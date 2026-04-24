package com.cui.mapper;

import com.cui.domain.SysInstrumentBorrow;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Date;

/**
 * 仪器借用Mapper
 *
 * @author xuyu555
 * @date 2026/3/23 19:46
 */
@Mapper
public interface SysInstrumentBorrowMapper{
    /**
     * 查询借用列表
     */
    List<SysInstrumentBorrow> selectBorrowList(SysInstrumentBorrow borrow);

    /**
     * 根据ID查询借用详情
     */
    SysInstrumentBorrow selectBorrowById(Long borrowId);

    /**
     * 新增借用申请
     */
    int insertBorrow(SysInstrumentBorrow borrow);

    /**
     * 修改借用信息
     */
    int updateBorrow(SysInstrumentBorrow borrow);

    /**
     * 删除借用记录
     */
    int deleteBorrowById(Long borrowId);

    /**
     * 批量删除借用记录
     */
    int deleteBorrowByIds(Long[] borrowIds);


    /**
     * 根据仪器ID列表统计借用次数
     */
    Integer countByInstrumentIds(@Param("instrumentIds") List<Long> instrumentIds);

    /**
     * 根据时间范围统计借用次数
     */
    Integer countByBorrowTimeBetween(@Param("start") Date start, @Param("end") Date end);

    /**
     * 根据状态统计数量
     */
    Integer countByStatus(@Param("status") String status);

    /**
     * 查询用户最近1条借用记录
     */
    SysInstrumentBorrow selectLatestByUserId(@Param("userId") Long userId);

    /**
     * 统计仪器指定时间后的借用次数
     */
    Integer countByInstrumentIdAndTime(@Param("instrumentId") Long instrumentId, @Param("startTime") Date startTime);

    /**
     * 查询仪器最近1条借用记录（申请中/已借出）
     */
    SysInstrumentBorrow selectLatestBorrowByInstrumentId(@Param("instrumentId") Long instrumentId);

    /**
     * 查询超期借用记录
     */
    List<SysInstrumentBorrow> selectOverdueBorrowList(@Param("instrumentId") Long instrumentId);

    /**
     * 统计仪器月使用次数
     */
    Integer countInstrumentMonthUse(@Param("instrumentId") Long instrumentId, @Param("monthStart") Date monthStart);

    SysInstrumentBorrow instrumentBorrowed(Long instrumentId);
}