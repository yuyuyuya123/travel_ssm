package com.ex.ssm.service;


import com.ex.ssm.domain.Order;

import java.util.List;

public interface IOrderService {
    List<Order> findAll(Integer page,Integer size);

    Order selectById(String id);

    void addOrderDesc(String id, String orderDesc);

    void deleteOneOrder(String id);

    void deleteManyOrders(String[] orderIds);
}
