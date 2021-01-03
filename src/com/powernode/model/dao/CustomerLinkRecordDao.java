package com.powernode.model.dao;

import com.powernode.entity.CustomerLinkRecord;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface CustomerLinkRecordDao extends TempleteDao<CustomerLinkRecord> {

    List<CustomerLinkRecord> selectByLinkman(Integer linkmanId);

}