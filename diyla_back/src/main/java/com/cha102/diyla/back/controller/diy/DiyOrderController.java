package com.cha102.diyla.back.controller.diy;

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
import com.cha102.diyla.member.*;

@WebServlet("/diy_order/DiyOrderController")
public class DiyOrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String result = req.getParameter("result");

		if ("getOne_For_Display".equals(action)) {
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(Integer.valueOf(req.getParameter("diyorderno")));
			System.out.println(diyOrderVO);

			req.setAttribute("diyOrderVO", diyOrderVO); // 資料庫取出的empVO物件,存入req
			String url = "/diy_order/odlistbyID_EL.jsp";
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

			String url = "/diy_order/getallorderlist_EL.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) {

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DOser.deleteDO(diyOrderNo);

			String url = "/diy_order/getallorderlist_EL.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {

			Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			req.setAttribute("diyOrderVO", diyOrderVO);

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

			DiyOrderVO diyOrderVO = new DiyOrderVO();
			diyOrderVO.setMemId(memId);
			diyOrderVO.setDiyNo(diyNo);
			diyOrderVO.setContactPerson(contactPerson);
			diyOrderVO.setContactPhone(contactPhone);
			diyOrderVO.setReservationNum(reservationNum);
			diyOrderVO.setDiyPeriod(diyPeriod);
			diyOrderVO.setDiyReserveDate(diyReserveDate);
			diyOrderVO.setReservationStatus(reservationStatus);
			diyOrderVO.setPaymentStatus(paymentStatus);
			diyOrderVO.setDiyPrice(diyPrice);
			diyOrderVO.setDiyOrderNo(diyOrderNo);
			req.setAttribute("diyOrderVO", diyOrderVO);

			DiyOrderService DOser = new DiyOrderService();
			DOser.upOD(diyOrderVO);

			String url = "/diy_order/getallorderlist_EL.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		// 查詢特定時段的所有訂單
		if ("getAllOrderByPeriod".equals(action)) {

			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.getAllByDatePeriodAfter(diyReserveDate, diyPeriod);
			req.setAttribute("diyOrderList", diyOrderList);
			DiyOrderVO diyOrderVO1 = diyOrderList.get(0);
			req.setAttribute("diyOrderVO1", diyOrderVO1);

			String url = "/diy_order/getodListByPeriod.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		// 查詢特定時段的會員訂單"已到or未到"(點名系統)
		if ("comeORnot".equals(action) && "0".equals(result)) {

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			diyOrderVO.setPaymentStatus(1);
			System.out.println(diyOrderVO);
			DOser.upOD(diyOrderVO);
			List<DiyOrderVO> diyOrderList = DOser.getAllByDatePeriodAfter(diyReserveDate, diyPeriod);
			req.setAttribute("diyOrderList", diyOrderList);
			DiyOrderVO diyOrderVO1 = diyOrderList.get(0);
			req.setAttribute("diyOrderVO1", diyOrderVO1);

			String url = "/diy_order/getodListByPeriod.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		} else if ("comeORnot".equals(action) && "1".equals(result)) {
			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			diyOrderVO.setReservationStatus(3);
			diyOrderVO.setPaymentStatus(2);
			System.out.println(diyOrderVO);
			DOser.upOD(diyOrderVO);
			List<DiyOrderVO> diyOrderList = DOser.getAllByDatePeriodAfter(diyReserveDate, diyPeriod);
			req.setAttribute("diyOrderList", diyOrderList);
			DiyOrderVO diyOrderVO1 = diyOrderList.get(0);
			req.setAttribute("diyOrderVO1", diyOrderVO1);

			String url = "/diy_order/getodListByPeriod.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		// 找個別會員所有訂單--後端
		if ("getOneMemId_For_Display".equals(action)) {
			DiyOrderService DOser = new DiyOrderService();
			int memId = Integer.valueOf(req.getParameter("memId"));
			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(memId);
			System.out.println(diyOrderList);
			MemberService memSvc = new MemberService();
			MemVO memVO = memSvc.selectMem(memId);
			memVO.setMemId(memId);

			req.setAttribute("memVO", memVO);
			req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
			String url = "/diy_order/getallorderlistByMemID.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

//		// 所有訂單退款審核(後台)
//		if ("refund_okORnot".equals(action) && "0".equals(result)) {
//			
//			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
//			int reservationStatus = Integer.valueOf(req.getParameter("reservationStatus"));
//			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));
//			
//			DiyOrderService DOser = new DiyOrderService();
//			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
//			diyOrderVO.setReservationStatus();
//			
//			
//			List<DiyOrderVO> diyOrderList = DOser.getAllRefundod();
//			req.setAttribute("diyOrderList", diyOrderList);
//
//			String url = "/diy_order/refund_verify.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);
//		} else if ("refund_okORnot".equals(action) && "1".equals(result)) {
//			DiyOrderService DOser = new DiyOrderService();
//			List<DiyOrderVO> diyOrderList = DOser.getAllRefundod();
//			req.setAttribute("diyOrderList", diyOrderList);
//
//			String url = "/diy_order/refund_verify.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);
//		}

	}
}
