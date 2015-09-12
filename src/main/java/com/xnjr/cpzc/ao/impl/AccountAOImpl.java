/**
 * @Title AccountAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月17日 上午10:44:49 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IAccountAO;
import com.xnjr.cpzc.dto.req.ZC703204Req;
import com.xnjr.cpzc.dto.req.ZC703205Req;
import com.xnjr.cpzc.dto.req.ZC703208Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703206Res;
import com.xnjr.cpzc.dto.res.ZC703207Res;
import com.xnjr.cpzc.exception.BizException;
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

    @Override
    public boolean redBlueApply(String accountNumber, String amount,
            String applyUser, String applyNote) {
        if (StringUtils.isBlank(accountNumber)) {
            throw new BizException("ZC703206", "账户编号");
        }
        if (StringUtils.isBlank(amount)) {
            throw new BizException("ZC703206", "金额");
        }
        if (StringUtils.isBlank(applyNote)) {
            throw new BizException("ZC703206", "申请理由");
        }
        ZC703206Res zc703206Req = new ZC703206Res();
        zc703206Req.setAccountNumber(accountNumber);
        zc703206Req.setAmount(amount);
        zc703206Req.setApplyUser(applyUser);
        zc703206Req.setApplyNote(applyNote);
        return BizConnecter.getBizData("703206",
            JsonUtils.object2Json(zc703206Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean redBlueSearchEdit(String rbNo, String checkUser,
            String checkResult, String remark) {
        if (StringUtils.isBlank(rbNo)) {
            throw new BizException("ZC703207", "红冲蓝补申请编号");
        }
        if (StringUtils.isBlank(checkResult)) {
            throw new BizException("ZC703207", "审核结果");
        }
        if (StringUtils.isBlank(remark)) {
            throw new BizException("ZC703207", "备注");
        }
        ZC703207Res zc703207Req = new ZC703207Res();
        zc703207Req.setRbNo(rbNo);
        zc703207Req.setCheckUser(checkUser);
        zc703207Req.setCheckResult(checkResult);
        zc703207Req.setRemark(remark);
        return BizConnecter.getBizData("703207",
            JsonUtils.object2Json(zc703207Req), SuccessRes.class).isSuccess();
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Page redBlueSearch(String rbNo, String accountNumber,
            String direction, String status, String applyUser, String checkUser,
            String applyDatetimeStart, String applyDatetimeEnd, String start,
            String limit, String orderColumn, String orderDir) {
        ZC703208Req zc703208Req = new ZC703208Req();
        zc703208Req.setRbNo(rbNo);
        zc703208Req.setAccountNumber(accountNumber);
        zc703208Req.setDirection(direction);
        zc703208Req.setStatus(status);
        zc703208Req.setApplyUser(applyUser);
        zc703208Req.setCheckUser(checkUser);
        zc703208Req.setApplyDatetimeStart(applyDatetimeStart);
        zc703208Req.setApplyDatetimeEnd(applyDatetimeEnd);
        zc703208Req.setStart(start);
        zc703208Req.setLimit(limit);
        zc703208Req.setOrderColumn(orderColumn);
        zc703208Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703208",
            JsonUtils.object2Json(zc703208Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

}
