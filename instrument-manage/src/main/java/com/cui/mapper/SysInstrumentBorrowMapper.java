package com.cui.mapper;

import com.cui.domain.SysInstrumentBorrow;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 仪器借用Mapper
 *
 * @author xuyu555
 * @date 2026/3/23 19:46
 */
@Mapper
public interface SysInstrumentBorrowMapper {
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
     * 查询逾期未归还的借用记录
     */
    List<SysInstrumentBorrow> selectOverdueBorrowList();

}