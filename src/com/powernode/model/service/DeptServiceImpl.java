package com.powernode.model.service;

import com.powernode.entity.Dept;
import com.powernode.model.dao.DeptDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.model.service
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/20 19:49
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> list() {
        return deptDao.selectAll();
    }

    @Override
    public Dept get(int empId) {
        return deptDao.selectByPrimaryKey(empId);
    }

    @Override
    public void save(Dept dept) {
        deptDao.insertSelective(dept);

    }

    @Override
    public void update(Dept dept) {
        deptDao.updateByPrimaryKeySelective(dept);
    }
}
