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
import java.util.LinkedHashMap;
import java.util.Map;
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
            Pattern p = Pattern.compile("(..[縣市])(.{1,3}[區鄉鎮市嶼])(.+)");
            Matcher m = p.matcher(memVO.getMemAddress());
            Map<String,String> addMap = new LinkedHashMap<>();

            while(m.find()){
//                String city = m.group(1);
//                String distinct = m.group(2);
//                String address = m .group(3);
                addMap.put("city",m.group(1));
                addMap.put("district",m.group(2));
                addMap.put(("address"),m.group(3));
                System.out.println(m.group(1));
                System.out.println(m.group(2));
                System.out.println(m.group(3));
            }

            req.setAttribute("memVO",memVO);
            req.setAttribute("addMap",addMap);
            RequestDispatcher select = req.getRequestDispatcher("/member/mem_update.jsp");
            select.forward(req,res);
        }


        if("update".equals(action)){
            Map<String,String> exMsgs = new LinkedHashMap<String,String>();
            req.setAttribute("exMsgs",exMsgs);

            Integer memId = Integer.valueOf(req.getParameter("memId"));


            String name = req.getParameter("memName");
            String phone = req.getParameter("phone");
            String city = req.getParameter("city");
            String district = req.getParameter("district");
            String address = req.getParameter("address");
            String addressAll = city+district+address;


//            if (!password.equals(pwcheck)){
//                exMsgs.put("pwcheck","該密碼與您設定的密碼不一致");
//            }
            MemVO memVO = memSer.updateMem(exMsgs,name,phone,addressAll,memId);
            HttpSession session = req.getSession();
            session.setAttribute("memVO", memVO);
            RequestDispatcher select = req.getRequestDispatcher("/member/mem_update.jsp");
            select.forward(req,res);

        }



    }
}
