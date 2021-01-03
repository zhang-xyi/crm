package com.powernode.controller;

import com.powernode.entity.Customer;
import com.powernode.model.service.CustomerService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import com.powernode.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/27 19:11
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@RequestMapping("customer")
@Controller
public class CustomerController extends TempleteController<Customer> {

    @Autowired
    private CustomerService customerService;

    @Override
    public TempleteService<Customer> getService() {
        return customerService;
    }

    @RequestMapping("list")

    public PageInfo<Customer> pageInfolist() {
        PageInfo<Customer> pageInfo=new PageInfo<>();
        pageInfo.setList(super.list());
        return pageInfo;
    }

    @RequestMapping("add")
    @Override
    public void add() {
        super.add();
    }

    @RequestMapping("save")
    @Override
    public String save(Customer formData) {
        return super.save(formData);
    }

    @RequestMapping("update")
    @Override
    public Customer update(Integer id) {
        return super.update(id);
    }

    @RequestMapping("saveUpdate")
    @Override
    public String saveUpdate(Customer formData) {
        return super.saveUpdate(formData);
    }

    @RequestMapping("ajaxList")
    @ResponseBody
    public List<Customer> ajaxList(String name){
        return customerService.list(name);
    }



}
