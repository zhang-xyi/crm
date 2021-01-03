package com.powernode.controller;

import com.powernode.entity.MarketActivity;
import com.powernode.model.service.ActivityRemarkService;
import com.powernode.model.service.MarketActivityService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import com.powernode.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/24 21:04
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@RequestMapping("activity")
@Controller
public class MarketActivityController extends TempleteController<MarketActivity> {

    @Autowired
    private MarketActivityService marketActivityService;

    @Autowired
    private ActivityRemarkService activityRemarkService;

    @Override
    public TempleteService<MarketActivity> getService() {
        return marketActivityService;
    }

    @RequestMapping("list")
    public PageInfo pageInfoList(MarketActivity marketActivity){
        PageInfo<MarketActivity> pageInfo=new PageInfo<>();
        pageInfo.setList(marketActivityService.list(marketActivity));
        return pageInfo;

    }

    @RequestMapping("add")
    @Override
    public void add() {
        super.add();
    }

    @RequestMapping("save")
    @Override
    public String save(MarketActivity formData) {
        return super.save(formData);
    }

    @RequestMapping("update")
    @ResponseBody
    @Override
    public MarketActivity update(Integer activityId) {
        MarketActivity activity=super.update(activityId);
        return activity;

    }

    @RequestMapping("saveUpdate")
    @Override
    public String saveUpdate(MarketActivity formData) {
        return super.saveUpdate(formData);
    }

    @Override
    public String delete(Integer id) {
        return super.delete(id);
    }

    @RequestMapping("view")
    @Override
    public MarketActivity view(Integer activityId) {

        MarketActivity marketActivity=super.view(activityId);
        marketActivity.setActivityRemarkList(activityRemarkService.list(activityId));
        return marketActivity;
    }

    @RequestMapping("ajaxList")
    @ResponseBody
    public List<MarketActivity> ajaxList(String name){
        return marketActivityService.list(name);

    }
}
