package com.ex.ssm.dao;

import com.ex.ssm.domain.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IProductDao {

    //查询所有产品的信息
    @Select("select * from product")
    List<Product> findAll();

    //根据ID查找产品
    @Select("select * from product where id=#{id}")
    Product selectById(String id);

    //添加产品
    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productStatus,productDesc)" +
            " values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productStatus},#{productDesc})")
    void insertOneProduct(Product product);

    //删除产品
    @Delete("delete from product where id=#{productId}")
    void delete(String productId);

    //根据产品Id找到产品，然后修改数据
    @Update("update product set productNum=#{productNum},productName=#{productName},cityName=#{cityName},departureTime=#{departureTime}," +
            "productPrice=#{productPrice},productStatus=#{productStatus},productDesc=#{productDesc} where id=#{id}")
    void update(Product product);


}
