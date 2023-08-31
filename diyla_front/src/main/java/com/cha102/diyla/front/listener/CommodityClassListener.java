package com.cha102.diyla.front.listener;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.List;

@WebListener
public class CommodityClassListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        CommodityClassService classService = new CommodityClassService();
        List<CommodityClassVO> commodityClasses = classService.getAll();
        HashMap<Integer, String> classNameMap = new HashMap<>();
        int i = 1;
        for (CommodityClassVO commodityClassVO : commodityClasses) {

            //將類別編號當key，類別名稱當Value放進HashMap中
            classNameMap.put(i, commodityClassVO.getComClassName());
            i++;
        }
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("classNameMap", classNameMap);
        servletContext.setAttribute("classNameMapSize", classNameMap.size());
    }
}
