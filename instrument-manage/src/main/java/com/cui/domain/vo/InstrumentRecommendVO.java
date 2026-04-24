package com.cui.domain.vo;

import com.cui.domain.SysInstrument;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 仪器预约推荐VO
 *
 * @author xuyu555
 * @date 2026/4/24 16:32
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class InstrumentRecommendVO extends SysInstrument {
    /** 推荐匹配度（%） */
    private BigDecimal matchRate;

    /** 最近使用频次（月/次） */
    private Integer useFrequency;

    /** 预计空闲开始时间 */
    private Date freeStartTime;

    /** 预计空闲时长（小时） */
    private BigDecimal freeHour;

    /** 推荐理由（如：同院系高使用率、近期无借用） */
    private String recommendReason;
}