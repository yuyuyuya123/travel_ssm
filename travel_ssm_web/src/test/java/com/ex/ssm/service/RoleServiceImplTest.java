package com.ex.ssm.service;

import com.ex.ssm.domain.Permission;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml","classpath*:spring-security.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class RoleServiceImplTest {
    @Autowired
    IRoleService roleService;

    @Test
    public void testShowRemainPermission(){
        List<Permission> permissions = roleService.showRemainPermission("adsdc12f");
        for (Permission permission:permissions) {
            System.out.println(permission.getPermissionName()+","+permission.getUrl());
        }
    }
}
