/**
 * @Title ProgramController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年9月8日 下午11:55:55 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public Page queryProgramPage(@RequestParam(required = false) String proId,
            @RequestParam(required = false) String userId,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String status,
            @RequestParam(required = true) String start,
            @RequestParam(required = true) String limit) {
        return programAO.queryProgramPage(proId, userId, name, type, status,
            start, limit);
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public boolean firstApproveProgram(
            @RequestParam(required = true) String proId,
            @RequestParam(required = true) String checkResult,
            @RequestParam(required = true) String remark) {
        return programAO.firstApproveProgram(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }

}
