package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import com.cha102.diyla.sweetclass.teaModel.TeacherService;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.*;

@MultipartConfig(
        fileSizeThreshold = 1024 * 10,  // 10 KB
        maxFileSize = 1024 * 300,       // 300 KB
        maxRequestSize = 1024 * 1024    // 1 MB
)
@WebServlet("/modifyCourse")
public class ModifyCourseServlet extends HttpServlet {
    // 開始做圖片相關的處理
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        //處理response相關
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        //宣告會用到的course相關的變數
        ClassVO classVO = new ClassVO();
        ClassService classService = new ClassService();
        List<String> errorMessage = new ArrayList<>();
        Gson gson = new Gson();
        TeacherService teacherService = new TeacherService();
        Integer updateCode = null;
        //驗證修改的師傅id是存在的
        Integer modifyTeacherId = Integer.parseInt(req.getParameter("teacherId").trim());
        if (!teacherService.verifyTeacherId(modifyTeacherId)) {
            updateCode = 0;
            errorMessage.add("修改的師傅ID不存在。");
        }
        //驗證是否有資格修改課程
//        String typeFun = (String) session.getAttribute("typeFun");
//        Integer empId = (Integer) session.getAttribute("empId");
        //前端參數接收
        Integer modifyCourseId = Integer.valueOf(req.getParameter("modifyCourseId").trim());
        String courseName = req.getParameter("courseName").trim();
        java.sql.Date courseDate = Date.valueOf(req.getParameter("courseDate").trim());
        Integer courseSeq = Integer.parseInt(req.getParameter("courseSeq").trim());
        java.sql.Date regEndDate = Date.valueOf(req.getParameter("regEndDate").trim());
        Integer category = Integer.parseInt(req.getParameter("category").trim());
        String intro = req.getParameter("courseIntro").trim();
        Integer limit = Integer.parseInt(req.getParameter("courseLimit").trim());
        Integer price = Integer.parseInt(req.getParameter("price").trim());
        // 確認報名時間不能早於報名截止時間
        if (courseDate.before(regEndDate)) {
            errorMessage.add("報名截止日期不可晚於課程日期。");
        }
        // 確認修改後的limit不可小於目前的headcount!
        classVO = classService.getOneClass(modifyCourseId);
        if (limit < classVO.getHeadcount()) {
            errorMessage.add("不可將人數上限調低於目前報名人數!");
        }

        //圖片處理
        byte[] coursePic = null;
        InputStream in = null;
        String defaultCoursePic = req.getParameter("defaultCoursePic");
        if (!defaultCoursePic.isEmpty()) {
            String Base64CoursePic = req.getParameter("defaultCoursePic");
            coursePic = Base64.getDecoder().decode(Base64CoursePic);
        } else {
            try {
                in = req.getPart("coursePic").getInputStream();
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            if (in.available() != 0) {
                coursePic = new byte[in.available()];
                in.read(coursePic);
                in.close();
            }
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
        // 需要比較idList內是否有一樣類型的材料

        //  Set 儲存遇到的數字
        Set<Integer> seen = new HashSet<>();
        for (Integer courseId : courseIngIdList) {
            // courseId已存在seen的話,以下判斷就會為true
            if (seen.contains(courseId)) {
                errorMessage.add("食材項目不可重複!");
                break;
            } else {
                seen.add(courseId);
            }
        }
        if (errorMessage.isEmpty()) {
            try {
                //更新課程資料
                classService.updateClass(modifyCourseId, category, modifyTeacherId, regEndDate, courseDate, courseSeq, coursePic, limit, price, intro, courseName);
                //更新資料庫內的食材
                classService.updateClassING(modifyCourseId, courseIngIdList, courseIngQuantitiesList);
            } catch (RuntimeException re) {
                errorMessage.add(re.getMessage());
            }
        }
        String errorMessageJson = gson.toJson(errorMessage);
        out.print(errorMessageJson);
        out.flush();
    }

}
