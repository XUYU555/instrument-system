package com.cui.service.impl;

import com.cui.domain.SysInstrumentBorrow;
import com.cui.mapper.SysInstrumentBorrowMapper;
import com.cui.service.ISysInstrumentBorrowService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysInstrumentBorrowServiceImpl implements ISysInstrumentBorrowService {

    @Autowired
    private SysInstrumentBorrowMapper borrowMapper;

    @Override
    public List<SysInstrumentBorrow> selectBorrowList(SysInstrumentBorrow borrow) {
        return borrowMapper.selectBorrowList(borrow);
    }

    @Override
    public SysInstrumentBorrow selectBorrowById(Long borrowId) {
        return borrowMapper.selectBorrowById(borrowId);
    }

    @Override
    public int insertBorrow(SysInstrumentBorrow borrow) {
        borrow.setCreateBy(ShiroUtils.getLoginName());
        borrow.setCreateTime(DateUtils.getNowDate());
        borrow.setUserId(ShiroUtils.getUserId());
        borrow.setUserName(ShiroUtils.getSysUser().getUserName());
        borrow.setStatus("0"); // 默认申请中
        return borrowMapper.insertBorrow(borrow);
    }

    @Override
    public int updateBorrow(SysInstrumentBorrow borrow) {
        borrow.setUpdateBy(ShiroUtils.getLoginName());
        borrow.setUpdateTime(DateUtils.getNowDate());
        return borrowMapper.updateBorrow(borrow);
    }

    @Override
    public int deleteBorrowById(Long borrowId) {
        return borrowMapper.deleteBorrowById(borrowId);
    }

    @Override
    public int deleteBorrowByIds(Long[] borrowIds) {
        return borrowMapper.deleteBorrowByIds(borrowIds);
    }

    @Override
    public int auditBorrow(SysInstrumentBorrow borrow) {
        borrow.setAuditUserId(ShiroUtils.getUserId());
        borrow.setAuditTime(DateUtils.getNowDate());
        borrow.setUpdateBy(ShiroUtils.getLoginName());
        // 审核通过则设置为已借出
        if ("1".equals(borrow.getStatus())) {
            borrow.setBorrowTime(DateUtils.getNowDate());
        }
        return borrowMapper.updateBorrow(borrow);
    }

    @Override
    public int returnBorrow(Long borrowId) {
        SysInstrumentBorrow borrow = new SysInstrumentBorrow();
        borrow.setBorrowId(borrowId);
        borrow.setStatus("2"); // 已归还
        borrow.setReturnTime(DateUtils.getNowDate());
        borrow.setUpdateBy(ShiroUtils.getLoginName());
        return borrowMapper.updateBorrow(borrow);
    }
}