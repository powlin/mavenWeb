/**
 * @Title SupportAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:16:55 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xnjr.cpzc.ao.IReturnAO;
import com.xnjr.cpzc.dto.res.ZC703309Res;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * 支持记录 
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:16:55 
 * @history:
 */
@Service
public class ReturnAOImpl implements IReturnAO {

    /** 
     * @see com.xnjr.cpzc.ao.IReturnAO#queryReturnModeList(java.lang.String)
     */
    @Override
    public List<ZC703309Res> queryReturnList(String proId) {
        String jsonStr = BizConnecter.getBizData("703309",
            JsonUtils.string2Json("proId", proId));
        Gson gson = new Gson();
        List<ZC703309Res> list = gson.fromJson(jsonStr,
            new TypeToken<List<ZC703309Res>>() {
            }.getType());
        return list;
    }
}
