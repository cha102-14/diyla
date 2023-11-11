package com.cha102.diyla.front.filter;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebFilter("/shop/*")
public class CommodityClassFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        CommodityClassService classService = new CommodityClassService();
        List<CommodityClassVO> commodityClasses = classService.getAll();
        HashMap<Integer, String> classNameMap = new HashMap<>();
        int i = 1;
        for (CommodityClassVO commodityClassVO : commodityClasses) {

            //將類別編號當key，類別名稱當Value放進HashMap中
            classNameMap.put(i, commodityClassVO.getComClassName());
            i++;
        }
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        request.setAttribute("classNameMap", classNameMap);
        request.setAttribute("classNameMapSize", classNameMap.size());
        filterChain.doFilter(servletRequest,servletResponse);
    }
}
