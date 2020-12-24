package com.powernode.controller;

import com.powernode.entity.Dept;
import com.powernode.entity.Employee;
import com.powernode.model.service.DeptService;
import com.powernode.model.service.EmployeeService;
import com.powernode.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/19 14:11
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
@RequestMapping("employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DeptService deptService;

    @RequestMapping("list")
    public PageInfo<Employee> list(Employee employee) {
//        deptList.addAll(deptService.list());
        PageInfo<Employee> pageInfo = new PageInfo<>();
        pageInfo.setList(employeeService.list(employee));
        return pageInfo;
    }
    /*分页不生效
    public void list(PageInfo<Employee> pageInfo,Employee employee, ArrayList<Dept> deptList) {
        deptList.addAll(deptService.list());
        pageInfo.setList(employeeService.list(employee));
    }*/

    /*@RequestMapping("add")
    public void add(Employee employee){
    }*/

    @RequestMapping("saveAdd")
    public String saveAdd(Employee employee) {
        employeeService.save(employee);
        return "redirect:list";
    }

    @RequestMapping("get")
//    将java对象转为json格式的数据
    @ResponseBody
    public Employee get(int employeeId ) {
        return employeeService.get(employeeId);
    }

    /*@RequestMapping("update")
    public  Employee update(int empId){
       return employeeService.get(empId);
    }*/

    @RequestMapping("saveUpdate")
    public String saveUpdate(Employee employee) {
        employeeService.update(employee);
        return "redirect:list";
    }
}
