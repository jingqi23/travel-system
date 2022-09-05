package com.example.travelsystem.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.travelsystem.dao.OrderMapper;
import com.example.travelsystem.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> getOrderList(String uid) {
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", uid);
        return orderMapper.getOrderList(uid);
    }
}
