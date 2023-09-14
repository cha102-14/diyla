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
import java.util.List;

@WebServlet("/verifyTeacherAction")
public class VerifyTeacherActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //取得當前連線session的empVO
        HttpSession session = req.getSession();
        Integer thisEmpId = (Integer)session.getAttribute("empId");
        //判斷該連線者是否有權限
        Object typeFunObj = session.getAttribute("typeFun");
        boolean isTypeFunList = (typeFunObj != null && (typeFunObj instanceof java.util.List));
        String type = "notAuth";
        if (session != null){
            if (isTypeFunList) {
                List<String> typeFun = (List<String>) session.getAttribute("typeFun");
                boolean containsMaster = typeFun.contains("MASTER");
                boolean containsAdmin = typeFun.contains("BACKADMIN");
                if (containsMaster && containsAdmin) {
                    type = "BACKADMIN";

                } else if (containsMaster) {
                    type = "MASTER";

                }
            } else {
                type = (String) typeFunObj;
            }
        } else {
            type = "NOSESSION";
        }
        System.out.println(type);
        //處理res相關
        res.setContentType("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        JSONObject resJson = new JSONObject();
        PrintWriter out = res.getWriter();
        //取得的empId以及是否有修改權限

        //取得請求修改teacherId以及目前請求者的empId
        Integer teacherId = Integer.parseInt(req.getParameter("teacherId"));
        TeacherService teacherService = new TeacherService();
        TeacherVO reqTeacher = teacherService.getOneTeacher(teacherId);
        Integer reqEmpId = reqTeacher.getEmpId();
        //比較目前請求者的empId和teacher的empId是否為相同
        //取得使用者打算做甚麼action
        String action = req.getParameter("action");
        //分成modify和delete的個別驗證
        if("delete".equals(action)) {
            if("BACKADMIN".equals(type)) {

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

            if("BACKADMIN".equals(type) || reqEmpId == thisEmpId) {
                String url = "/desertcourse/modifyteacher.jsp";
                RequestDispatcher allowModify = req.getRequestDispatcher(url);
                req.setAttribute("teacherVO", reqTeacher);
                allowModify.forward(req,res);
            } else {
                String url = "/desertcourse/notallowed.jsp";
                RequestDispatcher notAllow = req.getRequestDispatcher(url);
                notAllow.forward(req,res);
            }
        } else if("back".equals(action)) {
            if("BACKADMIN".equals(type)) {

                teacherService.updateTeaStatus(teacherId,0);
                resJson.put("isAllowed", true);
            } else {
                resJson.put("isAllowed", false);
            }
            out.print(resJson);
            out.flush();
        }

    }
}
