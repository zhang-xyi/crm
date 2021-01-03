package com.powernode.model.service;

import com.powernode.entity.CustomerLinkRecord;
import com.powernode.model.dao.CustomerLinkRecordDao;
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
 * @CreateDate: 2020/12/29 14:13
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class CustomerLinkRecordServiceImpl extends TempleteServiceImpl<CustomerLinkRecord> implements CustomerLinkRecordService {

    @Autowired
    private CustomerLinkRecordDao customerLinkRecordDao;

    @Override
    public TempleteDao<CustomerLinkRecord> getDao() {
        return customerLinkRecordDao;
    }

    @Override
    public List<CustomerLinkRecord> list(int linkmanId) {
        return customerLinkRecordDao.selectByLinkman(linkmanId);
    }
}
