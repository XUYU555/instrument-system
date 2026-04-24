package com.cui.config;

import com.cui.service.ISysInstrumentWarnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 仪器预警定时任务
 * 每小时检查一次阈值
 */
@Component
public class InstrumentWarnTask {

    @Autowired
    private ISysInstrumentWarnService instrumentWarnService;

    /**
     * 每小时执行一次阈值检查
     */
    @Scheduled(cron = "0 0 */1 * * ?")
    public void warnCheckTask() {
        instrumentWarnService.checkWarnThreshold();
    }
}