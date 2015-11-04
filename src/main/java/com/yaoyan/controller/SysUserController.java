package com.yaoyan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 系统用户模块
 * @author: linyy 
 * @since: 2015年11月4日 下午22:33:04 
 * @history:
 */
@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController extends BaseController {

    // ******** 用户登录 *****
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView doLogin(@RequestParam("login_name") String loginName,
            @RequestParam("login_pwd") String loginPwd) {
        ModelAndView view = new ModelAndView("redirect:/sysUser/main");
        return view;
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView doMain() {
        ModelAndView view = new ModelAndView("/main");
        view.addObject("userCode", this.getSessionUser().getUserCode());
        return view;
    }

}
