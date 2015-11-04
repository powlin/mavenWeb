/**
 * @Title SessionUser.java 
 * @Package com.hsnet.pz.session 
 * @Description 
 * @author miyb  
 * @date 2014-8-19 下午4:46:22 
 * @version V1.0   
 */
package com.yaoyan.base.session;

/** 
 * @author: miyb 
 * @since: 2014-8-19 下午4:46:22 
 * @history:
 */
public class SessionUser extends AUserDetail {
    private String userCode;

    private String roleCode;

    public SessionUser() {
    }

    public SessionUser(String userCode) {
        this.userCode = userCode;
    }

    public SessionUser(String userCode, String roleCode) {
        this.userCode = userCode;
        this.roleCode = roleCode;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }
}
