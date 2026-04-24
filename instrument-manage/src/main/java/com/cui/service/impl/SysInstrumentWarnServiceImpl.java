package com.cui.service.impl;

import com.cui.domain.*;
import com.cui.mapper.*;
import com.cui.service.ISysInstrumentWarnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Service
public class SysInstrumentWarnServiceImpl implements ISysInstrumentWarnService {

    @Autowired
    private SysInstrumentWarnRuleMapper warnRuleMapper;
    @Autowired
    private SysInstrumentWarnRecordMapper warnRecordMapper;
    @Autowired
    private SysInstrumentBorrowMapper borrowMapper;
    @Autowired
    private SysInstrumentRepairMapper repairMapper;
    @Autowired
    private SysInstrumentMapper instrumentMapper;

    @Override
    public boolean insertWarnRule(SysInstrumentWarnRule rule) {
        // 原生获取当前时间，替代所有DateUtils
        rule.setCreateTime(new Date());
        return warnRuleMapper.insertWarnRule(rule) > 0;
    }

    @Override
    public List<SysInstrumentWarnRule> selectWarnRuleList(SysInstrumentWarnRule rule) {
        return warnRuleMapper.selectEnabledRuleList(rule);
    }

    @Override
    public List<SysInstrumentWarnRecord> selectWarnRecordList(SysInstrumentWarnRecord record) {
        return warnRecordMapper.selectWarnRecordList(record);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean handleWarnRecord(Long recordId, String handleRemark) {
        SysInstrumentWarnRecord record = warnRecordMapper.selectWarnRecordById(recordId);
        if (record == null) {
            return false;
        }
        record.setHandleStatus("1");
        record.setHandleUserId(getUserId());
        record.setHandleTime(new Date());
        record.setHandleRemark(handleRemark);
        return warnRecordMapper.updateWarnRecord(record) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void checkWarnThreshold() {
        List<SysInstrumentWarnRule> ruleList = selectWarnRuleList(new SysInstrumentWarnRule());
        if (ruleList.isEmpty()) {
            return;
        }

        for (SysInstrumentWarnRule rule : ruleList) {
            Long instrumentId = rule.getInstrumentId();
            String warnType = rule.getWarnType();
            BigDecimal threshold = rule.getThreshold();

            if ("1".equals(warnType)) {
                checkBorrowOverdue(rule, instrumentId, threshold);
            } else if ("2".equals(warnType)) {
                checkRepairTimeout(rule, instrumentId, threshold);
            } else if ("3".equals(warnType)) {
                checkUseFrequency(rule, instrumentId, threshold);
            } else if ("4".equals(warnType)) {
                checkRepairCost(rule, instrumentId, threshold);
            }
        }
    }

    private void checkBorrowOverdue(SysInstrumentWarnRule rule, Long instrumentId, BigDecimal threshold) {
        List<SysInstrumentBorrow> overdueList = borrowMapper.selectOverdueBorrowList(instrumentId);
        for (SysInstrumentBorrow borrow : overdueList) {
            long diff = new Date().getTime() - borrow.getPlanReturnTime().getTime();
            BigDecimal overdueHour = new BigDecimal(diff).divide(new BigDecimal(3600000), 2, BigDecimal.ROUND_HALF_UP);

            if (overdueHour.compareTo(threshold) >= 0) {
                triggerWarn(rule, borrow.getBorrowId(), borrow.getInstrumentId(),
                        "借用超期预警：仪器【" + borrow.getInstrumentName() + "】超期" + overdueHour + "小时（阈值：" + threshold + "小时）",
                        overdueHour.toString());
            }
        }
    }

    private void checkRepairTimeout(SysInstrumentWarnRule rule, Long instrumentId, BigDecimal threshold) {
        // 原生计算N天前的时间，无任何工具类
        long timeoutTime = System.currentTimeMillis() - (threshold.intValue() * 86400000L);
        Date timeoutDate = new Date(timeoutTime);
        List<SysInstrumentRepair> timeoutList = repairMapper.selectTimeoutRepairList(instrumentId, timeoutDate);
        for (SysInstrumentRepair repair : timeoutList) {
            long diff = new Date().getTime() - repair.getCreateTime().getTime();
            BigDecimal timeoutDay = new BigDecimal(diff).divide(new BigDecimal(86400000), 2, BigDecimal.ROUND_HALF_UP);
            triggerWarn(rule, repair.getRepairId(), repair.getInstrumentId(),
                    "维修超时预警：仪器【" + repair.getInstrumentName() + "】维修超期" + timeoutDay + "天（阈值：" + threshold + "天）",
                    timeoutDay.toString());
        }
    }

    private void checkUseFrequency(SysInstrumentWarnRule rule, Long instrumentId, BigDecimal threshold) {
        LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
        Date monthStart = Date.from(firstDayOfMonth.atStartOfDay(ZoneId.systemDefault()).toInstant());

        Integer count = borrowMapper.countInstrumentMonthUse(instrumentId, monthStart);
        if (count != null && count >= threshold.intValue()) {
            SysInstrument instrument = instrumentMapper.selectInstrumentById(instrumentId);
            triggerWarn(rule, null, instrumentId,
                    "使用频次超限预警：仪器【" + instrument.getInstrumentName() + "】月使用次数" + count + "次（阈值：" + threshold + "次）",
                    count.toString());
        }
    }

    private void checkRepairCost(SysInstrumentWarnRule rule, Long instrumentId, BigDecimal threshold) {
        List<SysInstrumentRepair> costList = repairMapper.selectCostOverRepairList(instrumentId, threshold);
        for (SysInstrumentRepair repair : costList) {
            triggerWarn(rule, repair.getRepairId(), repair.getInstrumentId(),
                    "维修费用超限预警：仪器【" + repair.getInstrumentName() + "】维修费用" + repair.getCost() + "元（阈值：" + threshold + "元）",
                    repair.getCost().toString());
        }
    }

    private void triggerWarn(SysInstrumentWarnRule rule, Long businessId, Long instrumentId, String content, String triggerValue) {
        int exists = warnRecordMapper.existsUnHandleWarn(rule.getRuleId(), businessId);
        if (exists > 0) {
            return;
        }

        SysInstrumentWarnRecord record = new SysInstrumentWarnRecord();
        record.setRuleId(rule.getRuleId());
        record.setInstrumentId(instrumentId);
        record.setBusinessId(businessId);
        record.setWarnType(rule.getWarnType());
        record.setWarnContent(content);
        record.setTriggerValue(triggerValue);
        record.setHandleStatus("0");
        record.setCreateTime(new Date());
        warnRecordMapper.insertWarnRecord(record);
    }

    private Long getUserId() {
        return 1L;
    }
}