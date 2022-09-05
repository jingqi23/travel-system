package com.example.travelsystem.controller;

import com.example.travelsystem.entity.Hotel;
import com.example.travelsystem.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("hotel")
public class HotelController {

    @Autowired
    private HotelService hotelService;

    @GetMapping
    public Response<List<Hotel>> getHotelList() {
        return Response.makeSuccessResult(hotelService.getHotelList());
    }

}
