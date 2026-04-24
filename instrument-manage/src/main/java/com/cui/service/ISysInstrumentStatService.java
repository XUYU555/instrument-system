package com.cui.service;

import com.cui.domain.vo.InstrumentStatVO;

import java.util.List;
import java.util.Map;

/**
 * 仪器统计服务接口
 *
 * @author xuyu555
 * @date 2026/4/24 16:33
 */
public interface ISysInstrumentStatService {
    /**
     * 按院系统计仪器使用数据
     */
    List<InstrumentStatVO> statByDept();

    /**
     * 按月度统计借用趋势
     */
    List<InstrumentStatVO> statByMonth(Integer year);

    /**
     * 按仪器类型统计可用率
     */
    List<InstrumentStatVO> statByType();

    /**
     * 统计仪表盘核心指标（总仪器数、在用数、故障数、超期数）
     */
    Map<String, Integer> statDashboard();
}