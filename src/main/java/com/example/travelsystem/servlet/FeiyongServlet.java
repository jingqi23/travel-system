package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.Feiyong;
import com.example.travelsystem.entity.User;
import com.example.travelsystem.service.FeiyongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/feiyong")
public class FeiyongServlet {
    @Autowired
    @Qualifier("feiyongServiceImpl")
    FeiyongService feiyongService;

    @RequestMapping("add")
    public String add(HttpSession session, Feiyong feiyong, BindingResult result) {
        System.out.println("add()================");

        User obj = (User) session.getAttribute("userSession");
        if (obj == null) {
            obj = (User) session.getAttribute("userHouSession");
        }
        feiyong.setUid(obj.getId());
        feiyongService.add(feiyong);
        return "redirect:/feiyong/query1";
    }

    @RequestMapping("query1")
    public String query1(String queryFeiyongName, Integer pageIndex, HttpServletRequest request, HttpSession session) {
        //查询用户列表
        List<Feiyong> feiyongList = null;
        User obj = (User) session.getAttribute("userSession");
        if (obj == null) {
            obj = (User) session.getAttribute("userHouSession");
        }
        feiyongList = feiyongService.getList(obj.getId());
        request.setAttribute("feiyongList", feiyongList);
        request.setAttribute("total", feiyongService.getAll(obj.getId()));
        return "manager/feiyonglist";
    }

    @RequestMapping("del/{id}")
    public String delfeiyong(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();

        feiyongService.deleteById(id);
        return "redirect:/feiyong/query1";
    }

    @RequestMapping("modify")
    @ResponseBody
    public Feiyong modify(String id, HttpServletRequest request) {
        return feiyongService.getById(id);
    }

    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, Feiyong feiyong) {
        feiyongService.modify(feiyong);
        return "redirect:/feiyong/query1";
    }


}