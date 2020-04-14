package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IOrderDao;
import com.ex.ssm.domain.Order;
import com.ex.ssm.service.IOrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService{
    @Autowired
    IOrderDao orderDao;

    @Override
    public List<Order> findAll(Integer page,Integer size) {
        PageHelper.startPage(page,size);
        List<Order> all = orderDao.findAll();
        return all;
    }

    @Override
    public Order selectById(String id) {
        Order order = orderDao.selectById(id);
        return order;
    }

    @Override
    public void addOrderDesc(String id, String orderDesc) {
        orderDao.addOrderDesc(id,orderDesc);
    }

    @Override
    public void deleteOneOrder(String id) {
        //先删除中间表order_traveller中 该order的数据
        orderDao.deleteFromOrderTraveller(id);
        //再删除orders表中 该order的数据
        orderDao.delete(id);
    }

    @Override
    public void deleteManyOrders(String[] orderIds) {
        for (String orderId:orderIds) {
            deleteOneOrder(orderId);
        }
    }
}
