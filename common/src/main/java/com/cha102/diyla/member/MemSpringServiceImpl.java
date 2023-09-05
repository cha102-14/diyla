package com.cha102.diyla.member;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.empmodel.EmpDTO;
import com.cha102.diyla.enums.AuthFunEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemSpringServiceImpl implements MemSpringService {

    @Autowired
    private MemJPADAO memJPADAO;

    @Override
    public String getAllMem(JSONObject jsonObject) {
        int pageIndex = jsonObject.getIntValue("pageIndex");
        int pageSize = jsonObject.getIntValue("pageSize");
        String memEmail = jsonObject.getString("memEmail");
        List<Object[]> allMemObjArr = memJPADAO.getAllMem(pageSize * (pageIndex - 1), pageSize,memEmail);
        List<MemDTO> memDTOList = allMemObjArr.stream().map(MemDTO::new).collect(Collectors.toList());
        Integer allMemCount = memJPADAO.getMemListCount();
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("totalSize", allMemCount);
        returnJSONObject.put("memList", memDTOList);
        return JSONObject.toJSONString(returnJSONObject);
    }

    @Override
    public String changeMemStatus(JSONObject jsonObject) {
        int memId = jsonObject.getIntValue("memId");
        Boolean memStatus = jsonObject.getBooleanValue("memStatus");
        int changeMemArtStatus = memJPADAO.changeMemStatus(memId, jsonObject.getIntValue("memStatus"));
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("memStatus", memStatus);
        if (changeMemArtStatus > 0) {

            return JSONObject.toJSONString(returnJSONObject);
        } else {
            return "";
        }
    }

//    @Override
//    public String returnMemInformation(JSONObject jsonObject) {
//        String memEmail = jsonObject.getString("memEmail");
//        MemSpringVO memInformation = memJPADAO.returnMemInformation(memEmail);
//        return memInformation.toString();
//    }
}
