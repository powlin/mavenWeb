/**
 * @Title ProgramController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年9月8日 下午11:55:55 
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

import com.xnjr.cpzc.ao.IProgramAO;
import com.xnjr.cpzc.dto.res.Page;

/** 
 * @author: xieyj 
 * @since: 2015年9月8日 下午11:55:55 
 * @history:
 */
@Controller
@RequestMapping(value = "/program")
public class ProgramController extends BaseController {
    @Autowired
    IProgramAO programAO;

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryProgramPage(
            @RequestParam(value = "proId", required = false) String proId,
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "start", required = true) String start,
            @RequestParam(value = "limit", required = true) String limit) {
        return programAO.queryProgramPage(proId, userId, name, type, status,
            start, limit);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView getProgram(
            @RequestParam(value = "proId", required = true) String proId) {
        ModelAndView view = new ModelAndView("/program/program_detail");
        if (StringUtils.isNotBlank(proId)) {
            Page page = programAO.queryProgramPage(proId, null, null, null,
                null, "0", "10");
            if (page != null && page.getList() != null) {
                view.addObject("program", page.getList().get(0));
            }
        }
        return view;

    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public ModelAndView getCheckProgram(
            @RequestParam(value = "proId", required = true) String proId) {
        ModelAndView view = new ModelAndView("/program/program_check");
        if (StringUtils.isNotBlank(proId)) {
            Page page = programAO.queryProgramPage(proId, null, null, null,
                null, "0", "10");
            if (page != null && page.getList() != null) {
                view.addObject("role", page.getList().get(0));
            }
        }
        return view;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public boolean firstApproveProgram(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "checkResult", required = true) String checkResult,
            @RequestParam(value = "remark", required = true) String remark) {
        return programAO.firstApproveProgram(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }

}
