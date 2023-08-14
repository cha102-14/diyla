package com.cha102.diyla.back.controller.pbm;

import com.cha102.diyla.commonproblemmodel.PbmService;
import com.cha102.diyla.commonproblemmodel.PbmVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/pbm/PbmController")
public class PbmController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("getOne_For_Display".equals(action)) {

            //***************************2.開始查詢資料*****************************************/
            PbmService pbmSvc = new PbmService();
            PbmVO pbmVO = pbmSvc.getOnePbm(Integer.valueOf(req.getParameter("pbmNo")));

            req.setAttribute("pbmVO", pbmVO);

            String url = "/pbm/pbmgetbyid.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("delete_pbm".equals(action)) {

            //***************************2.開始查詢資料*****************************************/
            PbmService pbmSvc = new PbmService();
            pbmSvc.deletePbm(Integer.valueOf(req.getParameter("pbmNo")));



            String url = "/pbm/pbmall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("update_start".equals(action)) {
            PbmService pbmSvc = new PbmService();
            PbmVO pbmVO = pbmSvc.getOnePbm(Integer.valueOf(req.getParameter("pbmNo")));
            req.setAttribute("pbmVO", pbmVO);


            String url = "/pbm/editpbm.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if("update_pbm".equals(action)){
            PbmService pbmSvc = new PbmService();

            int pbmNo = Integer.valueOf(req.getParameter("pbmNo"));
            String pbmTitle = req.getParameter("pbmTitle");
            String pbmContext = req.getParameter("pbmContext");
            Byte pbmSort = Byte.valueOf(req.getParameter("pbmSort"));

            PbmVO pbmVO = new PbmVO();
            pbmVO.setPbmNo(pbmNo);
            pbmVO.setPbmTitle(pbmTitle);
            pbmVO.setPbmContext(pbmContext);
            pbmVO.setPbmSort(pbmSort);

            pbmSvc.updatePbm(pbmVO);

            String url = "/pbm/pbmall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if("pbm_insert".equals(action)){

            Byte pbmSort = Byte.valueOf(req.getParameter("pbmSort"));
            String pbmTitle = req.getParameter("pbmTitle");
            String pbmContext = req.getParameter("pbmContext");

            PbmVO pbmVO = new PbmVO();
            pbmVO.setPbmSort(pbmSort);
            pbmVO.setPbmTitle(pbmTitle);
            pbmVO.setPbmContext(pbmContext);

            PbmService pbmSvc = new PbmService();
            PbmVO addpbm = pbmSvc.addPbm(pbmVO);
            req.setAttribute("addpbm", addpbm);

            String url = "/pbm/addsuccess.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
    }
}
