package com.cui.domain.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 仪器使用统计VO
 *
 * @author xuyu555
 * @date 2026/4/24 16:31
 */
@Data
public class InstrumentStatVO {
    /** 维度名称（如院系名称、月份、仪器类型） */
    private String dimensionName;

    /** 借用次数 */
    private Integer borrowCount;

    /** 总借用时长（小时） */
    private BigDecimal totalBorrowHour;

    /** 维修次数 */
    private Integer repairCount;

    /** 故障占比（%） */
    private BigDecimal faultRatio;

    /** 可用率（%） */
    private BigDecimal availabilityRatio;

    /** 统计时间 */
    private Date statTime;
}