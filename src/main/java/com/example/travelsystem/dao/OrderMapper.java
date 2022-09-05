package com.example.travelsystem.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.travelsystem.entity.Order;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderMapper extends BaseMapper {

    @Select("select * from buyticket where uid=(select id as uid from user where username=#{uid})")
    List<Order> getOrderList(String uid);
}
