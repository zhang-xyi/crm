package com.powernode.util;

import com.powernode.entity.Dept;
import com.powernode.entity.Dictionary;
import com.powernode.entity.DictionaryType;
import com.powernode.model.service.DeptService;
import com.powernode.model.service.DictionaryService;
import com.powernode.model.service.DictionaryTypeService;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * @ProjectName: crm
 * @Package: com.powernode.util
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/21 10:13
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Component
public class ApplicationListener implements ServletContextListener {

    public static void putDictionaryToApplication(List<Dictionary> dictionaryList, ServletContext application) {
        //保存到application中的字典值的数据结构
        Map<String, Map<Integer, Dictionary>> allDictMap = new LinkedHashMap<>();

        //迭代list，将list中的数据整理成map结构装入dictMap
        for (Dictionary dictionary : dictionaryList) {

            //取出当前字典值对应类型的code
            String typeCode = dictionary.getDictionaryType().getDictTypeCode();

            Map<Integer, Dictionary> currentDictMap;
            //当前map是否已存在该类型
            if (allDictMap.containsKey(typeCode)) {
                //如果已存在，取出子map
                currentDictMap = allDictMap.get(typeCode);

            } else {
                //说明对应类型第一次出现，新建map
                currentDictMap = new LinkedHashMap<>();

                //将当前集合所对应的map放到总的map中
                allDictMap.put(typeCode, currentDictMap);
            }
            //将查到的值放到子map中
            currentDictMap.put(dictionary.getDictId(), dictionary);
        }
        //将字典map放到application中
        System.out.println(allDictMap);
        application.setAttribute(Constants.DICTIONARYMAP_IN_APPLICATION, allDictMap);


    }

    public static void putDictionaryTypeToApplication(List<DictionaryType> dictionaryTypeList, ServletContext application){
        //字典类型map
        //map需用String类型作为key，否则el表达式取不到值
        Map<String, DictionaryType> dictionaryTypeMap = new LinkedHashMap<>();
        for (DictionaryType dictionaryType : dictionaryTypeList) {
            //将key转化为字符串类型
            String dictTypeId = String.valueOf(dictionaryType.getDictTypeId());
            dictionaryTypeMap.put(dictTypeId, dictionaryType);
        }
        System.out.println(dictionaryTypeMap);
        application.setAttribute(Constants.DICTIONARYTYPE_IN_APPLICATION, dictionaryTypeMap);
    }

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //从event当中取application
        ServletContext application = servletContextEvent.getServletContext();
        //从application中获取IOC容器
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(application);


        //从IOC容器中获取DeptService
        DeptService deptService = webApplicationContext.getBean(DeptService.class);
        //查部门列表数据
        List<Dept> list = deptService.list();
        //将数据放到map中
        Map<Integer, Dept> map = new LinkedHashMap<>();

        for (Dept d : list) {
            map.put(d.getDeptId(), d);
        }
        //把部门map放到application中去
        application.setAttribute(Constants.DEPTMAP_IN_APPLICATION, map);

        /**
         *将字典数据放到application
         */
        //从IOC容器中获取DictionaryService
        DictionaryService dictionaryService = webApplicationContext.getBean(DictionaryService.class);
        //
        List<Dictionary> dictionaryList = dictionaryService.list();

        /**
         *将字典数据类型放到application
         */
        //从IOC容器中获取DictionaryTypeService
        DictionaryTypeService dictionaryTypeService = webApplicationContext.getBean(DictionaryTypeService.class);
        List<DictionaryType> dictionaryTypeList = dictionaryTypeService.list();

        putDictionaryToApplication(dictionaryList, application);
        putDictionaryTypeToApplication(dictionaryTypeList,application);


    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
