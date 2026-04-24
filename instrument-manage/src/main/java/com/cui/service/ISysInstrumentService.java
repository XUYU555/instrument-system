package com.cui.service;

import com.cui.domain.SysInstrument;
import java.util.List;


public interface ISysInstrumentService {

    List<SysInstrument> selectInstrumentList(SysInstrument instrument);

    SysInstrument selectInstrumentById(Long instrumentId);

    int insertInstrument(SysInstrument instrument);

    int updateInstrument(SysInstrument instrument);

    int deleteInstrumentById(Long instrumentId);

}