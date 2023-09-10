package com.cha102.diyla.front.filter;

import com.cha102.diyla.member.*;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter{
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
        MemVO memVO = (MemVO) session.getAttribute("memVO");
        if (memVO == null){
            session.setAttribute("location",req.getRequestURI());
            res.sendRedirect(req.getContextPath()+"/member/mem_login.jsp");
            return;

        }else {
            chain.doFilter(request, response);
        }
    }


}
