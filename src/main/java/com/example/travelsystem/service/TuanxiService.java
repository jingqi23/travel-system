package com.example.travelsystem.service;

import java.util.List;
import java.util.Map;

import com.example.travelsystem.entity.Tuan;
import com.example.travelsystem.entity.Tuanxi;


public interface TuanxiService {

    boolean add(Tuanxi tuanxi);

    int getCount(Map<String, Object> params);

}
