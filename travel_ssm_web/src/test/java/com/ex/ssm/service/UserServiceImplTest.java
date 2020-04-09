package com.ex.ssm.service;

import com.ex.ssm.domain.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class UserServiceImplTest {
    @Autowired
    IUserService userService;

    @Test
    public void testLoadUserByUsername() throws Exception{
        UserDetails user = userService.loadUserByUsername("admin");
        System.out.println(user.getUsername()+",密码："+user.getPassword()+",权限："+user.getAuthorities());//test

    }
}
