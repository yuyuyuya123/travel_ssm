package com.ex.ssm.service;

import com.ex.ssm.domain.Product;

import java.util.List;

public interface IProductService {

    List<Product> findAll(Integer page, Integer size);

    void insertOneProduct(Product product);

    Product selectById(String id);

    void deleteManyProducts(String[] productIds);

    void deleteOneProduct(String id);

    void updateProductInfo(Product product);
}
