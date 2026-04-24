package com.cui.service;

import com.cui.domain.SysInstrumentWarnRecord;
import com.cui.domain.SysInstrumentWarnRule;

import java.util.List;

/**
 * 仪器预警服务接口
 *
 * @author xuyu555
 * @date 2026/4/24 16:51
 */
public interface ISysInstrumentWarnService {
    /**
     * 新增预警规则
     */
    boolean insertWarnRule(SysInstrumentWarnRule rule);

    /**
     * 查询预警规则列表
     */
    List<SysInstrumentWarnRule> selectWarnRuleList(SysInstrumentWarnRule rule);

    /**
     * 查询预警记录列表
     */
    List<SysInstrumentWarnRecord> selectWarnRecordList(SysInstrumentWarnRecord record);

    /**
     * 处理预警记录
     */
    boolean handleWarnRecord(Long recordId, String handleRemark);

    /**
     * 检查阈值并触发预警（定时任务调用）
     */
    void checkWarnThreshold();
}