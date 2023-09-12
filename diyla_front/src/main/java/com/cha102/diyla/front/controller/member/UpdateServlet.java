package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.member.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/member/update")
public class UpdateServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        MemberService memSer = new MemberService();

        if("select".equals(action)){
            Integer memId = null;
            try{
                memId = Integer.valueOf(req.getParameter("memId"));
            }catch (NumberFormatException n){
                n.printStackTrace();
            }

            MemVO memVO = memSer.selectMem(memId);
            //將地址分成縣市區域和最後詳細地址
            Pattern p = Pattern.compile("(..[縣市])(.{1,3}[區鄉鎮市嶼])(.+)");
            Matcher m = p.matcher(memVO.getMemAddress());
            Map<String,String> addMap = new LinkedHashMap<>();

            while(m.find()){
                addMap.put("city",m.group(1));
                addMap.put("district",m.group(2));
                addMap.put(("address"),m.group(3));
            }

            req.setAttribute("memVO",memVO);
            req.setAttribute("addMap",addMap);
            RequestDispatcher select = req.getRequestDispatcher("/member/mem_update.jsp");
            select.forward(req,res);
        }


        if("update".equals(action)){
            Map<String,String> exMsgs = new LinkedHashMap<String,String>();
            Map<String,String> addMap = new LinkedHashMap<>();
            Map<String,String> success = new LinkedHashMap<String,String>();
            req.setAttribute("exMsgs",exMsgs);

            Integer memId = Integer.valueOf(req.getParameter("memId"));


            String name = req.getParameter("memName");
            String phone = req.getParameter("phone");
            String city = req.getParameter("city");
            String district = req.getParameter("district");
            String address = req.getParameter("address");
            String addressAll = city+district+address;
            String addReg = "^[\u4e00-\u9fa5\\w,]+$";
            if (!(address.matches(addReg))){
                exMsgs.put("memAddress","地址格式只能為中、英文字母、數字和,");
            }
            addMap.put("city",city);
            addMap.put("district",district);
            addMap.put(("address"),address);


            MemVO memVO = memSer.updateMem(exMsgs,name,phone,addressAll,memId);

            HttpSession session = req.getSession();
            session.setAttribute("memVO", memVO);
            req.setAttribute("addMap",addMap);
            if (memVO != null && exMsgs.isEmpty()){
                success.put("success","修改成功！");
                req.setAttribute("success",success);
            }

            RequestDispatcher select = req.getRequestDispatcher("/member/mem_update.jsp");
            select.forward(req,res);

        }

        //        修改密碼
        if ("updatePw".equals(action)) {
            String upemail = req.getParameter("upemail");
            String upPw = req.getParameter("upPw");
            String upPwcheck = req.getParameter("upPwcheck");
            Map<String,String> exMap = new LinkedHashMap<>();
            Map<String,String> successMap = new LinkedHashMap<>();

            String pwReg = "^\\w{6,12}$";
            if (upPw == null || (upPw.trim()).length()==0){
                exMap.put("password","請輸入密碼");
            } else if (!(upPw.matches(pwReg))){
                exMap.put("password","密碼格式錯誤，請重新輸入");
            }
            if (!upPwcheck.equals(upPw)){
                exMap.put("pwcheck","該密碼與您設定的密碼不一致");
            }
//             memVO =null;
            if(exMap.isEmpty()){
                MemVO memVO = memSer.updateNewPw(exMap,upPw,upemail);
                 successMap.put("successMap","修改成功！");
                 req.setAttribute("successMap",successMap);
            } else {
                req.setAttribute("exMap",exMap);
            }

//            req.setAttribute("memVO",memVO);
            RequestDispatcher failure = req.getRequestDispatcher("/member/updatePw.jsp");
            failure.forward(req, res);

        }


    }
}
