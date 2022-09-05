package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Pricture;
import com.example.travelsystem.entity.User;


public interface PrictureService {

    boolean add(Pricture Pricture);

    List<Pricture> getList(int currentPageNo, int pageSize);

    int getCount();

    boolean deleteById(Integer delId);

    Pricture getById(String id);

    boolean modify(Pricture pricture);
}
