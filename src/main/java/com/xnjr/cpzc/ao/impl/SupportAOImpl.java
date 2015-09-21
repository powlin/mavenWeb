/**
 * @Title SupportAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:16:55 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.ISupportAO;
import com.xnjr.cpzc.dto.req.ZC703403Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.exception.BizException;
import com.xnjr.cpzc.http.BizConnecter;

/**
 * 支持记录
 * 
 * @author: xieyj
 * @since: 2015年8月22日 上午8:16:55
 * @history:
 */
@Service
public class SupportAOImpl implements ISupportAO {

    /** 
     * @see com.xnjr.cpzc.ao.ISupportAO#querySupport(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page querySupport(String id, String proId, String userId,
            String status, String createDatetimeStart,
            String createDatetimeEnd, String start, String limit) {
        if (StringUtils.isBlank(start)) {
            throw new BizException("ZC00001", "分页信息start不能为空");
        }
        if (StringUtils.isBlank(limit)) {
            throw new BizException("ZC00001", "分页信息limit不能为空");
        }
        ZC703403Req req = new ZC703403Req();
        req.setId(id);
        req.setProId(proId);
        req.setUserId(userId);
        req.setStatus(status);
        req.setCreateDatetimeStart(createDatetimeStart);
        req.setCreateDatetimeEnd(createDatetimeEnd);
        req.setStart(start);
        req.setLimit(limit);
        return BizConnecter.getBizData("703403",
            com.xnjr.cpzc.util.JsonUtils.object2Json(req), Page.class);
    }
}
