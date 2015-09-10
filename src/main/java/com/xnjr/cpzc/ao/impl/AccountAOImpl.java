/**
 * @Title AccountAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月17日 上午10:44:49 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IAccountAO;
import com.xnjr.cpzc.dto.req.ZC703204Req;
import com.xnjr.cpzc.dto.req.ZC703205Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * 账户模块
 * @author: xieyj 
 * @since: 2015年8月17日 上午10:44:49 
 * @history:
 */
@Service
public class AccountAOImpl implements IAccountAO {

    @SuppressWarnings("rawtypes")
    @Override
    public Page queryAccountPage(String realName, String accountNumber,
            String status, String start, String limit, String orderColumn,
            String orderDir) {
        ZC703204Req zc703204Req = new ZC703204Req();
        zc703204Req.setRealName(realName);
        zc703204Req.setAccountNumber(accountNumber);
        zc703204Req.setStatus(status);
        zc703204Req.setStart(start);
        zc703204Req.setLimit(limit);
        zc703204Req.setOrderColumn(orderColumn);
        zc703204Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703204",
            JsonUtils.object2Json(zc703204Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Page queryAccountMoneyList(String ajNo, String bizType,
            String createDatetimeStart, String createDatetimeEnd,
            String realName, String accountNumber, String start, String limit,
            String orderColumn, String orderDir) {
        ZC703205Req zc703205Req = new ZC703205Req();
        zc703205Req.setAjNo(ajNo);
        zc703205Req.setBizType(bizType);
        zc703205Req.setCreateDatetimeStart(createDatetimeStart);
        zc703205Req.setCreateDatetimeEnd(createDatetimeEnd);
        zc703205Req.setRealName(realName);
        zc703205Req.setAccountNumber(accountNumber);
        zc703205Req.setStart(start);
        zc703205Req.setLimit(limit);
        zc703205Req.setOrderColumn(orderColumn);
        zc703205Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703205",
            JsonUtils.object2Json(zc703205Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

}
