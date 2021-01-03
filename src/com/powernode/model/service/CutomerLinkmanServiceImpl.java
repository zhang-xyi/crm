package com.powernode.model.service;

import com.powernode.entity.CutomerLinkman;
import com.powernode.model.dao.CustomerDao;
import com.powernode.model.dao.CutomerLinkmanDao;
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
 * @CreateDate: 2020/12/27 20:17
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class CutomerLinkmanServiceImpl extends TempleteServiceImpl<CutomerLinkman> implements CutomerLinkmanService {

    @Autowired
    private CutomerLinkmanDao cutomerLinkmanDao;

    @Override
    public TempleteDao<CutomerLinkman> getDao() {
        return cutomerLinkmanDao;
    }

    @Override
    public List<CutomerLinkman> list(int custId) {
        return cutomerLinkmanDao.selectAllByCustId(custId);
    }

    @Override
    public int save(CutomerLinkman obj) {
        obj.setCreateBy(Util.getLoginEmplIdFromSession());
        obj.setCreateTime(new Date());
        obj.setUpdateBy(Util.getLoginEmplIdFromSession());
        obj.setUpdateTime(new Date());
        return super.save(obj);
    }

    @Override
    public int update(CutomerLinkman obj) {
        obj.setUpdateBy(Util.getLoginEmplIdFromSession());
        obj.setUpdateTime(new Date());
        return super.update(obj);
    }
}
