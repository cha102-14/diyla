package com.cha102.filter;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebFilter("/shop/*")
public class CommodityUpdateFilter implements Filter {
    CommodityClassService classService = new CommodityClassService();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        List<CommodityClassVO> commodityClasses = classService.getAll();
        HashMap<Integer, String> classNameMap = new HashMap<>();
        for (CommodityClassVO commodityClassVO : commodityClasses) {
            //將類別編號當key，類別名稱當Value放進HashMap中
            classNameMap.put(commodityClassVO.getComClassNo(), commodityClassVO.getComClassName());
        }
        request.setAttribute("classNameMap", classNameMap);
        request.setAttribute("classNameMapSize", classNameMap.size());
        filterChain.doFilter(servletRequest,servletResponse);
    }
}
