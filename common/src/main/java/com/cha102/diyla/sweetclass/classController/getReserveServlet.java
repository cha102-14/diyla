package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.member.MemberService;
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
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/getReserve")
public class getReserveServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        Integer memberId = Integer.valueOf(req.getParameter("memberId"));
        //若請求的人本身memId並不等於傳送過來的memberId,則導入首頁
//        if (Integer.parseInt(req.getParameter("memId")) != memberId) {
//            RequestDispatcher illegalRequest = req.getRequestDispatcher("/diyla_front/index.jsp");
//            illegalRequest.forward(req,res);
//            return;
//        }
        PrintWriter out = res.getWriter();
        ClassService classService = new ClassService();
        MemberService memberService = new MemberService();
        List<ClassReserveVO> courseList = classService.getAllReserve();
        JSONArray jsonArray = new JSONArray();
        String pattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);

        for (ClassReserveVO reserves : courseList) {
            //-1 means get all reserve for admin viewing all the reserve detail.
            if (memberId == -1 ||reserves.getMemId() == memberId){
                JSONObject jsonCourse = new JSONObject();
                jsonCourse.put("reserveId", reserves.getReserveId());
                jsonCourse.put("memId", reserves.getMemId());
                jsonCourse.put("memName", memberService.selectMem(reserves.getMemId()).getMemName());
                jsonCourse.put("headcount", reserves.getHeadcount());
                if(reserves.getStatus() == 0) {
                    jsonCourse.put("status", "預約單成立");
                } else if(reserves.getStatus() == 1) {
                    jsonCourse.put("status", "預約單取消");
                } else if (reserves.getStatus() == 2) {
                    jsonCourse.put("status", "預約單完成");
                }
                jsonCourse.put("courseDate", classService.getOneClass(reserves.getClassId()).getClassDate());
                //場次處理
                if (classService.getOneClass(reserves.getClassId()).getClassSeq() == 0) {
                    jsonCourse.put("courseSeq", "早上");
                } else if (classService.getOneClass(reserves.getClassId()).getClassSeq() == 1) {
                    jsonCourse.put("courseSeq", "下午");
                } else if (classService.getOneClass(reserves.getClassId()).getClassSeq() == 2) {
                    jsonCourse.put("courseSeq", "晚上");
                }
                jsonCourse.put("courseName", classService.getOneClass(reserves.getClassId()).getClassName());
                jsonCourse.put("courseId", reserves.getClassId());
                jsonCourse.put("createTime", dateFormat.format(reserves.getCreateTime()));
                jsonCourse.put("totalPrice", reserves.getTotalPrice());
                jsonArray.put(jsonCourse);
            }
        }

        out.print(jsonArray.toString());
        out.flush();
    }
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        Integer teaId = Integer.valueOf(req.getParameter("teaId"));
        PrintWriter out = res.getWriter();
        ClassService classService = new ClassService();
        JSONArray jsonArray = classService.getReserveByTeaId(teaId);
        out.print(jsonArray.toString());
        out.flush();
    }
}
