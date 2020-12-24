package com.powernode.controller;

import com.powernode.entity.Dept;
import com.powernode.entity.Dictionary;
import com.powernode.model.service.DeptService;
import com.powernode.model.service.DictionaryService;
import com.powernode.model.service.DictionaryTypeService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import com.powernode.util.ApplicationListener;
import com.powernode.util.Constants;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/23 14:31
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@RequestMapping("dict")
@Controller
public class DictionaryController extends TempleteController<Dictionary> {

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private DictionaryTypeService dictionaryTypeService;

    @Override
    public TempleteService<Dictionary> getService() {
        return dictionaryService;
    }

    //无法满足业务需求，进行方法重载
    @RequestMapping("list")
    public List<Dictionary> list(Map<String, Object> map, int dictTypeId) {
        map.put("DictionaryType", dictionaryTypeService.get(dictTypeId));

        return dictionaryService.list(dictTypeId);
    }

    @RequestMapping("add")
    public void add(Map<String, Object> map, int dictTypeId) {
        map.put("DictionaryType", dictionaryTypeService.get(dictTypeId));
        map.put("DictionaryTypeList", dictionaryTypeService.list());
    }

    @RequestMapping("save")
    @Override
    public String save(Dictionary formData) {
        super.save(formData);
        return "redirect:list?dictTypeId=" + formData.getDictTypeId();
    }

    @RequestMapping("update")
    public void update(Map<String, Object> map, int dictTypeId, Integer id) {
        map.put("DictionaryType", dictionaryTypeService.get(dictTypeId));
        map.put("DictionaryTypeList", dictionaryTypeService.list());
        map.put("dictionary", super.update(id));
    }

    @RequestMapping("saveUpdate")
   /* public String saveUpdate(Dictionary formData,int currentDictTypeId) {
        super.saveUpdate(formData);
        return "redirect:list?dictTypeId=" + currentDictTypeId;
    }*/

    public String saveUpdate(Dictionary formData) {
        super.saveUpdate(formData);
        return "redirect:list?dictTypeId=" + formData.getDictTypeId();
    }

    @RequestMapping("delete")
    @Override
    public String delete(Integer id) {
        return super.delete(id);
    }

    @RequestMapping("cacheData")
    public void cacheData() {

    }

    @RequestMapping("updateCacheData")
    @ResponseBody
    public Map<String, Object> updateCacheData(HttpServletRequest request) {

        List<Dictionary> dictionaryList = dictionaryService.list();

        ApplicationListener.putDictsToApplication(dictionaryList, Util.getApplication());

        Map<String, Object> result = new HashMap<>();

        result.put("msg", "success");

        return result;
    }
}
