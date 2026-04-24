package com.cui.mapper;

import com.cui.domain.SysInstrumentWarnRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Mapper
 *
 * @author xuyu555
 * @date 2026/4/24 16:53
 */
@Mapper
public interface SysInstrumentWarnRecordMapper {

    /**
     * 查询预警记录列表
     */
    List<SysInstrumentWarnRecord> selectWarnRecordList(SysInstrumentWarnRecord record);

    /**
     * 根据ID查询预警记录
     */
    SysInstrumentWarnRecord selectWarnRecordById(@Param("recordId") Long recordId);

    /**
     * 更新预警记录
     */
    int updateWarnRecord(SysInstrumentWarnRecord record);

    /**
     * 新增预警记录
     */
    int insertWarnRecord(SysInstrumentWarnRecord record);

    /**
     * 判断是否存在未处理的重复预警
     */
    int existsUnHandleWarn(@Param("ruleId") Long ruleId, @Param("businessId") Long businessId);
}