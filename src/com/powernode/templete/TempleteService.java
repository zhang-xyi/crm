package com.powernode.templete;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.templete
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 19:08
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface TempleteService<T> {

    List<T> list();

    T get(Integer id);

    int save(T obj);

    int update(T obj);

    int delete(Integer id);

    TempleteDao<T> getDao();
}
