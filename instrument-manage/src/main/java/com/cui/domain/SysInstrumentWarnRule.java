package com.cui.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 仪器预警规则对象用于配置异常阈值（超期、维修、使用频次等）
 * sys_instrument_warn_record
 *
 * @author xuyu555
 * @date 2026/4/24 16:29
 */
@Data
public class SysInstrumentWarnRule extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 规则ID */
    private Long ruleId;

    /** 仪器ID（0表示全局规则） */
    private Long instrumentId;

    /** 预警类型 1-借用超期阈值(小时) 2-维修超时时长(天) 3-月使用频次阈值 4-维修费用阈值 */
    private String warnType;

    /** 阈值数值（如超期阈值24小时、维修超期7天、月使用频次5次、费用1000元） */
    private BigDecimal threshold;

    /** 通知方式 1-系统消息 2-邮件 3-两者都有 */
    private String notifyType;

    /** 状态 0-禁用 1-启用 */
    private String status;

    /** 仪器名称（非数据库字段） */
    private String instrumentName;
}