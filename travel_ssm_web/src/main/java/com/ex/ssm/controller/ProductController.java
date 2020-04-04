package com.ex.ssm.controller;

import com.ex.ssm.domain.Product;
import com.ex.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    IProductService productService;

    //查询全部产品信息
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<Product> products = productService.findAll();
        mv.addObject("productList",products);
        mv.setViewName("product_list");
        return mv;
    }

    //产品添加
    @RequestMapping("/insertOneProduct.do")
    public String insertOneProduct(Product product){
        productService.insertOneProduct(product);
        return "redirect:findAll.do";
    }

    //WEB-INF下的目录跳转：/WEB-INF/pages/product_add.jsp
    @RequestMapping("/toPage_ProductAdd.do")
    public String toPage_ProductAdd(){
        return "product_add";
    }



}
