/**
 * @Title AccountController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:09:09 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xnjr.cpzc.ao.IAccountAO;
import com.xnjr.cpzc.base.session.SessionUser;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703211Res;

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
    @RequestMapping(value = "/jour/detail", method = RequestMethod.GET)
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
        ModelAndView view = new ModelAndView("/account/fund_jour_detail");
        if (StringUtils.isNotBlank(ajNo)) {
            Page page = accountAO.queryAccountMoneyList(ajNo, bizType,
                createDatetimeStart, createDatetimeEnd, realName, accountNumber,
                "0", "10", orderColumn, orderDir);
            if (page != null && page.getList() != null) {
                view.addObject("account", page.getList().get(0));
            }
        }
        return view;
    }

    // ******** 红冲蓝补申请 *****
    @RequestMapping(value = "/redBlueApply", method = RequestMethod.POST)
    @ResponseBody
    public boolean redBlueApply(
            @RequestParam("accountNumber") String accountNumber,
            @RequestParam("direction") String direction,
            @RequestParam("amount") Long amount,
            @RequestParam("applyNote") String applyNote) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return accountAO.redBlueApply(accountNumber, direction, amount,
            sessionUser.getUserCode(), applyNote);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/redBlueSearchDetail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView redBlueSearchDetail(
            @RequestParam(value = "rbNo", required = false) String rbNo) {
        ModelAndView view = new ModelAndView("/account/red_blue_search_edit");
        if (StringUtils.isNotBlank(rbNo)) {
            Page page = accountAO.redBlueSearch(rbNo, null, null, null, null,
                null, null, null, "1", "10", null, null);
            if (page != null && page.getList() != null) {
                view.addObject("account", page.getList().get(0));
            }
        }
        return view;
    }

    // ******** 红冲蓝补申请 *****
    @RequestMapping(value = "/redBlueSearchEdit", method = RequestMethod.POST)
    @ResponseBody
    public boolean redBlueSearchEdit(@RequestParam("rbNo") String rbNo,
            @RequestParam("checkResult") String checkResult,
            @RequestParam("remark") String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return accountAO.redBlueSearchEdit(rbNo, sessionUser.getUserCode(),
            checkResult, remark);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/redBlueSearch", method = RequestMethod.GET)
    @ResponseBody
    public Page redBlueSearch(
            @RequestParam(value = "rbNo", required = false) String rbNo,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam(value = "direction", required = false) String direction,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "applyUser", required = false) String applyUser,
            @RequestParam(value = "checkUser", required = false) String checkUser,
            @RequestParam(value = "applyDatetimeStart", required = false) String applyDatetimeStart,
            @RequestParam(value = "applyDatetimeEnd", required = false) String applyDatetimeEnd,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return accountAO.redBlueSearch(rbNo, accountNumber, direction, status,
            applyUser, checkUser, applyDatetimeStart, applyDatetimeEnd, start,
            limit, orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/sysCheck", method = RequestMethod.GET)
    @ResponseBody
    public Page querySysCheckPage(
            @RequestParam(value = "ubNo", required = false) String ubNo,
            @RequestParam(value = "refNo", required = false) String refNo,
            @RequestParam(value = "bizType", required = false) String bizType,
            @RequestParam(value = "checkDateStart", required = false) String checkDateStart,
            @RequestParam(value = "checkDateEnd", required = false) String checkDateEnd,
            @RequestParam(value = "checkResult", required = false) String checkResult,
            @RequestParam(value = "adjustUser", required = false) String adjustUser,
            @RequestParam(value = "adjustDatetimeStart", required = false) String adjustDatetimeStart,
            @RequestParam(value = "adjustDatetimeEnd", required = false) String adjustDatetimeEnd,
            @RequestParam(value = "adjustResult", required = false) String adjustResult,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return accountAO.querySysCheckPage(ubNo, refNo, bizType, checkDateStart,
            checkDateEnd, checkResult, adjustUser, adjustDatetimeStart,
            adjustDatetimeEnd, adjustResult, accountNumber, start, limit,
            orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/sysCheckDetail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView querySysCheckDetail(
            @RequestParam(value = "ubNo", required = false) String ubNo) {
        ModelAndView view = new ModelAndView("/account/sys_check_edit");
        if (StringUtils.isNotBlank(ubNo)) {
            Page page = accountAO.querySysCheckPage(ubNo, null, null, null,
                null, null, null, null, null, null, null, "1", "10", null,
                null);
            if (page != null && page.getList() != null) {
                view.addObject("sysCheck", page.getList().get(0));
            }
        }
        return view;
    }

    // ******** 红冲蓝补申请 *****
    @RequestMapping(value = "/sysCheckEdit", method = RequestMethod.POST)
    @ResponseBody
    public boolean sysCheckEdit(@RequestParam("ubNo") String ubNo,
            @RequestParam("adjustResult") String adjustResult,
            @RequestParam("remark") String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        return accountAO.sysCheckEdit(ubNo, sessionUser.getUserCode(),
            adjustResult, remark);
    }

    @RequestMapping(value = "/sysAccount", method = RequestMethod.GET)
    @ResponseBody
    public ZC703211Res getSysAccount() {
        return accountAO.getSysParam();// 根据code查询记录
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/queryJourList", method = RequestMethod.GET)
    @ResponseBody
    public Page queryJourList(
            @RequestParam(value = "sjNo", required = false) String sjNo,
            @RequestParam(value = "bizType", required = false) String bizType,
            @RequestParam(value = "createDatetimeStart", required = false) String createDatetimeStart,
            @RequestParam(value = "createDatetimeEnd", required = false) String createDatetimeEnd,
            @RequestParam(value = "accountNumber", required = false) String accountNumber,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return accountAO.queryJourList(sjNo, bizType, createDatetimeStart,
            createDatetimeEnd, accountNumber, start, limit, orderColumn,
            orderDir);
    }
}
