package com.cui.service.impl;

import com.cui.domain.SysInstrument;
import com.cui.domain.SysInstrumentBorrow;
import com.cui.domain.vo.InstrumentRecommendVO;
import com.cui.mapper.SysInstrumentBorrowMapper;
import com.cui.mapper.SysInstrumentMapper;
import com.cui.service.ISysInstrumentRecommendService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 服务实现类（原生MyBatis无报错版）
 */
@Service
public class SysInstrumentRecommendServiceImpl implements ISysInstrumentRecommendService {

    @Autowired
    private SysInstrumentMapper instrumentMapper;
    @Autowired
    private SysInstrumentBorrowMapper borrowMapper;

    @Override
    public List<InstrumentRecommendVO> recommend(Long userId, Integer count) {
        if (count == null || count <= 0) {
            count = 10;
        }

        // 1. 获取用户院系（原生MyBatis）
        Long userDeptId = getUserDeptId(userId);

        // 2. 查询所有可用仪器（状态0，原生MyBatis）
        List<SysInstrument> allValidInstruments = instrumentMapper.selectByStatus("0");
        if (CollectionUtils.isEmpty(allValidInstruments)) {
            return new ArrayList<>();
        }

        // 3. 计算推荐度
        List<InstrumentRecommendVO> recommendList = new ArrayList<>();
        for (SysInstrument instrument : allValidInstruments) {
            InstrumentRecommendVO vo = new InstrumentRecommendVO();
            BeanUtils.copyProperties(instrument, vo);

            // 院系匹配度
            BigDecimal deptMatch = (userDeptId != null && userDeptId.equals(instrument.getDeptId()))
                    ? new BigDecimal(50) : new BigDecimal(10);
            // 使用频次
            int monthUseCount = getMonthUseCount(instrument.getInstrumentId());
            BigDecimal frequencyMatch = new BigDecimal(Math.min(monthUseCount * 3, 30));
            // 空闲时间
            BigDecimal freeHour = getFreeHour(instrument.getInstrumentId());
            BigDecimal freeMatch = new BigDecimal(Math.min(freeHour.intValue() * 2, 20));
            // 总匹配度
            BigDecimal matchRate = deptMatch.add(frequencyMatch).add(freeMatch);
            vo.setMatchRate(matchRate);

            vo.setUseFrequency(monthUseCount);
            vo.setFreeHour(freeHour);
            vo.setFreeStartTime(getFreeStartTime(instrument.getInstrumentId()));

            // 推荐理由
            List<String> reasons = new ArrayList<>();
            if (deptMatch.compareTo(new BigDecimal(10)) > 0) {
                reasons.add("同院系仪器");
            }
            if (frequencyMatch.compareTo(new BigDecimal(15)) > 0) {
                reasons.add("高使用率");
            }
            if (freeHour.compareTo(new BigDecimal(10)) > 0) {
                reasons.add("长期空闲");
            }
            vo.setRecommendReason(reasons.isEmpty() ? "基础匹配" : String.join("、", reasons));

            recommendList.add(vo);
        }

        // 排序+限流
        return recommendList.stream()
                .sorted((a, b) -> b.getMatchRate().compareTo(a.getMatchRate()))
                .limit(count)
                .collect(Collectors.toList());
    }

    /**
     * 获取用户院系ID（原生MyBatis）
     */
    private Long getUserDeptId(Long userId) {
        SysInstrumentBorrow borrow = borrowMapper.selectLatestByUserId(userId);
        if (borrow != null) {
            SysInstrument instrument = instrumentMapper.selectInstrumentById(borrow.getInstrumentId());
            return instrument != null ? instrument.getDeptId() : null;
        }
        return null;
    }

    /**
     * 获取仪器月使用次数（原生MyBatis + JDK8日期）
     */
    private int getMonthUseCount(Long instrumentId) {
        // 修复：JDK8原生获取本月初时间
        YearMonth currentMonth = YearMonth.now();
        LocalDate firstDay = currentMonth.atDay(1);
        Date monthStart = Date.from(firstDay.atStartOfDay(ZoneId.systemDefault()).toInstant());

        return borrowMapper.countByInstrumentIdAndTime(instrumentId, monthStart);
    }

    /**
     * 获取空闲时长（小时）
     */
    private BigDecimal getFreeHour(Long instrumentId) {
        SysInstrumentBorrow borrow = borrowMapper.selectLatestBorrowByInstrumentId(instrumentId);
        if (borrow == null) {
            return new BigDecimal(24 * 7);
        }
        // 时间差计算
        long diff = borrow.getPlanReturnTime().getTime() - new Date().getTime();
        BigDecimal hour = new BigDecimal(diff).divide(new BigDecimal(3600000), 2, BigDecimal.ROUND_HALF_UP);
        return hour.compareTo(BigDecimal.ZERO) > 0 ? hour : BigDecimal.ZERO;
    }

    /**
     * 获取空闲开始时间
     */
    private Date getFreeStartTime(Long instrumentId) {
        SysInstrumentBorrow borrow = borrowMapper.selectLatestBorrowByInstrumentId(instrumentId);
        return borrow != null ? borrow.getPlanReturnTime() : new Date();
    }
}