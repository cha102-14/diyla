package com.cha102.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BackLoginFilter implements Filter{
    private FilterConfig config;

    public void init(FilterConfig config){
        this.config=config;
    }

    public  void destroy(){
        config=null;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws ServletException, IOException{

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        Integer empId = (Integer) session.getAttribute("empId");

        if (empId == null){
            session.setAttribute("location",req.getRequestURI());
            res.sendRedirect(req.getContextPath()+"/emp/empLogin.jsp");
            return;

        }else {
            chain.doFilter(request, response);
        }
    }


}
