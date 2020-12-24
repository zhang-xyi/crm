package com.powernode.controller;

import com.powernode.entity.Employee;
import com.powernode.model.service.EmployeeService;
import com.powernode.util.Constants;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 10:20
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("login")
    void login() {

    }

    @RequestMapping("doLogin")
    String doLogin(Employee employee){
        Employee employeeDB=employeeService.login(employee);
        if (employeeDB==null){
            employee.setMsg("用户名或密码错误");
            return "login";
        }

        Util.putObjectToSession(Constants.LOGIN_EMPLOYEE,employeeDB);

        return "redirect:/index";
    }

    @RequestMapping("logout")
    String logout(){
        Util.removeObjectFromSession(Constants.LOGIN_EMPLOYEE);
        return "redirect:/login";
    }
}
