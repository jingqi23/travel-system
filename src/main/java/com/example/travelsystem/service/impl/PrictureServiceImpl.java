package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.example.travelsystem.dao.PrictureDao;
import com.example.travelsystem.entity.Pricture;
import com.example.travelsystem.service.PrictureService;

@Service
@Scope("prototype")
public class PrictureServiceImpl implements PrictureService {
    @Autowired
    private PrictureDao prictureDao;

    public boolean add(Pricture Pricture) {
        boolean flag = false;
        int updateRows = prictureDao.add(Pricture);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return prictureDao.deleteById(delId) > 0;
    }

    public Pricture getById(String id) {
        Pricture user;
        user = prictureDao.getById(Integer.parseInt(id));
        return user;
    }

    public int getCount() {
        return prictureDao.getCount();
    }

    public List<Pricture> getList(int currentPageNo, int pageSize) {
        List<Pricture> PrictureList = null;
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        PrictureList = prictureDao.getList(params);
        return PrictureList;
    }


    public boolean modify(Pricture Pricture) {
        return prictureDao.modify(Pricture) > 0;
    }


}
