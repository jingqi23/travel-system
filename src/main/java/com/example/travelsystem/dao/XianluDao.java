package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Xianlu;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface XianluDao {
    /**
     * 增加用户信息
     */
    int add(Xianlu xianlu);

    /**
     * 通过条件查询-userList
     */
    List<Xianlu> getList(Map<String, Object> params);

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
    Xianlu getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Xianlu xianlu);

}
