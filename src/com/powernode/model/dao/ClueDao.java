package com.powernode.model.dao;

import com.powernode.entity.Clue;
import com.powernode.templete.TempleteDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueDao extends TempleteDao<Clue> {

    List<Clue> selectByTop(int top);

    List<Clue> selectByTopKey(@Param("top") int top, @Param("key") String key);
}