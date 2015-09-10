package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IDictAO;
import com.xnjr.cpzc.dto.req.ZC703701Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * @author: xieyj 
 * @since: 2015年9月10日 上午8:51:03 
 * @history:
 */
@Service
public class DictAOImpl implements IDictAO {

    /**
     * @see com.xnjr.cpzc.support.ICollectAO#queryCollectPage(int, int, java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page queryDictPage(String key, String value, String pKey,
            String pValue, int start, int limit) {
        ZC703701Req zc703701Req = new ZC703701Req();
        zc703701Req.setKey(key);
        zc703701Req.setValue(value);
        zc703701Req.setpKey(pKey);
        zc703701Req.setpValue(pValue);
        return BizConnecter.getBizData("703701",
            JsonUtils.object2Json(zc703701Req), Page.class);
    }

    /** 
     * @see com.xnjr.cpzc.system.IDictAO#queryDictList(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public List queryDictList(String key, String value, String pKey,
            String pValue) {
        ZC703701Req zc703701Req = new ZC703701Req();
        zc703701Req.setKey(key);
        zc703701Req.setValue(value);
        zc703701Req.setpKey(pKey);
        zc703701Req.setpValue(pValue);
        return BizConnecter.getBizData("703702",
            JsonUtils.object2Json(zc703701Req), List.class);
    }

}
