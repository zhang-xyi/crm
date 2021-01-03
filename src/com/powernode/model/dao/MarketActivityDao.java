package com.powernode.model.dao;

import com.powernode.entity.MarketActivity;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface MarketActivityDao extends TempleteDao<MarketActivity> {

    List<MarketActivity> selectAllByActivity(MarketActivity marketActivity);

    List<MarketActivity> selectByName(String name);

}