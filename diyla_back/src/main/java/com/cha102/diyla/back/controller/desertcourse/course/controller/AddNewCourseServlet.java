package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassINGVO;
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
import java.util.HashSet;
import java.util.Set;

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
        //宣告用的到的service和變數
        ClassService classService = new ClassService();
        ClassVO classVO = new ClassVO();

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
        // 確認報名時間不能早於報名截止時間
        if (courseDate.before(regEndDate)) {
            errorMessage.put("errorMessage", "報名截止日期不可晚於課程日期。");
        }
        // 取得表單傳遞的食材資料陣列
        String[] ingredientTypes = req.getParameterValues("ingredientType[]");
        String[] ingredientQuantities = req.getParameterValues("ingredientQuantity[]");
        Integer[] courseIngIdList = new Integer[ingredientTypes.length];
        Integer[] courseIngQuantitiesList = new Integer[ingredientQuantities.length];
        for(int i = 0; i < courseIngIdList.length; i++) {
            courseIngIdList[i] = Integer.parseInt(ingredientTypes[i]);
            courseIngQuantitiesList[i] = Integer.parseInt(ingredientQuantities[i]);
        }
        Set<Integer> seen = new HashSet<>();
        //檢查是否選到重覆的食材
        for (Integer courseId : courseIngIdList) {
            // courseId已存在seen的話,以下判斷就會為true
            if (seen.contains(courseId)) {
                errorMessage.put("errorMessage", "食材項目不可重複!");
                break;
            } else {
                seen.add(courseId);
            }
        }
        //用service加入課程
        if (errorMessage.isEmpty()) {
            try {
                int newCourseId = classService.addClass(category, teacherId, regEndDate, courseDate, courseSeq, coursePic, limit, price, intro, courseName, 0, 0).getClassId();
                // 檢查回傳食材是否為空。
                if (ingredientTypes != null && ingredientQuantities != null &&
                        ingredientTypes.length == ingredientQuantities.length) {
                    for (int i = 0; i < ingredientTypes.length; i++) {
                        //產生對應的classingVO來存放課程食材資訊
                        ClassINGVO classINGVO = new ClassINGVO();
                        Integer ingredientType = Integer.parseInt(ingredientTypes[i]);
                        Integer ingredientQuantity = Integer.parseInt(ingredientQuantities[i]);
                        // 在這裡進行相應的處理，例如存入 List 或其他資料結構中,最後再放進資料庫
                        classService.addClassING(newCourseId, ingredientType, ingredientQuantity);
                    }
                }
            } catch (RuntimeException re) {
                re.printStackTrace();
                errorMessage.put("errorMessage", re.getMessage());
            } catch (Exception e) {
                errorMessage.put("errorMessage", "創建課程失敗，請再試一次");
            }
        }
        out.print(errorMessage);
        out.flush();

    }
}
