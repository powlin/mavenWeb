/**
 * @Title SysUserRoleAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年9月1日 下午9:07:33 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.ISysUserRoleAO;
import com.xnjr.cpzc.dto.req.ZC703654Req;
import com.xnjr.cpzc.dto.req.ZC703665Req;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/** 
 * @author: xieyj 
 * @since: 2015年9月1日 下午9:07:33 
 * @history:
 */
@Service
public class SysUserRoleAOImpl implements ISysUserRoleAO {

    /** 
     * @see com.xnjr.cpzc.ao.ISysUserRoleAO#addUserRole(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean editUserRole(String userCode, String roleCode,
            String creator) {
        return true;
    }

    /** 
     * @see com.xnjr.cpzc.ao.ISysUserRoleAO#dropUserRole(java.lang.String)
     */
    @Override
    public boolean dropUserRole(String id) {
        // TODO Auto-generated method stub
        return false;
    }

    /** 
     * @see com.xnjr.cpzc.ao.ISysUserRoleAO#queryRoleList(java.lang.String)
     */
    @SuppressWarnings("rawtypes")
    @Override
    public List queryRoleList(String userId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean deleteUserRole(String userCode) {
        ZC703665Req zc703665Req = new ZC703665Req();
        zc703665Req.setUserCode(userCode);
        return BizConnecter.getBizData("703655",
            JsonUtils.object2Json(zc703665Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean addUserRole(String userCode, String roleCode,
            String creator) {
        ZC703654Req zc703654Req = new ZC703654Req();
        zc703654Req.setUserCode(userCode);
        zc703654Req.setRoleCode(roleCode);
        zc703654Req.setCreator(creator);
        return BizConnecter.getBizData("703654",
            JsonUtils.object2Json(zc703654Req), SuccessRes.class).isSuccess();
    }

}
