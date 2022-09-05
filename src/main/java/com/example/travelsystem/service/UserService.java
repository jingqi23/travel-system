package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.User;


public interface UserService {

    boolean add(User user);

    String login2(String userName, String password);

    void register(String userName, String password, String name, String phone, int sex, String idNumber);

    User login(String username, String userpassword);

    List<User> getList(String queryUserName, String queryUserRole, int currentPageNo, int pageSize);

    int getCount(String queryUserName, String queryUserRole);

    User selectCodeExist(String userCode);

    boolean deleteById(Integer delId);

    User getById(String id);

    boolean modify(User user);
}
