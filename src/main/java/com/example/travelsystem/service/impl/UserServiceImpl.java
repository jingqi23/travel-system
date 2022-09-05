package com.example.travelsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.travelsystem.dao.UserDao;
import com.example.travelsystem.entity.User;
import com.example.travelsystem.exception.APICodeMsg;
import com.example.travelsystem.exception.BaseException;
import com.example.travelsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Scope("prototype")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public boolean add(User user) {
        boolean flag = false;
        int updateRows = userDao.add(user);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public String login2(String userName, String password) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", userName);
        wrapper.eq("password", password);
        User user = userDao.selectOne(wrapper);
        if (user == null) {
            throw new BaseException(APICodeMsg.PASSWORD_ERROR);
        }
        return user.getName();
    }

    @Override
    public void register(String userName, String password, String name, String phone, int sex, String idNumber) {
        User user = new User(userName, password, 1, name, sex, phone, idNumber, 0);
        int res = userDao.insertIfNotExists(user);
        if (res == 0) {
            throw new BaseException(APICodeMsg.USERNAME_HAS_EXIST);
        }
        System.out.println("注册成功");
    }

    public User login(String username, String userpassword) {
        User user = userDao.getLoginUser(username);
        if (null != user) {
            if (!user.getPassword().equals(userpassword))
                user = null;
        }
        return user;
    }

    public List<User> getList(String queryUserName, String queryUserRole, int currentPageNo, int pageSize) {
        List<User> userList;
        System.out.println("queryUserName ---- > " + queryUserName);
        System.out.println("queryUserRole ---- > " + queryUserRole);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("username", queryUserName);
        params.put("role", queryUserRole);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        userList = userDao.getList(params);
        return userList;
    }

    public User selectCodeExist(String userCode) {
        return userDao.getLoginUser(userCode);
    }

    public boolean deleteById(Integer delId) {
        return userDao.deleteById(delId) > 0;
    }

    public User getById(String id) {
        return userDao.selectById(id);
    }

    public boolean modify(User user) {
        return userDao.modify(user) > 0;
    }

    public int getCount(String queryUserName, String queryUserRole) {
        int count = 0;
        System.out.println("queryUserName ---- > " + queryUserName);
        System.out.println("queryUserRole ---- > " + queryUserRole);
        Map<String, Object> params = new HashMap<>();
        params.put("username", queryUserName);
        params.put("role", queryUserRole);
        count = userDao.getCount(params);
        return count;
    }

}
