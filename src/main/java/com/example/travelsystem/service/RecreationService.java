package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Recreation;


public interface RecreationService {

    List<Recreation> getRecreationList();

    boolean add(Recreation recreation);

    List<Recreation> getList(String queryRecreationName, int currentPageNo, int pageSize);

    int getCount(String queryRecreationName);

    boolean deleteById(Integer delId);

    Recreation getById(String id);

    boolean modify(Recreation recreation);
}
