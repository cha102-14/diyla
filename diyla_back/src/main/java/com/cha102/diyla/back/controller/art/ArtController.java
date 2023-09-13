package com.cha102.diyla.back.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articleModel.ArtVO;
import com.cha102.diyla.tokenModel.TokenService;
import redis.clients.jedis.Jedis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
//            //新增個人通知
//            NoticeService noticeService = new NoticeService();
//            NoticeVO noticeVO = new NoticeVO();
//            noticeVO.setNoticeTitle("因您發表的文章文情並茂妙筆生花百看不厭，獲得了代幣！恭喜恭喜！！！");
//            noticeVO.setMemId(memid);
//            noticeService.addNotice(noticeVO);
//            //存入redis
//            JedisNotice.setJedisNotice(memid,"addToken");
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

        if ("selectAll".equals(action)) {
            Jedis jedis = new Jedis("localhost", 6379);
            ArtService artSvc = new ArtService();
            List<ArtVO> list = artSvc.getAllArt();

            for (ArtVO artVO : list) {
                int i = artVO.getArtNo();
                String key = "art:" + i;
            }

            req.setAttribute("list", list);
            jedis.close();

            String url = "/art/artall.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
    }
}
