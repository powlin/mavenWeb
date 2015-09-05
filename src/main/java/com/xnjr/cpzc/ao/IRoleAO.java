/**
 * @Title IRoleAO.java 
 * @Package com.ibis.pz.ao 
 * @Description 
 * @author miyb  
 * @date 2015-5-14 上午9:16:25 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703643Res;

/** 
 * @author: miyb 
 * @since: 2015-5-14 上午9:16:25 
 * @history:
 */
public interface IRoleAO {
    /**
     * 新增角色
     * @param roleCode
     * @param roleName
     * @param roleLevel
     * @param creator
     * @param remark
     * @return 
     * @create: 2015年6月9日 下午9:41:52 haiqingzheng
     * @history:
     */
    public ZC703643Res addRole(String roleCode, String roleName,
            String roleLevel, String creator, String remark);

    /**
     * 删除角色
     * @param roleCode 
     * @create: 2015年3月13日 下午11:35:32 茜茜
     * @history:
     */
    public boolean dropRole(String roleCode);

    /**
     * 分页查询
     * @param roleCode
     * @param roleLevel
     * @param createDatetimeStart
     * @param createDatetimeEnd
     * @param start
     * @param limit
     * @param orderColumn
     * @param orderDir
     * @return 
     * @create: 2015年6月9日 下午10:13:18 haiqingzheng
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public Page queryRolePage(String roleCode, String roleLevel,
            String createDatetimeStart, String createDatetimeEnd, String start,
            String limit, String orderColumn, String orderDir);

    /**
     * 按条件获取所有的角色
     * @param roleCode
     * @param roleLevel    
     * @param createDatetimeStart    
     * @param createDatetimeEnd    
     * @return 
     * @create: 2015年3月14日 下午5:24:42 茜茜
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public List queryRoleList(String roleCode, String roleLevel,
            String createDatetimeStart, String createDatetimeEnd);

    /**
     * 修改角色基本信息
     * @param roleCode
     * @param roleName
     * @param roleLevel
     * @param updater
     * @param remark 
     * @create: 2015年3月15日 上午11:05:47 茜茜
     * @history:
     */
    public boolean editRole(String roleCode, String roleName, String roleLevel,
            String updater, String remark);

    /**
     * 
     * @param userCode
     * @return 
     * @create: 2015年9月4日 下午2:03:28 yuexia
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public List queryUserRoleList(String userCode);
}
