package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IOrderDao;
import com.ex.ssm.dao.IProductDao;
import com.ex.ssm.domain.Order;
import com.ex.ssm.domain.Product;
import com.ex.ssm.service.IProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService{
    @Autowired
    IProductDao productDao;
    @Autowired
    IOrderDao orderDao;

    @Override
    public List<Product> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        List<Product> all = productDao.findAll();
        return all;
    }

    @Override
    public void insertOneProduct(Product product) {
        productDao.insertOneProduct(product);
    }

    @Override
    public Product selectById(String id) {
        Product product = productDao.selectById(id);
        return product;
    }

    @Override
    public void deleteOneProduct(String productId) {
        //删除product <— 根据productId删除orders表中相关数据 <— 根据orderId删除orders_traveller表中相关数据

        //查询选择该产品的订单
        Order order = orderDao.selectByProductId(productId);
        if(order!=null){
            //先从中间表orders_traveller中 删除该订单的数据
            orderDao.deleteFromOrderTraveller(order.getId());
            //先删除有该产品的订单
            orderDao.delete(order.getId());
        }
        //再删除该产品
        productDao.delete(productId);
    }

    @Override
    public void deleteManyProducts(String[] productIds) {
        for (String productId:productIds) {
            deleteOneProduct(productId);
        }
    }

    @Override
    public void updateProductInfo(Product product) {
        productDao.update(product);
    }
}
