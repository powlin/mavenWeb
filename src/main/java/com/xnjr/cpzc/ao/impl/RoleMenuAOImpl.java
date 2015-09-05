/**
 * @Title MenuRoleAOImpl.java 
 * @Package com.ibis.pz.ao.impl 
 * @Description 
 * @author miyb  
 * @date 2015-5-14 上午10:23:11 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xnjr.cpzc.ao.IRoleMenuAO;
import com.xnjr.cpzc.dto.req.ZC703664Req;
import com.xnjr.cpzc.dto.req.ZC703666Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.dto.res.ZC703661Res;
import com.xnjr.cpzc.dto.res.ZC703664Res;
import com.xnjr.cpzc.exception.BizException;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * @author: miyb 
 * @since: 2015-5-14 上午10:23:11 
 * @history:
 */
@Service
public class RoleMenuAOImpl implements IRoleMenuAO {

    /** 
     * @see com.IRoleMenuAO.pz.ao.IMenuRoleAO#addMenuRole(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public ZC703664Res addMenuRole(String roleCode, String menuCode,
            String creator) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703664", "角色编号不能为空");
        }
        if (StringUtils.isBlank(menuCode)) {
            throw new BizException("ZC703664", "菜单编号不能为空");
        }
        if (StringUtils.isBlank(creator)) {
            throw new BizException("ZC703664", "创建用户ID不能为空");
        }

        ZC703664Req f703664Req = new ZC703664Req();
        f703664Req.setRoleCode(roleCode);
        f703664Req.setMenuCode(menuCode);
        f703664Req.setCreator(creator);

        return BizConnecter.getBizData("703664",
            JsonUtils.object2Json(f703664Req), ZC703664Res.class);
    }

    /**
     * @see com.IRoleMenuAO.pz.ao.IMenuRoleAO#dropMenuRole(java.lang.String)
     */
    @Override
    public boolean dropMenuRoleByRole(String roleCode) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703665", "角色编号不能为空");
        }
        return BizConnecter.getBizData("703665",
            JsonUtils.string2Json("roleCode", roleCode), SuccessRes.class)
            .isSuccess();
    }

    /** 
     * @see com.IRoleMenuAO.pz.ao.IMenuRoleAO#editMenuRole(java.lang.Long, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean editMenuRole(String id, String roleCode, String menuCode,
            String updater) {
        if (StringUtils.isBlank(id)) {
            throw new BizException("ZC703666", "主键ID不能为空");
        }
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703666", "角色编号不能为空");
        }
        if (StringUtils.isBlank(menuCode)) {
            throw new BizException("ZC703666", "菜单编号不能为空");
        }
        if (StringUtils.isBlank(updater)) {
            throw new BizException("ZC703666", "更新人不能为空");
        }

        ZC703666Req f703666Req = new ZC703666Req();
        f703666Req.setId(id);
        f703666Req.setRoleCode(roleCode);
        f703666Req.setMenuCode(menuCode);
        f703666Req.setUpdater(updater);

        return BizConnecter.getBizData("703666",
            JsonUtils.object2Json(f703666Req), SuccessRes.class).isSuccess();
    }

    /** 
     * @see com.IRoleMenuAO.pz.ao.IMenuRoleAO#queryMenuList(java.lang.String)
     */
    @Override
    public List<ZC703661Res> queryMenuList(String roleCode) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703661", "角色编号不能为空");
        }
        String jsonStr = BizConnecter.getBizData("703661",
            JsonUtils.string2Json("roleCode", roleCode));
        Gson gson = new Gson();
        return gson.fromJson(jsonStr, new TypeToken<List<ZC703661Res>>() {
        }.getType());
    }

    /** 
     * @see com.xnjr.cpzc.ao.IRoleMenuAO#queryMenuList(java.lang.String, java.lang.String)
     */
    @Override
    public List<ZC703661Res> queryMenuList(String roleCode, String pMenuCode,
            boolean isGetChild) {
        if (StringUtils.isBlank(roleCode)) {
            throw new BizException("ZC703661", "角色编号不能为空");
        }
        String jsonStr = BizConnecter.getBizData("703661",
            JsonUtils.string2Json("roleCode", roleCode));
        Gson gson = new Gson();
        List<ZC703661Res> list = gson.fromJson(jsonStr,
            new TypeToken<List<ZC703661Res>>() {
            }.getType());
        List<ZC703661Res> cList = new ArrayList<ZC703661Res>();
        if (!isGetChild) {
            for (ZC703661Res res : list) {
                if (pMenuCode.equals(res.getParentCode())) {
                    cList.add(res);
                }
            }
        }
        if (isGetChild) {
            for (ZC703661Res res : cList) {
                for (ZC703661Res result : list) {
                    if (res.getMenuCode().equals(result.getParentCode())) {
                        cList.add(result);
                    }
                }
            }
        }
        return cList;
    }

    /** 
     * @see com.IRoleMenuAO.pz.ao.IMenuRoleAO#queryRoleList(java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Page queryRoleList(String menuCode) {
        if (StringUtils.isBlank(menuCode)) {
            throw new BizException("ZC703662", "菜单编号不能为空");
        }
        String jsonStr = BizConnecter.getBizData("703662",
            JsonUtils.string2Json("userId", menuCode));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }
}
