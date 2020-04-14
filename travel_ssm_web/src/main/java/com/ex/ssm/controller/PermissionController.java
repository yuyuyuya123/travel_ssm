package com.ex.ssm.controller;

import com.ex.ssm.domain.Permission;
import com.ex.ssm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;

    //查询所有角色，展示在角色管理页面
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Permission> all = permissionService.findAll();
        mv.addObject("permissionList",all);
        mv.setViewName("permission_list");
        return mv;
    }

    //页面跳转：permission_add.jsp
    @RequestMapping("/toPage_PermissionAdd.do")
    public String toPage_PermissionAdd(){return "permission_add";}

    //添加一个角色
    @RequestMapping("/insertOnePermission.do")
    public String insertOnePermission(Permission permission){
        permissionService.insertOnePermission(permission);
        return "redirect:findAll.do";
    }

    //根据权限ID查找详细信息
    @RequestMapping("/selectById.do")
    public ModelAndView selectById(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
        Permission permission = permissionService.selectById(id);
        mv.addObject("permission",permission);
        mv.setViewName("permission_show");
        return mv;
    }

    //删除一个权限
    @RequestMapping("/deleteOnePermission.do")
    public String deleteOnePermission(@RequestParam("id") String id){
        permissionService.deleteOnePermission(id);
        return "redirect:findAll.do";
    }



}
