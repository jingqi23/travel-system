package com.example.travelsystem.service.impl;

import com.example.travelsystem.dao.FeiyongDao;
import com.example.travelsystem.entity.Feiyong;
import com.example.travelsystem.service.FeiyongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Scope("prototype")
public class FeiyongServiceImpl implements FeiyongService {
    @Autowired
    private FeiyongDao feiyongDao;

    public boolean add(Feiyong feiyong) {
        boolean flag = false;
        int updateRows = feiyongDao.add(feiyong);
        if (updateRows > 0) {
            flag = true;
            System.out.println("add success!");
        } else {
            System.out.println("add failed!");
        }

        return flag;
    }

    public boolean deleteById(Integer delId) {
        return feiyongDao.deleteById(delId) > 0;
    }

    public Feiyong getById(String id) {
        return feiyongDao.getById(Integer.parseInt(id));
    }

    public List<Feiyong> getList(int uid) {
        List<Feiyong> FeiyongList;

        Map<String, Object> params = new HashMap<>();
        params.put("uid", uid);

        FeiyongList = feiyongDao.getList(params);
        return FeiyongList;
    }


    public boolean modify(Feiyong feiyong) {
        return feiyongDao.modify(feiyong) > 0;
    }

    public double getAll(int uid) {
        return feiyongDao.getAll(uid);
    }


}
