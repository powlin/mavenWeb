package com.xnjr.cpzc.ao.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.ISysParamAO;
import com.xnjr.cpzc.dto.req.ZC703711Req;
import com.xnjr.cpzc.dto.req.ZC703712Req;
import com.xnjr.cpzc.dto.req.ZC703713Req;
import com.xnjr.cpzc.dto.req.ZC703714Req;
import com.xnjr.cpzc.dto.req.ZC703715Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703712Res;
import com.xnjr.cpzc.exception.BizException;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * @author: yuexia 
 * @since: 2015年9月12日 下午9:52:32
 * @history:
 */
@Service
public class SysParamAOImpl implements ISysParamAO {

    @SuppressWarnings("rawtypes")
    @Override
    public Page querySysParamPage(String code, String name, String type,
            String start, String limit, String orderColumn, String orderDir) {
        ZC703711Req zc703711Req = new ZC703711Req();
        zc703711Req.setCode(code);
        zc703711Req.setName(name);
        zc703711Req.setType(type);
        zc703711Req.setStart(start);
        zc703711Req.setLimit(limit);
        zc703711Req.setOrderColumn(orderColumn);
        zc703711Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703711",
            JsonUtils.object2Json(zc703711Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    @Override
    public boolean addSysParam(String code, String name, String type,
            String value, String remark, String creator) {
        if (StringUtils.isBlank(code)) {
            throw new BizException("ZC703713", "参数编号");
        }
        if (StringUtils.isBlank(name)) {
            throw new BizException("ZC703713", "参数名称");
        }
        if (StringUtils.isBlank(type)) {
            throw new BizException("ZC703713", "参数类型");
        }
        if (StringUtils.isBlank(value)) {
            throw new BizException("ZC703713", "参数值");
        }
        ZC703713Req zc703713Req = new ZC703713Req();
        zc703713Req.setCode(code);
        zc703713Req.setName(name);
        zc703713Req.setType(type);
        zc703713Req.setValue(value);
        zc703713Req.setRemark(remark);
        zc703713Req.setCreator(creator);
        return BizConnecter.getBizData("703713",
            JsonUtils.object2Json(zc703713Req), SuccessRes.class).isSuccess();
    }

    @Override
    public ZC703712Res getSysParam(String code) {
        ZC703712Req zc703712Req = new ZC703712Req();
        zc703712Req.setCode(code);
        String jsonStr = BizConnecter.getBizData("703712",
            JsonUtils.object2Json(zc703712Req));
        return JsonUtils.json2Bean(jsonStr, ZC703712Res.class);
    }

    @Override
    public boolean editSysParam(String code, String name, String type,
            String value, String remark, String updater) {
        ZC703714Req zc703714Req = new ZC703714Req();
        zc703714Req.setCode(code);
        zc703714Req.setName(name);
        zc703714Req.setType(type);
        zc703714Req.setValue(value);
        zc703714Req.setRemark(remark);
        zc703714Req.setUpdater(updater);
        return BizConnecter.getBizData("703714",
            JsonUtils.object2Json(zc703714Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean dropSysParam(String code) {
        ZC703715Req zc703715Req = new ZC703715Req();
        zc703715Req.setCode(code);
        return BizConnecter.getBizData("703715",
            JsonUtils.object2Json(zc703715Req), SuccessRes.class).isSuccess();
    }
}
