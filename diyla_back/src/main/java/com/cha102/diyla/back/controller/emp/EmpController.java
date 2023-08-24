package com.cha102.diyla.back.controller.emp;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.empmodel.EmpJPADAO;
import com.cha102.diyla.empmodel.EmpSpringService;
import com.cha102.diyla.empmodel.EmpVO;
import netscape.javascript.JSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController //可以直接返回JSON格式 也是component的一種
public class EmpController {

//  注入Service介面後可以多型同時降低耦合性
//  介面被入Autowired時,有實作該介面的類別其方法都可以被呼叫
    @Autowired
    private EmpSpringService empSpringService;
    @Autowired
    private EmpJPADAO empJPADAO;

//    限定用post方法映射到指定URL做請求 ,以處理網頁請求和回應
    @PostMapping("/emp/getAllEmpList") // 等同於@webServlet = doPost
// 將請求(?後的Key Value)放入BODY裡面 , 不過因為前端fetch是傳入JSONString 所以要用String接
//  在將data轉型成JSONObject
    public String getAllEmpList(@RequestBody String data){
        JSONObject jsonObject = JSONObject.parseObject(data);
       return empSpringService.getAllEmp(jsonObject);
    }
//  示範用SpringDataJPA 取得資料
//  findAll方法即為
    @GetMapping("/emp/test")
    public List<EmpVO> getAllEmp(){
        List<EmpVO> all = empJPADAO.findAll();
        return all;
    }
}
