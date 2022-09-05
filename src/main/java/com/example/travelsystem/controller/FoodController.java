package com.example.travelsystem.controller;

import com.example.travelsystem.entity.Food;
import com.example.travelsystem.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("food2")
public class FoodController {

    @Autowired
    private FoodService foodService;

    @GetMapping
    public Response<List<Food>> getFoodList() {
        return Response.makeSuccessResult(foodService.getFoodList());
    }
}
