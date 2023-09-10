package com.cha102.diyla.back.controller.desertcourse.teacher.controller;

import com.cha102.diyla.sweetclass.teaModel.TeacherService;
import com.cha102.diyla.sweetclass.teaModel.TeacherVO;
import org.json.JSONObject;

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

@MultipartConfig(
        fileSizeThreshold = 1024 * 10,  // 10 KB
        maxFileSize = 1024 * 300,       // 300 KB
        maxRequestSize = 1024 * 1024    // 1 MB
)

@WebServlet("/registerTeacher")
public class RegisterTeacherServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //處理response相關
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        // EmpVO empVO = (EmpVO)session.getAttribute("empVO");
        //宣告會用到的Teacher相關Service
        TeacherVO teacherVO = new TeacherVO();
        TeacherService teacherService = new TeacherService();
        // 創建回傳的json,放入success: 1or0 代表註冊成功或失敗
        StringBuilder errorMessage = new StringBuilder();
        JSONObject jsonObject = new JSONObject();
        Integer registerCode = null;

        //接受前端參數,前端已做圖片以外的格式檢查
        Integer empId = (Integer) session.getAttribute("empId");
        String teaName = req.getParameter("teacherName");

        Integer gender = Integer.parseInt(req.getParameter("teagender"));
        String phone = req.getParameter("teaPhone");
        String[] specialities = req.getParameterValues("speciality");
        String teaIntro = req.getParameter("teaIntro");
        String teaEmail = req.getParameter("teaEmail");
        //前端回傳圖片處理
        // 開始做圖片相關的處理
        InputStream in = null;
        try {
            in = req.getPart("teaPic").getInputStream();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
        byte[] teaPic = null;
        if(in.available() != 0) {
            teaPic = new byte[in.available()];
            in.read(teaPic);
            in.close();
        } else{
            registerCode = 0;
            errorMessage.append("未上傳師傅圖片!");
        }
        Integer newTeacherId = null;
        //開始將form取得的資料放進teacher和speciality資料庫
        try {
            //取得插入師傅的主鍵
            newTeacherId = teacherService.addTeacher(empId, teaName, gender, phone, teaIntro, teaPic, teaEmail, 0 );
            //將專長放進師傅專長表格
            Integer[] speIDArray = new Integer[specialities.length];
            for (int i = 0; i < specialities.length; i++) {
                try{
                    teacherService.addSpeciality(specialities[i]);
                    speIDArray[i] = teacherService.getOneSpecialityID(specialities[i]);
                } catch(RuntimeException re) {
                    if(re.getMessage() == "UKerror") {
                        speIDArray[i] = teacherService.getOneSpecialityID(specialities[i]);
                    }
                }
            }
            for(int i = 0; i < speIDArray.length; i++) {
                teacherService.addTeaSpeciality(newTeacherId,speIDArray[i]);
            }
        } catch (RuntimeException re) {
            registerCode = 0;
            errorMessage.append("新增師傅時發生錯誤，請再嘗試");
            re.printStackTrace();
        }
        if(registerCode == null) {
            registerCode = 1;
        }
        if(registerCode == 1){
           jsonObject.put("isSuccessful", true);
           jsonObject.put("teacherName", teaName);
           jsonObject.put("errorMessage", "註冊成功");
        } else {
            jsonObject.put("isSuccessful", false);
            jsonObject.put("errorMessage", errorMessage);
        }
        out.print(jsonObject);
        out.flush();

    }
    }

