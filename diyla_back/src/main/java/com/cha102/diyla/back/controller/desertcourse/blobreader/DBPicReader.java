package com.cha102.diyla.back.controller.desertcourse.blobreader;


import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.teaModel.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DBPicReader")
public class DBPicReader extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //回傳res的處理
        res.setContentType("image/gif");
        ServletOutputStream out = res.getOutputStream();
        //了解取得的是teacherPic或coursePic
        String action = req.getParameter("action");
        //針對teacherPic來做取圖片的處理
        if ("teacherPic".equals(action)){
            try {
                Integer teacherId = Integer.valueOf(req.getParameter("teacherId"));
                TeacherService teacherService = new TeacherService();
                out.write(teacherService.getOneTeacher(teacherId).getTeaPic());
            }
            catch (Exception e){
                e.printStackTrace();
//                InputStream in = getServletContext().getResourceAsStream("");
//                byte[] buf = new byte[in.available()];
//                in.read(buf);
//                out.write(buf);
//                in.close();
            }
        }
        //針對coursePic來作取圖片的處理
        else {
            try {
                Integer courseId = Integer.valueOf(req.getParameter("courseId"));
                ClassService classService = new ClassService();
                out.write(classService.getOneClass(courseId).getClassPic());
            }
            catch (Exception e){
                e.printStackTrace();
//                InputStream in = getServletContext().getResourceAsStream("");
//                byte[] buf = new byte[in.available()];
//                in.read(buf);
//                out.write(buf);
//                in.close();
            }
        }

    }

}

