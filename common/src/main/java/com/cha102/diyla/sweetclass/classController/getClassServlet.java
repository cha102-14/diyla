package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
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
import java.util.Base64;
@WebServlet("/getDesertCourse")
public class getClassServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));
        ClassService classService = new ClassService();
        List<ClassVO> courseList = classService.getAllClass();
        JSONArray jsonArray = new JSONArray();

        for (ClassVO courses : courseList) {
            if (categoryId == -1 && courses.getClassStatus() == 0 || courses.getClassStatus() == 2){
            JSONObject jsonCourse = new JSONObject();
            if(courses.getClassPic().length == 0){
                jsonCourse.put("coursePic", "無圖片。");
            } else {
                jsonCourse.put("coursePic", Base64.getEncoder().encodeToString(courses.getClassPic()));
            }
            jsonCourse.put("courseName", courses.getClassName());
            jsonCourse.put("courseDate", courses.getClassDate().toString());
            jsonCourse.put("regEndDate", courses.getRegEndTime().toString());
            jsonCourse.put("courseIntro", courses.getIntro());
            jsonCourse.put("courseId", courses.getClassId());
            if(courses.getClassSeq() == 0) {
                jsonCourse.put("courseSeq", "早上");
            } else if (courses.getClassSeq() == 1) {
                jsonCourse.put("courseSeq", "下午");
            } else if (courses.getClassSeq() == 2) {
                jsonCourse.put("courseSeq", "晚上");
            }
            jsonCourse.put("courseStatus", courses.getClassStatus());
            // Add more course information as needed
            jsonArray.put(jsonCourse);
            } else if (courses.getCategory() == categoryId && courses.getClassStatus() == 0 || courses.getClassStatus() == 2) {
                JSONObject jsonCourse = new JSONObject();
                if(courses.getClassPic().length == 0){
                    jsonCourse.put("coursePic", "無圖片。");
                } else {
                    jsonCourse.put("coursePic", Base64.getEncoder().encodeToString(courses.getClassPic()));
                }
                jsonCourse.put("courseName", courses.getClassName());
                jsonCourse.put("courseDate", courses.getClassDate().toString());
                jsonCourse.put("regEndDate", courses.getRegEndTime().toString());
                jsonCourse.put("courseIntro", courses.getIntro());
                jsonCourse.put("courseId", courses.getClassId());
                if(courses.getClassSeq() == 0) {
                    jsonCourse.put("courseSeq", "早上");
                } else if (courses.getClassSeq() == 1) {
                    jsonCourse.put("courseSeq", "下午");
                } else if (courses.getClassSeq() == 2) {
                    jsonCourse.put("courseSeq", "晚上");
                }
                jsonCourse.put("courseStatus", courses.getClassStatus());
                // Add more course information as needed
                jsonArray.put(jsonCourse);
            }
        }

        out.print(jsonArray.toString());
        out.flush();
    }

}
