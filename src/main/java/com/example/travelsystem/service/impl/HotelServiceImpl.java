package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.travelsystem.entity.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.example.travelsystem.dao.HotelDao;
import com.example.travelsystem.service.HotelService;

@Service
@Scope("prototype")
public class HotelServiceImpl implements HotelService {
    @Autowired
    private HotelDao hotelDao;

    public boolean add(Hotel hotel) {
        boolean flag = false;
        int updateRows = hotelDao.add(hotel);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    @Override
    public List<Hotel> getHotelList() {
        return hotelDao.selectList(null);
    }

    public boolean deleteById(Integer delId) {return hotelDao.deleteById(delId) > 0;
    }

    public Hotel getById(String id) {
        Hotel user;
        user = hotelDao.getById(Integer.parseInt(id));
        return user;
    }

    public List<Hotel> getList(String queryHotelName, int currentPageNo, int pageSize) {
        List<Hotel> hotelList = null;
        System.out.println("queryHotelName ---- > " + queryHotelName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryHotelName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        hotelList = hotelDao.getList(params);
        return hotelList;
    }


    public boolean modify(Hotel Hotel) {
        return hotelDao.modify(Hotel) > 0;
    }

    public int getCount(String queryHotelName) {
        int count = 0;
        System.out.println("queryHotelName ---- > " + queryHotelName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryHotelName);
        count = hotelDao.getCount(params);
        return count;
    }


}
