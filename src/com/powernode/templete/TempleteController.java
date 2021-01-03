package com.powernode.templete;


import com.powernode.entity.DictionaryType;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.powernode.templete
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/22 19:39
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 *
 * 注解无法被继承，在这里就不标了
 *
 */
public abstract class TempleteController<T> {

    public abstract TempleteService<T> getService();

    public List<T> list(){
        return getService().list();
    }

    public void add(){

    }

    public String save(T formData){
        getService().save(formData);
        return "redirect:list";
    }

    public T update(Integer id){
        return getService().get(id);
    }

    public String saveUpdate(T formData){
        getService().update(formData);
        return "redirect:list";
    }

    public String delete(Integer id){
        getService().delete(id);
        return "redirect:list";
    }

    public T view(Integer id){
        return getService().get(id);
    }


}
