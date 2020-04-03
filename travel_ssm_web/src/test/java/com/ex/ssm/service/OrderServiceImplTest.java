package com.ex.ssm.service;

import com.ex.ssm.domain.Order;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class OrderServiceImplTest {

    @Autowired
    IOrderService orderService;

    @Test
    public void testFindAll() throws Exception{
        List<Order> all = orderService.findAll(1,4);
        System.out.println(all);
    }


}
