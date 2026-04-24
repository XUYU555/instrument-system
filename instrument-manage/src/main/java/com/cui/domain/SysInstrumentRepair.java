package com.cui.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 仪器维修对象 sys_instrument_repair
 *
 * @author ruoyi
 */
@Data
public class SysInstrumentRepair extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 维修ID */
    private Long repairId;

    /** 仪器ID */
    private Long instrumentId;

    /** 故障原因 */
    private String repairReason;

    /** 维修时间 */
    private Date repairTime;

    /** 维修结果 */
    private String repairResult;

    /** 状态 0待维修 1维修中 2已修复 3无法修复 */
    private String status;

    /** 维修费用 */
    private BigDecimal cost;

    /** 申报人姓名（非数据库字段） */
    private String createUserName;

    /** 仪器名称（非数据库字段） */
    private String instrumentName;
}