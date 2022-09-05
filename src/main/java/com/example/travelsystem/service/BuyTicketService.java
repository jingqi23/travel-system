package com.example.travelsystem.service;

import java.util.List;
import java.util.Map;

import com.example.travelsystem.entity.Buyticket;
import com.example.travelsystem.entity.User;


public interface BuyTicketService {

    boolean add(Buyticket buyticket);

    List<Buyticket> getList(String sid, Integer uid, Integer check, int currentPageNo, int pageSize);

    int getCount(String sid, Integer check);

    boolean deleteById(Integer delId);

    Buyticket getById(Integer id);

    boolean modify(Buyticket buyticket);

    Integer getTodayTicket();

    List<Map<String, Object>> getTickets(Map<String, Object> params);
}
