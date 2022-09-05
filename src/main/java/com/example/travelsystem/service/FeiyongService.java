package com.example.travelsystem.service;

import java.util.List;

import com.example.travelsystem.entity.Feiyong;
import com.example.travelsystem.entity.User;


public interface FeiyongService {

    boolean add(Feiyong feiyong);

    List<Feiyong> getList(int uid);

    double getAll(int uid);

    boolean deleteById(Integer delId);

    Feiyong getById(String id);

    boolean modify(Feiyong feiyong);
}
