package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Feiyong;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface FeiyongDao {
    /**
     * 增加用户信息
     */
    int add(Feiyong feiyong);

    double getAll(int uid);

    /**
     * 通过条件查询-userList
     */
    List<Feiyong> getList(Map<String, Object> params);

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
    Feiyong getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Feiyong feiyong);


}
