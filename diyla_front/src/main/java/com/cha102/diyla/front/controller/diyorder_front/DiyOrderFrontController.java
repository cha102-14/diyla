package com.cha102.diyla.front.controller.diyorder_front;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;
import com.cha102.diyla.diycatemodel.*;

@WebServlet("/diyOrder/DiyOrderFrontController")
public class DiyOrderFrontController extends HttpServlet {
	String taiwanPhoneNumberPattern = "09\\d{8}";
	String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
	private static final long serialVersionUID = 1L;

	private DiyCateService diyCateService;
	private Timer timer;

//	public void destroy() {
//        super.destroy();
//
//        // 在Servlet销毁时取消定时任务
//        timer.cancel();
//    }

	@Override
	public void init() throws ServletException {
		super.init();

		// 获取Spring的应用程序上下文
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

		// 从上下文中获取Bean
		diyCateService = (DiyCateService) context.getBean("diyCateService");

		// 排成器
//        timer = new Timer(true);
//        Calendar now = Calendar.getInstance();
//        
//        now.set(Calendar.HOUR_OF_DAY, 19);
//        now.set(Calendar.MINUTE, 0);
//        now.set(Calendar.SECOND, 0);
//        
//        if (Calendar.getInstance().after(now)) {
//        	now.add(Calendar.MINUTE, 1);
//       	}
//        
//        long delay = now.getTimeInMillis() - Calendar.getInstance().getTimeInMillis();
//        Calendar cal = new GregorianCalendar(2023,Calendar.SEPTEMBER,2,19,25,0);
//
//        timer.scheduleAtFixedRate(new TimerTask() {
//            @Override
//            public void run() {
//                System.out.println("11111111111111111111111111111111111111。");
//            }
//        }, cal.getTime(), 10000); // 任务每24小时执行一次

	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 找會員所有訂單--前台
		if ("getAllOrderByMemId_front".equals(action)) {
			DiyOrderService DOser = new DiyOrderService();
			List<DiyCateEntity> diyCateList = diyCateService.getAllNotPutOn();
			req.setAttribute("diyCateList", diyCateList);
			List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(Integer.valueOf(req.getParameter("memId")));
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			System.out.println(diyOrderList);
			System.out.println(diyCateList);

			try {
				if (diyOrderList == null || diyOrderList.size() == 0) {
					errorMsgs.put("diyOrderList", "查無訂單資料");
					System.out.println("查無訂單資料");
					req.setAttribute("uuu", 405);
					String url = "/diyOrder/diyOrder.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
					req.setAttribute("diyOrderList", diyOrderList);
					String url = "/diyOrder/diyOrder.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				}

			} catch (Exception e) {
				errorMsgs.put("diyOrderList", "查無訂單資料");
			}

//			req.setAttribute("diyOrderList", diyOrderList);
//			
//			String url = "/diyOrder/diyOrder.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);
		}

		// 找會員所有"待退款"訂單 done
		if ("getAllDeleteByMemId_front".equals(action)) {
			// 錯誤處理及 匯入 DiyCateEntity
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllNotPutOn();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			DiyOrderService DOser = new DiyOrderService();
			List<DiyOrderVO> diyOrderList = DOser.getDeleteByID(Integer.valueOf(req.getParameter("memId")));
			System.out.println(diyOrderList);

			try {
				if (diyOrderList == null || diyOrderList.size() == 0) {
					errorMsgs.put("diyOrderList", "查無資料");
					System.out.println("查無資料");
					req.setAttribute("uuu", 404);
					String url = "/diyOrder/AllDeleteById.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				} else {
					req.setAttribute("diyOrderList", diyOrderList);
					String url = "/diyOrder/AllDeleteById.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				}

			} catch (Exception e) {
				errorMsgs.put("diyOrderList", "查無資料");
			}

		}

		// 找會員該時段訂單
		if ("getMemIdOrderByPeriod".equals(action)) {
			// 錯誤處理及 匯入 DiyCateEntity
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			List<DiyCateEntity> diyCateList = diyCateService.getAllNotPutOn();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("diyCateList", diyCateList);

			int memId = Integer.valueOf(req.getParameter("memId"));

			int diyPeriod = Integer.valueOf(req.getParameter("diyPeriod"));

			System.out.println(req.getParameter("diyReserveDate"));

			try {
				if (req.getParameter("diyReserveDate").length() == 0) { // 是空值
					errorMsgs.put("diyReserveDateNull", "請輸入日期");
					System.out.println("沒輸入日期");
					req.setAttribute("aaa", 404);
					String url = "/diyOrder/diyOrder_front.jsp";
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

					String diyPeriod1 = req.getParameter("diyPeriod1");
//					req.setAttribute("diyPeriod", diyPeriod);
					DiyOrderService DOser = new DiyOrderService();
					List<DiyOrderVO> diyOrderList = DOser.getAllByMemIDDatePeriod(memId, diyReserveDate, diyPeriod);
					System.out.println(diyOrderList);

					try {
						if (diyOrderList == null || diyOrderList.size() == 0) {
							errorMsgs.put("diyOrderList", "該時段查無資料");
							System.out.println("查無資料");
							req.setAttribute("uuu", 405);
							String url = "/diyOrder/diyOrder_ByMemPeriod.jsp";
							RequestDispatcher successView = req.getRequestDispatcher(url);
							successView.forward(req, res);
						} else {
							req.setAttribute("diyOrderList", diyOrderList);
							req.setAttribute("period", 200);
							req.setAttribute("diyReserveDate", diyReserveDate);
							String url = "/diyOrder/diyOrder_ByMemPeriod.jsp";/////////
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

		// diyOrder燈箱update 聯絡資訊 完導向到diyOrder(訂單總攬) done
		if ("update_contact".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			List<DiyCateEntity> diyCateList = diyCateService.getAllNotPutOn();
			req.setAttribute("diyCateList", diyCateList);
			int period;
			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			// 看是否從時段那過來
			String contactPerson = req.getParameter("contactPerson");
			String contactPhone = req.getParameter("contactPhone");
			DiyOrderService DOser = new DiyOrderService();
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);

			/* =================== */
			try {
				if (contactPhone.matches(taiwanPhoneNumberPattern)) {

				} else {
					if (contactPhone == null || (contactPhone.trim()).length() == 0) {
						errorMsgs.put("contactPhone", "請輸入聯絡人電話");
					} else {
						errorMsgs.put("contactPhone", "請輸入正確聯絡人電話");
					}

				}
			} catch (Exception e) {
				errorMsgs.put("contactPhone", "請輸入聯絡人電話");
			}

			/* =================== */

			try {
				if (contactPerson.matches(nameReg)) {

				} else {
					if (contactPerson == null || (contactPerson.trim()).length() == 0) {
						errorMsgs.put("contactPerson", "請輸入聯絡人姓名");
					} else {
						errorMsgs.put("contactPerson", "請輸入正確聯絡人姓名，姓名格式只能為中、英文字母、數字和_ , 且長度必需在2到10之間");
					}
				}
			} catch (Exception e) {
				errorMsgs.put("contactPerson", "請輸入正確聯絡人姓名 \n 姓名格式只能為中、英文字母、數字和_ , 且長度必需在2到10之間\n");
			}

			/* =================== */

			if (!errorMsgs.isEmpty()) {
				DOser.upOD(diyOrderVO);

				if (req.getParameter("period") != null) { // 從時段訂單過來的
					DiyOrderVO diyOrderVO200 = DOser.getOneDO(diyOrderNo);
					List<DiyOrderVO> diyOrderList = DOser.getAllByMemIDDatePeriod(diyOrderVO200.getMemId(),
							diyOrderVO200.getDiyReserveDate(), diyOrderVO200.getDiyPeriod());
					req.setAttribute("diyReserveDate", diyOrderVO200.getDiyReserveDate());
					req.setAttribute("diyPeriod", diyOrderVO200.getDiyPeriod());

					req.setAttribute("diyOrderList", diyOrderList);
					req.setAttribute("uuu", 404);
					RequestDispatcher failureView = req.getRequestDispatcher("/diyOrder/diyOrder_ByMemPeriod.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				} else if (req.getParameter("period") == null) { // 從所有訂單過來的
					List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());

					req.setAttribute("diyOrderList", diyOrderList);
					req.setAttribute("uuu", 404);

					RequestDispatcher failureView = req.getRequestDispatcher("/diyOrder/diyOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

			} else if (req.getParameter("period") != null) {
				System.out.println(diyOrderVO);
				diyOrderVO.setContactPerson(contactPerson);
				diyOrderVO.setContactPhone(contactPhone);

				DOser.upOD(diyOrderVO);

				DiyOrderVO diyOrderVO200 = DOser.getOneDO(diyOrderNo);

				List<DiyOrderVO> diyOrderList = DOser.getAllByMemIDDatePeriod(diyOrderVO200.getMemId(),
						diyOrderVO200.getDiyReserveDate(), diyOrderVO200.getDiyPeriod());
				req.setAttribute("diyReserveDate", diyOrderVO200.getDiyReserveDate());
				req.setAttribute("diyPeriod", diyOrderVO200.getDiyPeriod());

				req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
//				req.setAttribute("diyOrderVO200", diyOrderVO200);
				req.setAttribute("uuu", 1);
				String url = "/diyOrder/diyOrder_ByMemPeriod.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

			} else {
				System.out.println(diyOrderVO);
				diyOrderVO.setContactPerson(contactPerson);
				diyOrderVO.setContactPhone(contactPhone);

				DOser.upOD(diyOrderVO);

				List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());

				req.setAttribute("diyOrderList", diyOrderList); // 資料庫取出的empVO物件,存入req
				req.setAttribute("uuu", 1);
				String url = "/diyOrder/diyOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			}
		}

		// 準備要取消訂單(判斷有無三天) done
		if ("cancel_order".equals(action)) {
			List<DiyCateEntity> diyCateList = diyCateService.getAllNotPutOn();
			req.setAttribute("diyCateList", diyCateList);

			int diyOrderNo = Integer.valueOf(req.getParameter("diyOrderNo"));
			int refund_qual = Integer.valueOf(req.getParameter("refund_qual"));
//			Date currentDate = new Date(System.currentTimeMillis());
			Date diyReserveDate = Date.valueOf(req.getParameter("diyReserveDate"));
			String diyPeriod1 = req.getParameter("diyPeriod1");
			System.out.println(diyPeriod1);
			DiyOrderService DOser = new DiyOrderService();
			System.out.println(diyOrderNo);
			DiyOrderVO diyOrderVO = DOser.getOneDO(diyOrderNo);
			System.out.println(diyOrderVO);
			System.out.println(diyReserveDate);

			// 計算日期差距（以天為單位）
//	        long differenceInMilliseconds = diyReserveDate.getTime() - currentDate.getTime();
//	        long differenceInDays = TimeUnit.MILLISECONDS.toDays(differenceInMilliseconds);

			// 比較差距與 3 天
			if (refund_qual == 1) {
				System.out.println("可正常退款");

				diyOrderVO.setReservationStatus(1);
				System.out.println(diyOrderVO);
				DOser.upOD(diyOrderVO);

				//////////////////////////

				if (req.getParameter("period") != null) { // 從時段訂單過來的
//					List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());
//					req.setAttribute("diyOrderList", diyOrderList);
//					req.setAttribute("DiyOrderVO", diyOrderVO);
//					req.setAttribute("refund_check", 1);

//
//					String url = "/diyOrder/diyOrder_ByMemPeriod.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//					successView.forward(req, res);

					req.setAttribute("diyReserveDate", diyReserveDate);
					req.setAttribute("diyPeriod", diyPeriod1);
					DiyOrderVO diyOrderVO200 = DOser.getOneDO(diyOrderNo);
					List<DiyOrderVO> diyOrderList = DOser.getAllByMemIDDatePeriod(diyOrderVO200.getMemId(),
							diyOrderVO200.getDiyReserveDate(), diyOrderVO200.getDiyPeriod());
					req.setAttribute("diyReserveDate", diyOrderVO200.getDiyReserveDate());

//					switch (diyOrderVO200.getDiyPeriod()) {
//		            case 0:
//		            	req.setAttribute("diyPeriod", "上午");
//		                break;
//		            case 1:
//		            	req.setAttribute("diyPeriod", "下午");
//		                break;
//		            case 2:
//		            	req.setAttribute("diyPeriod", "晚上");
//		                break;
//		            default:
//		                System.out.println("您選擇了無效選項");
//		        }

					req.setAttribute("diyPeriod", diyPeriod1);

					req.setAttribute("diyOrderList", diyOrderList);
					req.setAttribute("refund_check", 1);
					RequestDispatcher failureView = req.getRequestDispatcher("/diyOrder/diyOrder_ByMemPeriod.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				} else if (req.getParameter("period") == null) { // 從所有訂單過來的
					List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());
					req.setAttribute("diyOrderList", diyOrderList);
					req.setAttribute("DiyOrderVO", diyOrderVO);
					req.setAttribute("refund_check", 1);
					req.setAttribute("diyReserveDate", diyReserveDate);
					req.setAttribute("diyPeriod", diyPeriod1);

					String url = "/diyOrder/diyOrder.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);
				}
				//////////////////////////

				List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());
				req.setAttribute("diyOrderList", diyOrderList);
				req.setAttribute("DiyOrderVO", diyOrderVO);
				req.setAttribute("refund_check", 1);
				req.setAttribute("diyReserveDate", diyReserveDate);
				req.setAttribute("diyPeriod", diyPeriod1);

				String url = "/diyOrder/diyOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} else {
				System.out.println("不能退款");

				diyOrderVO.setReservationStatus(3);
				diyOrderVO.setPaymentStatus(2);
				System.out.println(diyOrderVO);
				DOser.upOD(diyOrderVO);

				List<DiyOrderVO> diyOrderList = DOser.findMemIdAllOrder(diyOrderVO.getMemId());
				req.setAttribute("diyOrderList", diyOrderList);
				req.setAttribute("DiyOrderVO", diyOrderVO);
				req.setAttribute("refund_check", 2);
				req.setAttribute("diyReserveDate", diyReserveDate);
				req.setAttribute("diyPeriod", diyPeriod1);

				String url = "/diyOrder/diyOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			}
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
