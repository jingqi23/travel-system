package com.example.travelsystem.controller;

import com.example.travelsystem.entity.Hotel;
import com.example.travelsystem.entity.Order;
import com.example.travelsystem.service.HotelService;
import com.example.travelsystem.service.OrderService;
import com.example.travelsystem.token.NeedToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @NeedToken
    @GetMapping
    public Response<List<Order>> getOrderList(HttpServletRequest request) {
        String uid = (String) request.getAttribute("uid");
        return Response.makeSuccessResult(orderService.getOrderList(uid));
    }

}
