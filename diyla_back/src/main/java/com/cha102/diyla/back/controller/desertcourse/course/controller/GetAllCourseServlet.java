package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Date;

@WebServlet("/getAllCourse")
public class GetAllCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //處理response
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        //宣告service和課程資料
        ClassService classService = new ClassService();
        List<ClassVO> courses = classService.getAllClass(); // 從後端獲取課程資料


        StringBuilder eventsJson = new StringBuilder();
        for (ClassVO course : courses) {
            int classSeq = course.getClassSeq();
            Date classDate = course.getClassDate();

            // 根據 classSeq 計算完整的開始和結束時間
            String startTime = "";
            String endTime = "";
            if (classSeq == 0) {
                startTime = "09:00:00";
                endTime = "12:00:00";
            } else if (classSeq == 1) {
                startTime = "14:00:00";
                endTime = "17:00:00";
            } else if (classSeq == 2) {
                startTime = "19:00:00";
                endTime = "22:00:00";
            }

            // 合併日期和時間，並格式化為 ISO 8601 格式
            String isoStartTime = classDate + "T" + startTime;
            String isoEndTime = classDate + "T" + endTime;
            System.out.println(course.getClassName());
            System.out.println(classDate);
            System.out.println(isoStartTime);
            System.out.println(isoEndTime);
            eventsJson.append("{");
            eventsJson.append("\"title\": \"" + course.getClassName() + "\",");
            eventsJson.append("\"start\": \"" + isoStartTime + "\",");
            eventsJson.append("\"end\": \"" + isoEndTime + "\",");
            eventsJson.append("\"id\": \"" + course.getClassId() + "\"");
            eventsJson.append("}");
            eventsJson.append(",");
        }
        // 移除最後一個逗號
        if (eventsJson.length() > 0) {
            eventsJson.deleteCharAt(eventsJson.length() - 1);
        }
        out.print("[" + eventsJson.toString() + "]");
        out.flush();
    }
}


