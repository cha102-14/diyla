package com.cha102.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextPathListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext =sce.getServletContext();
        servletContext.setAttribute("ctxPath",servletContext.getContextPath()); // 放入大中小的大，讓JSP可以利用${ctxPath}取得專案路徑
    }
}
