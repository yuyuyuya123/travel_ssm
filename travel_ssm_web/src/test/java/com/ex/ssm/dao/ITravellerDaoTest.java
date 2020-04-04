package com.ex.ssm.dao;

import com.ex.ssm.domain.Traveller;
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
public class ITravellerDaoTest {
    @Autowired
    ITravellerDao travellerDao;

    @Test
    public void testSelectById(){
        System.out.println("》》》》》"+travellerDao);
        List<Traveller> travellers = travellerDao.selectById("0E7231DC797C486290E8713CA3C6ECCC");
        for(Traveller val:travellers){
            System.out.println(val);
        }
    }
}
