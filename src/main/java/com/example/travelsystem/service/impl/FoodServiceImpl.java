package com.example.travelsystem.service.impl;

import com.example.travelsystem.dao.FoodDao;
import com.example.travelsystem.entity.Food;
import com.example.travelsystem.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope("prototype")
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodDao foodDao;

    public boolean add(Food Food) {
        boolean flag = false;
        int updateRows = foodDao.add(Food);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return foodDao.deleteById(delId) > 0;
    }

    public Food getById(String id) {
        return foodDao.getById(Integer.parseInt(id));
    }

    public List<Food> getFoodList() {
        return foodDao.selectList(null);
    }

    public List<Food> getList(String queryFoodName, int currentPageNo, int pageSize) {
        List<Food> FoodList;
        System.out.println("queryFoodName ---- > " + queryFoodName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryFoodName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        FoodList = foodDao.getList(params);
        return FoodList;
    }


    public boolean modify(Food Food) {
        return foodDao.modify(Food) > 0;
    }

    public int getCount(String queryFoodName) {
        int count;
        System.out.println("queryFoodName ---- > " + queryFoodName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryFoodName);
        count = foodDao.getCount(params);
        return count;
    }

}
