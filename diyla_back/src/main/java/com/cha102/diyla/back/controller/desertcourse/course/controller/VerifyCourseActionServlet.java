package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/verifyCourseAction")
public class VerifyCourseActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //取得當前連線session的
        HttpSession session = req.getSession();
        String typeFun = (String) session.getAttribute("typeFun");
        //處理res相關
        res.setContentType("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        JSONObject resJson = new JSONObject();
        PrintWriter out = res.getWriter();
        //宣告使用的到的變數
        Integer courseId = Integer.parseInt(req.getParameter("courseId"));
        ClassService classService = new ClassService();
        TeacherService teacherService = new TeacherService();
        typeFun = "ADMIN";
        boolean adminAuthCode = false;
        ClassVO reqCourse = classService.getOneClass(courseId);
        List<Integer> reqCourseIngId = new ArrayList<>();
        //確認是否有管理員權限
        if ("ADMIN".equals(typeFun)) {
            adminAuthCode = true;
        }
        //取得請求修改courseId以及當前請求的empId
        Integer teacherId = classService.getOneClass(courseId).getTeaId();
        TeacherVO reqTeacher = teacherService.getOneTeacher(teacherId);
        Integer reqEmpId = reqTeacher.getEmpId();
//        Integer thisEmpId = (Integer) session.getAttribute("empId");
        Integer thisEmpId = 1;
        //取得使用者打算做甚麼action
        String action = req.getParameter("action");
        //取得課程食材的Id
        reqCourseIngId = classService.getOneClassIngID(courseId);
        //分成modify和delete的個別驗證
        if("delete".equals(action)) {
            //若使用者是admin,就不用比對session內的empId以及當前課程的teacher對應的empId
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
                String url = "/desertcourse/modifydesertcourse.jsp";
                RequestDispatcher allowModify = req.getRequestDispatcher(url);
                req.setAttribute("courseVO", reqCourse);
                req.setAttribute("courseIngVO", reqCourseIngId);
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
