package com.example.travelsystem.servlet;

import com.example.travelsystem.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @Autowired
    TestService testService;

    @GetMapping("/test")
    public String test() {
        testService.test();
        return "testJSP";
    }
}
