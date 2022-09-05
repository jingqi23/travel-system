package com.example.travelsystem.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.example.travelsystem.dao.TuanDao;
import com.example.travelsystem.dao.TuanxiDao;
import com.example.travelsystem.entity.Tuan;
import com.example.travelsystem.entity.Tuanxi;
import com.example.travelsystem.service.TuanxiService;

@Service
@Scope("prototype")
public class TuanxiServiceImpl implements TuanxiService {
    @Autowired
    private TuanxiDao tuanxiDao;

    @Autowired
    private TuanDao tuanDao;

    public boolean add(Tuanxi tuanxi) {
        boolean flag = false;
        int updateRows = tuanxiDao.add(tuanxi);

        if (updateRows > 0) {

            Tuan tuan = tuanDao.getById(tuanxi.getTid());
            tuan.setCnums(tuan.getCnums() + 1);
            tuanDao.modify(tuan);
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public int getCount(Map<String, Object> params) {

        return tuanDao.getCount(params);
    }


}
