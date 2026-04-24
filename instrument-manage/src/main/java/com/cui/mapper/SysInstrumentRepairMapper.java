package com.cui.mapper;

import com.cui.domain.SysInstrumentRepair;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
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

    /**
     * 根据仪器ID列表统计维修次数
     */
    Integer countByInstrumentIds(@Param("instrumentIds") List<Long> instrumentIds);

    /**
     * 根据状态统计数量
     */
    Integer countByStatus(@Param("status") String status);

    /**
     * 查询维修超时记录
     */
    List<SysInstrumentRepair> selectTimeoutRepairList(@Param("instrumentId") Long instrumentId, @Param("timeoutDate") Date timeoutDate);

    /**
     * 查询维修费用超限记录
     */
    List<SysInstrumentRepair> selectCostOverRepairList(@Param("instrumentId") Long instrumentId, @Param("threshold") BigDecimal threshold);

}