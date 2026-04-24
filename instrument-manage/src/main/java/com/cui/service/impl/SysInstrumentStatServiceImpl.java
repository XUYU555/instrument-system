package com.cui.service.impl;

import com.cui.domain.SysInstrument;
import com.cui.domain.vo.InstrumentStatVO;
import com.cui.mapper.SysInstrumentBorrowMapper;
import com.cui.mapper.SysInstrumentMapper;
import com.cui.mapper.SysInstrumentRepairMapper;
import com.cui.service.ISysInstrumentStatService;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.system.mapper.SysDeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class SysInstrumentStatServiceImpl implements ISysInstrumentStatService {

    @Autowired
    private SysInstrumentMapper instrumentMapper;
    @Autowired
    private SysInstrumentBorrowMapper borrowMapper;
    @Autowired
    private SysInstrumentRepairMapper repairMapper;
    @Autowired
    private SysDeptMapper deptMapper;

    @Override
    public List<InstrumentStatVO> statByDept() {
        List<SysInstrument> instrumentList = instrumentMapper.selectAll();
        if (CollectionUtils.isEmpty(instrumentList)) {
            return new ArrayList<>();
        }

        // 按院系ID分组
        Map<Long, List<SysInstrument>> deptInstrumentMap = instrumentList.stream()
                .collect(Collectors.groupingBy(SysInstrument::getDeptId));

        List<InstrumentStatVO> statVOList = new ArrayList<>();
        for (Map.Entry<Long, List<SysInstrument>> entry : deptInstrumentMap.entrySet()) {
            Long deptId = entry.getKey();
            List<SysInstrument> deptInstruments = entry.getValue();

            String deptName = "未知院系";
            if (deptId != null) {
                SysDept sysDept = deptMapper.selectDeptById(deptId);
                if (sysDept != null) {
                    deptName = sysDept.getDeptName(); // 从院系表取名称
                }
            }

            // 统计借用/维修次数
            List<Long> instrumentIds = deptInstruments.stream()
                    .map(SysInstrument::getInstrumentId)
                    .collect(Collectors.toList());
            int borrowCount = borrowMapper.countByInstrumentIds(instrumentIds);
            int repairCount = repairMapper.countByInstrumentIds(instrumentIds);

            // 可用率计算
            long normalCount = deptInstruments.stream()
                    .filter(ins -> "0".equals(ins.getStatus()))
                    .count();
            BigDecimal availabilityRatio = new BigDecimal(normalCount)
                    .divide(new BigDecimal(deptInstruments.size()), 2, BigDecimal.ROUND_HALF_UP)
                    .multiply(new BigDecimal(100));

            // 封装返回
            InstrumentStatVO vo = new InstrumentStatVO();
            vo.setDimensionName(deptName);  // 真实院系名称，无null
            vo.setBorrowCount(borrowCount);
            vo.setRepairCount(repairCount);
            vo.setAvailabilityRatio(availabilityRatio);
            statVOList.add(vo);
        }
        return statVOList;
    }

    @Override
    public List<InstrumentStatVO> statByMonth(Integer year) {
        // 3. 修复：获取当前年份（JDK8原生）
        if (year == null) {
            year = LocalDate.now().getYear();
        }
        List<InstrumentStatVO> statVOList = new ArrayList<>();
        for (int month = 1; month <= 12; month++) {
            // 4. 修复：计算 月初 / 月末（标准API，无报错）
            YearMonth yearMonth = YearMonth.of(year, month);
            // 月初转Date
            LocalDate startLocal = yearMonth.atDay(1);
            Date monthStart = Date.from(startLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
            // 月末转Date
            LocalDate endLocal = yearMonth.atEndOfMonth();
            Date monthEnd = Date.from(endLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());

            int borrowCount = borrowMapper.countByBorrowTimeBetween(monthStart, monthEnd);

            InstrumentStatVO vo = new InstrumentStatVO();
            vo.setDimensionName(month + "月");
            vo.setBorrowCount(borrowCount);
            vo.setStatTime(monthStart);
            statVOList.add(vo);
        }
        return statVOList;
    }

    @Override
    public List<InstrumentStatVO> statByType() {
        List<SysInstrument> instrumentList = instrumentMapper.selectAll();
        if (CollectionUtils.isEmpty(instrumentList)) {
            return new ArrayList<>();
        }

        Map<String, List<SysInstrument>> typeMap = instrumentList.stream()
                .filter(ins -> ins.getSpecs() != null) // 过滤null值
                .collect(Collectors.groupingBy(SysInstrument::getSpecs));

        List<InstrumentStatVO> statVOList = new ArrayList<>();
        for (Map.Entry<String, List<SysInstrument>> entry : typeMap.entrySet()) {
            String type = entry.getKey();
            List<SysInstrument> typeInstruments = entry.getValue();

            long normalCount = typeInstruments.stream().filter(ins -> "0".equals(ins.getStatus())).count();
            BigDecimal availabilityRatio = new BigDecimal(normalCount).divide(
                    new BigDecimal(typeInstruments.size()), 2, BigDecimal.ROUND_HALF_UP
            ).multiply(new BigDecimal(100));

            InstrumentStatVO vo = new InstrumentStatVO();
            vo.setDimensionName(type);
            vo.setAvailabilityRatio(availabilityRatio);
            statVOList.add(vo);
        }
        return statVOList;
    }

    @Override
    public Map<String, Integer> statDashboard() {
        Map<String, Integer> dashboardMap = new HashMap<>();
        int totalCount = instrumentMapper.countAll();
        List<String> statusList = Arrays.asList("0", "3");
        int inUseCount = instrumentMapper.countByStatusIn(statusList);
        int faultCount = repairMapper.countByStatus("1");
        int overdueCount = borrowMapper.countByStatus("4");

        dashboardMap.put("totalCount", totalCount);
        dashboardMap.put("inUseCount", inUseCount);
        dashboardMap.put("faultCount", faultCount);
        dashboardMap.put("overdueCount", overdueCount);
        return dashboardMap;
    }
}