package com.ex.ssm.service;

import com.ex.ssm.domain.Permission;
import com.ex.ssm.domain.Role;
import com.ex.ssm.domain.UserInfo;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml","classpath*:spring-security.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class UserServiceImplTest {
    @Autowired
    IUserService userService;

    @Test
    @Ignore
    public void testLoadUserByUsername() throws Exception{
        UserDetails user = userService.loadUserByUsername("admin");
        System.out.println(user.getUsername()+",密码："+user.getPassword()+",权限："+user.getAuthorities());
    }

    @Test
    @Ignore
    public void testFindAll(){
        List<UserInfo> all = userService.findAll();
        for (UserInfo uf:all) {
            System.out.println(">>>>>>"+uf);
        }
    }

    @Test
    @Ignore
    public void testSelectById(){
        UserInfo uf = userService.selectById("111");
        System.out.println(">>>>>>username："+uf.getUsername());
        List<Role> roles = uf.getRoles();
        for (Role role:roles) {
            System.out.println(">>>>>>role："+role.getRoleName());
            List<Permission> permissions = role.getPermissions();
            for (Permission p:permissions) {
                System.out.println(">>>>>>permission："+p.getPermissionName());
            }
        }
    }

    @Test
    public void testAddRoleToUser(){
        String userId="E5C5CA2266BA4021A2C2291E5DC04370";
        String[] roleIds={"C7213513734A4F32AB032F2BE4C2D5E4","adsdc12f"};
        userService.addRoleToUser(userId,roleIds);
    }

}
