package com.cha102.filter;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;
import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpService;
import com.cha102.diyla.empmodel.EmpVO;
import com.cha102.diyla.util.SHAEncodeUtil;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ObjectUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@WebFilter("/emp/empInsert")
public class EmpPasswordFilter implements Filter {
    private EmpService empService = new EmpService();

    @Value("setSalt")
    private String setSalt;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        byte[] setSaltArr = setSalt.getBytes();
        String empPassword = request.getParameter("empPassword");
        Map<String, String> errorMsgMap = new ConcurrentHashMap<>();
        if (ObjectUtils.isEmpty(empPassword)) {
            errorMsgMap.put("empPassword", "請輸入管理員密碼");
            request.setAttribute("errorMsgMap", errorMsgMap);
            //  英數字混合 符合6~12碼
        } else {
            empPassword = empPassword.trim();
            if (empPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,12}$")) {
            } else {
                errorMsgMap.put("empPassword", "請輸入6-12碼英數字混合密碼");
                request.setAttribute("errorMsgMap", errorMsgMap);
            }
        }
        String encodeEmpPassword = SHAEncodeUtil.hashPassword(empPassword, setSaltArr);
        request.setAttribute("empPassword", encodeEmpPassword);
        filterChain.doFilter(request, servletResponse);
    }
}
