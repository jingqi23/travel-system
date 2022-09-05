package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Tuan;
import com.example.travelsystem.entity.Tuanxi;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface TuanxiDao {
    /**
     * 增加用户信息
     */
    int add(Tuanxi tuanxi);

    List<Tuan> getBytuan(Map<String, Object> params);

    int getCount(Map<String, Object> params);

}
