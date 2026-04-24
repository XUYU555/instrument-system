package com.ruoyi.web.controller.instrument;

import com.cui.domain.SysInstrumentRepair;
import com.cui.service.ISysInstrumentRepairService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ruoyi.common.core.text.Convert.toLongArray;

@Controller
@RequestMapping("/system/repair")
public class SysInstrumentRepairController extends BaseController {
    private String prefix = "system/repair";

    @Autowired
    private ISysInstrumentRepairService repairService;

    @RequiresPermissions("system:repair:view")
    @GetMapping()
    public String repair() {
        return prefix + "/repair";
    }

    @RequiresPermissions("system:repair:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysInstrumentRepair repair) {
        startPage();
        List<SysInstrumentRepair> list = repairService.selectRepairList(repair);
        return getDataTable(list);
    }

    @RequiresPermissions("system:repair:add")
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    @RequiresPermissions("system:repair:add")
    @Log(title = "仪器维修", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysInstrumentRepair repair) {
        return toAjax(repairService.insertRepair(repair));
    }

    @RequiresPermissions("system:repair:edit")
    @GetMapping("/edit/{repairId}")
    public String edit(@PathVariable("repairId") Long repairId, ModelMap mmap) {
        SysInstrumentRepair repair = repairService.selectRepairById(repairId);
        mmap.put("repair", repair);
        return prefix + "/edit";
    }

    @RequiresPermissions("system:repair:edit")
    @Log(title = "仪器维修", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysInstrumentRepair repair) {
        return toAjax(repairService.updateRepair(repair));
    }

    @RequiresPermissions("system:repair:remove")
    @Log(title = "仪器维修", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(repairService.deleteRepairByIds(toLongArray(ids)));
    }

    @RequiresPermissions("system:repair:handle")
    @GetMapping("/handle/{repairId}")
    public String handle(@PathVariable("repairId") Long repairId, ModelMap mmap) {
        SysInstrumentRepair repair = repairService.selectRepairById(repairId);
        mmap.put("repair", repair);
        return prefix + "/handle";
    }

    @RequiresPermissions("system:repair:handle")
    @Log(title = "维修处理", businessType = BusinessType.UPDATE)
    @PostMapping("/handle")
    @ResponseBody
    public AjaxResult handleSave(SysInstrumentRepair repair) {
        return toAjax(repairService.handleRepair(repair));
    }
}