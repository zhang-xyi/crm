package com.powernode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/19 11:15
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class IndexController {

    @RequestMapping("index")
    public String index(){
        return "workbench/index";
    }

    @RequestMapping("rightMain")
    public String rightMain(){
        return "workbench/main/index";
    }

}
