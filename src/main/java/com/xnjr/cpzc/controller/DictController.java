/**
 * @Title DictController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:13:20 
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

import com.xnjr.cpzc.ao.IDictAO;
import com.xnjr.cpzc.base.session.SessionUser;
import com.xnjr.cpzc.dto.res.Page;

/** 
 * 数据字典
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:13:20 
 * @history:
 */
@Controller
@RequestMapping(value = "/dict")
public class DictController extends BaseController {
    @Autowired
    protected IDictAO dictAO;

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryDictPage(
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "value", required = false) String value,
            @RequestParam(value = "pKey", required = false) String pKey,
            @RequestParam(value = "pValue", required = false) String pValue,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return dictAO.queryDictPage(key, value, pKey, pValue, start, limit,
            orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List queryDictList(
            @RequestParam(value = "key", required = false) String key,
            @RequestParam(value = "value", required = false) String value,
            @RequestParam(value = "pId", required = false) String pId,
            @RequestParam(value = "pKey", required = false) String pKey,
            @RequestParam(value = "pValue", required = false) String pValue) {
        return dictAO.queryDictList(key, value, pId, pKey, pValue);
    }

    // ******** 添加字典 *****
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public boolean addDict(@RequestParam("key") String key,
            @RequestParam("value") String value,
            @RequestParam("pId") String pId,
            @RequestParam(value = "remark", required = false) String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        // 添加字典验证
        return dictAO.addDict(key, value, pId, remark,
            sessionUser.getUserCode());
    }

    @RequestMapping(value = "/drop", method = RequestMethod.POST)
    @ResponseBody
    public boolean dropDict(@RequestParam("id") String id) {
        return dictAO.dropDict(id);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailDict(@RequestParam("id") String id,
            @RequestParam("key") String key, @RequestParam("pKey") String pKey,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/base/dictionary_detail");
        if (StringUtils.isNotBlank(key) && "edit".equals(operate)) {// 是修改则查询数据库
            List list = dictAO.queryDictList(key, null, null, pKey, null);// 根据key和pKey查询记录
            if (list != null && list.size() > 0) {
                view.addObject("dict", list.get(0));
                view.addObject("operate", operate);
                view.addObject("id", id);
            }
        }
        return view;
    }

    // ******** 修改菜单 *****
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public boolean editDict(@RequestParam("id") String id,
            @RequestParam("value") String value,
            @RequestParam("pId") String pId,
            @RequestParam(value = "remark", required = false) String remark) {
        SessionUser sessionUser = (SessionUser) sessionProvider.getUserDetail();
        // 修改数据字典验证
        return dictAO.editMenu(id, value, pId, remark,
            sessionUser.getUserCode());
    }

}
