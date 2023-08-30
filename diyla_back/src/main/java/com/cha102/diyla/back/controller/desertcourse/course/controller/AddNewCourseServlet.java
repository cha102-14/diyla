package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;

@MultipartConfig(
        fileSizeThreshold = 1024 * 10,  // 10 KB
        maxFileSize = 1024 * 300,       // 300 KB
        maxRequestSize = 1024 * 1024    // 1 MB
)
@WebServlet("/addNewCourse")
public class AddNewCourseServlet extends HttpServlet {
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws IOException {
        //處理response相關
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        //宣告用的到的service
        ClassService classService = new ClassService();
        ClassVO classVO = new ClassVO();
//        ClassINGVO classINGVO = new ClassINGVO();

        JSONObject errorMessage = new JSONObject();
        //前端已做輸入參數的驗證了，這邊只要取得前端傳來的參數即可
        Integer teacherId = Integer.parseInt(req.getParameter("teacherId").trim());
        String courseName = req.getParameter("courseName").trim();
        java.sql.Date courseDate = Date.valueOf(req.getParameter("courseDate").trim());
        Integer courseSeq = Integer.parseInt(req.getParameter("courseSeq").trim());
        java.sql.Date regEndDate = Date.valueOf(req.getParameter("regEndDate").trim());
        Integer category = Integer.parseInt(req.getParameter("category").trim());
        String intro = req.getParameter("courseIntro").trim();
        Integer limit = Integer.parseInt(req.getParameter("courseLimit").trim());
        Integer price = Integer.parseInt(req.getParameter("price").trim());
        // 開始做圖片相關的處理
        InputStream in = null;
        try {
            in = req.getPart("coursePic").getInputStream();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
        byte[] coursePic = null;
        if(in.available() != 0) {
            coursePic = new byte[in.available()];
            in.read(coursePic);
            in.close();
        }
//        else {
////            teacherService.getDefaultPic();
//        }
        // 取得表單傳遞的食材資料陣列
        String[] ingredientTypes = req.getParameterValues("ingredientType[]");
        System.out.println();
        String[] ingredientQuantities = req.getParameterValues("ingredientQuantity[]");

        // 檢查是否為空，並確認數量一致
        if (ingredientTypes != null && ingredientQuantities != null &&
                ingredientTypes.length == ingredientQuantities.length) {
            for (int i = 0; i < ingredientTypes.length; i++) {
                String ingredientType = ingredientTypes[i];
                String ingredientQuantity = ingredientQuantities[i];
                // 在這裡進行相應的處理，例如存入 List 或其他資料結構中
            }
        }
        //用service加入課程
            try {
                classService.addClass(category, teacherId, regEndDate, courseDate, courseSeq, coursePic, limit, price, intro, courseName, 0, 0);
            } catch (RuntimeException re) {
                errorMessage.put("errorMessage", re.getMessage());
            } catch (Exception e) {
                errorMessage.put("errorMessage", "創建課程失敗，請再試一次");
            }
        out.print(errorMessage);
        out.flush();

    }
}
