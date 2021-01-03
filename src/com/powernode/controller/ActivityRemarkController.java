package com.powernode.controller;

import com.powernode.entity.ActivityRemark;
import com.powernode.model.service.ActivityRemarkService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/26 11:44
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
@RequestMapping("activityRemark")
public class ActivityRemarkController extends TempleteController<ActivityRemark> {

    @Autowired
    private ActivityRemarkService activityRemarkService;

    @Override
    public TempleteService getService() {
        return activityRemarkService;
    }


    @RequestMapping("list")
    public List<ActivityRemark> list(Integer activityId) {
        return super.list();
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map<String, Object> del(int remarkId) {
        Map<String, Object> map = new HashMap<>();
        try {
            activityRemarkService.delete(remarkId);
            map.put("flag", true);
        } catch (Exception e) {
            map.put("flag", false);
            e.printStackTrace();
        }
        return map;
    }

    @Override
    @RequestMapping("saveUpdate")
    public String saveUpdate(ActivityRemark formData) {
        super.save(formData);
        return "redirect:/activity/view?activityId=" + formData.getActivityId();
    }
}
