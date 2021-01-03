package com.powernode.model.dao;

import com.powernode.entity.CutomerLinkman;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface CutomerLinkmanDao extends TempleteDao<CutomerLinkman> {

    List<CutomerLinkman> selectAllByCustId(int custId);

}