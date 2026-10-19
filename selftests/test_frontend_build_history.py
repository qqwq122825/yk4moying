#!/usr/bin/env python3
"""Regression checks for the source-faithful, stable build center."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / 'web' / 'panel' / 'assets' / 'index-dvi-972c.js'

class FrontendBuildHistoryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        bundle = BUNDLE.read_text(encoding='utf-8')
        start = bundle.index('function wN(){')
        end = bundle.index('var SN=', start)
        cls.history = bundle[start:end]

    def test_layout_matches_yuankon_build_center(self):
        self.assertIn('gridTemplateColumns:"minmax(0,1.1fr) minmax(0,.9fr)"', self.history)
        self.assertIn('B 包 · 工作端', self.history)
        self.assertIn('A 包 · 安装器', self.history)
        self.assertIn('minWidth:1080', self.history)

    def test_history_is_a_compact_table(self):
        for text in ('应用 / 构建 ID', '模板 / 配置', '状态', '时间 / 大小', '产物 / 操作', '下载 APK'):
            self.assertIn(text, self.history)

    def test_submit_is_optimistic_newest_first_without_refresh_collapse(self):
        self.assertIn('addOptimistic(result.buildId,"b")', self.history)
        self.assertIn('addOptimistic(result.buildId,"a")', self.history)
        self.assertIn('[...builds].sort((left,right)=>new Date(right.createdAt||0)-new Date(left.createdAt||0))', self.history)
        self.assertIn('新任务已显示在下方第一条', self.history)
        self.assertIn('页面保持原位', self.history)

    def test_each_history_record_has_delete_control(self):
        self.assertIn('确定删除此构建记录及关联文件？', self.history)
        self.assertIn('"/api/build/delete"', self.history)

    def test_history_supports_select_all_and_quick_delete(self):
        for text in (
            '[selectedBuildIds,setSelectedBuildIds]=(0,b.useState)([])',
            '全选可删除的构建记录', '全选', '快速删除',
            '确定删除已选择的 ${selectedIds.length} 条构建记录及关联文件？',
            'Promise.all(selectedIds.map(buildId=>bt("/api/build/delete"',
            'disabled:active||bulkDeleting',
            'label==="应用 / 构建 ID"?H("div"',
        ):
            self.assertIn(text, self.history)

    def test_active_build_row_has_live_progress(self):
        for text in ('progressStage', '["queued","pending","building"]', 'role:"progressbar"', 'background:failed?"#d63939":done?"#2fb344":"#4f6bed"', '每 3 秒自动更新'):
            self.assertIn(text, self.history)

    def test_b_builder_exposes_default_and_uploaded_icon_choices(self):
        for text in (
            '[icon,setIcon]=(0,b.useState)("__preset__:/static/preset_icons/default.png")',
            '应用图标', '使用默认图标', '上传图标', '当前：默认图标',
            'accept:".png,.jpg,.jpeg,.webp"', 'body.append("icon",file)',
            '图标上传完成，构建时会替换全部 5 个密度',
        ):
            self.assertIn(text, self.history)
        self.assertIn('enableCrashLog:true,icon,enableWebrtc:false', self.history)
        self.assertNotIn('enableCrashLog:true,icon:"__preset__:/static/preset_icons/default.png"', self.history)

if __name__ == '__main__':
    unittest.main()
