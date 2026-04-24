package com.cui.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 仪器借用对象 sys_instrument_borrow
 *
 * @author ruoyi
 */
@Data
public class SysInstrumentBorrow extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 借用ID */
    private Long borrowId;

    /** 仪器ID */
    private Long instrumentId;

    /** 借用人ID */
    private Long userId;

    /** 借用人姓名 */
    private String userName;

    /** 实际借出时间 */
    private Date borrowTime;

    /** 计划归还时间 */
    private Date planReturnTime;

    /** 实际归还时间 */
    private Date returnTime;

    /** 状态 0申请中 1已借出 2已归还 3已驳回 4逾期 */
    private String status;

    /** 审核人ID */
    private Long auditUserId;

    /** 审核意见 */
    private String auditRemark;

    /** 审核时间 */
    private Date auditTime;

    /** 仪器名称（非数据库字段） */
    private String instrumentName;

    /** 审核人姓名（非数据库字段） */
    private String auditUserName;
}