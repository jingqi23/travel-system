package com.example.travelsystem.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.travelsystem.entity.Food;

import java.util.List;
import java.util.Map;

public interface FoodDao extends BaseMapper<Food> {
    /**
     * 增加食物信息
     */
    int add(Food food);

    /**
     * 通过条件查询-userList
     */
    List<Food> getList(Map<String, Object> params);

    /**
     * 通过条件查询-食物表记录数
     */
    int getCount(Map<String, Object> params);

    /**
     * 通过userId删除user
     */
    int deleteById(Integer delId);

    /**
     * 通过userId获取user
     */
    Food getById(int id);

    /**
     * 修改食物信息
     */
    int modify(Food food);

}
