package com.cha102.diyla.empmodel;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface EmpSpringService {

        String getAllEmp(JSONObject jsonObject);

        String changeEmpStatus(JSONObject jsonObject);

        void validEmpLogin(String empAccount, String empPassword, HttpServletRequest req, HttpServletResponse resp);

        void logout(String empId, HttpServletRequest req, HttpServletResponse resp);

        String compareEmpEmail(String empEmail,HttpServletRequest req, HttpServletResponse resp);

        void queryValidCodeResetPassword(String validCode,String doubleCheckPassword, HttpServletRequest req,HttpServletResponse resp);


}
