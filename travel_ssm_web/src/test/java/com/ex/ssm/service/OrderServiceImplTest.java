package com.ex.ssm.service;

import com.ex.ssm.domain.Order;
import org.junit.Ignore;
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
public class OrderServiceImplTest {

    @Autowired
    IOrderService orderService;

    @Test
    @Ignore
    public void testFindAll() throws Exception{
        List<Order> all = orderService.findAll(1,4);
        System.out.println(all);
    }

    @Test
    @Ignore
    public void testSelectById() throws Exception{
        Order order = orderService.selectById("0E7231DC797C486290E8713CA3C6ECCC");
        System.out.println(order);
    }

    @Test
    @Ignore
    public void testAddOrderDesc(){
        orderService.addOrderDesc("0E7231DC797C486290E8713CA3C6ECCC","...");
        System.out.println(orderService.selectById("0E7231DC797C486290E8713CA3C6ECCC"));
    }

    @Test
    public void testDelete(){
        orderService.deleteOneOrder("2FF351C4AC744E2092DCF08CFD314420");
    }


}
