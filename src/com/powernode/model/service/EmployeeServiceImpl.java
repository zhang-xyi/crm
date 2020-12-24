package com.powernode.model.service;

import com.powernode.entity.Employee;
import com.powernode.model.dao.EmployeeDao;
import com.powernode.util.MD5Util;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    public Employee login(Employee employee) {
        employee.setEmployeePwd(MD5Util.getMD5(employee.getEmployeePwd()));
        employee.setEmployeeAllowedIps(Util.getClientIp());
        return employeeDao.selectOne(employee);
    }

    @Override
    public void save(Employee employee) {
        employee.setCreateBy(Util.getLoginEmplIdFromSession());
        employee.setCreateTime(new Date());
        employee.setUpdateBy(Util.getLoginEmplIdFromSession());
        employee.setUpdateTime(new Date());
        employee.setEmployeePwd(MD5Util.getMD5(employee.getEmployeePwd()));
        employeeDao.insertSelective(employee);
    }

    @Override
    public void update(Employee employee) {
        employee.setUpdateBy(Util.getLoginEmplIdFromSession());
        employee.setUpdateTime(new Date());
        employeeDao.updateByPrimaryKeySelective(employee);

    }
}
