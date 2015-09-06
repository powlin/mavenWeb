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

import com.xnjr.cpzc.dto.res.ZC703652Res;

/** 
 * @author: miyb 
 * @since: 2015-5-14 上午9:17:07 
 * @history:
 */
public interface ISysUserRoleAO {
    public boolean editUserRole(String userCode, String roleCode, String creator);

    public boolean dropUserRole(String id);

    public List<ZC703652Res> queryRoleList(String userCode);

    /**
     * 删除用户角色
     * @param userCode
     * @return 
     * @create: 2015年9月4日 下午3:04:16 yuexia
     * @history:
     */
    public boolean deleteUserRole(String userCode);

    /**
     * 添加用户角色
     * @param userCode
     * @param roleCode
     * @param creator
     * @return 
     * @create: 2015年9月3日 上午10:18:08 yuexia
     * @history:
     */
    public boolean addUserRole(String userCode, String roleCode, String creator);

}
