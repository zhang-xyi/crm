package com.powernode.util;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;

/**
 * @ClassName PageInfo
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/12 10:02
 * @version 1.0
 */
public class PageInfo<T>  extends com.github.pagehelper.PageInfo<T> {

    private String url;

    public PageInfo(){


        //从当前本地线程中获取请求
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
        //从请求当中接收当前页号
        String pageNumStr = request.getParameter("pageNum");
        //如果当前页号没有传，则默认认为是第1页
        int pageNum = Integer.parseInt(Util.isEmpty(pageNumStr) ? "1" : pageNumStr);
        this.setPageNum(pageNum);

        //从请求当中接收每页记录数
        String pageSizeStr = request.getParameter("pageSize");
        //如果每页记录数没有传，则默认认为是10条
        int pageSize = Integer.parseInt(Util.isEmpty(pageSizeStr) ? "10" : pageSizeStr);
        this.setPageSize(pageSize);

        PageHelper.startPage(pageNum, pageSize);


        /*
         * 将搜索与翻页融合，自动取请求当中的所有的搜索参数，拼接成url
         */
        //从请求当中获取当前请求的地址
        url = request.getRequestURI() + "?1=1";

        //取请求当中所有的参数
        Enumeration<String> parameterNames = request.getParameterNames();

        while(parameterNames.hasMoreElements()){

            String name = parameterNames.nextElement();

            String value = request.getParameter(name);

            //排除三个常驻参数
            if(!"1".equals(name) && !"pageNum".equals(name) && !"pageSize".equals(name) && Util.isNotEmpty(value)){

                try {
                    value = URLEncoder.encode(value,"UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    value = "";
                }

                url += "&" + name + "=" + value;
            }
        }

    }

    public void setList(List<T> list) {
        this.list = list;

        this.setIsFirstPage(false);
        this.setIsLastPage(false);
        this.setHasPreviousPage(false);
        this.setHasNextPage(false);
        if (list instanceof Page) {
            Page page = (Page)list;
            this.setPageNum(page.getPageNum());
            this.setPageSize(page.getPageSize());
            this.setPages(page.getPages());
            this.setSize(page.size());
            this.total = page.getTotal();
            if (this.getSize() == 0) {
                this.setStartRow(0L);
                this.setEndRow(0L);
            } else {
                this.setStartRow(page.getStartRow() + 1L) ;
                this.setEndRow(this.getStartRow() - 1L + (long)this.getSize());
            }
        } else if (list instanceof Collection) {
            this.setPageNum(1);
            this.setPageSize(list.size());
            this.setPages(this.getPageSize() > 0 ? 1 : 0);
            this.setSize(list.size());
            this.setStartRow(0L);
            this.setEndRow(list.size() > 0 ? (long)(list.size() - 1) : 0L);
        }

        if (list instanceof Collection) {
            this.calcByNavigatePages(this.getNavigatePages());
        }
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
