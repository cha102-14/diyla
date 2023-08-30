package com.cha102.diyla.member;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemSpringServiceImpl implements MemSpringService {

    @Autowired
    private  MemJPADAO memJPADAO;

    @Override
    public String getAllMemList(JSONObject jsonObject) {
        int pageIndex = jsonObject.getIntValue("pageIndex");
        int pageSize = jsonObject.getIntValue("pageSize");
        return null;
    }
}
