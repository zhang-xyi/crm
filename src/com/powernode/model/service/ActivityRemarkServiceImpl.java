package com.powernode.model.service;

import com.powernode.entity.ActivityRemark;
import com.powernode.model.dao.ActivityRemarkDao;
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
 * @CreateDate: 2020/12/26 11:40
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class ActivityRemarkServiceImpl extends TempleteServiceImpl<ActivityRemark> implements ActivityRemarkService {

    @Autowired
    private ActivityRemarkDao activityRemarkDao;

    @Override
    public TempleteDao<ActivityRemark> getDao() {
        return activityRemarkDao;
    }

    @Override
    public int save(ActivityRemark obj) {
        obj.setCreateBy(Util.getLoginEmplIdFromSession());
        obj.setCreateTime(new Date());
        obj.setUpdateBy(Util.getLoginEmplIdFromSession());
        obj.setUpdateTime(new Date());
        return super.save(obj);
    }

    @Override
    public List<ActivityRemark> list(Integer activityId) {
        return activityRemarkDao.selectAllByActivity(activityId);
    }
}
