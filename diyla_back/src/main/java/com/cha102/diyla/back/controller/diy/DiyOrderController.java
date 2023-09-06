package com.cha102.diyla.back.controller.diy;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.sql.Timestamp;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;
import com.cha102.diyla.diycatemodel.DiyCateEntity;
import com.cha102.diyla.diycatemodel.DiyCateService;
import com.cha102.diyla.member.*;

@WebServlet("/diy_order/DiyOrderController")
public class DiyOrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private DiyCateService diyCateService;
	private Timer timer;

	public void destroy() {
		super.destroy();

		// 在Servlet销毁时取消定时任务
		timer.cancel();
	}

	public void init() throws ServletException {
		super.init();

		// 获取Spring的应用程序上下文
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

		// 从上下文中获取Bean
		diyCateService = (DiyCateService) context.getBean("diyCateService");

		// 排成器
		timer = new Timer(true);
		Calendar now = Calendar.getInstance();

		now.set(Calendar.HOUR_OF_DAY, 18);
		now.set(Calendar.MINUTE, 8);
		now.set(Calendar.SECOND, 0);

		if (Calendar.getInstance().after(now)) {
			now.add(Calendar.MINUTE, 1);
		}

		long delay = now.getTimeInMillis() - Calendar.getInstance().getTimeInMillis();
		Calendar cal = new GregorianCalendar(2023, Calendar.SEPTEMBER, 4, 18, 11, 0);

		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {

				DiyOrderService DOser = new DiyOrderService();
				List<DiyOrderVO> diyOrderList = DOser.getAll();

				for (DiyOrderVO diyOrderVO : diyOrderList) {
					if (diyOrderVO.getReservationStatus() == 1 && diyOrderVO.getPaymentStatus() == 0) {
						Timestamp currentTime = new Timestamp(System.currentTimeMillis());
						long timediff = currentTime.getTime() - diyOrderVO.getCreateTime().getTime();
						long daysDifference = timediff / (1000 * 60 * 60 * 24);
						if (daysDifference >= 1) {
							diyOrderVO.setPaymentStatus(3);

						}

					}

				}

				System.out.println("11111111111111111111111111111111111111。");
			}
		}, cal.getTime(), 10800000); // 任务每3小时执行一次

	}

	/*
	 * ===============================以上是DiyCate注入 及
	 * 排程器===================================================================
	 */

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String result = req.getParameter("result");

		// 後台前端顯示所有訂單 (差DATATABLE) done
		if ("getAllOrder".equals(action)) {

			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("diyCateList", diyCateList);

			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.getAll();

			req.setAttribute("diyOrderList", diyOrderList);

			String url = "/diy_order/getallorderlist_EL.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		// 後台前端顯示某訂單編號之訂單 done
		if ("getOne_For_Display".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			DiyOrderService DOser = new DiyOrderService();
			String diyorderno = req.getParameter("diyorderno");

			if (req.getParameter("diyOrderNo") == null || req.getParameter("diyOrderNo").trim().length() == 0) {
				System.out.println("沒有輸入訂單編號");
				errorMsgs.put("diyOrderNo", "請輸入訂單編號");
				String url = "/diy_order/diyorderfront.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} else {
				Integer diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
				DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
				if (diyOrderVO == null) {
					System.out.println("該訂單編號無效");
					errorMsgs.put("diyOrderVO", "該訂單編號" + diyOrderNo + "無訂單資料，請查詢後重新輸入");
					String url = "/diy_order/diyorderfront.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
					System.out.println(diyOrderVO);
					req.setAttribute("diyOrderVO", diyOrderVO);

					String url = "/diy_order/odlistbyID_EL.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);

				}
			}
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

		// 後台找該時段全部有效訂單(傳diyReserveDate、diyPeriod 要串接點名系統 ) done
		if ("getEffectOrderByPeriod".equals(action)) {
			// 錯誤處理及 匯入 DiyCateEntity
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));

			System.out.println(req.getParameter("diyReserveDate"));

			try {
				if (req.getParameter("diyReserveDate").length() == 0) { // 是空值
					errorMsgs.put("diyReserveDateNull", "請輸入日期");
					System.out.println("沒輸入日期");
					req.setAttribute("uuu", 404);
					String url = "/diy_order/getodByPeriod_front.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
					Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
					switch (diyPeriod) {
					case 0:
						req.setAttribute("diyPeriod", "上午");
						break;
					case 1:
						req.setAttribute("diyPeriod", "下午");
						break;
					case 2:
						req.setAttribute("diyPeriod", "晚上");
						break;
					default:
						System.out.println("您選擇了無效選項");
					}

//					String diyPeriod1 = req.getParameter("diyPeriod1");
//					req.setAttribute("diyPeriod", diyPeriod);
					DiyOrderService DOser = new DiyOrderService();
					List<DiyOrderVO> diyOrderList = DOser.getAllByDatePeriodAfter(diyReserveDate, diyPeriod);
					System.out.println(diyOrderList);

					try {
						if (diyOrderList == null || diyOrderList.size() == 0) {
							errorMsgs.put("diyOrderList", "該時段查無資料");
							System.out.println("查無資料");
							req.setAttribute("uuu", 405);
							String url = "/diy_order/getodByPeriod_front.jsp";
							RequestDispatcher successView = req.getRequestDispatcher(url);
							successView.forward(req, res);
						} else {
							req.setAttribute("diyOrderList", diyOrderList);
							req.setAttribute("diyReserveDate", diyReserveDate);
							String url = "/diy_order/getodListByPeriod.jsp";/////////
							RequestDispatcher successView = req.getRequestDispatcher(url);
							successView.forward(req, res);
						}

					} catch (Exception e) {
						errorMsgs.put("diyOrderList", "該時段查無資料");
					}

				}

			} catch (Exception e) {
				errorMsgs.put("diyReserveDateNull", "請輸入日期");
			}
		}

		// 查詢特定時段的會員訂單"已到or未到"(點名系統) done
		if ("comeORnot".equals(action) && "0".equals(result)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("diyCateList", diyCateList);

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

			if (diyOrderList.size() == 0) {
				System.out.println(diyOrderList);
				System.out.println("沒資料");
				errorMsgs.put("diyOrderList", "已無有效訂單須確認，點擊\"OK\"返回上頁。可至\"查詢時段所有訂單\"查詢狀態。");
				req.setAttribute("uuu", 404);
				String url = "/diy_order/getodListByPeriod.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} else {
				String url = "/diy_order/getodListByPeriod.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			}

		} else if ("comeORnot".equals(action) && "1".equals(result)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("diyCateList", diyCateList);

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

			if (diyOrderList.size() == 0) {
				System.out.println(diyOrderList);
				System.out.println("沒資料");
				errorMsgs.put("diyOrderList", "已無有效訂單須確認，點擊\"OK\"返回上頁。可至\"查詢時段所有訂單\"查詢狀態。");
				req.setAttribute("uuu", 404);
				String url = "/diy_order/getodListByPeriod.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} else {
				String url = "/diy_order/getodListByPeriod.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			}
		}

		// 後台找該時段全部//狀態\\訂單(傳diyReserveDate、diyPeriod 點名系統串接過來 ) done
		if ("getAllOrderByPeriod".equals(action)) {
			// 錯誤處理及 匯入 DiyCateEntity
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));

			try {
				if (req.getParameter("diyReserveDate").length() == 0) { // 是空值
					errorMsgs.put("diyReserveDateNull1", "請輸入日期");
					System.out.println("沒輸入日期");
					req.setAttribute("uuu", 404);
					String url = "/diy_order/getodByPeriod_front.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
					Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
					switch (diyPeriod) {
					case 0:
						req.setAttribute("diyPeriod", "上午");
						break;
					case 1:
						req.setAttribute("diyPeriod", "下午");
						break;
					case 2:
						req.setAttribute("diyPeriod", "晚上");
						break;
					default:
						System.out.println("您選擇了無效選項");
					}

					DiyOrderService DOser = new DiyOrderService();
					List<DiyOrderVO> diyOrderList = DOser.getAllOrderByPeriod(diyReserveDate, diyPeriod);
					System.out.println(diyOrderList);

					try {
						if (diyOrderList == null || diyOrderList.size() == 0) {
							errorMsgs.put("diyOrderList1", "該時段查無資料");
							System.out.println("查無資料");
							req.setAttribute("uuu", 405);
							String url = "/diy_order/getodByPeriod_front.jsp";
							RequestDispatcher successView = req.getRequestDispatcher(url);
							successView.forward(req, res);
						} else {
							req.setAttribute("diyOrderList", diyOrderList);
							req.setAttribute("diyReserveDate", diyReserveDate);
							String url = "/diy_order/getAllStatusodByPeriod.jsp";/////////
							RequestDispatcher successView = req.getRequestDispatcher(url);
							successView.forward(req, res);
						}

					} catch (Exception e) {
						errorMsgs.put("diyOrderList1", "該時段查無資料");
					}

				}

			} catch (Exception e) {
				errorMsgs.put("diyReserveDateNull1", "請輸入日期");
			}
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

		// 找個別會員所有訂單--後端
		if ("getOneMemId_For_Display".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			DiyOrderService DOser = new DiyOrderService();

			if (req.getParameter("memId") == null || req.getParameter("memId").trim().length() == 0) {
				System.out.println("沒有輸入會員資料");
				errorMsgs.put("memId", "請輸入會員編號");
				req.setAttribute("uuu", 405);
				String url = "/diy_order/diyorderfront.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} else {
				int memId = Integer.valueOf(req.getParameter("memId"));
				List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(memId);

				if (diyOrderList.size() == 0) {
					System.out.println("該會員無訂單資料");
					errorMsgs.put("diyOrderList", "該會員" + memId + "無訂單資料");
					req.setAttribute("uuu", 405);
					String url = "/diy_order/diyorderfront.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
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
			}

		}

		// 所有訂單退款審核(後台)
		if ("getAllRefund".equals(action)) {

//			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
//			int reservationStatus = Integer.valueOf(req.getParameter("reservationStatus"));
//			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllDiyCates();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);
			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.getAllRefundod();

			if (diyOrderList.size() == 0) {
				System.out.println("無退款未完成訂單");
				errorMsgs.put("refundNot", "無退款未完成訂單資料");
				String url = "/diy_order/diyorderfront.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} else {
				System.out.println(diyOrderList);

				req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
				String url = "/diy_order/refund_verify.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			}
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
