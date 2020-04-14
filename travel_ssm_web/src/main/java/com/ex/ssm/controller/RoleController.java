package com.ex.ssm.controller;

import com.ex.ssm.domain.Permission;
import com.ex.ssm.domain.Role;
import com.ex.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    IRoleService roleService;

    //查询所有角色，展示在角色管理页面
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Role> roles = roleService.findAll();
        mv.addObject("roleList",roles);
        mv.setViewName("role_list");
        return mv;
    }

    //页面跳转：role_sdd.jsp
    @RequestMapping("/toPage_RoleAdd.do")
    public String toPage_RoleAdd(){return "role_add";}

    //添加一个角色
    @RequestMapping("/insertOneRole.do")
    public String insertOneRole(Role role){
        roleService.insertOneRole(role);
        return "redirect:findAll.do";
    }

    //删除选中的角色
    @RequestMapping("/deleteOneRole.do")
    public String deleteOneRole(@RequestParam("id") String id){
        roleService.deleteOneRole(id);
        return "redirect:findAll.do";
    }

    //根据角色ID查看角色信息
    @RequestMapping("/selectById.do")
    public ModelAndView selectById(@RequestParam("id") String id){
        Role role = roleService.selectById(id);
        ModelAndView mv=new ModelAndView();
        mv.addObject("role",role);
        mv.setViewName("role_show");
        return mv;
    }

    //查询该角色剩余可添加的权限
    @RequestMapping("/showRemainPermission.do")
    public ModelAndView showRemainPermission(@RequestParam("id") String id){
        ModelAndView mv = new ModelAndView();
        //查询该角色，并封装到“添加权限表单”页面，以便于发送添加请求
        Role role = roleService.selectById(id);
        mv.addObject("role",role);
        List<Permission> permissions = roleService.showRemainPermission(id);
        mv.addObject("permissionList",permissions);
        mv.setViewName("role_permissionAdd");
        return mv;
    }

    //将添加的权限保存到数据库中
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam("roleId") String roleId,@RequestParam(value = "checkItemTd",defaultValue = "") String[] permissionIds){
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }


}
