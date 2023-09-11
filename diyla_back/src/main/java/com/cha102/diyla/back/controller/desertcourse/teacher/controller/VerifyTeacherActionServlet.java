package com.cha102.diyla.back.controller.desertcourse.teacher.controller;

import com.cha102.diyla.sweetclass.teaModel.TeacherService;
import com.cha102.diyla.sweetclass.teaModel.TeacherVO;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/verifyTeacherAction")
public class VerifyTeacherActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //取得當前連線session的empVO
        HttpSession session = req.getSession();
//        EmpVO empVO = session.getAttribute("empVO");
        //處理res相關
        res.setContentType("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        JSONObject resJson = new JSONObject();
        PrintWriter out = res.getWriter();
        //暫時模擬取得的empId以及是否有修改權限
        session.setAttribute("empId", 1);
        Integer thisEmpId = (Integer)session.getAttribute("empId");
        //模擬確認該emp是否有管理員權限
        boolean adminAuthCode = true;
        //EmpVO empVO = (EmpVO) session.getAttribute("empVO");
        //取得請求修改teacherId的empId
        Integer teacherId = Integer.parseInt(req.getParameter("teacherId"));
        TeacherService teacherService = new TeacherService();
        TeacherVO reqTeacher = teacherService.getOneTeacher(teacherId);
        Integer reqEmpId = reqTeacher.getEmpId();
        //取得使用者打算做甚麼action
        String action = req.getParameter("action");
        //分成modify和delete的個別驗證
        if("delete".equals(action)) {
            if(adminAuthCode) {
                reqTeacher.setTeaStatus(1);
                teacherService.updateTeaStatus(teacherId,1);
                resJson.put("isAllowed", true);
            } else {
                if(reqEmpId == thisEmpId) {
                    teacherService.updateTeaStatus(teacherId,1);
                    resJson.put("isAllowed", true);
                } else {
                    resJson.put("isAllowed", false);
                }
            }
            out.print(resJson);
            out.flush();
        } else if("modify".equals(action)){

            if(adminAuthCode) {
                String url = "/desertcourse/modifyteacher.jsp";
                RequestDispatcher allowModify = req.getRequestDispatcher(url);
                req.setAttribute("teacherVO", reqTeacher);
                allowModify.forward(req,res);
            } else {
                String url = req.getContextPath()+"/desertcourse/notallowed.jsp";
                RequestDispatcher notAllow = req.getRequestDispatcher(url);
                notAllow.forward(req,res);
            }
        } else if("back".equals(action)) {
            if(adminAuthCode) {
                reqTeacher.setTeaStatus(1);
                teacherService.updateTeaStatus(teacherId,0);
                resJson.put("isAllowed", true);
            } else {
                if(reqEmpId == thisEmpId) {
                    teacherService.updateTeaStatus(teacherId,0);
                    resJson.put("isAllowed", true);
                } else {
                    resJson.put("isAllowed", false);
                }
            }
            out.print(resJson);
            out.flush();
        }

    }
}
