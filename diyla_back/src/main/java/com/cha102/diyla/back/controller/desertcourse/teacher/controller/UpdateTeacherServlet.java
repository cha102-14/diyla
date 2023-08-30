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
import java.util.Base64;

@MultipartConfig(
        fileSizeThreshold = 1024 * 10,  // 10 KB
        maxFileSize = 1024 * 300,       // 300 KB
        maxRequestSize = 1024 * 1024    // 1 MB
)

@WebServlet("/updateTeacher")
public class UpdateTeacherServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //處理response相關
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        // EmpVO empVO = (EmpVO)session.getAttribute("empVO");
        //宣告會用到的Teacher相關Service和變數
        TeacherVO updatedTeacherVO = new TeacherVO();
        TeacherService teacherService = new TeacherService();
        Integer modifyTeacherId = Integer.parseInt(req.getParameter("teacherId"));
        Integer updateCode = null;
        // 創建回傳的json,放入success: 1or0 代表註冊成功或失敗
        StringBuilder errorMessage = new StringBuilder();
        JSONObject jsonObject = new JSONObject();
        //判斷要修改的師傅ID是否存在
        if (!teacherService.verifyTeacherId(modifyTeacherId)) {
            updateCode = 0;
            errorMessage.append("修改的師傅ID不存在。");
        }
        //判斷是否admin
        //session.getAttribute("adminAuthCode");
        int adminAuthCode = 1;

        //接受前端參數,前端已做格式檢查, 修改時empId不會改變
        //Integer empId = empVO.getEmpId();
        Integer empId = teacherService.getOneTeacher(modifyTeacherId).getEmpId();
        String teaName = null;
        //確認是否為admin,是的話才接受teacherName的參數,否的話代表是老師,teaName只能接受自己的名字
        if (adminAuthCode == 1) {
            teaName = req.getParameter("teacherName");
        } else {
            //String teaName = empVO.getEmpName();
            teaName = req.getParameter("teacherName");
        }
        Integer gender = Integer.parseInt(req.getParameter("teaGender"));
        String phone = req.getParameter("teaPhone");
        String[] specialities = req.getParameterValues("speciality");
        String teaIntro = req.getParameter("teaIntro");
        String teaEmail = req.getParameter("teaEmail");
        // 開始做圖片相關的處理
        byte[] teaPic = null;
        String defaultTeaPic = req.getParameter("defaultTeaPic");
        if(!defaultTeaPic.isEmpty()) {
            String Base64TeaPic = req.getParameter("defaultTeaPic");
            teaPic = Base64.getDecoder().decode(Base64TeaPic);
        } else {
            InputStream in = null;
            try {
                in = req.getPart("teaPic").getInputStream();
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            if (in.available() != 0) {
                teaPic = new byte[in.available()];
                in.read(teaPic);
                in.close();
            } else {
                updateCode = 0;
                errorMessage.append("未上傳師傅圖片!");
            }
        }
        //開始將form取得的資料放進teacher和speciality資料庫
        try {
            //更新老師的資料
            teacherService.updateTeacher(modifyTeacherId,empId, teaName, gender, phone, teaIntro, teaPic, teaEmail, 0 );
            //專長的部分需先將老師專長資料庫內該老師的所有專長刪除掉
            teacherService.delTeaSpeciality(modifyTeacherId);
            //再開始執行將專長放進師傅專長表格的動作
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
                teacherService.addTeaSpeciality(modifyTeacherId,speIDArray[i]);
            }
        } catch (RuntimeException re) {
            updateCode = 0;
            //若前方沒有其他errorMessage,才將通用的錯誤訊息放入
            if(errorMessage.equals("")) {
                errorMessage.append("修改師傅時發生錯誤，請再嘗試");
            }
            re.printStackTrace();
        }
        //若前面都沒發生錯誤, updateCode會是null, 將其指定為1
        if(updateCode == null) {
            updateCode = 1;
        }
        if(updateCode == 1){
            jsonObject.put("isSuccessful", true);
            jsonObject.put("teacherId", modifyTeacherId);
            jsonObject.put("errorMessage", "修改成功");
        } else {
            jsonObject.put("isSuccessful", false);
            jsonObject.put("errorMessage", errorMessage);
        }
        out.print(jsonObject);
        out.flush();

    }
}

