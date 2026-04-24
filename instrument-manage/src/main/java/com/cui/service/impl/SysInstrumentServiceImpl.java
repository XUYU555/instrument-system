package com.cui.service.impl;

import com.cui.domain.SysInstrument;
import com.cui.mapper.SysInstrumentMapper;
import com.cui.service.ISysInstrumentService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysInstrumentServiceImpl implements ISysInstrumentService {

    @Autowired
    private SysInstrumentMapper instrumentMapper;

    @Override
    public List<SysInstrument> selectInstrumentList(SysInstrument instrument) {
        return instrumentMapper.selectInstrumentList(instrument);
    }

    @Override
    public SysInstrument selectInstrumentById(Long instrumentId) {
        return instrumentMapper.selectInstrumentById(instrumentId);
    }

    @Override
    public int insertInstrument(SysInstrument instrument) {
        instrument.setCreateTime(DateUtils.getNowDate());
        return instrumentMapper.insertInstrument(instrument);
    }

    @Override
    public int updateInstrument(SysInstrument instrument) {
        instrument.setUpdateTime(DateUtils.getNowDate());
        return instrumentMapper.updateInstrument(instrument);
    }

    @Override
    public int deleteInstrumentById(Long instrumentId) {
        return instrumentMapper.deleteInstrumentById(instrumentId);
    }
}