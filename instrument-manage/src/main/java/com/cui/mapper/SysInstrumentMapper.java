package com.cui.mapper;

import com.cui.domain.SysInstrument;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 查询所有仪器
     */
    List<SysInstrument> selectAll();

    /**
     * 统计仪器总数
     */
    Integer countAll();

    /**
     * 根据状态列表统计数量
     */
    Integer countByStatusIn(@Param("statusList") List<String> statusList);

    /**
     * 根据状态查询仪器列表
     */
    List<SysInstrument> selectByStatus(@Param("status") String status);

}