package com.ex.ssm.controller;

import com.ex.ssm.domain.SysLog;
import com.ex.ssm.service.ISysLogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {
    @Autowired
    ISysLogService sysLogService;

    //查询所有日志
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam("page") Integer page,@RequestParam("size") Integer size){
        ModelAndView mv=new ModelAndView();
        List<SysLog> sysLogs = sysLogService.findAll(page,size);
        PageInfo<SysLog> pageInfo = new PageInfo<>(sysLogs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog_list");
        return mv;
    }
}
