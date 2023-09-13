package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;
import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import org.apache.commons.io.IOUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/shop/CommodityController")
@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CommodityController extends HttpServlet {
    CommodityService service = new CommodityService();
    CommodityClassService classService = new CommodityClassService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("listAll".equals(action)) {
            List<CommodityVO> commodityVOS = service.getAll();
            List<CommodityClassVO> commodityClasses = classService.getAll();
            HashMap<Integer, String> classNameMap = new HashMap<>();
            for (CommodityClassVO commodityClassVO : commodityClasses) {
                //將類別編號當key，類別名稱當Value放進HashMap中
                classNameMap.put(commodityClassVO.getComClassNo(), commodityClassVO.getComClassName());
            }
            req.setAttribute("classNameMap", classNameMap);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("findByID".equals(action)) {
            Integer comNO = Integer.valueOf(req.getParameter("comNO"));
            CommodityVO commodityVO = service.findByID(comNO);
            req.setAttribute("commodity", commodityVO);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/commodityPage.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("findByClassNO".equals(action)) {
            Integer comClassNO = Integer.valueOf(req.getParameter("comClassNo"));
            List<CommodityVO> commodityVOS = service.findByComClass(comClassNO);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("search".equals(action)) {
            String keyword = req.getParameter("keyword");
            List<CommodityVO> commodityVOS = service.findByNameKeyword(keyword);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }
        doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("changeState".equals(action)) {
            Integer comState = Integer.valueOf(req.getParameter("comState"));
            Integer comNO = Integer.valueOf(req.getParameter("comNO"));
            int i = service.changeState(comState, comNO);
            if (i == 1) {
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/CommodityController?action=listAll");
               res.sendRedirect(req.getContextPath()+"/shop/CommodityController?action=listAll");
            }else {
                // todo 錯誤頁面
            }
        }

        if ("insertPage".equals(action)) {
            List<CommodityClassVO> commodityClasses = classService.getAll(); // 取回所有商品類別
            req.setAttribute("commodityClasses", commodityClasses); // 放到大中小的小
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/insertNewCommodity.jsp"); // 設定下個頁面路徑
            requestDispatcher.forward(req, res); // 轉導到下個頁面，並把請求跟回應一併交給
        }
        HashMap<String, String> errMsg = new HashMap<>();

        if ("insert".equals(action)) {
            Integer comClassNo = null;
            try {
                comClassNo = Integer.valueOf(req.getParameter("comClassNo"));
            } catch (NumberFormatException e) {
                errMsg.put("comClassNo", "請選擇類別");
            }

            String commodityName = req.getParameter("commodityName");
            if (commodityName == null || commodityName.trim().isEmpty()) {
                errMsg.put("commodityName", "名稱不得空白");
            }
            byte[] commodityPic = IOUtils.toByteArray(req.getPart("commodityPic").getInputStream());
            if (commodityPic.length == 0) {
                errMsg.put("commodityPic", "請上傳圖片檔");
            }

            String commodityDes = req.getParameter("commodityDes");
            if (commodityDes == null || commodityDes.trim().length() == 0) {
                errMsg.put("commodityDes", "請加入商品敘述");
            }
            Integer commodityPri = null;
            try {
                commodityPri = Integer.valueOf(req.getParameter("commodityPri"));
            } catch (Exception e) {
                errMsg.put("commodityPri", "請輸入價格");
            }
            if (commodityPri == null || commodityPri <= 0) {
                errMsg.put("commodityPri", "價格不得小於零");
            }
            Integer commodityQua = null;
            try {
                commodityQua = Integer.valueOf(req.getParameter("commodityQua"));
            } catch (Exception e) {
                errMsg.put("commodityQua", "請輸入數量");
            }
            if (commodityQua == null || commodityQua <= 0) {
                errMsg.put("commodityQua", "數量不得小於零");
            }

            if (!errMsg.isEmpty()) {
                req.setAttribute("errMsg", errMsg);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/CommodityController?action=insertPage");
                requestDispatcher.forward(req, res);
                return;
            }
            Integer commodityStatus = Integer.valueOf(req.getParameter("commodityStatus"));

            CommodityVO commodityVO = getCommodityVO(comClassNo, commodityName, commodityPic, commodityDes, commodityPri, commodityQua, commodityStatus);
            service.insert(commodityVO);
            res.sendRedirect(req.getContextPath()+"/shop/CommodityController?action=listAll");
        }

        if ("toUpdate".equals(action)) {
            Integer comNO = Integer.valueOf(req.getParameter("comNO"));
            CommodityVO commodityVO = service.findByID(comNO);
            req.setAttribute("commodity", commodityVO);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/commodityUpdate.jsp");
            requestDispatcher.forward(req, res);
        }

        if ("update".equals(action)) {
            Integer comNO = Integer.valueOf(req.getParameter("comNO"));
            Integer comClassNo = null;
            try {
                comClassNo = Integer.valueOf(req.getParameter("comClassNo"));
            } catch (NumberFormatException e) {
                errMsg.put("comClassNo", "請選擇類別");
            }

            String commodityName = req.getParameter("commodityName");
            if (commodityName == null || commodityName.trim().isEmpty()) {
                errMsg.put("commodityName", "名稱不得空白");
            }
            byte[] commodityPic = IOUtils.toByteArray(req.getPart("commodityPic").getInputStream());

            String commodityDes = req.getParameter("commodityDes");
            if (commodityDes == null || commodityDes.trim().length() == 0) {
                errMsg.put("commodityDes", "請加入商品敘述");
            }
            Integer commodityPri = null;
            try {
                commodityPri = Integer.valueOf(req.getParameter("commodityPri"));
            } catch (Exception e) {
                errMsg.put("commodityPri", "請輸入價格");
            }
            if (commodityPri == null || commodityPri <= 0) {
                errMsg.put("commodityPri", "價格不得小於零");
            }
            Integer commodityQua = null;
            try {
                commodityQua = Integer.valueOf(req.getParameter("commodityQua"));
            } catch (Exception e) {
                errMsg.put("commodityQua", "請輸入數量");
            }
            if (commodityQua == null || commodityQua <= 0) {
                errMsg.put("commodityQua", "數量不得小於零");
            }

            if (!errMsg.isEmpty()) {
                req.setAttribute("errMsg", errMsg);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/CommodityController?action=toUpdate");
                requestDispatcher.forward(req, res);
            }
            Integer commodityStatus = Integer.valueOf(req.getParameter("commodityStatus"));
            CommodityVO commodityVO = getCommodityVO(comClassNo, commodityName, commodityPic, commodityDes, commodityPri, commodityQua, commodityStatus);
            commodityVO.setComNO(comNO);
            CommodityVO commodityVO1 = service.updateCommodity(commodityVO);
            req.setAttribute("commodity", commodityVO1);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/commodityPage.jsp");
            requestDispatcher.forward(req, res);

        }


    }

    private static CommodityVO getCommodityVO(Integer comClassNo, String commodityName, byte[] commodityPic, String commodityDes, Integer commodityPri, Integer commodityQua, Integer commodityStatus) {
        CommodityVO commodityVO = new CommodityVO();
        commodityVO.setComClassNo(comClassNo);
        commodityVO.setComName(commodityName);
        commodityVO.setComPic(commodityPic);
        commodityVO.setComDes(commodityDes);
        commodityVO.setComPri(commodityPri);
        commodityVO.setComQua(commodityQua);
        commodityVO.setComState(commodityStatus);
        return commodityVO;
    }
}
