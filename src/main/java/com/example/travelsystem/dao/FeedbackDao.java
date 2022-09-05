package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Feedback;

import java.util.List;
import java.util.Map;

public interface FeedbackDao {
    /**
     * 增加用户信息
     */
    int add(Feedback feedback);

    /**
     * 通过条件查询-userList
     */
    List<Feedback> getByPricture(int pid);

    List<Feedback> getList(Map<String, Object> params);

    /**
     * 通过条件查询-用户表记录数
     */
    int getCount();

    /**
     * 通过userId删除user
     */
    int deleteById(Integer delId);


    /**
     * 通过userId获取user
     */
    Feedback getById(int id);
}
