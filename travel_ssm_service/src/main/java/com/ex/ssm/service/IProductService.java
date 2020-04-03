package com.ex.ssm.service;

import com.ex.ssm.domain.Product;

import java.util.List;

public interface IProductService {

    List<Product> findAll();

    void insertOneProduct(Product product);

    Product selectById(String id);
}
