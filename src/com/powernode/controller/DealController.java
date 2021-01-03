package com.powernode.controller;

import com.powernode.entity.Clue;
import com.powernode.entity.Deal;
import com.powernode.entity.DealStage;
import com.powernode.model.service.ClueService;
import com.powernode.model.service.DealService;
import com.powernode.model.service.DealStageService;
import com.powernode.util.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/29 16:00
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
@RequestMapping("deal")
public class DealController {

    @Autowired
    private DealService dealService;

    @Autowired
    private ClueService clueService;

    @Autowired
    private DealStageService dealStageService;

    @RequestMapping("list")
    PageInfo<Deal> list(){
        PageInfo<Deal> pageInfo =new PageInfo<>();
        pageInfo.setList(dealService.list());
        return pageInfo;
    }

    @RequestMapping("edit")
    List<Clue> edit(Deal deal){

        if (deal.getDealId()!=null){
            Deal dealDB=dealService.get(deal.getDealId());
            BeanUtils.copyProperties(dealDB,deal);
            //查询交易的阶段信息
            //ArrayList list
            //list.addAll(dealStageService.list(deal.getDealId()));
            List<DealStage> list=dealStageService.list(deal.getDealId());
            deal.setDealStages(list.toArray(new DealStage[]{}));
        }
        return clueService.list(8);
    }

    @RequestMapping("save")
    String save(Deal deal){

        if (deal.getDealId()!=null){
            //修改
            dealService.update(deal);
        }else {
            //新增
            dealService.save(deal);
        }

        return "redirect:list";
    }

}
