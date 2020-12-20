package com.powernode.model.service;

import com.powernode.entity.Employee;
import com.powernode.model.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/19 11:56
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> list(Employee employee) {
        return employeeDao.selectAll(employee);
    }

    @Override
    public Employee get(int empId) {
        return employeeDao.selectByPrimaryKey(empId);
    }

    @Override
    public void save(Employee employee) {
        employeeDao.insertSelective(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.updateByPrimaryKeySelective(employee);

    }
}
