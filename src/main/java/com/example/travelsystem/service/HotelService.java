package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Hotel;


public interface HotelService {

    boolean add(Hotel hotel);

    List<Hotel> getHotelList();

    List<Hotel> getList(String queryHotelName, int currentPageNo, int pageSize);

    int getCount(String queryHotelName);

    boolean deleteById(Integer delId);

    Hotel getById(String id);

    boolean modify(Hotel hotel);
}
