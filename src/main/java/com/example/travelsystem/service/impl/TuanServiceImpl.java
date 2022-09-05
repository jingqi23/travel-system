package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.example.travelsystem.dao.TuanDao;
import com.example.travelsystem.entity.Tuan;
import com.example.travelsystem.service.TuanService;

@Service
@Scope("prototype")
public class TuanServiceImpl implements TuanService {
    @Autowired
    private TuanDao TuanDao;

    public boolean add(Tuan tuan) {
        boolean flag = false;
        int updateRows = TuanDao.add(tuan);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return TuanDao.deleteById(delId) > 0;
    }

    public Tuan getById(String id) {
        Tuan user = null;
        user = TuanDao.getById(Integer.parseInt(id));
        return user;
    }

    public List<Tuan> getList(String queryTuanName, int currentPageNo, int pageSize) {
        List<Tuan> TuanList = null;
        System.out.println("queryTuanName ---- > " + queryTuanName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryTuanName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        TuanList = TuanDao.getList(params);
        return TuanList;
    }


    public boolean modify(Tuan tuan) {
        return TuanDao.modify(tuan) > 0;
    }

    public int getCount(String queryTuanName) {
        int count;
        System.out.println("queryTuanName ---- > " + queryTuanName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryTuanName);
        count = TuanDao.getCount(params);
        return count;
    }

}
