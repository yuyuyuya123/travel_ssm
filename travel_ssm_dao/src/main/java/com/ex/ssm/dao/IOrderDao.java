package com.ex.ssm.dao;

import com.ex.ssm.domain.Order;
import com.ex.ssm.domain.Product;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IOrderDao {
    @Select("select * from orders")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "productId",property = "product",javaType = Product.class,one = @One(select = "com.ex.ssm.dao.IProductDao.selectById"))
    })
    List<Order> findAll();
}
