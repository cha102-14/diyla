package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet("/getOneClassServlet")
public class getOneClassServlet extends HttpServlet {
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        Integer courseId = Integer.valueOf(req.getParameter("courseId"));
        //confirm is headcount excess the courselimit or is the courseStatus is unavaliable?
        ClassService classService = new ClassService();
        ClassVO course = classService.getOneClass(courseId);
        //處理傳回來的課程時間
        int classSeq = course.getClassSeq();
        Date courseDate = course.getClassDate();
        String startTime = "";
        String endTime = "";
        if (classSeq == 0) {
            startTime = " 09:00:00";
            endTime = " 12:00:00";
        } else if (classSeq == 1) {
            startTime = " 14:00:00";
            endTime = " 17:00:00";
        } else if (classSeq == 2) {
            startTime = " 19:00:00";
            endTime = " 22:00:00";
        }
        String isoStartTime = courseDate + startTime;
        String isoEndTime = courseDate + endTime;
        String courseDateTime = isoStartTime + "~" + isoEndTime;
        //將回傳訊息打包進Json內
        JSONObject courseJson = new JSONObject();
        courseJson.put("courseName", course.getClassName());
        courseJson.put("courseDate", courseDateTime);
        courseJson.put("coursePrice", course.getPrice());
        courseJson.put("courseStatus", course.getClassStatus());
        out.print(courseJson);
    }

}
