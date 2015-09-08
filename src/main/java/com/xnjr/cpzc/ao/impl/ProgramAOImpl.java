/**
 * @Title LaunchAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:15:05 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IProgramAO;
import com.xnjr.cpzc.dto.req.ZC703405Req;
import com.xnjr.cpzc.dto.req.ZC703502Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * 发起项目
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:15:05 
 * @history:
 */
@Service
public class ProgramAOImpl implements IProgramAO {

    /** 
     * @see com.xnjr.cpzc.ao.IProgramAO#queryProgramPage(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page queryProgramPage(String proId, String userId, String name,
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
     * @see com.xnjr.cpzc.ao.IProgramAO#firstApproveProgram(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean firstApproveProgram(String proId, String checkUser,
            String checkResult, String remark) {
        ZC703502Req zc703502Req = new ZC703502Req();
        zc703502Req.setProId(proId);
        zc703502Req.setCheckUser(checkUser);
        zc703502Req.setCheckResult(checkResult);
        zc703502Req.setRemark(remark);
        return BizConnecter.getBizData("703405",
            JsonUtils.object2Json(zc703502Req), SuccessRes.class).isSuccess();
    }

}
