package com.cha102.diyla.front.controller.diyorder_front;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 找會員所有訂單--前端
		if ("getAllOrderByMemId_front".equals(action)) { // done
			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(Integer.valueOf(req.getParameter("memId")));
			System.out.println(diyOrderList);

			req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
		
		// 找會員所有"取消"訂單
		if ("getAllDeleteByMemId_front".equals(action)) { // done
			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.getDeleteByID(Integer.valueOf(req.getParameter("memId")));
			System.out.println(diyOrderList);

			req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
			String url = "/diyOrder/AllDeleteById.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
		
		
		
		
		// 找單筆訂單準備要update
		if ("getOne_For_Update_front".equals(action)) { // done

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO DiyOrderVO = DOser.getOneDO(diyOrderNo);
			req.setAttribute("DiyOrderVO", DiyOrderVO);

			String url = "/diyOrder/updateod_front.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		

		// update完導向到首頁
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

		// 準備要取消訂單
		if ("cancel_order_front".equals(action)) { // done

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			
			Date currentDate = new Date(System.currentTimeMillis());
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			
			// 計算日期差距（以天為單位）
	        long differenceInMilliseconds = diyReserveDate.getTime() - currentDate.getTime();
	        long differenceInDays = TimeUnit.MILLISECONDS.toDays(differenceInMilliseconds);

	        // 比較差距與 3 天
	        if (differenceInDays > 3) {
	            System.out.println("可正常退款");
	            
	            diyOrderVO.setReservationStatus(1);    
	            
	        } else {
	            System.out.println("不能退款");
	            
	            diyOrderVO.setReservationStatus(3);   
	        }
			
	        DOser.upOD(diyOrderVO);
	        
			req.setAttribute("DiyOrderVO", diyOrderVO);

			String url = "/diyOrder/deleteod_front.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		// 取消訂單前確認
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
		
		// 不取消，導向首頁
		if ("keep_order".equals(action)) { 

			int memId = Integer.valueOf(req.getParameter("memId"));

			DiyOrderService DOser = new DiyOrderService();
		

			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(memId);
			req.setAttribute("diyOrderList", diyOrderList);

			String url = "/diyOrder/diyOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		
		// 新增訂單(測試session用)
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
			
			DiyOrderVO DOVO = new DiyOrderVO();
			DOVO.setMemId(memId);
			DOVO.setDiyNo(diyNo);
			DOVO.setContactPerson(contactPerson);
			DOVO.setContactPhone(contactPhone);
			DOVO.setReservationNum(reservationNum);
			DOVO.setDiyPeriod(diyPeriod);
			DOVO.setDiyReserveDate(diyReserveDate);
			DOVO.setReservationStatus(reservationStatus);
			DOVO.setPaymentStatus(paymentStatus);
			DOVO.setDiyPrice(diyPrice);

			DiyOrderService DOser = new DiyOrderService();
			DOser.addOD(DOVO);

			String url = "/diyOrder/diyOrder_front.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

	}
}
