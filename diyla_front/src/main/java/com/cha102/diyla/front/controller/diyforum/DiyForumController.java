package com.cha102.diyla.front.controller.diyforum;

import com.cha102.diyla.diyOrder.DiyOrderService;
import com.cha102.diyla.diyOrder.DiyOrderVO;
import com.cha102.diyla.diyforummodel.*;
import com.cha102.diyla.diyreservemodel.DiyReserveResultService;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.util.PageBean;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/diy/diy-forum")
public class DiyForumController {
	@Resource
	DiyForumService service;
	//使用了@Resource註解，將MemberRepository這個數據存取物件注入到該類中，這個物件用於和會員資料庫進行交互。
	@Resource
	MemberRepository memberRepository;



	@RequestMapping("/list")
	public Page<DiyForumEntity> list(
			@RequestParam(defaultValue = "4") Integer diyNo,
			@RequestParam(required = false) String cSort,
			@RequestParam(required = false) String sSort,
			@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer pageSize
	) {
		PageBean pageBean = new PageBean(page, pageSize);
		HashMap<String, String> errMsgs = new HashMap<>();
// 設置分頁條件
		Page<DiyForumEntity> all = service.getAll(diyNo, cSort, sSort, pageBean);
// 將JSON格式回傳给前端
		return all;
	}

	@RequestMapping("/add")
	public ResponseEntity add(DiyForumEntity diyForum, HttpSession httpSession) {
		DiyOrderService diyOrderService = new DiyOrderService();
		MemVO memVO = (MemVO) httpSession.getAttribute("memVO");
		if (!ObjectUtils.isEmpty(memVO)){
			List<DiyOrderVO> orders = diyOrderService.findMemIdAllOrder(memVO.getMemId());

			List<DiyOrderVO> collect = orders.stream().filter(diyOrderVO -> diyOrderVO.getDiyNo() == diyForum.getDiyNo() && diyOrderVO.getPaymentStatus() == 1).collect(Collectors.toList());

			if (collect.size() > 0) {
				MemberEntity memberEntity = memberRepository.findById(memVO.getMemId()).get();
				diyForum.setCreateTime(new Timestamp(new Date().getTime()));
				diyForum.setMemberEntity(memberEntity);
				DiyForumVO diyForumVO = service.addDF(diyForum);
				return new ResponseEntity(diyForumVO,HttpStatus.OK);
			}else {
				return new ResponseEntity(HttpStatus.METHOD_NOT_ALLOWED);
			}
		} else {
			return new ResponseEntity(HttpStatus.UNAUTHORIZED);
		}
	}

	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		service.deleteById(id);
	}
}









//import com.cha102.diyla.commodityClassModel.CommodityClassVO;
//import com.cha102.diyla.diyforummodel.DiyForumService;
//import com.cha102.diyla.diyforummodel.DiyForumVO;
//import com.cha102.diyla.util.PageBean;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.HashMap;
//import java.util.List;
//
//@WebServlet("/diy/DiyForumController")
//public class  DiyForumController extends HttpServlet {
//	DiyForumService service = new DiyForumService();
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doPost(req, resp);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//		if ("list".equals(action)) {
//			HashMap<String, String> errMsgs = new HashMap<>();
//			String diyNo = req.getParameter("diyNo");
//			int page = Integer.parseInt(req.getParameter("page"));
//			String commentSort = req.getParameter("commentSort");
//			String starSort = req.getParameter("starSort");
//			if (diyNo == null || diyNo.trim().length() == 0) {
//				errMsgs.put("diyNo", "DIY品項編號不得空白");
//			}
//			if (!errMsgs.isEmpty()) {
//				req.setAttribute("errMsgs", errMsgs);
//				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
//				requestDispatcher.forward(req, resp);
//				return;
//			}
//			try {
//				int diyNu = Integer.parseInt(diyNo);
////設置分頁條件
//				PageBean pageBean = new PageBean();
//				pageBean.setPage(page);
//				pageBean = service.getAll(diyNu, commentSort, starSort, pageBean);
//// 使用ObjectMapper將List轉換成JSON格式
//				ObjectMapper mapper = new ObjectMapper();
//				String json = mapper.writeValueAsString(pageBean);
//				resp.getWriter().write(json);
//// 將JSON格式回傳给前端
////進行其他操作
//			} catch (NumberFormatException e) {
//				errMsgs.put("diyNo", "DIY品項編號不能爲非數字");
//				req.setAttribute("errMsgs", errMsgs);
//				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
//				requestDispatcher.forward(req, resp);
//				return;
//			}
//		} else if ("add".equals(action)) {
//			int diyNo = Integer.parseInt(req.getParameter("diyNo"));
//			String artiCont = req.getParameter("artiCont");
//			Integer diyGrade = Integer.parseInt(req.getParameter("diyGrade"));
////可以使用session redis 或者 前端傳入,現在預設值為4
//			int memId = 4;
//			HashMap<String, String> msg = new HashMap<>();
//			try {
//				service.addDF(memId, diyNo, artiCont, diyGrade);
//// 將JSON格式回傳给前端
//				msg.put("msg", "添加評論成功！");
//				msg.put("code", "200");
//// 使用ObjectMapper将List转换成JSON字符串
//				ObjectMapper mapper = new ObjectMapper();
//				String json = mapper.writeValueAsString(msg);
//				resp.getWriter().write(json);
//			} catch (Exception e) {
//// 结果以JSON格式回傳给前端
//				msg.put("msg", "添加評論失敗！");
//				msg.put("code", "500");
//// 使用ObjectMapper將List轉換成JSON格式
//				ObjectMapper mapper = new ObjectMapper();
//				String json = mapper.writeValueAsString(msg);
//				resp.getWriter().write(json);
//			}
//		}
//	}
//}
