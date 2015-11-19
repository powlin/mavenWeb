package com.yaoyan.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yaoyan.base.session.SessionUser;
import com.yaoyan.domain.Menu;
import com.yaoyan.service.SysUserService;

/**
 * 系统用户模块
 * @author: linyy 
 * @since: 2015年11月4日 下午22:33:04 
 * @history:
 */
@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController extends BaseController {

    @Autowired
    protected SysUserService sysUserService;

    // ******** 用户登录 *****
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView doLogin(@RequestParam("login_name") String loginName,
            @RequestParam("login_pwd") String loginPwd) {
        Boolean loginflag = sysUserService.login(loginName, loginPwd);
        ModelAndView view = null;
        if (loginflag) {// 登录成功
            sessionProvider.setUserDetail(new SessionUser(loginName));// 存session
            view = new ModelAndView("redirect:/sysUser/main");
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
        sysUserService.queryBannerListForTest();
        String pMenuCode = "1";
        List<Menu> bannerList = sysUserService.queryBannerListValidate();
        bannerList.add(new Menu(pMenuCode, pMenuCode, "/menuName1", pMenuCode,
            pMenuCode, pMenuCode, 1));
        ModelAndView view = new ModelAndView("/top");
        view.addObject("bannerList", bannerList);// 更改为从数据库获取
        view.addObject("userCode", getSessionUser().getUserCode());
        return view;
    }

    @RequestMapping(value = "/roleMenu/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> queryRoleMenu(
            @RequestParam(value = "pmenuCode", required = false) String pMenuCode,
            @RequestParam(value = "isGetChild", required = false) boolean isGetChild) {
        List<Menu> menuList = new ArrayList<Menu>();
        // pMenuCode = "1";
        // menuList.add(new Menu(pMenuCode, pMenuCode, pMenuCode, pMenuCode,
        // pMenuCode, pMenuCode));
        return menuList;
    }

}
