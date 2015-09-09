/**
 * @Title AccountController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:09:09 
 * @version V1.0   
 */
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

import com.xnjr.cpzc.ao.IAccountAO;
import com.xnjr.cpzc.dto.res.Page;

/** 
 * 账户模块
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:09:09 
 * @history:
 */
@Controller
@RequestMapping(value = "/account")
public class AccountController extends BaseController {

    @Autowired
    protected IAccountAO accountAO;

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryAccountPage(
            @RequestParam(value = "realName", required = false) String realName,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return accountAO.queryAccountPage(realName, accountNumber, status,
            start, limit, orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/moneyList", method = RequestMethod.GET)
    @ResponseBody
    public Page queryAccountMoneyList(
            @RequestParam(value = "ajNo", required = false) String ajNo,
            @RequestParam(value = "bizType", required = false) String bizType,
            @RequestParam(value = "createDatetimeStart", required = false) String createDatetimeStart,
            @RequestParam(value = "createDatetimeEnd", required = false) String createDatetimeEnd,
            @RequestParam(value = "realName", required = false) String realName,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return accountAO.queryAccountMoneyList(ajNo, bizType,
            createDatetimeStart, createDatetimeEnd, realName, accountNumber,
            start, limit, orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryAccountDetail(
            @RequestParam(value = "ajNo", required = false) String ajNo,
            @RequestParam(value = "bizType", required = false) String bizType,
            @RequestParam(value = "createDatetimeStart", required = false) String createDatetimeStart,
            @RequestParam(value = "createDatetimeEnd", required = false) String createDatetimeEnd,
            @RequestParam(value = "realName", required = false) String realName,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        ModelAndView view = new ModelAndView("/account/account_detail");
        if (StringUtils.isNotBlank(ajNo)) {
            List list = accountAO.queryAccountDetail(ajNo, bizType,
                createDatetimeStart, createDatetimeEnd, realName, accountNumber,
                "0", "10", orderColumn, orderDir);
            if (list != null && list.size() > 0) {
                view.addObject("account", list.get(0));
            }
        }
        return view;
    }
}
