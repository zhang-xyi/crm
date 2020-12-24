package com.powernode.model.service;

import com.powernode.entity.Dictionary;
import com.powernode.templete.TempleteService;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/23 14:24
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface DictionaryService extends TempleteService<Dictionary> {

    List<Dictionary> list(int dictTypeId);
}
