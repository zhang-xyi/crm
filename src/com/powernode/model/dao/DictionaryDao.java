package com.powernode.model.dao;

import com.powernode.entity.Dictionary;
import com.powernode.templete.TempleteDao;

import java.util.List;

public interface DictionaryDao extends TempleteDao<Dictionary> {

    List<Dictionary> selectByDictTypeId(int dictTypeId);

}