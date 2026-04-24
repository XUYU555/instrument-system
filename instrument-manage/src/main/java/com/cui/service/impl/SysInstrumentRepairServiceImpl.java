package com.cui.service.impl;

import com.cui.domain.SysInstrumentRepair;
import com.cui.mapper.SysInstrumentRepairMapper;
import com.cui.service.ISysInstrumentRepairService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SysInstrumentRepairServiceImpl implements ISysInstrumentRepairService {

    @Autowired
    private SysInstrumentRepairMapper repairMapper;

    @Override
    public List<SysInstrumentRepair> selectRepairList(SysInstrumentRepair repair) {
        return repairMapper.selectRepairList(repair);
    }

    @Override
    public SysInstrumentRepair selectRepairById(Long repairId) {
        return repairMapper.selectRepairById(repairId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertRepair(SysInstrumentRepair repair) {
        repair.setCreateBy(ShiroUtils.getLoginName());
        repair.setCreateTime(DateUtils.getNowDate());
        repair.setStatus("0"); // 默认待维修
        return repairMapper.insertRepair(repair);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateRepair(SysInstrumentRepair repair) {
        repair.setUpdateBy(ShiroUtils.getLoginName());
        repair.setUpdateTime(DateUtils.getNowDate());
        return repairMapper.updateRepair(repair);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteRepairById(Long repairId) {
        return repairMapper.deleteRepairById(repairId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteRepairByIds(Long[] repairIds) {
        return repairMapper.deleteRepairByIds(repairIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int handleRepair(SysInstrumentRepair repair) {
        repair.setUpdateBy(ShiroUtils.getLoginName());
        repair.setUpdateTime(DateUtils.getNowDate());
        // 维修完成设置维修时间
        if ("2".equals(repair.getStatus()) || "3".equals(repair.getStatus())) {
            repair.setRepairTime(DateUtils.getNowDate());
        }
        return repairMapper.updateRepair(repair);
    }
}