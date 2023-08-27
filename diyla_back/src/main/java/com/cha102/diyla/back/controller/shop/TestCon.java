package com.cha102.diyla.back.controller.shop;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/shop")
public class TestCon {

    @RequestMapping("/test")
    public String test() {
        return "我在";
    }
}
