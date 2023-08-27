package com.cha102.diyla.back.controller.desertcourse.teacher.controller;

import com.cha102.diyla.sweetclass.teaModel.TeacherService;
import com.cha102.diyla.sweetclass.teaModel.TeacherVO;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/getAllTeacher")
public class GetAllTeacher extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        //Integer teacherId = Integer.valueOf(req.getParameter("teacherId"));
        //宣告各個用的到的物件
        PrintWriter out = res.getWriter();
        TeacherService teacherService = new TeacherService();
        JSONArray jsonArray = new JSONArray();
        //取得teacherList
        List<TeacherVO> teacherVOList = teacherService.getAllTeacher();
        for (TeacherVO teachers : teacherVOList) {
            //將各個Teacher相關資料放入JsonObject中
                JSONObject jsonTeacher = new JSONObject();
                jsonTeacher.put("teacherId", teachers.getTeaId());
                jsonTeacher.put("teacherName", teachers.getTeaName());
                if(teachers.getTeaGender() == 0) {
                    jsonTeacher.put("gender", "男");
                } else {
                    jsonTeacher.put("gender", "女");
                }
                if(teachers.getTeaStatus() == 0){
                    jsonTeacher.put("teacherStatus", "在職");
                } else{
                    jsonTeacher.put("teacherStatus", "離職");
                }
                jsonTeacher.put("teacherPic", teachers.getTeaPic());
                jsonTeacher.put("teacherIntro", teachers.getTeaIntro());
                jsonTeacher.put("speciality", teacherService.getTeacherSpecialityString(teachers.getTeaId()));
                jsonTeacher.put("teacherPhone", teachers.getTeaPhone());
                jsonTeacher.put("teacherEmail", teachers.getTeaEmail());
                jsonArray.put(jsonTeacher);

        }
        out.print(jsonArray.toString());
        out.flush();
    }
}
