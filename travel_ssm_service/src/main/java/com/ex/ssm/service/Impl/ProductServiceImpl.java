package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IProductDao;
import com.ex.ssm.domain.Product;
import com.ex.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService{
    @Autowired
    IProductDao productDao;

    @Override
    public List<Product> findAll() {
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
}
