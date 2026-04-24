package com.cui.service.impl;

import com.cui.domain.SysInstrumentBorrow;
import com.cui.mapper.SysInstrumentBorrowMapper;
import com.cui.service.ISysInstrumentBorrowService;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.mapper.SysRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SysInstrumentBorrowServiceImpl implements ISysInstrumentBorrowService {

    @Autowired
    private SysInstrumentBorrowMapper borrowMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Override
    public List<SysInstrumentBorrow> selectBorrowList(SysInstrumentBorrow borrow) {
        return borrowMapper.selectBorrowList(borrow);
    }

    @Override
    public SysInstrumentBorrow selectBorrowById(Long borrowId) {
        return borrowMapper.selectBorrowById(borrowId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertBorrow(SysInstrumentBorrow borrow) {
        borrow.setCreateBy(ShiroUtils.getLoginName());
        borrow.setCreateTime(DateUtils.getNowDate());
        borrow.setUserId(ShiroUtils.getUserId());
        borrow.setUserName(ShiroUtils.getSysUser().getUserName());
        borrow.setStatus("0"); // 默认申请中
        if (borrowMapper.instrumentBorrowed(borrow.getInstrumentId()) != null) {
            return 0;
        }
        return borrowMapper.insertBorrow(borrow);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateBorrow(SysInstrumentBorrow borrow) {
        borrow.setUpdateBy(ShiroUtils.getLoginName());
        borrow.setUpdateTime(DateUtils.getNowDate());
        return borrowMapper.updateBorrow(borrow);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteBorrowById(Long borrowId) {
        return borrowMapper.deleteBorrowById(borrowId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteBorrowByIds(Long[] borrowIds) {
        return borrowMapper.deleteBorrowByIds(borrowIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int auditBorrow(SysInstrumentBorrow borrow) {
        Long userId = ShiroUtils.getUserId();
        List<SysRole> sysRoles = roleMapper.selectRolesByUserId(userId);
        boolean authority = false;
        for (SysRole sysRole : sysRoles) {
            if(sysRole.isAdmin()) {
                authority = true;
                break;
            }
        }
        if (!authority) {
            return 0;
        }
        if (borrowMapper.verifyBorrowUser(userId, borrow.getBorrowId(), 0) == 0) {
            return 0;
        }
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
    @Transactional(rollbackFor = Exception.class)
    public int returnBorrow(Long borrowId) {
        Long loginUserId = ShiroUtils.getUserId();
        if (borrowMapper.verifyBorrowUser(loginUserId, borrowId, 1) == 0) {
            return 0;
        }
        SysInstrumentBorrow borrow = new SysInstrumentBorrow();
        borrow.setBorrowId(borrowId);
        borrow.setStatus("2"); // 已归还
        borrow.setReturnTime(DateUtils.getNowDate());
        borrow.setUpdateBy(ShiroUtils.getLoginName());
        return borrowMapper.updateBorrow(borrow);
    }
}