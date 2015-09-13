/**
 * @Title ProjectAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:15:05 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IProjectAO;
import com.xnjr.cpzc.dto.req.ZC703405Req;
import com.xnjr.cpzc.dto.req.ZC703502Req;
import com.xnjr.cpzc.dto.req.ZC703503Req;
import com.xnjr.cpzc.dto.req.ZC703504Req;
import com.xnjr.cpzc.dto.req.ZC703505Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * 项目管理
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:15:05 
 * @history:
 */
@Service
public class ProjectAOImpl implements IProjectAO {

    /** 
     * @see com.xnjr.cpzc.ao.IProjectAO#queryProjectPage(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page queryProjectPage(String proId, String userId, String name,
            String type, String status, String start, String limit) {
        ZC703405Req zc703405Req = new ZC703405Req();
        zc703405Req.setProId(proId);
        zc703405Req.setUserId(userId);
        zc703405Req.setName(name);
        zc703405Req.setType(type);
        zc703405Req.setStatus(status);
        zc703405Req.setStart(start);
        zc703405Req.setLimit(limit);
        return BizConnecter.getBizData("703405",
            JsonUtils.object2Json(zc703405Req), Page.class);
    }

    /** 
     * @see com.xnjr.cpzc.ao.IProjectAO#firstApproveProject(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean firstApproveProject(String proId, String checkUser,
            String checkResult, String remark) {
        ZC703502Req zc703502Req = new ZC703502Req();
        zc703502Req.setProId(proId);
        zc703502Req.setCheckUser(checkUser);
        zc703502Req.setCheckResult(checkResult);
        zc703502Req.setRemark(remark);
        return BizConnecter.getBizData("703502",
            JsonUtils.object2Json(zc703502Req), SuccessRes.class).isSuccess();
    }

    /** 
     * @see com.xnjr.cpzc.ao.IProjectAO#flowProject(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean flowProject(String proId, String checkUser, String remark) {
        ZC703503Req zc703503Req = new ZC703503Req();
        zc703503Req.setProId(proId);
        zc703503Req.setCheckUser(checkUser);
        zc703503Req.setRemark(remark);
        return BizConnecter.getBizData("703503",
            JsonUtils.object2Json(zc703503Req), SuccessRes.class).isSuccess();
    }

    /** 
     * @see com.xnjr.cpzc.ao.IProjectAO#payAmountProject(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean payAmountProject(String proId, String checkUser,
            String firstPayAmount, String firstPayFee, String remark) {
        ZC703504Req zc703504Req = new ZC703504Req();
        zc703504Req.setProId(proId);
        zc703504Req.setCheckUser(checkUser);
        zc703504Req.setFirstPayAmount(firstPayAmount);
        zc703504Req.setFirstPayFee(firstPayFee);
        zc703504Req.setRemark(remark);
        return BizConnecter.getBizData("703504",
            JsonUtils.object2Json(zc703504Req), SuccessRes.class).isSuccess();
    }

    /** 
     * @see com.xnjr.cpzc.ao.IProjectAO#confirmSendOut(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean confirmSendOut(String proId, String checkUser,
            String checkResult, String remark) {
        ZC703505Req zc703505Req = new ZC703505Req();
        zc703505Req.setProId(proId);
        zc703505Req.setCheckUser(checkUser);
        zc703505Req.setCheckResult(checkResult);
        zc703505Req.setRemark(remark);
        return BizConnecter.getBizData("703505",
            JsonUtils.object2Json(zc703505Req), SuccessRes.class).isSuccess();
    }

}