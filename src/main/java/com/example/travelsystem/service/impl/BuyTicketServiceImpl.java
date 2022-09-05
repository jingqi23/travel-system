package com.example.travelsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.travelsystem.dao.BuyticketDao;
import com.example.travelsystem.entity.Buyticket;
import com.example.travelsystem.service.BuyTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;


@Service
@Scope("prototype")
public class BuyTicketServiceImpl implements BuyTicketService {
    @Autowired
    private BuyticketDao buyticketDao;

    public boolean add(Buyticket buyticket) {
        boolean flag = false;
        int updateRows = buyticketDao.add(buyticket);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return buyticketDao.deleteById(delId) > 0;
    }

    public Buyticket getById(Integer id) {
        return buyticketDao.getById(id);
    }

    public int getCount(String sid, Integer check) {
        int count;
        System.out.println("sid ---- > " + sid);
        System.out.println("check ---- > " + check);
        Map<String, Object> params = new HashMap<>();
        params.put("fenlei", sid);
        params.put("check", check);
        count = buyticketDao.getCount(params);
        return count;
    }

    public List<Buyticket> getList(String sid, Integer uid, Integer check, int currentPageNo, int pageSize) {
        List<Buyticket> buyticketList;
        System.out.println("sid ---- > " + sid);
        System.out.println("check ---- > " + check);
        System.out.println("uid ---- > " + uid);
        System.out.println("currentPageNo ---- > " + currentPageNo);
        System.out.println("pageSize ---- > " + pageSize);
        Map<String, Object> params = new HashMap<>();
        params.put("fenlei", sid);
        params.put("uid", uid);
        params.put("check", check);
        params.put("begin", (currentPageNo - 1) * pageSize);
        params.put("pageSize", pageSize);
        buyticketList = buyticketDao.getList(params);
        return buyticketList;
    }

    public boolean modify(Buyticket buyticket) {
        return buyticketDao.modify(buyticket) > 0;
    }

    public List<Map<String, Object>> getTickets(Map<String, Object> params) {
        return buyticketDao.getTickets(params);
    }

    public Integer getTodayTicket() {
        return buyticketDao.getTodayTicket();
    }


}
