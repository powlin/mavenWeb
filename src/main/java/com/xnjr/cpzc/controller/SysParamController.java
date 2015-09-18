/**
 * @Title SysParamController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author yuexia  
 * @date 2015年9月18日 下午9:33:39 
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

import com.xnjr.cpzc.ao.ISysParamAO;
import com.xnjr.cpzc.base.session.SessionUser;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703712Res;

/** 
 * 
 * @author: yuexia 
 * @since: 2015年9月18日 下午9:33:35 
 * @history:
 */
@Controller
@RequestMapping(value = "/sysParam")
public class SysParamController extends BaseController {
    @Autowired
    protected ISysParamAO sysParamAO;

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page querySysParamPage(
            @RequestParam(value = "code", required = false) String code,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return sysParamAO.querySysParamPage(code, name, type, start, limit,
            orderColumn, orderDir);
    }

    // ******** 添加系统参数 *****
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public boolean addDict(@RequestParam("code") String code,
            @RequestParam("name") String name,
            @RequestParam("type") String type,
            @RequestParam("value") String value,
            @RequestParam(value = "remark", required = false) String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        // 添加系统参数验证
        return sysParamAO.addSysParam(code, name, type, value, remark,
            sessionUser.getUserCode());
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView querySysParamDict(@RequestParam("code") String code,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/base/sys_param_detail");
        if (StringUtils.isNotBlank(code) && "edit".equals(operate)) {// 是修改则查询数据库
            ZC703712Res zc703712Res = sysParamAO.getSysParam(code);// 根据code查询记录
            if (zc703712Res != null) {
                view.addObject("sysParam", zc703712Res);
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    // ******** 修改菜单 *****
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public boolean editSysParam(@RequestParam("code") String code,
            @RequestParam("name") String name,
            @RequestParam("type") String type,
            @RequestParam("value") String value,
            @RequestParam(value = "remark", required = false) String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        // 修改系统参数验证
        return sysParamAO.editSysParam(code, name, type, value, remark,
            sessionUser.getUserCode());
    }

    @RequestMapping(value = "/drop", method = RequestMethod.POST)
    @ResponseBody
    public boolean dropSysParam(@RequestParam("code") String code) {
        return sysParamAO.dropSysParam(code);
    }

}
