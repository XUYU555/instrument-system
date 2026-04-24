package com.ruoyi.web.controller.instrument;

import com.cui.domain.vo.InstrumentRecommendVO;
import com.cui.service.ISysInstrumentRecommendService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 仪器预约推荐控制器
 *
 * @author xuyu555
 * @date 2026/4/24 16:50
 */
@Controller
@RequestMapping("/instrument/recommend")
public class SysInstrumentRecommendController extends BaseController {
    private String prefix = "system/instrument";

    @Autowired
    private ISysInstrumentRecommendService instrumentRecommendService;

    /**
     * 推荐页面
     */
    @GetMapping()
    public String recommendPage(ModelMap mmap) {
        // 获取当前登录用户ID（若依框架获取）
        Long userId = getUserId();
        // 默认推荐10个
        List<InstrumentRecommendVO> recommendList = instrumentRecommendService.recommend(userId, 10);
        mmap.put("recommendList", recommendList);
        return prefix + "/recommend";
    }

    /**
     * 刷新推荐列表（接口）
     */
    @GetMapping("/refresh")
    @ResponseBody
    public AjaxResult refreshRecommend(@RequestParam(defaultValue = "5") Integer count) {
        Long userId = getUserId();
        List<InstrumentRecommendVO> list = instrumentRecommendService.recommend(userId, count);
        return AjaxResult.success(list);
    }
}