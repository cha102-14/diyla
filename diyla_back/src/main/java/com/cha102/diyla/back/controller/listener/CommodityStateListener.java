package com.cha102.diyla.back.controller.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Map;

@WebListener
public class CommodityStateListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        Map<Integer,String> commodityState = Map.of(0,"下架中",1,"上架中",2,"完售");
        servletContext.setAttribute("commodityState",commodityState);
    }
}
