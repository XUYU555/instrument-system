package com.cui.mapper;

import com.cui.domain.SysInstrument;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 仪器信息Mapper接口
 */
@Mapper
public interface SysInstrumentMapper {

    List<SysInstrument> selectInstrumentList(SysInstrument instrument);

    SysInstrument selectInstrumentById(Long instrumentId);

    int insertInstrument(SysInstrument instrument);

    int updateInstrument(SysInstrument instrument);

    int deleteInstrumentById(Long instrumentId);

}