package com.example.travelsystem.service.impl;

import com.example.travelsystem.dao.XianluDao;
import com.example.travelsystem.entity.Xianlu;
import com.example.travelsystem.service.XianluService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope("prototype")
public class XianluServiceImpl implements XianluService {
    @Autowired
    private XianluDao xianluDao;

    public boolean add(Xianlu xianlu) {
        boolean flag = false;
        int updateRows = xianluDao.add(xianlu);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return xianluDao.deleteById(delId) > 0;
    }

    public Xianlu getById(String id) {
        return xianluDao.getById(Integer.parseInt(id));
    }

    public int getCount(String queryXianluName) {
        int count;
        System.out.println("sid ---- > " + queryXianluName);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryXianluName);
        count = xianluDao.getCount(params);
        return count;
    }

    public List<Xianlu> getList(String queryXianluName, int currentPageNo, int pageSize) {
        List<Xianlu> XianluList;
        System.out.println("sid ---- > " + queryXianluName);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("name", queryXianluName);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);

        XianluList = xianluDao.getList(params);
        return XianluList;
    }

    public boolean modify(Xianlu xianlu) {
        return xianluDao.modify(xianlu) > 0;
    }

}
