package com.cui.service;

import com.cui.domain.vo.InstrumentRecommendVO;

import java.util.List;

/**
 * 仪器预约推荐服务接口
 *
 * @author xuyu555
 * @date 2026/4/24 16:46
 */
public interface ISysInstrumentRecommendService {
    /**
     * 智能推荐仪器（基于用户ID）
     * @param userId 用户ID
     * @param count 推荐数量
     * @return 推荐列表
     */
    List<InstrumentRecommendVO> recommend(Long userId, Integer count);
}