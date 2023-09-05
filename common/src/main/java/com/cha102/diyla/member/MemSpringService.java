package com.cha102.diyla.member;

import com.alibaba.fastjson.JSONObject;
public interface MemSpringService {


    String getAllMem(JSONObject jsonObject);

    String changeMemStatus(JSONObject jsonObject);

}

