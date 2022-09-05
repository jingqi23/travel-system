package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Food;
import com.example.travelsystem.entity.User;


public interface FoodService {

    boolean add(Food food);

    List<Food> getFoodList();

    List<Food> getList(String queryFoodName, int currentPageNo, int pageSize);

    int getCount(String queryFoodName);

    boolean deleteById(Integer delId);

    Food getById(String id);

    boolean modify(Food food);

}
