package com.ex.ssm.controller;

import com.ex.ssm.domain.Order;
import com.ex.ssm.service.IOrderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    IOrderService orderService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "size",defaultValue = "5") Integer size){
        ModelAndView mv=new ModelAndView();
        List<Order> all = orderService.findAll(page,size);
        PageInfo<Order> pageInfo = new PageInfo<Order>(all);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("order_list");
        return mv;
    }

    @RequestMapping("/selectById")
    public ModelAndView selectById(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
        Order order = orderService.selectById(id);
        mv.addObject("order",order);
        mv.setViewName("order_show");
        return mv;
    }


}
