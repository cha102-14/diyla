//package com.cha102.diyla.front.filter;
//
//import com.cha102.diyla.member.MemVO;
//import com.cha102.diyla.noticeModel.NoticeService;
//import com.cha102.diyla.noticeModel.NoticeVO;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.List;
//
//@Component
//@WebFilter("/*")
//public class NoticeFilter implements Filter {
//    private NoticeService noticeService;
//
//    public NoticeFilter(NoticeService noticeService) {
//        this.noticeService = noticeService;
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        HttpSession session = request.getSession();
//        MemVO memVO = (MemVO) session.getAttribute("memVO");
//        if (memVO == null) {
//            filterChain.doFilter(servletRequest, servletResponse);
//        } else {
//            List<NoticeVO> noticeVOS = noticeService.findAllByMemId(memVO.getMemId());
//            session.setAttribute("noticeVOS",noticeVOS);
//            filterChain.doFilter(servletRequest, servletResponse);
//        }
//    }
//}
