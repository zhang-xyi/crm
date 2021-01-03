package com.powernode.model.service;

import com.powernode.entity.ActivityRemark;
import com.powernode.entity.MarketActivity;
import com.powernode.model.dao.MarketActivityDao;
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
 * @CreateDate: 2020/12/24 20:58
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class MarketActivityServiceImpl extends TempleteServiceImpl<MarketActivity> implements MarketActivityService {

    @Autowired
    private MarketActivityDao marketActivityDao;
    @Override
    public TempleteDao<MarketActivity> getDao() {
        return marketActivityDao;
    }

    @Override
    public int save(MarketActivity obj) {
        obj.setCreateBy(Util.getLoginEmplIdFromSession());
        obj.setCreateTime(new Date());
        obj.setUpdateBy(Util.getLoginEmplIdFromSession());
        obj.setUpdateTime(new Date());
        return super.save(obj);
    }

    @Override
    public int update(MarketActivity obj) {
        obj.setUpdateBy(Util.getLoginEmplIdFromSession());
        obj.setUpdateTime(new Date());
        return super.update(obj);
    }

    @Override
    public List<MarketActivity> list() {
        return super.list();
    }

    public List<MarketActivity> list(MarketActivity marketActivity){
        return marketActivityDao.selectAllByActivity(marketActivity);
    }

    public List<MarketActivity> list(String name){
        return marketActivityDao.selectByName(name);
    }
}
