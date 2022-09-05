package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Xianlu;
import com.example.travelsystem.entity.User;


public interface XianluService {

    boolean add(Xianlu xianlu);

    List<Xianlu> getList(String queryXianluName, int currentPageNo, int pageSize);

    int getCount(String queryXianluName);

    boolean deleteById(Integer delId);

    Xianlu getById(String id);

    boolean modify(Xianlu xianlu);
}
