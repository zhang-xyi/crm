package com.powernode.model.service;

import com.powernode.entity.DealStage;
import com.powernode.templete.TempleteService;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2021/1/1 20:23
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2021
 */
public interface DealStageService extends TempleteService<DealStage> {

    void save(int dealId,DealStage[] dealStages);

    List<DealStage> list(int dealId);

    void deleteByDeal(int dealId);
}
