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

import com.xnjr.cpzc.ao.IRoleAO;
import com.xnjr.cpzc.ao.IRoleMenuAO;
import com.xnjr.cpzc.ao.ISysUserAO;
import com.xnjr.cpzc.ao.ISysUserRoleAO;
import com.xnjr.cpzc.base.session.SessionUser;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703652Res;
import com.xnjr.cpzc.dto.res.ZC703661Res;
import com.xnjr.cpzc.exception.BizException;

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
    protected IRoleAO roleAO;

    @Autowired
    protected ISysUserAO sysUserAO;

    @Autowired
    protected ISysUserRoleAO sysUserRoleAO;

    @Autowired
    protected IRoleMenuAO roleMenuAO;

    // ******** 用户登录 *****
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView doLogin(@RequestParam("login_name") String loginName,
            @RequestParam("login_pwd") String loginPwd) {
        // 校验用户名密码
        boolean flag = sysUserAO.login(loginName, loginPwd, getRemoteHost());
        ModelAndView view = null;
        if (flag == true) {
            // 创建session
            // 根据用户的编号获取对应的角色
            List<ZC703652Res> roleList = sysUserRoleAO.queryRoleList(loginName);

            if (roleList == null || roleList.size() == 0) {
                throw new BizException("ZC779045", "该用户未分配角色");
            }
            String roleCode = roleList.get(0).getRoleCode();
            sessionProvider.setUserDetail(new SessionUser(loginName, roleCode));
            view = new ModelAndView("redirect:/sysUser/main");
        } else {
            view = new ModelAndView("/login");
            view.addObject("errMes", "用户名或密码错误");
        }
        return view;
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView doMain() {
        ModelAndView view = new ModelAndView("/main");
        view.addObject("userCode", this.getSessionUser().getUserCode());
        return view;
    }

    // ******** 顶级菜单 *****
    @RequestMapping(value = "/top_menu", method = RequestMethod.GET)
    public ModelAndView doTopMenu() {
        List<ZC703661Res> bannerList = roleMenuAO
            .queryMenuList(getSessionUser().getRoleCode(), "10000", false);
        ModelAndView view = new ModelAndView("/top");
        view.addObject("bannerList", bannerList);
        view.addObject("userCode", getSessionUser().getUserCode());
        return view;
    }

    // ******** 顶级菜单 *****
    @RequestMapping(value = "/left_menu", method = RequestMethod.GET)
    public ModelAndView doLeftMenu(
            @RequestParam(value = "pmenu_code") String pMenuCode) {
        ModelAndView view = new ModelAndView("/menu");
        view.addObject("pMenuCode", pMenuCode);
        return view;
    }

    @RequestMapping(value = "/roleMenu/list", method = RequestMethod.POST)
    @ResponseBody
    public List<ZC703661Res> queryRoleMenu(
            @RequestParam(value = "pmenuCode", required = false) String pMenuCode,
            @RequestParam(value = "isGetChild", required = false) boolean isGetChild) {
        List<ZC703661Res> menuList = roleMenuAO
            .queryMenuList(getSessionUser().getRoleCode(), pMenuCode, true);
        return menuList;
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

    // ******** 添加用户 *****
    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    @ResponseBody
    public boolean addUser(@RequestParam("userCode") String userCode,
            @RequestParam("userName") String userName,
            @RequestParam("password") String password) {
        // 添加用户验证
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return sysUserAO.addUser(userCode, userName, password,
            sessionUser.getUserCode());
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
    @RequestMapping(value = "/user/detailRole", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailRoleUser(
            @RequestParam(value = "userCode", required = false) String userCode,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/system/user_detail_role");
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
            sessionUser.getUserCode());
    }

    // ******** 修改用户角色 *****
    @RequestMapping(value = "/user/editRole", method = RequestMethod.POST)
    @ResponseBody
    public boolean editUserRole(@RequestParam("userCode") String userCode,
            @RequestParam("roleCode") String roleCode) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        boolean del = sysUserRoleAO.deleteUserRole(userCode);// 删除当前用户纪录
        if (!del) {// 删除失败
            return false;
        }
        return sysUserRoleAO.addUserRole(userCode, roleCode,
            sessionUser.getUserCode());
    }

    // ******** 修改用户密码 *****
    @RequestMapping(value = "/user/editSta", method = RequestMethod.POST)
    @ResponseBody
    public boolean editUserSta(@RequestParam("userCode") String userCode,
            @RequestParam("status") String status) {
        // 修改状态验证
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        if ("1".equals(status)) {
            status = "2";
        } else if ("2".equals(status)) {
            status = "1";
        }
        return sysUserAO.editUserSta(userCode, status,
            sessionUser.getUserCode());
    }

}
