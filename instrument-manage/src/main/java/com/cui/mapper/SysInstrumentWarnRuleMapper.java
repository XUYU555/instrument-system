package com.cui.mapper;

import com.cui.domain.SysInstrumentWarnRule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Mapper
 *
 * @author xuyu555
 * @date 2026/4/24 16:53
 */
@Mapper
public interface SysInstrumentWarnRuleMapper {

    /**
     * 新增预警规则
     */
    int insertWarnRule(SysInstrumentWarnRule rule);

    /**
     * 查询启用的预警规则列表
     */
    List<SysInstrumentWarnRule> selectEnabledRuleList(SysInstrumentWarnRule rule);
}