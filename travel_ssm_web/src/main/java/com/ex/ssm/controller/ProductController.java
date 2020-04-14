package com.ex.ssm.controller;

import com.ex.ssm.domain.Product;
import com.ex.ssm.service.IProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    IProductService productService;

    //查询全部产品信息
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "size",defaultValue = "5") Integer size){
        ModelAndView mv=new ModelAndView();
        List<Product> products = productService.findAll(page,size);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        mv.addObject("pageInfo",pageInfo);
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

    //一次删除多个产品
    @RequestMapping("/deleteManyProducts.do")
    public String deleteManyProducts(@RequestParam("checkItemTd") String[] productIds){
        productService.deleteManyProducts(productIds);
        return "redirect:findAll.do";
    }

    //删除指定产品
    @RequestMapping("/deleteOneProduct.do")
    public String deleteOneProduct(@RequestParam("id") String id){
        productService.deleteOneProduct(id);
        return "redirect:findAll.do";
    }

    //携带该产品信息跳转到product_edit.jsp
    @RequestMapping("/toPage_ProductEdit.do")
    public ModelAndView toPage_ProductEdit(@RequestParam("id") String id){//EditProductInfo
        ModelAndView mv=new ModelAndView();
        Product product = productService.selectById(id);
        mv.addObject("product",product);
        mv.setViewName("product_edit");
        return mv;
    }

    //修改该产品数据
    @RequestMapping("/updateProductInfo.do")
    public String updateProductInfo(Product product){
        productService.updateProductInfo(product);
        return "redirect:findAll.do";
    }



}
