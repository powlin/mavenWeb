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
import com.xnjr.cpzc.dto.req.ZC703209Req;
import com.xnjr.cpzc.dto.req.ZC703211Req;
import com.xnjr.cpzc.dto.req.ZC703212Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703206Res;
import com.xnjr.cpzc.dto.res.ZC703207Res;
import com.xnjr.cpzc.dto.res.ZC703210Res;
import com.xnjr.cpzc.dto.res.ZC703211Res;
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
    public boolean redBlueApply(String accountNumber, String direction,
            Long amount, String applyUser, String applyNote) {
        if (StringUtils.isBlank(accountNumber)) {
            throw new BizException("ZC703206", "账户编号不能为空");
        }
        if (amount == null || amount.longValue() <= 0) {
            throw new BizException("ZC703206", "金额不能为空，或者小于等于0");
        }
        if (StringUtils.isBlank(applyNote)) {
            throw new BizException("ZC703206", "申请理由不能为空");
        }
        if (StringUtils.isBlank(direction)) {
            throw new BizException("ZC703206", "方向不能为空");
        }
        String amountVal = null;
        if (direction.equals("0")) {
            amountVal = "-" + amount;
        } else if (direction.equals("1")) {
            amountVal = "" + amount;
        } else {
            throw new BizException("ZC703206", "方向值不在枚举中");
        }
        ZC703206Res zc703206Req = new ZC703206Res();
        zc703206Req.setAccountNumber(accountNumber);
        zc703206Req.setAmount(amountVal);
        zc703206Req.setApplyUser(applyUser);
        zc703206Req.setApplyNote(applyNote);
        return BizConnecter.getBizData("703206",
            JsonUtils.object2Json(zc703206Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean redBlueSearchEdit(String rbNo, String checkUser,
            String checkResult, String remark) {
        if (StringUtils.isBlank(rbNo)) {
            throw new BizException("ZC703207", "申请编号不能为空");
        }
        if (StringUtils.isBlank(checkResult)) {
            throw new BizException("ZC703207", "审核结果不能为空");
        }
        if (StringUtils.isBlank(remark)) {
            throw new BizException("ZC703207", "备注不能为空");
        }
        ZC703207Res zc703207Res = new ZC703207Res();
        zc703207Res.setRbNo(rbNo);
        zc703207Res.setCheckUser(checkUser);
        zc703207Res.setCheckResult(checkResult);
        zc703207Res.setRemark(remark);
        return BizConnecter.getBizData("703207",
            JsonUtils.object2Json(zc703207Res), SuccessRes.class).isSuccess();
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

    @SuppressWarnings("rawtypes")
    @Override
    public Page querySysCheckPage(String ubNo, String refNo, String bizType,
            String checkDateStart, String checkDateEnd, String checkResult,
            String adjustUser, String adjustDatetimeStart,
            String adjustDatetimeEnd, String adjustResult, String accountNumber,
            String start, String limit, String orderColumn, String orderDir) {
        ZC703209Req zc703209Req = new ZC703209Req();
        zc703209Req.setUbNo(ubNo);
        zc703209Req.setRefNo(refNo);
        zc703209Req.setBizType(bizType);
        zc703209Req.setCheckDateStart(checkDateStart);
        zc703209Req.setCheckDateEnd(checkDateEnd);
        zc703209Req.setCheckResult(checkResult);
        zc703209Req.setAdjustUser(adjustUser);
        zc703209Req.setAdjustDatetimeStart(adjustDatetimeStart);
        zc703209Req.setAdjustDatetimeEnd(adjustDatetimeEnd);
        zc703209Req.setAdjustResult(adjustResult);
        zc703209Req.setAccountNumber(accountNumber);
        zc703209Req.setStart(start);
        zc703209Req.setLimit(limit);
        zc703209Req.setOrderColumn(orderColumn);
        zc703209Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703209",
            JsonUtils.object2Json(zc703209Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    @Override
    public boolean sysCheckEdit(String ubNo, String adjustUser,
            String adjustResult, String remark) {
        if (StringUtils.isBlank(ubNo)) {
            throw new BizException("ZC703210", "编号不能为空");
        }
        if (StringUtils.isBlank(adjustResult)) {
            throw new BizException("ZC703210", "调账结果不能为空");
        }
        if (StringUtils.isBlank(remark)) {
            throw new BizException("ZC703210", "备注不能为空");
        }
        ZC703210Res zc703210Res = new ZC703210Res();
        zc703210Res.setUbNo(ubNo);
        zc703210Res.setAdjustUser(adjustUser);
        zc703210Res.setAdjustResult(adjustResult);
        zc703210Res.setRemark(remark);
        return BizConnecter.getBizData("703210",
            JsonUtils.object2Json(zc703210Res), SuccessRes.class).isSuccess();
    }

    @Override
    public ZC703211Res getSysParam() {
        ZC703211Req zc703211Req = new ZC703211Req();
        String jsonStr = BizConnecter.getBizData("703211",
            JsonUtils.object2Json(zc703211Req));
        return JsonUtils.json2Bean(jsonStr, ZC703211Res.class);
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Page queryJourList(String sjNo, String bizType,
            String createDatetimeStart, String createDatetimeEnd,
            String accountNumber, String start, String limit,
            String orderColumn, String orderDir) {
        ZC703212Req zc703212Req = new ZC703212Req();
        zc703212Req.setSjNo(sjNo);
        zc703212Req.setBizType(bizType);
        zc703212Req.setCreateDatetimeStart(createDatetimeStart);
        zc703212Req.setCreateDatetimeEnd(createDatetimeEnd);
        zc703212Req.setAccountNumber(accountNumber);
        zc703212Req.setStart(start);
        zc703212Req.setLimit(limit);
        zc703212Req.setOrderColumn(orderColumn);
        zc703212Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703212",
            JsonUtils.object2Json(zc703212Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

}
