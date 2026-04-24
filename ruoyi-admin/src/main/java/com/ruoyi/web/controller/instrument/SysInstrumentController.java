package com.ruoyi.web.controller.instrument;

import com.cui.domain.SysInstrument;
import com.cui.service.ISysInstrumentService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.ISysDeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/system/instrument")
public class SysInstrumentController extends BaseController {
    private String prefix = "system/instrument";

    @Autowired
    private ISysInstrumentService instrumentService;

    @Autowired
    private ISysDeptService deptService;

    @RequiresPermissions("system:instrument:view")
    @GetMapping()
    public String instrument() {
        return prefix + "/instrument";
    }

    @RequiresPermissions("system:instrument:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysInstrument instrument) {
        startPage();
        List<SysInstrument> list = instrumentService.selectInstrumentList(instrument);
        return getDataTable(list);
    }

    @RequiresPermissions("system:instrument:add")
    @GetMapping("/add")
    public String add(ModelMap mmap) {
        // 【新增】把部门列表也传到前端
        List<SysDept> deptList = deptService.selectDeptList(new SysDept());
        mmap.put("deptList", deptList);
        return prefix + "/add";
    }

    @RequiresPermissions("system:instrument:add")
    @Log(title = "仪器管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysInstrument instrument) {
        return toAjax(instrumentService.insertInstrument(instrument));
    }

    @RequiresPermissions("system:instrument:edit")
    @GetMapping("/edit/{instrumentId}")
    public String edit(@PathVariable("instrumentId") Long instrumentId, ModelMap mmap) {
        SysInstrument instrument = instrumentService.selectInstrumentById(instrumentId);
        mmap.put("instrument", instrument);

        // 【关键新增】把部门列表也传到前端
        List<SysDept> deptList = deptService.selectDeptList(new SysDept());
        mmap.put("deptList", deptList);

        return prefix + "/edit";
    }

    @RequiresPermissions("system:instrument:edit")
    @Log(title = "仪器管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysInstrument instrument) {
        return toAjax(instrumentService.updateInstrument(instrument));
    }

    @RequiresPermissions("system:instrument:remove")
    @Log(title = "仪器管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(instrumentService.deleteInstrumentById(Long.parseLong(ids)));
    }
}