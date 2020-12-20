package com.powernode.model.service;

import com.powernode.entity.Employee;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/19 11:55
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface EmployeeService {
    List<Employee> list(Employee employee);

    Employee get(int empId);

    void save(Employee employee);

    void update(Employee employee);
}
