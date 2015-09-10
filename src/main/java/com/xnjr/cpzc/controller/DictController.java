/**
 * @Title DictController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:13:20 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xnjr.cpzc.ao.IDictAO;
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
}
