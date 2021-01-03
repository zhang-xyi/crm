package com.powernode.model.dao;

import com.powernode.entity.Customer;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface CustomerDao extends TempleteDao<Customer> {

    List<Customer> selectByName(String name);

}