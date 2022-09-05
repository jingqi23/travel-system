package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Tuan;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface TuanDao {
    /**
     * 增加用户信息
     */
    int add(Tuan tuan);

    /**
     * 通过条件查询-userList
     */
    List<Tuan> getList(Map<String, Object> params);

    /**
     * 通过条件查询-用户表记录数
     */
    int getCount(Map<String, Object> params);

    /**
     * 通过userId删除user
     */
    int deleteById(Integer delId);

    /**
     * 通过userId获取user
     */
    Tuan getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Tuan tuan);

}
