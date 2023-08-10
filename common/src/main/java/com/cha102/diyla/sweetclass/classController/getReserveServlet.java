package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassReserveVO;
import com.cha102.diyla.sweetclass.classModel.ClassService;
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
@WebServlet("/getReserve")
public class getReserveServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        Integer memberId = Integer.valueOf(req.getParameter("memberId"));
        ClassService classService = new ClassService();
        List<ClassReserveVO> courseList = classService.getAllReserve();
        JSONArray jsonArray = new JSONArray();

        for (ClassReserveVO reserves : courseList) {
            //-1 means get all reserve for admin viewing all the reserve detail.
            if (memberId == -1){
                JSONObject jsonCourse = new JSONObject();
                jsonCourse.put("reserveId", reserves.getReserveId());
                jsonCourse.put("memId", reserves.getMemId());
                jsonCourse.put("headcount", reserves.getHeadcount());
                jsonCourse.put("status", reserves.getStatus());
                jsonCourse.put("courseId", reserves.getClassId());
                jsonCourse.put("createTime", reserves.getCreateTime());
                jsonCourse.put("totalPrice", reserves.getTotalPrice());
                jsonArray.put(jsonCourse);
            } else if (reserves.getMemId() == memberId) { //specific member query his reserve.
                JSONObject jsonCourse = new JSONObject();
                jsonCourse.put("reserveId", reserves.getReserveId());
                jsonCourse.put("memId", reserves.getMemId());
                jsonCourse.put("headcount", reserves.getHeadcount());
                jsonCourse.put("status", reserves.getStatus());
                jsonCourse.put("courseId", reserves.getClassId());
                jsonCourse.put("createTime", reserves.getCreateTime());
                jsonCourse.put("totalPrice", reserves.getTotalPrice());
                jsonArray.put(jsonCourse);
            }
        }

        out.print(jsonArray.toString());
        out.flush();
    }

}
