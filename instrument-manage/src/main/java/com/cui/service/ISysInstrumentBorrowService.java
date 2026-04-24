package com.cui.service;


import com.cui.domain.SysInstrumentBorrow;
import java.util.List;

public interface ISysInstrumentBorrowService {

    List<SysInstrumentBorrow> selectBorrowList(SysInstrumentBorrow borrow);

    SysInstrumentBorrow selectBorrowById(Long borrowId);

    int insertBorrow(SysInstrumentBorrow borrow);

    int updateBorrow(SysInstrumentBorrow borrow);

    int deleteBorrowById(Long borrowId);

    int deleteBorrowByIds(Long[] borrowIds);

    int auditBorrow(SysInstrumentBorrow borrow);

    int returnBorrow(Long borrowId);

}