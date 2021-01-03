package com.powernode.controller;

import com.powernode.entity.Clue;
import com.powernode.model.service.ClueService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/30 21:19
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
@RequestMapping("clue")
public class ClueController extends TempleteController<Clue> {

    @Autowired
    private ClueService clueService;

    @Override
    public TempleteService<Clue> getService() {
        return clueService;
    }

    @RequestMapping("ajaxSearch")
    @ResponseBody
    List<Clue> ajaxList(String key){
        return clueService.list(8,key);
    }
}
