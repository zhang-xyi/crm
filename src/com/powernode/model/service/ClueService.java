package com.powernode.model.service;

import com.powernode.entity.Clue;
import com.powernode.templete.TempleteService;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/30 21:15
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface ClueService extends TempleteService<Clue> {

    List<Clue> list(int top);
    List<Clue> list(int top,String key);
}
