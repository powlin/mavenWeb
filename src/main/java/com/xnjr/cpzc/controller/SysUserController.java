package com.xnjr.cpzc.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xnjr.cpzc.ao.ISysUserAO;
import com.xnjr.cpzc.base.session.SessionUser;
import com.xnjr.cpzc.dto.res.Page;

/**
 * 系统用户模块
 * @author: xieyj 
 * @since: 2015年8月16日 下午1:41:04 
 * @history:
 */
@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController extends BaseController {

    @Autowired
    protected ISysUserAO sysUserAO;

    // ******** 用户登录 *****
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(@RequestParam("login_name") String loginName,
            @RequestParam("login_pwd") String loginPwd) {
        // 校验用户名密码
        boolean flag = sysUserAO.login(loginName, loginPwd, getRemoteHost());
        if (flag == true) {
            // 创建session
            sessionProvider.setUserDetail(new SessionUser(loginName));
            return "/main";
        } else {
            return "/login";
        }
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/user/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryUserPage(
            @RequestParam(value = "userCode", required = false) String userCode,
            @RequestParam(value = "userName", required = false) String userName,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return sysUserAO.queryMenuPage(userCode, userName, status, start, limit,
            orderColumn, orderDir);
    }

    @RequestMapping(value = "/user/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailUser(
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/system/user_detail");
        return view;
    }

    // ******** 添加菜单 *****
    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    @ResponseBody
    public boolean addmenu(@RequestParam("userCode") String userCode,
            @RequestParam("userName") String userName,
            @RequestParam("password") String password) {
        // 添加用户验证
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return sysUserAO.addUser(userCode, userName, password,
            sessionUser.getUser_id());
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/user/detailPas", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailPasUser(
            @RequestParam(value = "userCode", required = false) String userCode,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/system/user_detail_pas");
        if (StringUtils.isNotBlank(userCode) && "edit".equals(operate)) {// 是修改则查询数据库
            List list = sysUserAO.queryUserList(userCode, "", "");
            if (list != null && list.size() > 0) {
                view.addObject("user", list.get(0));
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/user/detailSta", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailStaUser(
            @RequestParam(value = "userCode", required = false) String userCode,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/system/user_detail_sta");
        if (StringUtils.isNotBlank(userCode) && "edit".equals(operate)) {// 是修改则查询数据库
            List list = sysUserAO.queryUserList(userCode, "", "");
            if (list != null && list.size() > 0) {
                view.addObject("user", list.get(0));
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    // ******** 修改用户密码 *****
    @RequestMapping(value = "/user/editPas", method = RequestMethod.POST)
    @ResponseBody
    public boolean editUserPas(@RequestParam("userCode") String userCode,
            @RequestParam("oldPwd") String oldPwd,
            @RequestParam("newPwd") String newPwd) {
        // 修改密码验证
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return sysUserAO.editUserPas(userCode, oldPwd, newPwd,
            sessionUser.getUser_id());
    }

    // ******** 修改用户密码 *****
    @RequestMapping(value = "/user/editSta", method = RequestMethod.POST)
    @ResponseBody
    public boolean editUserSta(@RequestParam("userCode") String userCode,
            @RequestParam("status") String status) {
        // 修改状态验证
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return sysUserAO.editUserSta(userCode, status,
            sessionUser.getUser_id());
    }

}
