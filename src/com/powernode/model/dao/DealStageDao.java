package com.powernode.model.dao;

import com.powernode.entity.DealStage;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface DealStageDao extends TempleteDao<DealStage> {

    int insertBatch(DealStage[] dealStages);

    int deleteByDeal(int dealId);

    List<DealStage> selectByDeal(int dealId);

}