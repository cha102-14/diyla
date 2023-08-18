package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/refundReserve")
public class refundReserveServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        Integer reserveId = Integer.valueOf(req.getParameter("reserveId"));
        ClassService classService = new ClassService();
        //(0:預約單建立，1:預約單付款完成，2:預約單取消(未退款)，3.預約單取消(退款完成)，4.預約單完成)
        if (classService.getOneReserve(reserveId).getStatus() == 0) {
            classService.updateReserveStatus(reserveId, 3);
        } else if (classService.getOneReserve(reserveId).getStatus() == 1) {
            classService.updateReserveStatus(reserveId, 2);
        }
    }

}
