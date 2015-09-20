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
import com.xnjr.cpzc.dto.req.ZC703305Req;
import com.xnjr.cpzc.dto.req.ZC703306Req;
import com.xnjr.cpzc.dto.req.ZC703307Req;
import com.xnjr.cpzc.dto.req.ZC703308Req;
import com.xnjr.cpzc.dto.res.ZC703305Res;
import com.xnjr.cpzc.dto.res.ZC703306Res;
import com.xnjr.cpzc.dto.res.ZC703307Res;
import com.xnjr.cpzc.dto.res.ZC703308Res;
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
     * @see com.xnjr.cpzc.ao.IReturnAO#addReturn(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.Integer, java.lang.Integer, java.lang.String, java.lang.Integer)
     */
    @Override
    public ZC703305Res addReturn(String proId, String amount, String name,
            String picture, String needLimit, Integer limitNum,
            Integer supportMaxCount, String returnType,
            Integer returnExpectedDays) {
        ZC703305Req req = new ZC703305Req();
        req.setProId(proId);
        req.setAmount(amount);
        req.setPicture(picture);
        req.setName(name);
        req.setNeedLimit(needLimit);
        req.setLimitNum(limitNum);
        req.setSupportMaxCount(supportMaxCount);
        req.setReturnType(returnType);
        req.setReturnExpectedDays(returnExpectedDays);

        ZC703305Res zc703305Res = BizConnecter.getBizData("703305",
            com.xnjr.cpzc.util.JsonUtils.object2Json(req), ZC703305Res.class);
        ZC703305Res res = new ZC703305Res();
        res.setId(zc703305Res.getId());
        return res;
    }

    /** 
     * @see com.xnjr.cpzc.ao.IReturnAO#editReturn(java.lang.String, java.lang.Integer, java.lang.String, java.lang.String, java.lang.String, java.lang.Integer, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public ZC703306Res editReturn(String id, Integer amount, String name,
            String picture, String needLimit, Integer limitNum,
            String supportMaxCount, String returnType, String returnExpectedDays) {
        ZC703306Req req = new ZC703306Req();
        req.setId(id);
        req.setAmount(amount);
        req.setName(name);
        req.setPicture(picture);
        req.setNeedLimit(needLimit);
        req.setLimitNum(limitNum);
        req.setSupportMaxCount(supportMaxCount);
        req.setReturnType(returnType);
        req.setReturnExpectedDays(returnExpectedDays);
        ZC703306Res zc703306Res = BizConnecter.getBizData("703306",
            com.xnjr.cpzc.util.JsonUtils.object2Json(req), ZC703306Res.class);
        ZC703306Res res = new ZC703306Res();
        res.setIsSuccess(zc703306Res.getIsSuccess());
        return res;
    }

    /** 
     * @see com.xnjr.cpzc.ao.IReturnAO#dropReturn(java.lang.String)
     */
    @Override
    public ZC703307Res dropReturn(String id) {
        ZC703307Req req = new ZC703307Req();
        req.setId(id);
        ZC703307Res zc703307Res = BizConnecter.getBizData("703307",
            com.xnjr.cpzc.util.JsonUtils.object2Json(req), ZC703307Res.class);
        ZC703307Res res = new ZC703307Res();
        res.setIsSuccess(zc703307Res.getIsSuccess());
        return res;
    }

    /** 
     * @see com.xnjr.cpzc.ao.IReturnAO#getReturn(java.lang.String)
     */
    @Override
    public ZC703308Res getReturn(String id) {
        ZC703308Req req = new ZC703308Req();
        req.setId(id);
        ZC703308Res zc703308Res = BizConnecter.getBizData("703308",
            com.xnjr.cpzc.util.JsonUtils.object2Json(req), ZC703308Res.class);
        ZC703308Res res = new ZC703308Res();
        res.setId(zc703308Res.getId());
        res.setName(zc703308Res.getName());
        res.setAmount(zc703308Res.getAmount());
        res.setProId(zc703308Res.getProId());
        res.setPicture(zc703308Res.getPicture());
        res.setNeedLimit(zc703308Res.getNeedLimit());
        res.setLimitNum(zc703308Res.getLimitNum());
        res.setReturnType(zc703308Res.getReturnType());
        res.setSupportMaxCount(zc703308Res.getSupportMaxCount());
        res.setReturnExpectedDays(zc703308Res.getReturnExpectedDays());
        return res;
    }

    /** 
     * @see com.xnjr.cpzc.ao.IReturnAO#queryReturnModeList(java.lang.String)
     */
    @Override
    public List<ZC703309Res> getAllReturnByProId(String proId) {
        String jsonStr = BizConnecter.getBizData("703309",
            JsonUtils.string2Json("proId", proId));
        Gson gson = new Gson();
        List<ZC703309Res> list = gson.fromJson(jsonStr,
            new TypeToken<List<ZC703309Res>>() {
            }.getType());
        return list;
    }
}
