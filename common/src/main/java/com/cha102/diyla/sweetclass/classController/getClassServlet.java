package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
@WebServlet("/getDesertCourse")
public class getClassServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();

        ClassService classService = new ClassService();
        List<ClassVO> courseList = classService.getAllClass();

        JSONArray jsonArray = new JSONArray();
        for (ClassVO courses : courseList) {
            JSONObject jsonCourse = new JSONObject();
            jsonCourse.put("coursePic", Base64.getEncoder().encodeToString(courses.getClassPic()));
            jsonCourse.put("courseName", courses.getClassName());
            jsonCourse.put("courseDate", courses.getClassDate().toString());
            jsonCourse.put("courseIntro", courses.getIntro());
            // Add more course information as needed
            jsonArray.put(jsonCourse);
        }

        out.print(jsonArray.toString());
        out.flush();
    }

}
//<%  ClassService course = new ClassService();
//        List<ClassVO> courseList = course.getAllClass();
//        for(ClassVO courses: courseList) {
//        byte[] coursePic = courses.getClassPic();
//        String courseName = courses.getClassName();
//        Date courseDate = courses.getClassDate();
//        String courseIntro = courses.getIntro();
//        Integer courseId = courses.getClassId();
//        Integer courseCat = courses.getCategory();
//        String base64Img = Base64.getEncoder().encodeToString(coursePic);
//        %>