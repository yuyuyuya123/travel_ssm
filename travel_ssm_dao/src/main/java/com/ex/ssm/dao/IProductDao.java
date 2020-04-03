package com.ex.ssm.dao;

import com.ex.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IProductDao {

    //查询所有产品的信息
    @Select("select * from product")
    List<Product> findAll();

    //添加产品
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productStatus,productDesc)" +
            " values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productStatus},#{productDesc})")
    void insertOneProduct(Product product);

    //根据ID查找产品
    @Select("select * from product where id=#{id}")
    Product selectById(String id);
}
