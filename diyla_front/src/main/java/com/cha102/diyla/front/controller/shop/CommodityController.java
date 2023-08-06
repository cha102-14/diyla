package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;
import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;

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
            CommodityClassVO commodityClassVO = classService.findById(commodityVO.getComClassNo());
            req.setAttribute("comClassName",commodityClassVO);
            req.setAttribute("commodity", commodityVO);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/commodityPage.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("search".equals(action)) {
            String keyword = req.getParameter("keyword");
            List<CommodityVO> commodityVOS = service.findByNameKeyword(keyword);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}

