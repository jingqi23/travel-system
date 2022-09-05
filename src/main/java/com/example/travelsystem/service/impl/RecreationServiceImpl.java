package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.example.travelsystem.dao.RecreationDao;
import com.example.travelsystem.entity.Recreation;
import com.example.travelsystem.service.RecreationService;

@Service
@Scope("prototype")
public class RecreationServiceImpl implements RecreationService {
    @Autowired
    private RecreationDao recreationDao;

    @Override
    public List<Recreation> getRecreationList() {
        return recreationDao.selectList(null);
    }

    public boolean add(Recreation recreation) {
        boolean flag = false;
        int updateRows = recreationDao.add(recreation);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return recreationDao.deleteById(delId) > 0;
    }

    public Recreation getById(String id) {
        Recreation user = null;
        user = recreationDao.getById(Integer.parseInt(id));
        return user;
    }

    public int getCount(String queryRecreationName) {
        int count;
        System.out.println("sid ---- > " + queryRecreationName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryRecreationName);
        count = recreationDao.getCount(params);
        return count;
    }

    public List<Recreation> getList(String queryRecreationName, int currentPageNo, int pageSize) {
        List<Recreation> RecreationList;
        System.out.println("sid ---- > " + queryRecreationName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryRecreationName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        RecreationList = recreationDao.getList(params);
        return RecreationList;
    }


    public boolean modify(Recreation recreation) {
        return recreationDao.modify(recreation) > 0;
    }


}
