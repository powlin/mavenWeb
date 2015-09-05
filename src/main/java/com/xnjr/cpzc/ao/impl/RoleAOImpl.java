/**
 * @Title RoleAOImpl.java 
 * @Package com.ibis.pz.ao.impl 
 * @Description 
 * @author miyb  
 * @date 2015-5-14 上午10:27:29 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.IRoleAO;
import com.xnjr.cpzc.dto.req.ZC703641Req;
import com.xnjr.cpzc.dto.req.ZC703642Req;
import com.xnjr.cpzc.dto.req.ZC703643Req;
import com.xnjr.cpzc.dto.req.ZC703645Req;
import com.xnjr.cpzc.dto.req.ZC703652Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703643Res;
import com.xnjr.cpzc.exception.BizException;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * @author: miyb
 * @since: 2015-5-14 上午10:27:29
 * @history:
 */
@Service
public class RoleAOImpl implements IRoleAO {

    /**
     * @see com.ibis.pz.ao.IRoleAO#addRole(java.lang.String, java.lang.String,
     *      java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public ZC703643Res addRole(String roleCode, String roleName,
            String roleLevel, String creator, String remark) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703643", "角色编号不能为空");
        }
        if (StringUtils.isBlank(roleName)) {
            throw new BizException("ZC703643", "角色名称不能为空");
        }
        if (StringUtils.isBlank(roleLevel)) {
            throw new BizException("ZC703643", "角色等级不能为空");
        }
        if (StringUtils.isBlank(creator)) {
            throw new BizException("ZC703643", "角色创建人ID不能为空");
        }
        ZC703643Req zc703643Req = new ZC703643Req();
        zc703643Req.setRoleCode(roleCode);
        zc703643Req.setRoleName(roleName);
        zc703643Req.setRoleLevel(roleLevel);
        zc703643Req.setCreator(creator);
        zc703643Req.setRemark(remark);
        return BizConnecter.getBizData("703643",
            JsonUtils.object2Json(zc703643Req), ZC703643Res.class);
    }

    /**
     * @see com.ibis.pz.ao.IRoleAO#dropRole(java.lang.String)
     */
    @Override
    public boolean dropRole(String roleCode) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703644", "角色编号不能为空");
        }
        return BizConnecter.getBizData("703644",
            JsonUtils.string2Json("roleCode", roleCode), SuccessRes.class)
            .isSuccess();
    }

    /**
     * @see com.ibis.pz.ao.IRoleAO#getRolePage(int, int, java.lang.String,
     *      java.lang.String, java.lang.String, java.lang.String,
     *      java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page queryRolePage(String roleCode, String roleLevel,
            String createDatetimeStart, String createDatetimeEnd, String start,
            String limit, String orderColumn, String orderDir) {
        if (StringUtils.isBlank(start)) {
            throw new BizException("ZC703641", "分页起始页码不能为空");
        }
        if (StringUtils.isBlank(limit)) {
            throw new BizException("ZC703641", "分页数量不能为空");
        }
        ZC703641Req zc703641Req = new ZC703641Req();
        zc703641Req.setRoleCode(roleCode);
        zc703641Req.setRoleLevel(roleLevel);
        zc703641Req.setDateStart(createDatetimeStart);
        zc703641Req.setDateEnd(createDatetimeEnd);
        zc703641Req.setStart(start);
        zc703641Req.setLimit(limit);
        zc703641Req.setOrderColumn(orderColumn);
        zc703641Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703641",
            JsonUtils.object2Json(zc703641Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    /**
     * @see com.ibis.pz.ao.IRoleAO#getAll(java.lang.String, java.lang.String,
     *      java.lang.String, java.lang.String, java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public List queryRoleList(String roleCode, String roleLevel,
            String createDatetimeStart, String createDatetimeEnd) {
        ZC703642Req zc703642Req = new ZC703642Req();
        zc703642Req.setRoleCode(roleCode);
        zc703642Req.setRoleLevel(roleLevel);
        zc703642Req.setDateStart(createDatetimeStart);
        zc703642Req.setDateEnd(createDatetimeEnd);
        String jsonStr = BizConnecter.getBizData("703642",
            JsonUtils.object2Json(zc703642Req));
        return JsonUtils.json2Bean(jsonStr, List.class);
    }

    /**
     * @see com.ibis.pz.ao.IRoleAO#editRole(java.lang.String, java.lang.String,
     *      java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean editRole(String roleCode, String roleName, String roleLevel,
            String updater, String remark) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC779045", "角色编号不能为空");
        }
        if (StringUtils.isBlank(roleName)) {
            throw new BizException("ZC779045", "角色名称不能为空");
        }
        if (StringUtils.isBlank(roleLevel)) {
            throw new BizException("ZC779045", "角色等级不能为空");
        }
        if (StringUtils.isBlank(updater)) {
            throw new BizException("ZC779045", "角色修改人ID不能为空");
        }

        ZC703645Req zc779045Req = new ZC703645Req();
        zc779045Req.setRoleCode(roleCode);
        zc779045Req.setRoleName(roleName);
        zc779045Req.setRoleLevel(roleLevel);
        zc779045Req.setUpdater(updater);
        zc779045Req.setRemark(remark);

        return BizConnecter.getBizData("703645",
            JsonUtils.object2Json(zc779045Req), SuccessRes.class).isSuccess();
    }

    @SuppressWarnings("rawtypes")
    @Override
    public List queryUserRoleList(String userCode) {
        ZC703652Req zc703652Req = new ZC703652Req();
        zc703652Req.setUserCode(userCode);
        String jsonStr = BizConnecter.getBizData("703652",
            JsonUtils.object2Json(zc703652Req));
        return JsonUtils.json2Bean(jsonStr, List.class);
    }

}
