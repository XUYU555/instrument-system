package com.cui.service;


import com.cui.domain.SysInstrumentRepair;

import java.util.List;

public interface ISysInstrumentRepairService {

    List<SysInstrumentRepair> selectRepairList(SysInstrumentRepair repair);

    SysInstrumentRepair selectRepairById(Long repairId);

    int insertRepair(SysInstrumentRepair repair);

    int updateRepair(SysInstrumentRepair repair);

    int deleteRepairById(Long repairId);

    int deleteRepairByIds(Long[] repairIds);

    int handleRepair(SysInstrumentRepair repair);

}