package com.ruoyi.web.controller.instrument;

import com.cui.domain.vo.InstrumentStatVO;
import com.cui.service.ISysInstrumentStatService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 仪器统计可视化控制器
 *
 * @author xuyu555
 * @date 2026/4/24 16:43
 */
@Controller
@RequestMapping("/instrument/stat")
public class SysInstrumentStatController extends BaseController {
    private String prefix = "system/instrument";

    @Autowired
    private ISysInstrumentStatService instrumentStatService;

    /**
     * 统计可视化页面
     */
    @GetMapping()
    @RequiresPermissions("instrument:state:view")
    public String statPage(ModelMap mmap) {
        // 仪表盘核心指标
        Map<String, Integer> dashboard = instrumentStatService.statDashboard();
        mmap.put("dashboard", dashboard);
        return prefix + "/stat";
    }

    /**
     * 按院系统计数据（供ECharts调用）
     */
    @GetMapping("/byDept")
    @ResponseBody
    @RequiresPermissions("instrument:state:view")
    public AjaxResult statByDept() {
        List<InstrumentStatVO> list = instrumentStatService.statByDept();
        return AjaxResult.success(list);
    }

    /**
     * 按月度统计数据（供ECharts调用）
     */
    @GetMapping("/byMonth")
    @ResponseBody
    @RequiresPermissions("instrument:state:view")
    public AjaxResult statByMonth(Integer year) {
        List<InstrumentStatVO> list = instrumentStatService.statByMonth(year);
        return AjaxResult.success(list);
    }

    /**
     * 按类型统计可用率（供ECharts调用）
     */
    @GetMapping("/byType")
    @ResponseBody
    @RequiresPermissions("instrument:state:view")
    public AjaxResult statByType() {
        List<InstrumentStatVO> list = instrumentStatService.statByType();
        return AjaxResult.success(list);
    }
}