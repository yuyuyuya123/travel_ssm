package com.ex.ssm.dao;

import com.ex.ssm.domain.Member;
import com.ex.ssm.domain.Order;
import com.ex.ssm.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrderDao {
    @Select("select * from orders")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "productId",property = "product",javaType = Product.class,one = @One(select = "com.ex.ssm.dao.IProductDao.selectById"))
    })
    List<Order> findAll();


    @Select("select * from orders where id=#{id}")
    @Results({
            @Result(column = "id",property = "id",id = true ),
            @Result(column = "productId",property = "product",javaType = Product.class,one = @One(select = "com.ex.ssm.dao.IProductDao.selectById")),
            @Result(column = "memberId",property = "member",javaType = Member.class,one = @One(select = "com.ex.ssm.dao.IMemberDao.selectById")),
            @Result(column = "id",property = "travellers",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.ITravellerDao.selectById"))
    })
   Order selectById(String id);
}
