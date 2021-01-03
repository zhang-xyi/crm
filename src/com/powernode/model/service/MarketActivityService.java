package com.powernode.model.service;

import com.powernode.entity.MarketActivity;
import com.powernode.templete.TempleteService;

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
public interface MarketActivityService extends TempleteService<MarketActivity> {

    List<MarketActivity> list(MarketActivity marketActivity);

    List<MarketActivity> list(String name);
}
