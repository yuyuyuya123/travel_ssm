package com.ex.ssm.controller;

import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import com.ex.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    //查询所有用户，展示在用户管理页面
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<UserInfo> all = userService.findAll();
        mv.addObject("userList",all);
        mv.setViewName("user_list");
        return mv;
    }

    //根据主键ID查询用户信息，并展示在详情页面
    @RequestMapping("/selectById.do")
    public ModelAndView selectById(@RequestParam("id") String id){
        ModelAndView mv = new ModelAndView();
        UserInfo uf = userService.selectById(id);
        mv.addObject("user",uf);
        mv.setViewName("user_show");
        return mv;
    }

    //页面跳转到：user_add.jsp
    @RequestMapping("/toPage_UserAdd.do")
    public String toPage_UserAdd(){
        return "user_add";
    }

    //添加一个用户，保存到数据库中，然后返回新增数据后的查询页面
    @RequestMapping("/insertOneUser.do")
    public String insertOneUser(UserInfo userInfo){
        userService.insertOneUser(userInfo);
        return "redirect:findAll.do";
    }

    @RequestMapping("/deleteOneUser.do")
    public String deleteOneUser(@RequestParam("id") String id){
        userService.deleteOneUser(id);
        return "redirect:findAll.do";
    }

    //查询该用户剩余的可添加的角色
    @RequestMapping("/showRemainRole.do")
    public ModelAndView showRemainRole(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
        //查询用户
        UserInfo userInfo = userService.selectById(id);
        mv.addObject("user",userInfo);
        //查询该用户剩余可添加的角色
        List<Role> roles = userService.showRemainRole(id);
        mv.addObject("roleList",roles);
        mv.setViewName("user_roleAdd");
        return mv;
    }

    //将该用户添加的角色保存到数据库中
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam("userId") String userId,@RequestParam(name = "checkItemTd",defaultValue = "") String[] roleIds){
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }


}
