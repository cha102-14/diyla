package com.cha102.diyla.back.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.tokenModel.TokenService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/art/ArtController")
public class ArtController extends HttpServlet {
    private static Byte SENDCOIN = 1;
    private static Byte SHOW = 2;


    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("delete_art".equals(action)) {

            ArtService artSvc = new ArtService();
            artSvc.deleteArt(Integer.valueOf(req.getParameter("artNo")));

            String url = "/art/artnocheckall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("sendToken".equals((action))) {
            TokenService tokenSvc = new TokenService();
            ArtService artSvc = new ArtService();

            int artNo = Integer.parseInt(req.getParameter("artNo"));
            int tokenCount = Integer.parseInt(req.getParameter("tokenCount"));
            int memid = Integer.valueOf(req.getParameter("memId"));
            Byte getToken = Byte.valueOf(req.getParameter("getToken"));

            tokenSvc.addToken(tokenCount, getToken, memid);
            artSvc.updateArtStatus(SENDCOIN, artNo);

            String url = "/art/artnocheckall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("show_art".equals(action)) {

            int artNo = Integer.parseInt(req.getParameter("artNo"));

            ArtService artSvc = new ArtService();
            artSvc.updateArtStatus(SHOW, artNo);

            String url = "/art/artnocheckall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

    }
}
