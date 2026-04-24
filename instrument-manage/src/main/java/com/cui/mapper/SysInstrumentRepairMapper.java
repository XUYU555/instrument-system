package com.cui.mapper;

import com.cui.domain.SysInstrumentRepair;

import java.util.List;

/**
 * 仪器维修Mapper接口
 */
public interface SysInstrumentRepairMapper {

    List<SysInstrumentRepair> selectRepairList(SysInstrumentRepair repair);

    SysInstrumentRepair selectRepairById(Long repairId);

    int insertRepair(SysInstrumentRepair repair);

    int updateRepair(SysInstrumentRepair repair);

    int deleteRepairById(Long repairId);

    int deleteRepairByIds(Long[] repairIds);

}