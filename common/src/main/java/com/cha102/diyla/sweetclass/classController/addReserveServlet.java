package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/addReserve")
public class addReserveServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        Integer reserveId = Integer.valueOf(req.getParameter("reserveId"));
        Integer headcount = Integer.valueOf(req.getParameter("headcount"));
        ClassService classService = new ClassService();
        if (classService.getOneReserve(reserveId).getStatus() == 0) {
            classService.updateReserveStatus(reserveId, 3);
        } else if (classService.getOneReserve(reserveId).getStatus() == 1) {
            classService.updateReserveStatus(reserveId, 2);
        }
    }

}
