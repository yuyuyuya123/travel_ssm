package com.ex.ssm.dao;

import com.ex.ssm.domain.Member;
import com.ex.ssm.domain.Order;
import com.ex.ssm.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrderDao {
    //查询所有订单
    @Select("select * from orders")
    @Results({
            @Result(column = "id",property = "id",id = true),
            @Result(column = "productId",property = "product",javaType = Product.class,one = @One(select = "com.ex.ssm.dao.IProductDao.selectById"))
    })
    List<Order> findAll();

    //根据 订单ID 查询订单，并查询该订单相关数据
    @Select("select * from orders where id=#{id}")
    @Results({
            @Result(column = "id",property = "id",id = true ),
            @Result(column = "productId",property = "product",javaType = Product.class,one = @One(select = "com.ex.ssm.dao.IProductDao.selectById")),
            @Result(column = "memberId",property = "member",javaType = Member.class,one = @One(select = "com.ex.ssm.dao.IMemberDao.selectById")),
            @Result(column = "id",property = "travellers",javaType = java.util.List.class,many = @Many(select = "com.ex.ssm.dao.ITravellerDao.selectById"))
    })
   Order selectById(String id);

    //根据 产品ID 查询订单
    @Select("select * from orders where productId=#{productId}")
    Order selectByProductId(String productId);

    //修改 orderDesc字段的数据
    @Update("update orders set orderDesc=#{orderDesc} where id=#{id}")
    void addOrderDesc(@Param("id") String id,@Param("orderDesc") String orderDesc);

    //根据 订单Id 删除订单
    @Delete("delete from orders where id=#{id}")
    void delete(String id);

    //根据 订单Id 删除相关中间表的数据
    @Delete("delete from order_traveller where orderId=#{orderId}")
    void deleteFromOrderTraveller(String orderId);

}
