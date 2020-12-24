package com.powernode.model.service;

import com.powernode.entity.DictionaryType;
import com.powernode.model.dao.DictionaryTypeDao;
import com.powernode.templete.TempleteDao;
import com.powernode.templete.TempleteServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 20:07
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class DictionaryTypeServiceImpl extends TempleteServiceImpl<DictionaryType> implements DictionaryTypeService {

    @Autowired
    private DictionaryTypeDao dictionaryTypeDao;

    @Override
    public TempleteDao<DictionaryType> getDao() {
        return dictionaryTypeDao;
    }
}
