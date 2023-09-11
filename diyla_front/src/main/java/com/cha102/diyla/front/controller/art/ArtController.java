package com.cha102.diyla.front.controller.art;

import com.cha102.diyla.articleModel.ArtService;
import com.cha102.diyla.articleModel.ArtVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.io.IOException;
import java.io.InputStream;
import java.util.Set;

@WebServlet("/art/ArtController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class ArtController extends HttpServlet {
    private static Byte NOSEND_NOSHOW = 0;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();


        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("art_insert".equals(action)) {

            String artTitle = req.getParameter("artTitle");
            String artContext = req.getParameter("artContext");
            Integer memId = Integer.valueOf(req.getParameter("memId"));
            Part artPicPart = req.getPart("artPic");
            InputStream ips = artPicPart.getInputStream();
            byte[] buffer = ips.readAllBytes();
            ArtVO artVO = new ArtVO();
            artVO.setArtTitle(artTitle);
            artVO.setArtContext(artContext);

            Set<ConstraintViolation<ArtVO>> error = validator.validate(artVO);
            if (!error.isEmpty()) {
                req.setAttribute("ErrorMessage", error);
                req.getRequestDispatcher("/art/addart.jsp").forward(req, res);
                return;
            }

            ArtService artSvc = new ArtService();
            if (buffer.length > 0) {
                artSvc.addArtAndPic(artTitle, artContext, memId, buffer);
            } else {
                artSvc.addArt(artTitle, artContext, memId);
            }

            String url = "/art/art.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("delete_Art".equals(action)) {
            ArtService artSvc = new ArtService();
            artSvc.deleteArt(Integer.valueOf(req.getParameter("artNo")));

            String url = "/art/personalart.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("update_start".equals(action)) {
            ArtService artSvc = new ArtService();
            ArtVO artVO = artSvc.getArtByArtNo(Integer.valueOf(req.getParameter("artNo")));
            req.setAttribute("artVO", artVO);

            String url = "/art/editart.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("update_art".equals(action)) {
            String artTitle = req.getParameter("artTitle");
            String artContext = req.getParameter("artContext");
            Integer memId = Integer.valueOf(req.getParameter("memId"));
            Integer artNo = Integer.valueOf(req.getParameter("artNo"));
            byte artStatus = NOSEND_NOSHOW;
            Part artPicPart = req.getPart("artPic");
            InputStream ips = artPicPart.getInputStream();
            byte[] buffer = ips.readAllBytes();
            ArtVO artVO = new ArtVO();
            artVO.setArtTitle(artTitle);
            artVO.setArtContext(artContext);

            Set<ConstraintViolation<ArtVO>> error = validator.validate(artVO);
            if (!error.isEmpty()) {
                req.setAttribute("ErrorMessage", error);
                req.getRequestDispatcher("/art/editart.jsp").forward(req, res);
                return;
            }

            ArtService artSvc = new ArtService();
            if (buffer.length > 0) {
                artSvc.updateArtAndPic(artNo, artTitle, buffer, artContext, artStatus);
            } else {
                artSvc.updateArt(artNo, artTitle, artContext, artStatus);
            }

            String url = "/art/personalart.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
    }
}
