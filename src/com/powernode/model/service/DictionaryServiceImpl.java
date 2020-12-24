package com.powernode.model.service;

import com.powernode.entity.Dictionary;
import com.powernode.model.dao.DictionaryDao;
import com.powernode.templete.TempleteDao;
import com.powernode.templete.TempleteServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/23 14:26
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class DictionaryServiceImpl extends TempleteServiceImpl<Dictionary> implements DictionaryService  {

    @Autowired
    private DictionaryDao dictionaryDao;

    @Override
    public TempleteDao<Dictionary> getDao() {
        return dictionaryDao;
    }

    @Override
    public List<Dictionary> list(int dictTypeId) {
        return dictionaryDao.selectByDictTypeId(dictTypeId);
    }
}
