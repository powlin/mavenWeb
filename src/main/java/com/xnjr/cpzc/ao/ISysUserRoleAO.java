/**
 * @Title IUserRoleAO.java 
 * @Package com.ibis.pz.ao 
 * @Description 
 * @author miyb  
 * @date 2015-5-14 上午9:17:07 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

/** 
 * @author: miyb 
 * @since: 2015-5-14 上午9:17:07 
 * @history:
 */
public interface ISysUserRoleAO {
    public boolean editUserRole(String userCode, String roleCode, String creator);

    public boolean dropUserRole(String id);

    @SuppressWarnings("rawtypes")
    public List queryRoleList(String userId);

}
