package com.cui.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 仪器预警记录对象 sys_instrument_warn_record存储触发的异常预警信息
 *
 * @author xuyu555
 * @date 2026/4/24 16:30
 */
@Data
public class SysInstrumentWarnRecord extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 规则ID */
    private Long ruleId;

    /** 仪器ID */
    private Long instrumentId;

    /** 关联业务ID（借用ID/维修ID） */
    private Long businessId;

    /** 预警类型 1-借用超期 2-维修超时 3-使用频次超限 4-维修费用超限 */
    private String warnType;

    /** 预警内容 */
    private String warnContent;

    /** 触发值（如超期28小时、维修8天） */
    private String triggerValue;

    /** 处理状态 0-未处理 1-已处理 */
    private String handleStatus;

    /** 处理人ID */
    private Long handleUserId;

    /** 处理时间 */
    private Date handleTime;

    /** 处理备注 */
    private String handleRemark;

    /** 仪器名称（非数据库字段） */
    private String instrumentName;
}