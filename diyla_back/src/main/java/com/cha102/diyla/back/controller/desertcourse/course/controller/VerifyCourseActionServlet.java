package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassINGVO;
import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import com.cha102.diyla.sweetclass.ingModel.IngStorageService;
import com.cha102.diyla.sweetclass.ingModel.IngStorageVO;
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
        //確認當前session和使用者權限
        HttpSession session = req.getSession();
        Object typeFunObj = session.getAttribute("typeFun");
        boolean isTypeFunList = (typeFunObj != null && (typeFunObj instanceof java.util.List));
        String type = "notAuth";
        if (session == null){
            if (isTypeFunList) {
                List<String> typeFun = (List<String>) session.getAttribute("typeFun");
                boolean containsMaster = typeFun.contains("MASTER");
                boolean containsAdmin = typeFun.contains("ADMIN");
                if (containsMaster && containsAdmin) {
                    type = "ADMIN";

                } else if (containsMaster) {
                    type = "MASTER";

                }
            } else {
                type = (String) typeFunObj;
            }
    } else {
        type = "NOSESSION";
    }
        //處理res相關
        res.setContentType("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        JSONObject resJson = new JSONObject();
        PrintWriter out = res.getWriter();
        //宣告使用的到的變數
        Integer courseId = Integer.parseInt(req.getParameter("courseId"));
        ClassService classService = new ClassService();
        TeacherService teacherService = new TeacherService();
        String ctxPath = req.getContextPath();

        boolean adminAuthCode = false;
        ClassVO reqCourse = classService.getOneClass(courseId);
        //確認是否有管理員權限
        if ("ADMIN".equals(type)) {
            adminAuthCode = true;
        }
        //取得請求修改courseId以及當前請求的empId
        Integer teacherId = classService.getOneClass(courseId).getTeaId();
        TeacherVO reqTeacher = teacherService.getOneTeacher(teacherId);
        Integer reqEmpId = reqTeacher.getEmpId();
        Integer thisEmpId = (Integer) session.getAttribute("empId");
        //取得使用者打算做甚麼action
        String action = req.getParameter("action");

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
            //取得目前倉庫內有何種材料
            IngStorageService ingStorageService = new IngStorageService();
            List<IngStorageVO> ingList = ingStorageService.getAll();
            //處理該課程應該要有的食材以及食材數量
            List<ClassINGVO> reqCourseIngIdAmountList = classService.getOneClassIngID(courseId);
            List<Integer> reqCourseIngId = new ArrayList<>();
            List<Integer> reqCourseIngAmount = new ArrayList<>();
            for(int i = 0; i < reqCourseIngIdAmountList.size(); i++) {

                reqCourseIngId.add(reqCourseIngIdAmountList.get(i).getIngId());
                reqCourseIngAmount.add(reqCourseIngIdAmountList.get(i).getIngNums());

            }


            if(adminAuthCode || reqEmpId == thisEmpId) {
                String url = "/desertcourse/modifydesertcourse.jsp";
                RequestDispatcher allowModify = req.getRequestDispatcher(url);
                req.setAttribute("ingList", ingList);
                req.setAttribute("courseVO", reqCourse);
                req.setAttribute("reqCourseIngVOList", reqCourseIngIdAmountList);
                req.setAttribute("reqCourseIngIdList", reqCourseIngId);
                req.setAttribute("reqCourseIngAmountList", reqCourseIngAmount);
                allowModify.forward(req,res);
            } else {
                String url = "/desertcourse/listalldesertcoursecalendar.jsp";
                RequestDispatcher notAllow = req.getRequestDispatcher(url);
                notAllow.forward(req,res);
            }
        } else if("back".equals(action)) {
            //仍需改動,下架課程功能
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
