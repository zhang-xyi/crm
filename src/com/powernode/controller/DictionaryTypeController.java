package com.powernode.controller;

import com.powernode.entity.DictionaryType;
import com.powernode.model.service.DictionaryTypeService;
import com.powernode.templete.TempleteController;
import com.powernode.templete.TempleteService;
import com.powernode.util.ApplicationListener;
import com.powernode.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.controller
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 20:26
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@RequestMapping("dictType")
@Controller
//泛型加在最后面
public class DictionaryTypeController extends TempleteController<DictionaryType> {

    @Autowired
    private DictionaryTypeService dictionaryTypeService;

    @Override
    public TempleteService<DictionaryType> getService() {
        return dictionaryTypeService;
    }

    @RequestMapping("list")
    @Override
    public List<DictionaryType> list() {
        return super.list();
    }

    @RequestMapping("add")
    @Override
    public void add() {
        super.add();
    }

    @RequestMapping("save")
    @Override
    public String save(DictionaryType formData) {
        return super.save(formData);
    }

    @RequestMapping("update")
    @Override
    public DictionaryType update(Integer dictTypeId) {
        DictionaryType dictionaryType = new DictionaryType();
        if (dictTypeId == null) {
            dictionaryType.setMsg("新增字典类型");
            return dictionaryType;
        } else {
            dictionaryType = super.update(dictTypeId);
            dictionaryType.setMsg("编辑字典类型");
        }
        return dictionaryType;
    }

    @RequestMapping("saveUpdate")
    @Override
    public String saveUpdate(DictionaryType formData) {
        //更新后刷新缓存
        List<DictionaryType> dictionaryTypeList =dictionaryTypeService.list();
        ApplicationListener.putDictionaryTypeToApplication(dictionaryTypeList, Util.getApplication());
        if (formData.getDictTypeId() == null) {
            return super.save(formData);
        } else {
            return super.saveUpdate(formData);
        }

    }

    @Override
    public String delete(Integer id) {
        return super.delete(id);
    }
}
