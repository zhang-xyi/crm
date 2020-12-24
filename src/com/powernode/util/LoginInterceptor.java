package com.powernode.util;

import com.powernode.entity.Employee;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ProjectName: SSM-springMVC
 * @Package: com.util
 * @Description: java类作用描述
 * @Author: 张子凡
 * @CreateDate: 2020/12/15 15:14
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public class LoginInterceptor implements HandlerInterceptor {

    //此方法在进入controller之前被调用
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Employee employee= (Employee) request.getSession().getAttribute("LOGIN_EMPLOYEE");
        if (null==employee){
            //向登录入口做重定向
            response.sendRedirect(request.getContextPath()+"/login");
            return false;
        }
        return true;
    }

    //controller已经被调用，只是视图没有被渲染
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    //整个MVC流程全部结束之后被调用
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
