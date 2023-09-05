package com.cha102.diyla.back.controller;


import com.cha102.diyla.IatestnewsModel.LatService;
import com.cha102.diyla.IatestnewsModel.LatestnewsVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/latestnews/latServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class latServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        //單筆查詢
        if ("getOne_For_Display".equals(action)) {

            LatService latSvc = new LatService();
            LatestnewsVO latVO = latSvc.getOneLat(Integer.valueOf(req.getParameter("newsNO")));

            req.setAttribute("latVO", latVO);

            String url = "/latestnews/listbyID.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //刪除公告
        if ("delete_latnews".equals(action)) {
            LatService latSvc = new LatService();
            String newsNo = req.getParameter("newsNo");
            latSvc.deleteLat(Integer.valueOf(newsNo));

            String url = "/latestnews/latall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //修改觸發
        if ("update_start".equals(action)) {
            LatService latSvc = new LatService();
            LatestnewsVO latVO = latSvc.getOneLat(Integer.valueOf(req.getParameter("newsNo")));
            req.setAttribute("latVO", latVO);


            String url = "/latestnews/editlat.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //修改公告
        if ("update_latnews".equals(action)) {
            LatService latSvc = new LatService();

            int newsNo = Integer.valueOf(req.getParameter("newsNo"));
            String newsContext = req.getParameter("newsContext");
            Byte annStatus = Byte.valueOf(req.getParameter("annStatus"));
            Part annPicPart = req.getPart("annPic");
            InputStream ips = annPicPart.getInputStream();
            byte[] buffer = ips.readAllBytes();

            LatestnewsVO latVO = new LatestnewsVO();
            latVO.setNewsContext(newsContext);
            latVO.setAnnStatus(annStatus);
            latVO.setAnnPic(buffer);
            latVO.setNewsNo(newsNo);


            latSvc.updateLat(latVO);

            ips.close();
            String url = "/latestnews/latall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //新增公告
        if ("lat_insert".equals(action)) {

            String newsContext = req.getParameter("newsContext");
            if (newsContext == null || newsContext.trim().length() == 0) {

            } else {

            }
            Byte annStatus = Byte.valueOf(req.getParameter("annStatus"));
            try {
                Part annPicPart = req.getPart("annPic");
                InputStream ips = annPicPart.getInputStream();
                byte[] buffer = ips.readAllBytes();

                LatestnewsVO latVO = new LatestnewsVO();
                latVO.setNewsContext(newsContext);
                latVO.setAnnStatus(annStatus);
                latVO.setAnnPic(buffer);

                LatService latSvc = new LatService();
                LatestnewsVO addedLat = latSvc.addLat(latVO);
                req.setAttribute("addedLat", addedLat);

                ips.close();
                String url = "/latestnews/addsuccess.jsp";
                RequestDispatcher successView = req.getRequestDispatcher(url);
                successView.forward(req, res);
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
    }
}
