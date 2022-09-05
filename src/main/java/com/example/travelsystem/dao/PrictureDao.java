package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Pricture;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface PrictureDao {
    /**
     * 增加用户信息
     */
    int add(Pricture pircture);

    /**
     * 通过条件查询-PirctureList
     */
    List<Pricture> getList(Map<String, Object> params);

    /**
     * 通过条件查询-用户表记录数
     */
    int getCount();

    /**
     * 通过PirctureId删除Pircture
     */
    int deleteById(Integer delId);


    /**
     * 通过PirctureId获取Pircture
     */
    Pricture getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Pricture pircture);
}
