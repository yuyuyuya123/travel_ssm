package com.ex.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class indexController {

    //跳转到主页
    @RequestMapping("/toPage_Index.do")
    public String toPage_Index(){ return "index"; }

}
