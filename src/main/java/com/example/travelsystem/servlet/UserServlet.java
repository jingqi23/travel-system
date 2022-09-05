package com.example.travelsystem.servlet;

import com.example.travelsystem.entity.User;
import com.example.travelsystem.service.UserService;
import com.example.travelsystem.tools.Constants;
import com.example.travelsystem.tools.PageSupport;
import com.example.travelsystem.tools.StringUtils;
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
@RequestMapping("/userold")
public class UserServlet {
    @Autowired
    @Qualifier("userServiceImpl")
    UserService userService;


    @RequestMapping("login")
    public String login(String userCode, String userPassword, HttpServletRequest request) {
        System.out.println("login ============ ");
        User user = userService.login(userCode, userPassword);
        if (null != user) {//登录成功
            //放入session
            if (user.getRole() == 1) {
                request.getSession().setAttribute(Constants.USER_QIANSESSION, user);
            }
            request.getSession().setAttribute(Constants.USER_HOUSESSION, user);
        }
        return "redirect:/scenicspot.jsp";
    }


    @RequestMapping("add")
    public String add(HttpSession session, User user, BindingResult result) {
        System.out.println("add()================");
        userService.add(user);
        return "redirect:/index.jsp";
    }

    @RequestMapping("add2")
    public String add2(HttpSession session, User user, BindingResult result) {
        System.out.println("add2()================");
        userService.add(user);
        return "redirect:/userold/query";
    }

    @RequestMapping("query")
    public String query(String queryname, String queryUserRole, Integer pageIndex, HttpServletRequest request) {
        //查询用户列表
        List<User> userList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;
        if (pageIndex != null && pageIndex != 0) {
            currentPageNo = pageIndex;
        }

        System.out.println("queryUserName servlet--------" + queryname);
        System.out.println("queryUserRole servlet--------" + queryUserRole);
        System.out.println("query pageIndex--------- > " + pageIndex);

        //总数量（表）
        int totalCount = userService.getCount(queryname, queryUserRole);
        //总页数
        PageSupport pages = new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);

        int totalPageCount = pages.getTotalPageCount();

        //控制首页和尾页
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {
            currentPageNo = totalPageCount;
        }


        userList = userService.getList(queryname, queryUserRole, currentPageNo, pageSize);
        request.setAttribute("userList", userList);
        request.setAttribute("queryname", queryname);
        request.setAttribute("queryUserRole", queryUserRole);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("currentPageNo", currentPageNo);
        return "manager/userlist";
    }

    @RequestMapping("ucexist")
    @ResponseBody
    public HashMap<String, String> ucexist(String goodsname) {
        //判断用户账号是否可用
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if (StringUtils.isNullOrEmpty(goodsname)) {
            resultMap.put("productName", "exist");
        } else {
            User user = userService.selectCodeExist(goodsname);
            resultMap.put("user", goodsname);
            if (null != user) {
                resultMap.put("productName", "exist");
            } else {
                resultMap.put("productName", "notexist");
            }
        }
        return resultMap;

    }

    @RequestMapping("del/{id}")
    public String deluser(@PathVariable("id") Integer id) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (id <= 0) {
            resultMap.put("delResult", "notexist");
        } else {
            if (userService.deleteById(id)) {
                resultMap.put("delResult", "true");
            } else {
                resultMap.put("delResult", "false");
            }
        }
        return "redirect:/userold/query";
    }


    //    点用户名
    @RequestMapping("modify")
    @ResponseBody
    public User modify(String uid, HttpServletRequest request) {
        return userService.getById(uid);
    }

    @RequestMapping("modifyexe1")
    public String modifyexe1(HttpSession session, String id, String password) {
        User user = userService.getById(id);
        user.setPassword(password);
        userService.modify(user);
        session.removeAttribute(Constants.USER_HOUSESSION);
        return "redirect:/manager/login.jsp";
    }

    @RequestMapping("modifyexe")
    public String modifyexe(HttpServletRequest request, User user) {
        userService.modify(user);
        return "redirect:/scenicspot.jsp";
    }



    @RequestMapping("login1")
    public String login1(String userCode, String userPassword, HttpServletRequest request) {
        System.out.println("login ============ ");
        User user = userService.login(userCode, userPassword);
        if (null != user) {//登录成功
            //放入session
            request.getSession().setAttribute(Constants.USER_HOUSESSION, user);
            return "redirect:/manager/frist.jsp";
        } else {
            request.setAttribute("error", "用户名或密码错误");
            return "/manager/login";
        }
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        //清除session
        session.removeAttribute(Constants.USER_QIANSESSION);
        return "redirect:/scenicspot.jsp";
    }

    @RequestMapping("logout2")
    public String logout2(HttpSession session) {
        //清除session
        session.removeAttribute(Constants.USER_HOUSESSION);
        return "redirect:/manager/login.jsp";
    }


}