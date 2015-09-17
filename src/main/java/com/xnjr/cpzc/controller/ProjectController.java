/**
 * @Title ProgramController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年9月8日 下午11:55:55 
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

import com.xnjr.cpzc.ao.IProjectAO;
import com.xnjr.cpzc.ao.IReturnAO;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703309Res;

/** 
 * @author: xieyj 
 * @since: 2015年9月8日 下午11:55:55 
 * @history:
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController extends BaseController {
    @Autowired
    IProjectAO projectAO;

    @Autowired
    IReturnAO returnAO;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView doForwardView(
            @RequestParam(value = "op_status") String op_status) {
        ModelAndView view = new ModelAndView("/project/project_list");
        view.addObject("op_status", op_status);
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryProjectPage(
            @RequestParam(value = "proId", required = false) String proId,
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "start", required = true) String start,
            @RequestParam(value = "limit", required = true) String limit) {
        return projectAO.queryProjectPage(proId, userId, name, type, status,
            start, limit);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView editProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "name", required = true) String name,
            @RequestParam(value = "type", required = true) String type,
            @RequestParam(value = "province", required = true) String province,
            @RequestParam(value = "city", required = true) String city,
            @RequestParam(value = "picture", required = true) String picture,
            @RequestParam(value = "video", required = true) String video,
            @RequestParam(value = "summary", required = true) String summary,
            @RequestParam(value = "detail", required = true) String detail,
            @RequestParam(value = "targetAmount", required = true) Integer targetAmount,
            @RequestParam(value = "raiseDays", required = true) Integer raiseDays) {
        boolean flag = projectAO.editProject(proId, name, type, province, city,
            picture, video, summary, detail, targetAmount, raiseDays);
        ModelAndView view = null;
        if (flag == true) {
            view = new ModelAndView("/project/project_approve");
            if (StringUtils.isNotBlank(proId)) {
                @SuppressWarnings("rawtypes")
                Page page = projectAO.queryProjectPage(proId, null, null, null,
                    null, "0", "10");
                if (page != null && page.getList() != null) {
                    List<ZC703309Res> returnList = returnAO
                        .queryReturnList(proId);
                    view.addObject("project", page.getList().get(0));
                    view.addObject("returnList", returnList);
                }
            }
        } else {
            view = new ModelAndView("/error/error");
        }
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public ModelAndView getProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "operate", required = false) String operate) {
        String url = "/project/project_detail";
        if ("approve".equals(operate)) {
            url = "/project/project_approve";
        }
        ModelAndView view = new ModelAndView(url);
        if (StringUtils.isNotBlank(proId)) {
            Page page = projectAO.queryProjectPage(proId, null, null, null,
                null, "0", "10");
            if (page != null && page.getList() != null) {
                List<ZC703309Res> returnList = returnAO.queryReturnList(proId);
                view.addObject("project", page.getList().get(0));
                view.addObject("returnList", returnList);
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    @RequestMapping(value = "/approve", method = RequestMethod.POST)
    @ResponseBody
    public boolean firstApproveProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "checkResult", required = true) String checkResult,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.firstApproveProject(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }

    @RequestMapping(value = "/flow", method = RequestMethod.POST)
    @ResponseBody
    public boolean flowProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.flowProject(proId,
            this.getSessionUser().getUserCode(), remark);
    }

    @RequestMapping(value = "/payAmount", method = RequestMethod.POST)
    @ResponseBody
    public boolean payAmountProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "firstPayAmount", required = true) String firstPayAmount,
            @RequestParam(value = "firstPayFee", required = true) String firstPayFee,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.payAmountProject(proId, this.getSessionUser()
            .getUserCode(), firstPayAmount, firstPayFee, remark);
    }

    @RequestMapping(value = "/repay", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmSendProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "checkResult", required = true) String checkResult,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.confirmSendOut(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }
}
