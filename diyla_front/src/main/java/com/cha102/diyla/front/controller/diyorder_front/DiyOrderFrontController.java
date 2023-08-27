package com.cha102.diyla.front.controller.diyorder_front;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;

@WebServlet("/diyOrder/DiyOrderFrontController")
public class DiyOrderFrontController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display_front".equals(action)) { // done
			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(Integer.valueOf(req.getParameter("memId")));
			System.out.println(diyOrderList);

			req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update_front".equals(action)) { // done

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO DiyOrderVO = DOser.getOneDO(diyOrderNo);
			req.setAttribute("DiyOrderVO", DiyOrderVO);

			String url = "/diyOrder/updateod_front.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("update_front".equals(action)) { // done

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			String contactPerson = req.getParameter("contactPerson");
			String contactPhone = req.getParameter("contactPhone");

			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			System.out.println(diyOrderVO);
			diyOrderVO.setContactPerson(contactPerson);
			diyOrderVO.setContactPhone(contactPhone);

			DOser.upOD(diyOrderVO);

			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(Integer.valueOf(req.getParameter("memId")));

			req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("cancel_order_front".equals(action)) { // done

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			req.setAttribute("DiyOrderVO", diyOrderVO);

			String url = "/diyOrder/deleteod_front.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("cancel_order_comfirm".equals(action)) { // done

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));

			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			diyOrderVO.setReservationStatus(1);
			diyOrderVO.setPaymentStatus(2);

			DOser.upOD(diyOrderVO);

			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(Integer.valueOf(req.getParameter("memId")));
			req.setAttribute("diyOrderList", diyOrderList);

			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		if ("keep_order".equals(action)) { 

			int memId = Integer.valueOf(req.getParameter("memId"));

			DiyOrderService DOser = new DiyOrderService();
		

			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(memId);
			req.setAttribute("diyOrderList", diyOrderList);

			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

	}
}
