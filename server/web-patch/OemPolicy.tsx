/**
 * 保活策略页（React 源码版）—— 等有面板源码工程时，把本文件放到 src/pages/OemPolicy.tsx，
 * 再按 README-dist-patch.md 里那三处改动加路由与菜单项，`pnpm build` 即可。
 *
 * 数据来源：GET /api/devices → device.extra.deviceInfo.oem（设备 deviceOnline 上报）
 * 只读：策略在本地配置好随包推送，这里只展示当前每台机器用的是哪套。
 */
import { useEffect, useMemo, useState } from 'react';

type Oem = {
  manufacturer?: string; brand?: string; model?: string;
  battery?: string[]; autostart?: string[];
  clickDelayMs?: number; adminFlow?: string; notificationFlow?: string; notes?: string;
};
type Device = {
  deviceId: string; displayId?: string; online?: boolean;
  extra?: { deviceInfo?: { oem?: Oem; batteryPath?: string; batteryPathUsed?: string; model?: string; apkVer?: string } };
};

const token = () => localStorage.getItem('c2token') || localStorage.getItem('token') || '';

export default function OemPolicy() {
  const [devices, setDevices] = useState<Device[]>([]);
  const [kw, setKw] = useState('');
  const [err, setErr] = useState('');

  const load = async () => {
    setErr('');
    try {
      const r = await fetch('/api/devices', { headers: { Authorization: `Bearer ${token()}` } });
      const j = await r.json();
      if (!j?.ok) { setErr(j?.error || '读取设备失败'); return; }
      setDevices(j.devices || []);
    } catch (e) {
      setErr(String(e));
    }
  };
  useEffect(() => { load(); }, []);

  const stat = useMemo(() => {
    const online = devices.filter((d) => d.online).length;
    const reported = devices.filter((d) => d.extra?.deviceInfo?.oem).length;
    const fallback = devices.filter((d) => (d.extra?.deviceInfo?.batteryPathUsed || '').startsWith('aosp/')).length;
    return [['设备总数', devices.length], ['在线', online], ['已上报机型策略', reported], ['走 AOSP 兜底', fallback]];
  }, [devices]);

  const rows = devices.filter((d) => {
    const i = d.extra?.deviceInfo || {};
    const o = i.oem || {};
    return !kw || [d.deviceId, o.model, o.manufacturer, o.brand, i.model].join(' ').toLowerCase().includes(kw.toLowerCase());
  });

  return (
    <div style={{ padding: '18px 24px 40px', maxWidth: 1360, margin: '0 auto' }}>
      <div style={{ display: 'flex', alignItems: 'center', marginBottom: 16 }}>
        <h2 style={{ margin: 0, fontSize: 16, fontWeight: 600 }}>保活策略</h2>
        <div style={{ flex: 1 }} />
        <button className="btn-primary" onClick={load}>刷新</button>
      </div>

      {err && <div style={{ color: 'var(--red)', marginBottom: 12 }}>读取设备失败：{err}</div>}

      <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap', marginBottom: 16 }}>
        {stat.map(([l, n]) => (
          <div key={l as string} className="stat-card">
            <div className="stat-num">{n as number}</div>
            <div className="stat-label">{l as string}</div>
          </div>
        ))}
      </div>

      <div style={{ background: 'var(--bg2)', border: '1px solid var(--border)', borderRadius: 'var(--radius-lg)', overflow: 'hidden' }}>
        <div style={{ padding: 12, borderBottom: '1px solid var(--border)' }}>
          <input
            className="search-box"
            placeholder="搜索型号 / 厂商 / 设备号…"
            value={kw}
            onChange={(e) => setKw(e.target.value)}
          />
          <span style={{ marginLeft: 12, fontSize: 12, color: 'var(--text2)' }}>共 {rows.length} 台</span>
        </div>
        <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13 }}>
          <thead>
            <tr style={{ background: 'var(--bg3)', color: 'var(--text2)', fontSize: 12 }}>
              {['设备', '机型', '状态', '电池 / 自启动路径（上报）', '实际使用', '延迟', '备注'].map((t) => (
                <th key={t} style={{ textAlign: 'left', padding: '10px 14px', fontWeight: 500 }}>{t}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map((d) => {
              const i = d.extra?.deviceInfo || {};
              const o = i.oem || {};
              const used = i.batteryPathUsed || '';
              return (
                <tr key={d.deviceId} style={{ borderTop: '1px solid var(--border)' }}>
                  <td style={{ padding: '11px 14px', fontFamily: 'ui-monospace,Menlo,monospace', fontSize: 12 }}>{d.displayId || d.deviceId}</td>
                  <td style={{ padding: '11px 14px' }}>{`${o.manufacturer || ''} ${o.model || i.model || ''}`.trim() || '—'}</td>
                  <td style={{ padding: '11px 14px' }}>
                    <span className={'ctrl-tag ' + (d.online ? 'green' : 'gray')}>{d.online ? '在线' : '离线'}</span>
                  </td>
                  <td style={{ padding: '11px 14px', fontFamily: 'ui-monospace,Menlo,monospace', fontSize: 12 }}>
                    {(o.battery && o.battery.length)
                      ? o.battery.map((x) => <div key={x} style={{ color: x.startsWith('aosp/') ? 'var(--text3)' : undefined }}>{x}</div>)
                      : <span>未上报（旧版本或未跑引导）</span>}
                  </td>
                  <td style={{ padding: '11px 14px', fontFamily: 'ui-monospace,Menlo,monospace', fontSize: 12, color: used.startsWith('aosp/') ? 'var(--orange)' : used ? 'var(--green)' : undefined }}>
                    {used || '—'}
                  </td>
                  <td style={{ padding: '11px 14px', fontFamily: 'ui-monospace,Menlo,monospace', fontSize: 12 }}>{o.clickDelayMs || '—'}</td>
                  <td style={{ padding: '11px 14px', fontSize: 12 }}>{o.notes || '—'}</td>
                </tr>
              );
            })}
            {!rows.length && (
              <tr><td colSpan={7} style={{ padding: 36, textAlign: 'center', color: 'var(--text3)' }}>没有匹配的设备</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
