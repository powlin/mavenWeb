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

import com.xnjr.cpzc.ao.ISysUserRoleAO;

/** 
 * @author: xieyj 
 * @since: 2015年9月1日 下午9:07:33 
 * @history:
 */
public class SysUserRoleAOImpl implements ISysUserRoleAO {

    /** 
     * @see com.xnjr.cpzc.ao.ISysUserRoleAO#addUserRole(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public boolean editUserRole(String userCode, String roleCode, String creator) {
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

}
