package com.cha102.diyla.back.controller.mem;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.member.MemJPADAO;
import com.cha102.diyla.member.MemSpringService;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class MemController {

    @Autowired
    private MemSpringService memSpringService;

    @Autowired
    MemJPADAO memJPADAO;



    @GetMapping("/getAllMemList")
    public String getAllMemList(@RequestBody String memData) {
        JSONObject jsonObject = JSONObject.parseObject(memData);
        return memSpringService.getAllMemList(jsonObject);
    }

// TODO 是否要設置更新會員黑名單狀態待確認 MemSpringService、Impl未完成

}
