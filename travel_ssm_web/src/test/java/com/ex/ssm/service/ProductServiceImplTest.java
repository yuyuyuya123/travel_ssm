package com.ex.ssm.service;

import com.ex.ssm.domain.Product;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml","classpath*:spring-mvc.xml","classpath*:spring-security.xml"})
@WebAppConfiguration(value = "src/main/webapp")
public class ProductServiceImplTest {

    @Autowired
    IProductService productService;

    @Test
//    @Ignore
    public void testFindById() throws Exception{
        Product product = productService.selectById("676C5BD1D35E429A8C2E114939C5685A");
        System.out.println(product);
    }

    @Test
    @Ignore
    public void testUpdate(){
        Product product = new Product();
        product.setId("676C5BD1D35E429A8C2E114939C5685A");
        product.setProductNum("B002");
        product.setProductName("北京七日游");
        product.setCityName("海口");
        productService.updateProductInfo(product);

    }

    @Test
    public void testDelete(){
        productService.deleteOneProduct("12B7ABF2A4C544568B0A7C69F36BF8B7");
    }

}
