package com.powernode.model.service;

import com.powernode.entity.Customer;
import com.powernode.templete.TempleteService;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/27 19:05
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface CustomerService extends TempleteService<Customer> {

    List<Customer> list(String name);
}
