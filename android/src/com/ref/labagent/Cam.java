package com.ref.labagent;

import android.content.Context;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Base64;
import android.util.Size;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;

/**
 * 相机：Camera2 真取景/真拍一张（前置/后置可切）。
 * 原版的 startCam / setCam / camPic —— 没有 App 组件是拿不到相机流的。
 */
public class Cam {

    private static CameraDevice device;
    private static CameraCaptureSession session;
    private static ImageReader reader;
    private static HandlerThread ht;
    private static Handler handler;
    private static String curId;
    private static String lastErr = "";

    public static synchronized String open(Context c, int face) {
        close();
        try {
            CameraManager cm = (CameraManager) c.getSystemService(Context.CAMERA_SERVICE);
            String pick = null;
            for (String id : cm.getCameraIdList()) {
                Integer f = cm.getCameraCharacteristics(id).get(CameraCharacteristics.LENS_FACING);
                int want = face == 0 ? CameraCharacteristics.LENS_FACING_BACK
                        : CameraCharacteristics.LENS_FACING_FRONT;
                if (f != null && f == want) {
                    pick = id;
                    break;
                }
            }
            if (pick == null && cm.getCameraIdList().length > 0) {
                pick = cm.getCameraIdList()[0];
            }
            if (pick == null) {
                return "no-camera";
            }
            curId = pick;
            ht = new HandlerThread("cam");
            ht.start();
            handler = new Handler(ht.getLooper());
            Size sz = chooseSize(cm, pick);
            reader = ImageReader.newInstance(sz.getWidth(), sz.getHeight(),
                    android.graphics.ImageFormat.JPEG, 2);
            final String id = pick;
            // 相机权限由 Python(root) 侧 pm grant 保证；这里不能传 null 进去（会 NPE，实测）
            cm.openCamera(id, new CameraDevice.StateCallback() {
                @Override public void onOpened(CameraDevice d) {
                    device = d;
                    try {
                        CaptureRequest.Builder b = d.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
                        b.addTarget(reader.getSurface());
                        d.createCaptureSession(java.util.Collections.singletonList(reader.getSurface()),
                                new CameraCaptureSession.StateCallback() {
                                    @Override public void onConfigured(CameraCaptureSession s) {
                                        session = s;
                                        try {
                                            s.setRepeatingRequest(b.build(), null, handler);
                                        } catch (Throwable t) { lastErr = "req:" + t; }
                                    }
                                    @Override public void onConfigureFailed(CameraCaptureSession s) {
                                        lastErr = "configure-failed";
                                    }
                                }, handler);
                    } catch (Throwable t) { lastErr = "open:" + t; }
                }
                @Override public void onDisconnected(CameraDevice d) { d.close(); device = null; }
                @Override public void onError(CameraDevice d, int e) { lastErr = "err:" + e; d.close(); device = null; }
            }, handler);
            return "opening:" + pick + " " + sz.getWidth() + "x" + sz.getHeight();
        } catch (Throwable t) {
            lastErr = t.toString();
            return "err:" + t;
        }
    }

    private static Size chooseSize(CameraManager cm, String id) {
        try {
            Size[] sizes = cm.getCameraCharacteristics(id)
                    .get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)
                    .getOutputSizes(android.graphics.ImageFormat.JPEG);
            Size best = sizes[0];
            for (Size s : sizes) {
                long px = (long) s.getWidth() * s.getHeight();
                if (px <= 1920L * 1080L && px > (long) best.getWidth() * best.getHeight()) {
                    best = s;
                }
            }
            return best;
        } catch (Throwable t) {
            return new Size(1280, 720);
        }
    }

    /** 真拍一张（JPEG -> base64）。相机没开就先开。 */
    public static synchronized JSONObject still(Context c, int face, int waitMs) {
        JSONObject o = new JSONObject();
        try {
            if (device == null || session == null) {
                open(c, face);
                for (int i = 0; i < waitMs / 100; i++) {
                    Thread.sleep(100);
                    if (session != null) {
                        break;
                    }
                }
            }
            if (session == null) {
                o.put("ok", false);
                o.put("err", lastErr.isEmpty() ? "no-session" : lastErr);
                return o;
            }
            final Object lock = new Object();
            final byte[][] holder = new byte[1][];
            reader.setOnImageAvailableListener(new ImageReader.OnImageAvailableListener() {
                @Override public void onImageAvailable(ImageReader r) {
                    Image img = r.acquireLatestImage();
                    if (img != null) {
                        try {
                            ByteBuffer buf = img.getPlanes()[0].getBuffer();
                            byte[] data = new byte[buf.remaining()];
                            buf.get(data);
                            holder[0] = data;
                        } finally {
                            img.close();
                        }
                    }
                    synchronized (lock) { lock.notifyAll(); }
                }
            }, handler);
            CaptureRequest.Builder b = device.createCaptureRequest(CameraDevice.TEMPLATE_STILL_CAPTURE);
            b.addTarget(reader.getSurface());
            session.capture(b.build(), null, handler);
            // 只等**图像**回调：onCaptureCompleted 通常比图像早到，
            // 在它里面 notify 会让等待提前返回、拿不到帧（实测就是 no-frame）
            synchronized (lock) {
                lock.wait(waitMs > 0 ? waitMs : 6000);
            }
            if (holder[0] == null) {
                o.put("ok", false);
                o.put("err", "no-frame");
                return o;
            }
            o.put("ok", true);
            o.put("bytes", holder[0].length);
            o.put("img", "data:image/jpeg;base64," + Base64.encodeToString(holder[0], Base64.NO_WRAP));
            return o;
        } catch (Throwable t) {
            try {
                o.put("ok", false);
                o.put("err", t.toString());
            } catch (Throwable ignored) {
            }
            return o;
        }
    }

    public static synchronized String close() {
        try {
            if (session != null) {
                session.close();
            }
        } catch (Throwable ignored) {}
        session = null;
        try {
            if (device != null) {
                device.close();
            }
        } catch (Throwable ignored) {}
        device = null;
        try {
            if (reader != null) {
                reader.close();
            }
        } catch (Throwable ignored) {}
        reader = null;
        return "closed";
    }

    public static String state() {
        return device == null ? "closed" : ("open:" + curId);
    }
}
