package com.ruoyi.web.controller.instrument;

import com.cui.domain.SysInstrumentBorrow;
import com.cui.service.ISysInstrumentBorrowService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ruoyi.common.core.text.Convert.toLongArray;

@Controller
@RequestMapping("/system/borrow")
public class SysInstrumentBorrowController extends BaseController {
    private String prefix = "system/borrow";

    @Autowired
    private ISysInstrumentBorrowService borrowService;

    @RequiresPermissions("system:borrow:view")
    @GetMapping()
    public String borrow() {
        return prefix + "/borrow";
    }

    @RequiresPermissions("system:borrow:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysInstrumentBorrow borrow) {
        startPage();
        List<SysInstrumentBorrow> list = borrowService.selectBorrowList(borrow);
        return getDataTable(list);
    }

    @RequiresPermissions("system:borrow:add")
    @GetMapping("/add")
    public String add(@RequestParam(value = "instrumentId", required = false) Long instrumentId, Model model) {
        // 把仪器ID传到前端页面
        model.addAttribute("instrumentId", instrumentId);
        return prefix + "/add";
    }

    @RequiresPermissions("system:borrow:add")
    @Log(title = "仪器借用", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysInstrumentBorrow borrow) {
        int i = borrowService.insertBorrow(borrow);
        return i!=0? success():error("仪器已被借出");
    }

    @RequiresPermissions("system:borrow:edit")
    @GetMapping("/edit/{borrowId}")
    public String edit(@PathVariable("borrowId") Long borrowId, ModelMap mmap) {
        SysInstrumentBorrow borrow = borrowService.selectBorrowById(borrowId);
        mmap.put("borrow", borrow);
        return prefix + "/edit";
    }

    @RequiresPermissions("system:borrow:edit")
    @Log(title = "仪器借用", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysInstrumentBorrow borrow) {
        return toAjax(borrowService.updateBorrow(borrow));
    }

    @RequiresPermissions("system:borrow:remove")
    @Log(title = "仪器借用", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(borrowService.deleteBorrowByIds(toLongArray(ids)));
    }

    @RequiresPermissions("system:borrow:audit")
    @GetMapping("/audit/{borrowId}")
    public String audit(@PathVariable("borrowId") Long borrowId, ModelMap mmap) {
        SysInstrumentBorrow borrow = borrowService.selectBorrowById(borrowId);
        mmap.put("borrow", borrow);
        return prefix + "/audit";
    }

    @RequiresPermissions("system:borrow:audit")
    @Log(title = "借用审核", businessType = BusinessType.UPDATE)
    @PostMapping("/audit")
    @ResponseBody
    public AjaxResult auditSave(SysInstrumentBorrow borrow) {
        return toAjax(borrowService.auditBorrow(borrow));
    }

    @RequiresPermissions("system:borrow:return")
    @Log(title = "仪器归还", businessType = BusinessType.UPDATE)
    @PostMapping("/return")
    @ResponseBody
    public AjaxResult returnBorrow(Long borrowId) {
        return toAjax(borrowService.returnBorrow(borrowId));
    }
}