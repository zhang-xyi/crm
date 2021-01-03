package com.powernode.model.service;

import com.powernode.entity.Deal;
import com.powernode.model.dao.DealDao;
import com.powernode.templete.TempleteDao;
import com.powernode.templete.TempleteServiceImpl;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/29 15:58
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class DealServiceImpl extends TempleteServiceImpl<Deal> implements DealService {

    @Autowired
    private DealDao dealDao;

    @Autowired
    private DealStageService dealStageService;


    @Override
    public TempleteDao<Deal> getDao() {
        return dealDao;
    }

    @Override
    @Transactional
    public int save(Deal deal) {
        //设置交易号
        deal.setDealNo(Util.generateDealNo());
        //设置创建人和修改人
        deal.setCreateBy(Util.getLoginEmplIdFromSession());
        deal.setCreateTime(new Date());
        deal.setUpdateBy(Util.getLoginEmplIdFromSession());
        deal.setUpdateTime(new Date());
        //1.保存交易
        int count = dealDao.insertSelective(deal);
        //2.保存阶段
        dealStageService.save(deal.getDealId(),deal.getDealStages());



        return count;
    }

    @Override
    @Transactional
    public int update(Deal deal) {

        //1.更新交易
        int i=super.update(deal);

        //2.删除当前交易的所有阶段
        int dealId=deal.getDealId();
        dealStageService.deleteByDeal(dealId);

        //3.为当前交易写入新的交易阶段
        dealStageService.save(dealId,deal.getDealStages());



        //更新修改时间
        deal.setUpdateBy(Util.getLoginEmplIdFromSession());
        deal.setUpdateTime(new Date());
        return i;
    }
}
