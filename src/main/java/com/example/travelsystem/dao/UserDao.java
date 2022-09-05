package com.example.travelsystem.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.travelsystem.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import java.sql.Connection;
import java.util.List;
import java.util.Map;


public interface UserDao extends BaseMapper<User> {
    /**
     * 增加用户信息
     */
    int add(User user);


    @Insert("insert into user (`username`, `password`,`role`,`name`,`sex`,`phone`,`idcard`,`isdel`) " +
            "select #{username},#{password},#{role},#{name},#{sex},#{phone},#{idcard},#{isdel} from dual " +
            "where not exists (select id from user where username = #{username});")
    int insertIfNotExists(User user);

    /**
     * 通过userCode获取User
     */
    User getLoginUser(String userid);

    /**
     * 通过条件查询-userList
     */
    List<User> getList(Map<String, Object> params);

    /**
     * 通过条件查询-用户表记录数
     */
    int getCount(Map<String, Object> params);

    /**
     * 通过userId删除user
     */
    @Update("update user set isdel=1 where id=#{delId}")
    int deleteById(Integer delId);

    /**
     * 修改用户信息
     */
    int modify(User user);


}
