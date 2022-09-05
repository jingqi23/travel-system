package com.example.travelsystem.dao;


import com.example.travelsystem.entity.Buyticket;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface BuyticketDao {
    /**
     * 增加用户信息
     */
    int add(Buyticket buyticket);

    /**
     * 通过条件查询-userList
     */
    List<Buyticket> getList(Map<String, Object> params);

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
    Buyticket getById(int id);

    /**
     * 修改用户信息
     */
    int modify(Buyticket buyticket);

    /**
     * 修改当前用户密码
     */
    int updatePwd(Map<String, Object> params);

    //当日总票数
    Integer getTodayTicket();

    //按时间段查询景点票数
    List<Map<String, Object>> getTickets(Map<String, Object> params);

}
