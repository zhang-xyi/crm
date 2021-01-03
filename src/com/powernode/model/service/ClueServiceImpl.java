package com.powernode.model.service;

import com.powernode.entity.Clue;
import com.powernode.model.dao.ClueDao;
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
 * @CreateDate: 2020/12/30 21:16
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class ClueServiceImpl extends TempleteServiceImpl<Clue> implements ClueService {

    @Autowired
    private ClueDao clueDao;


    public List<Clue> list(int top) {
        return clueDao.selectByTop(top);
    }

    public List<Clue> list(int top,String key) {
        return clueDao.selectByTopKey(top,key);
    }

    @Override
    public TempleteDao<Clue> getDao() {
        return clueDao;
    }
}
