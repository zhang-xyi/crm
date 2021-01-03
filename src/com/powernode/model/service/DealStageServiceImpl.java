package com.powernode.model.service;

import com.powernode.entity.DealStage;
import com.powernode.model.dao.DealStageDao;
import com.powernode.templete.TempleteDao;
import com.powernode.templete.TempleteServiceImpl;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2021/1/1 20:24
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2021
 */
@Service
public class DealStageServiceImpl extends TempleteServiceImpl<DealStage> implements DealStageService {

    @Autowired
    private DealStageDao dealStageDao;

    @Override
    public TempleteDao<DealStage> getDao() {
        return dealStageDao;
    }

    @Override
    public void save(int dealId,DealStage[] dealStages) {

      /*  for(DealStage dealStage : dealStages){

            dealStageDao.insertSelective(dealStage);
        }*/
        for(DealStage dealStage : dealStages){

            dealStage.setDealId(dealId);
            dealStage.setCreateBy(Util.getLoginEmplIdFromSession());
            dealStage.setCreateTime(new Date());
            dealStage.setUpdateBy(Util.getLoginEmplIdFromSession());
            dealStage.setUpdateTime(new Date());

        }
        dealStageDao.insertBatch(dealStages);


    }

    @Override
    public void deleteByDeal(int dealId) {

        dealStageDao.deleteByDeal(dealId);
    }

    @Override
    public List<DealStage> list(int dealId) {
        return dealStageDao.selectByDeal(dealId);
    }
}
