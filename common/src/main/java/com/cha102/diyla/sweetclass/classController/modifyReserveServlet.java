package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import com.cha102.diyla.sweetclass.classModel.ClassReserveVO;
import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import com.cha102.diyla.sweetclass.email.MailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/modifyReserve")
public class modifyReserveServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        Integer reserveId = Integer.valueOf(req.getParameter("reserveId"));
        System.out.println(reserveId);
        String action = req.getParameter("action");
        ClassService classService = new ClassService();
        ClassReserveVO classReserveVO = new ClassReserveVO();
        MemberService memberService = new MemberService();
        MailService mailService = new MailService();
        //(0:預約單成立，1:預約單取消，2:預約單完成)
        if ("delete".equals(action)) {
            classService.updateReserveStatus(reserveId, 1);
            classReserveVO = classService.getOneReserve(reserveId);
            Integer memId = classReserveVO.getMemId();
            MemVO member = memberService.selectMem(memId);
            String to = member.getMemEmail();
            String memName = member.getMemName();
            Integer classId = classReserveVO.getClassId();
            ClassVO classVO = classService.getOneClass(classId);
            int reserveHeadcount = classReserveVO.getHeadcount();
            int classHeadCount = classVO.getHeadcount();
            int newClassHeadCount = classHeadCount - reserveHeadcount;
            classVO.setHeadcount(newClassHeadCount);
            classService.updateClass(classVO);
            mailService.sendMail(to, memName, "createReserve");
        } else if ("complete".equals(action)) {
            classService.updateReserveStatus(reserveId, 2);
        }
        out.print("{\"status\": \"success\"}");
        out.flush();
        out.close();
    }

}
