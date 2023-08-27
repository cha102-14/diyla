package com.cha102.diyla.empmodel;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.enums.AuthFunEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Filter;
import java.util.stream.Collectors;

@Service
public class EmpSpringServiceImpl implements EmpSpringService {

    @Autowired
    private EmpJPADAO empJPADAO;

    @Override
    public String getAllEmp(JSONObject jsonObject) {
        int pageIndex = jsonObject.getIntValue("pageIndex");
        int pageSize = jsonObject.getIntValue("pageSize");
//      前端傳入值 pageIndex 1 , pageSize 10 第一頁取10筆, 第二頁為 10 * (2-1),10...
        List<Object[]> allEmpObjArr = empJPADAO.getAllEmp(pageSize * (pageIndex - 1), pageSize);
//      將ObjectArr 透過stream流轉換成 stream<ObjectArr> 透過map方法做轉換-> stream<EmpDTO>,
        List<EmpDTO> empDTOList = allEmpObjArr.stream().map(EmpDTO::new)
//      stream<EmpDTO>在此處代名詞為 o (隨便取都行),o先拿著自己的TypeFun英文傳入參數去調用AuthFunEnum方法
//      拿到TypeFunChinese 再返回 o , 此時stream<EmpDTO> 裡的英文已透過setTypeFun換成中文,但TypeFun的Key不變,可以透過map去做一些操作
                .map(o ->
                        {
                            o.setTypeFun(AuthFunEnum.getTypeFunChinese(o.getTypeFun()));
                            return o;
                        }
                )
                .collect(Collectors.toList());
        Integer allEmpCount = empJPADAO.getAllEmpCount();
//      JSONObject 也是用put放入資料
//    TODO優化   正確做法為寫一個VO裝取資料,報錯時才知道是哪一欄位出問題,若使用JSONObject Key就是字串不好除錯
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("totalSize", allEmpCount);
        returnJSONObject.put("empList", empDTOList);
        return JSONObject.toJSONString(returnJSONObject);
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("1");
        list.add("5");
        list.add("2");
        list.add("3");
//      在每一個參數中放入, 形成字串
        String s = list.stream().collect(Collectors.joining(","));
        System.out.println(s);
//        filter = 過濾器,留下我要的資料類型去記,最後轉成List 印出 , List印出就會有[] 非陣列
        List<String> collect = list.stream().filter(o -> !o.equalsIgnoreCase("1")).collect(Collectors.toList());
        System.out.println(collect);
    }
}
