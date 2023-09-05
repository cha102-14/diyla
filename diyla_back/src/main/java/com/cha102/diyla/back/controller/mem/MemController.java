package com.cha102.diyla.back.controller.mem;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.member.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mem")
public class MemController {

    @Autowired
    private MemSpringService memSpringService;

    @Autowired
    private MemJPADAO memJPADAO;


    @PostMapping("/getAllMemList")
    public String getAllMemList(@RequestBody String memData) {
        JSONObject jsonObject = JSONObject.parseObject(memData);
        return memSpringService.getAllMem(jsonObject);
    }

    @PostMapping("/changeMemStatus")
    public String limitMemArt(@RequestBody String memArtStatus) {
        JSONObject jsonObject = JSONObject.parseObject(memArtStatus);
        return memSpringService.changeMemStatus(jsonObject);
    }

//    @GetMapping("/searchMemEmail")
//    public String searchMemEmail (@RequestParam("memEmail") String returnMem){
//        JSONObject jsonObject = JSONObject.parseObject(returnMem);
//        return memSpringService.returnMemInformation(jsonObject);
//    }
}
