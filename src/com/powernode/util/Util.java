package com.powernode.util;


import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonSerializable;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.powernode.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @ClassName Util
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/10 14:16
 * @version 1.0
 */
public class Util {
    /*
     * @ClassName Util
     * @Description 判断一个字符串是否为空值
     * @author PowerNode
     * @Date 2020/10/10 14:16
     * @version 1.0
     * @param str 传入的字符串
     */
    public static boolean isEmpty(String str){

        return str == null || "".equals(str) ||  str.trim().equals("");
    }

    /*
     * @ClassName Util
     * @Description 判断一个字符串是否为空值
     * @author PowerNode
     * @Date 2020/10/10 14:16
     * @version 1.0
     * @param str 传入的字符串
     */
    public static boolean isNotEmpty(String str){

        return !isEmpty(str);
    }

    /*
     * @ClassName Util
     * @Description 随机生成文件的文件名
     * @author PowerNode
     * @Date 2020/10/13 16:55
     * @version 1.0
     */

    public static String randFileName(){

        return  UUID.randomUUID().toString().replaceAll("-","");
    }


    public static void main(String[] args)throws Exception {


    }

    public static HttpServletRequest getRequest(){

        //从当前本地线程中获取请求

        return  ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
    }

    public static HttpSession getSession(){

        //从当前本地线程中获取请求

        return  getRequest().getSession();
    }

    public static ServletContext getApplication(){

        //从当前本地线程中获取请求
        return  getRequest().getServletContext();
    }



    public static Employee getLoginEmployeeFromSession(){
        //从当前本地线程中获取请求
        return (Employee)getObjectFromSession(Constants.LOGIN_EMPLOYEE);
    }

    public static Integer getLoginEmplIdFromSession(){

        return getLoginEmployeeFromSession().getEmployeeId();
    }

    public static void putObjectToSession(String key,Object obj){

        getSession().setAttribute(key,obj);

    }

    public static void putObjectToApplication(String key,Object obj){

        getRequest().getServletContext().setAttribute(key,obj);

    }

    public static Object getObjectFromSession(String key){

        return getSession().getAttribute(key);

    }

    public static void removeObjectFromSession(String key){

        getSession().removeAttribute(key);

    }

    public static Object getObjectFromApplication(String key){

        return getRequest().getServletContext().getAttribute(key);

    }

    /*
     * @ClassName Util
     * @Description 取客户端的ip地址
     * @author PowerNode
     * @Date 2020/10/20 14:21
     * @version 1.0
     */
    public static String getClientIp(){

        return getRequest().getRemoteAddr();
    }

    /*
     * @ClassName Util
     * @Description 根据文件的名称获得扩展名
     * @author PowerNode
     * @Date 2020/10/16 9:07
     * @version 1.0
     */
    public static String getExpandName(String fileName){

        return fileName.substring(fileName.lastIndexOf("."));
    }

    /*
     * @ClassName Util
     * @Description 根据文件的扩展名生成图标名称
     * @author PowerNode
     * @Date 2020/10/16 9:07
     * @version 1.0
     */
    public static String getIcon(String fileName){

        String expand = getExpandName(fileName);

        String icon = "unknown";

        if(".rar".equalsIgnoreCase(expand) ){

            icon = "rar";

        }else if(".jpg".equalsIgnoreCase(expand) || ".jpeg".equalsIgnoreCase(expand) || ".jpe".equalsIgnoreCase(expand)|| ".png".equalsIgnoreCase(expand) || ".gif".equalsIgnoreCase(expand) || ".bmp".equalsIgnoreCase(expand)){

            icon = "img";

        }else if(".doc".equalsIgnoreCase(expand) || ".docx".equalsIgnoreCase(expand)){

            icon = "word";

        }else if(".ppt".equalsIgnoreCase(expand) || ".pptx".equalsIgnoreCase(expand)){

            icon = "ppt";

        }else if(".txt".equalsIgnoreCase(expand)){

            icon = "txt";

        }else if(".xls".equalsIgnoreCase(expand) || ".xlsx".equalsIgnoreCase(expand) || ".cvs".equalsIgnoreCase(expand)){

            icon = "xls";

        }

        return icon;
    }

    /*
     * @ClassName Util
     * @Description 生成交易号(年月日时分秒毫秒+15位的随机数)
     * @author PowerNode
     * @Date 2020/10/27 14:18
     * @version 1.0
     */

    public static String generateDealNo(){

        //S是毫秒
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

        return sdf.format(new Date()) + random(15);
    }

    /*
     * @ClassName Util
     * @Description 15位的随机数
     * @author PowerNode
     * @Date 2020/10/27 14:18
     * @version 1.0
     */

    public static String random(int n){

        String str = "";

        for(int i = 0; i < n; i++){

            int num = (int)(Math.random() * 10);

            str += num;
        }
       return str;
    }



}
