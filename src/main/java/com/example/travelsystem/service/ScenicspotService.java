package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.entity.User;


public interface ScenicspotService {

    List<Scenicspot> getScenicspotList();

    boolean add(Scenicspot scenicspot);

    List<Scenicspot> getList(String queryScenicspotName, int currentPageNo, int pageSize);

    int getCount(String queryScenicspotName);

    boolean deleteById(Integer delId);

    Scenicspot getById(String id);

    boolean modify(Scenicspot scenicspot);
}
