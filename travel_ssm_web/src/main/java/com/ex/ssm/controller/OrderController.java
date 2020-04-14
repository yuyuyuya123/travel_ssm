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

    //查找所有订单
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "size",defaultValue = "5") Integer size){
        ModelAndView mv=new ModelAndView();
        List<Order> all = orderService.findAll(page,size);
        PageInfo<Order> pageInfo = new PageInfo<>(all);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("order_list");
        return mv;
    }

    //根据 订单Id 查找订单，并将数据携带到order_show.jsp页面，用于查询订单详情
    @RequestMapping("/selectById")
    public ModelAndView selectById(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
        Order order = orderService.selectById(id);
        mv.addObject("order",order);
        mv.setViewName("order_show");
        return mv;
    }

    //携带该订单的数据跳转到页面order_edit.jsp
    @RequestMapping("/toPage_OrderEdit.do")
    public ModelAndView toPage_OrderEdit(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
        Order order = orderService.selectById(id);
        mv.addObject("order",order);
        mv.setViewName("order_edit");
        return mv;
    }

    //修改订单的orderDesc，用于添加备注
    @RequestMapping("/addOrderDesc.do")
    public String addOrderDesc(@RequestParam("id") String id,@RequestParam("orderDesc") String orderDesc){
        orderService.addOrderDesc(id,orderDesc);
        return "redirect:findAll.do";
    }

    //删除一个订单
    @RequestMapping("/deleteOneOrder.do")
    public String deleteOneOrder(@RequestParam("id") String id){
        orderService.deleteOneOrder(id);
        return "redirect:findAll.do";
    }

    //删除多个订单
    @RequestMapping("/deleteManyOrders.do")
    public String deleteManyOrders(@RequestParam("checkItemTd") String[] orderIds){
        orderService.deleteManyOrders(orderIds);
        return "redirect:findAll.do";
    }

}
