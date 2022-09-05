package com.example.travelsystem.service;

import com.example.travelsystem.entity.Order;

import java.util.List;

public interface OrderService {

    List<Order> getOrderList(String uid);
}
