package com.cha102.diyla.back.controller.diy;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;

@WebServlet("/diy_order/DiyOrderController")
public class DiyOrderController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String diyorderno = req.getParameter("diyorderno");

		if ("getOne_For_Display".equals(action)) {
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO DOVO = DOser.getOneDO(Integer.valueOf(req.getParameter("diyorderno")));
			System.out.println(DOVO);

			req.setAttribute("DOVO", DOVO); // 資料庫取出的empVO物件,存入req
			String url = "/diy_order/odlistonebyID.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) {

			int memId = Integer.valueOf(req.getParameter("memId"));
			int diyNo = Integer.valueOf(req.getParameter("diyNo"));
			String contactPerson = req.getParameter("contactPerson");
			String contactPhone = req.getParameter("contactPhone");
			int reservationNum = Integer.valueOf(req.getParameter("reservationNum"));
			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			int reservationStatus = Integer.valueOf(req.getParameter("reservationStatus"));
			int paymentStatus = Integer.valueOf(req.getParameter("paymentStatus"));
			int diyPrice = Integer.valueOf(req.getParameter("diyPrice"));

			DiyOrderService DOser = new DiyOrderService();
			DOser.addOD(memId, diyNo, contactPerson, contactPhone, reservationNum, diyPeriod, diyReserveDate,
					reservationStatus, paymentStatus, diyPrice);

			String url = "/diy_order/getallorderlist.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) {

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DOser.deleteDO(diyOrderNo);

			String url = "/diy_order/getallorderlist.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO DOVO = DOser.getOneDO(diyOrderNo);
			req.setAttribute("DOVO", DOVO);   
			

			String url = "/diy_order/updateodinput.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		if ("update".equals(action)) {
			
			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			int memId = Integer.valueOf(req.getParameter("memId"));
			int diyNo = Integer.valueOf(req.getParameter("diyNo"));
			String contactPerson = req.getParameter("contactPerson");
			String contactPhone = req.getParameter("contactPhone");
			int reservationNum = Integer.valueOf(req.getParameter("reservationNum"));
			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			int reservationStatus = Integer.valueOf(req.getParameter("reservationStatus"));
			int paymentStatus = Integer.valueOf(req.getParameter("paymentStatus"));
			int diyPrice = Integer.valueOf(req.getParameter("diyPrice"));
			

//			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DOser.upOD(memId, diyNo, contactPerson, contactPhone, reservationNum, diyPeriod, diyReserveDate, reservationStatus, paymentStatus, diyPrice, diyOrderNo);
			  
			

			String url = "/diy_order/getallorderlist.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		
		
		
		

	}

}
