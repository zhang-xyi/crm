package com.powernode.templete;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.templete
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 18:58
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface TempleteDao<T> {

    int deleteByPrimaryKey(Integer id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer id);

    List<T> selectAll();

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

}
