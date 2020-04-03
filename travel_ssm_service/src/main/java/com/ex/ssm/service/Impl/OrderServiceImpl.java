package com.ex.ssm.service.Impl;

import com.ex.ssm.dao.IOrderDao;
import com.ex.ssm.dao.IProductDao;
import com.ex.ssm.domain.Order;
import com.ex.ssm.domain.Product;
import com.ex.ssm.service.IOrderService;
import com.ex.ssm.service.IProductService;
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
}
