package com.powernode.model.dao;

import com.powernode.entity.ActivityRemark;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface ActivityRemarkDao extends TempleteDao<ActivityRemark> {
    List<ActivityRemark> selectAllByActivity(Integer activityId);

}