package com.powernode.templete;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.templete
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 19:16
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public abstract class TempleteServiceImpl<T> implements TempleteService<T> {
    @Override
    public List<T> list() {
        return getDao().selectAll();
    }

    @Override
    public T get(Integer id) {
        return getDao().selectByPrimaryKey(id);
    }

    @Override
    public int save(T obj) {
        return getDao().insertSelective(obj);
    }

    @Override
    public int update(T obj) {
        return getDao().updateByPrimaryKeySelective(obj);
    }

    @Override
    public int delete(Integer id) {
        return getDao().deleteByPrimaryKey(id);
    }

}
