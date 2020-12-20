package com.powernode.model.service;

import com.powernode.entity.Dept;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/20 19:49
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface DeptService {
    List<Dept> list();

    Dept get(int empId);

    void save(Dept dept);

    void update(Dept dept);
}
