package com.ex.ssm.service;

import com.ex.ssm.domain.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class ProductServiceImplTest {

    @Autowired
    IProductService productService;

    @Test
    public void testFindById() throws Exception{
        Product product = productService.selectById("676C5BD1D35E429A8C2E114939C5685A");
        System.out.println(product);
    }

}
