package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IDictAO;
import com.xnjr.cpzc.dto.req.ZC703701Req;
import com.xnjr.cpzc.dto.req.ZC703702Req;
import com.xnjr.cpzc.dto.req.ZC703705Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703703Res;
import com.xnjr.cpzc.dto.res.ZC703704Res;
import com.xnjr.cpzc.exception.BizException;
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
    public List queryDictList(String key, String value, String pId, String pKey,
            String pValue) {
        ZC703702Req zc703702Req = new ZC703702Req();
        zc703702Req.setKey(key);
        zc703702Req.setValue(value);
        zc703702Req.setpId(pId);
        zc703702Req.setpKey(pKey);
        zc703702Req.setpValue(pValue);
        return BizConnecter.getBizData("703702",
            JsonUtils.object2Json(zc703702Req), List.class);
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Page queryDictPage(String key, String value, String pKey,
            String pValue, String start, String limit, String orderColumn,
            String orderDir) {
        ZC703701Req zc703701Req = new ZC703701Req();
        zc703701Req.setKey(key);
        zc703701Req.setValue(value);
        zc703701Req.setpKey(pKey);
        zc703701Req.setpValue(pValue);
        zc703701Req.setStart(start);
        zc703701Req.setLimit(limit);
        zc703701Req.setOrderColumn(orderColumn);
        zc703701Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703701",
            JsonUtils.object2Json(zc703701Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    @Override
    public boolean addDict(String key, String value, String pId, String remark,
            String creator) {
        if (StringUtils.isBlank(key)) {
            throw new BizException("ZC703703", "数据字典键");
        }
        if (StringUtils.isBlank(value)) {
            throw new BizException("ZC703703", "数据字典值");
        }
        if (StringUtils.isBlank(pId)) {
            throw new BizException("ZC703703", "数据字典父级键");
        }
        ZC703703Res zc703703Req = new ZC703703Res();
        zc703703Req.setKey(key);
        zc703703Req.setValue(value);
        zc703703Req.setpId(pId);
        zc703703Req.setRemark(remark);
        zc703703Req.setCreator(creator);
        return BizConnecter.getBizData("703703",
            JsonUtils.object2Json(zc703703Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean dropDict(String id) {
        ZC703704Res zc703704Req = new ZC703704Res();
        zc703704Req.setId(id);
        return BizConnecter.getBizData("703704",
            JsonUtils.object2Json(zc703704Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean editMenu(String id, String value, String pId, String remark,
            String updater) {
        ZC703705Req zc703705Req = new ZC703705Req();
        zc703705Req.setId(id);
        zc703705Req.setValue(value);
        zc703705Req.setpId(pId);
        zc703705Req.setRemark(remark);
        zc703705Req.setUpdater(updater);
        return BizConnecter.getBizData("703705",
            JsonUtils.object2Json(zc703705Req), SuccessRes.class).isSuccess();
    }

}
