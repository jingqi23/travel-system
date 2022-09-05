package com.example.travelsystem.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.travelsystem.entity.Recreation;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface RecreationDao extends BaseMapper<Recreation> {
    /**
     * 增加用户信息
     */
    int add(Recreation recreation);

    /**
     * 通过条件查询-userList
     */
    List<Recreation> getList(Map<String, Object> params);

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
    Recreation getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Recreation recreation);
}
