package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.example.travelsystem.dao.ScenicspotDao;
import com.example.travelsystem.entity.Scenicspot;
import com.example.travelsystem.service.ScenicspotService;

@Service
@Scope("prototype")
public class ScenicspotServiceImpl implements ScenicspotService {
    @Autowired
    private ScenicspotDao scenicspotDao;

    public List<Scenicspot> getScenicspotList() {
        return scenicspotDao.selectList(null);
    }

    public boolean add(Scenicspot scenicspot) {
        boolean flag = false;
        int updateRows = scenicspotDao.add(scenicspot);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return scenicspotDao.deleteById(delId) > 0;
    }

    public Scenicspot getById(String id) {
        Scenicspot user = null;
        user = scenicspotDao.getById(Integer.parseInt(id));
        return user;
    }

    public int getCount(String queryScenicspotName) {
        int count;
        System.out.println("sid ---- > " + queryScenicspotName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryScenicspotName);
        count = scenicspotDao.getCount(params);
        return count;
    }

    public List<Scenicspot> getList(String queryScenicspotName, int currentPageNo, int pageSize) {
        List<Scenicspot> ScenicspotList;
        System.out.println("sid ---- > " + queryScenicspotName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryScenicspotName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        ScenicspotList = scenicspotDao.getList(params);
        return ScenicspotList;
    }


    public boolean modify(Scenicspot scenicspot) {
        return scenicspotDao.modify(scenicspot) > 0;
    }


}
