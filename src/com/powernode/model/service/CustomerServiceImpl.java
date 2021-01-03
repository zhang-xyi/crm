package com.powernode.model.service;

import com.powernode.entity.Customer;
import com.powernode.model.dao.CustomerDao;
import com.powernode.templete.TempleteDao;
import com.powernode.templete.TempleteServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/27 19:06
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class CustomerServiceImpl extends TempleteServiceImpl<Customer> implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public TempleteDao<Customer> getDao() {
        return customerDao;
    }

    @Override
    public List<Customer> list(String name) {
        return customerDao.selectByName(name);
    }
}
