package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Tuan;


public interface TuanService {

    boolean add(Tuan tuan);

    List<Tuan> getList(String queryTuanName, int currentPageNo, int pageSize);

    int getCount(String queryTuanName);

    boolean deleteById(Integer delId);

    Tuan getById(String id);

    boolean modify(Tuan tuan);

}
