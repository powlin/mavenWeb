/**
 * @Title ProjectTagAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年9月22日 上午12:10:07 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IProjectTagAO;
import com.xnjr.cpzc.dto.req.ZC703507Req;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * @author: xieyj 
 * @since: 2015年9月22日 上午12:10:07 
 * @history:
 */
@Service
public class ProjectTagAOImpl implements IProjectTagAO {

    /** 
     * @see com.xnjr.cpzc.ao.IProjectTagAO#getDetail(java.lang.String)
     */
    @Override
    public Object getDetail(String proId) {
        return BizConnecter.getBizData("703506",
            JsonUtils.string2Json("proId", proId), Object.class);
    }

    /** 
     * @see com.xnjr.cpzc.ao.IProjectTagAO#editProjectTag(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean editProjectTag(String proId, String isHot, String isRecommend) {
        ZC703507Req req = new ZC703507Req();
        req.setProId(proId);
        req.setIsHot(isHot);
        req.setIsRecommend(isRecommend);
        return BizConnecter.getBizData("703507", JsonUtils.object2Json(req),
            SuccessRes.class).isSuccess();
    }
}
