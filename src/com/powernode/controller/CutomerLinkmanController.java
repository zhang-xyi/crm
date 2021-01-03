package com.powernode.controller;

import com.powernode.entity.CustomerLinkRecord;
import com.powernode.entity.CutomerLinkman;
import com.powernode.model.service.CustomerLinkRecordService;
import com.powernode.model.service.CustomerService;
import com.powernode.model.service.CutomerLinkmanService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/27 20:23
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
@RequestMapping("customerLinkman")
public class CutomerLinkmanController extends TempleteController<CutomerLinkman> {

    @Autowired
    private CutomerLinkmanService cutomerLinkmanService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerLinkRecordService customerLinkRecordService;

    @Override
    public TempleteService getService() {
        return cutomerLinkmanService;
    }

    @RequestMapping("list")
    public List<CutomerLinkman> list(Map<String, Object> map, int custId) {
        map.put("customer", customerService.get(custId));
        return cutomerLinkmanService.list(custId);
    }

    @RequestMapping("save")
    @Override
    public String save(CutomerLinkman formData) {
        super.save(formData);
        return "redirect:/customerLinkman/list?custId=" + formData.getCustId();
    }

    @RequestMapping("saveUpdate")
    @Override
    public String saveUpdate(CutomerLinkman formData) {
        return super.saveUpdate(formData);
    }

    @RequestMapping("delete")
    @Override
    public String delete(Integer id) {
        return super.delete(id);
    }

    @RequestMapping("view")
    public CutomerLinkman view(ArrayList<CustomerLinkRecord> list, Integer linkmanId) {
        list.addAll(customerLinkRecordService.list(linkmanId));
        return super.view(linkmanId);
    }

    @RequestMapping("ajaxList")
    @ResponseBody
    public List<CutomerLinkman> ajaxList(int custId){
        return cutomerLinkmanService.list(custId);
    }
}
