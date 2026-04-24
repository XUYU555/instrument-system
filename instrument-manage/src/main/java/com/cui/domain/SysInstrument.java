package com.cui.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 仪器信息对象 sys_instrument
 *
 * @author ruoyi
 */
@Data
public class SysInstrument extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 仪器ID */
    private Long instrumentId;

    /** 仪器名称 */
    private String instrumentName;

    /** 仪器编号 */
    private String instrumentCode;

    /** 所属院系 */
    private Long deptId;

    /** 状态 0正常 1维修 2报废 3停用 */
    private String status;

    /** 采购时间 */
    private Date purchaseTime;

    /** 存放位置 */
    private String location;

    /** 规格型号 */
    private String specs;

    /** 生产厂家 */
    private String manufacturer;

    /** 院系名称（非数据库字段） */
    private String deptName;
}