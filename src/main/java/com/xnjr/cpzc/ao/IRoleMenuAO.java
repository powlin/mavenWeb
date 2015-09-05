/**
 * @Title IMenuRoleAO.java 
 * @Package com.ibis.pz.ao 
 * @Description 
 * @author miyb  
 * @date 2015-5-14 上午9:17:21 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703661Res;
import com.xnjr.cpzc.dto.res.ZC703664Res;

/** 
 * @author: miyb 
 * @since: 2015-5-14 上午9:17:21 
 * @history:
 */
public interface IRoleMenuAO {
    public ZC703664Res addMenuRole(String roleCode, String menuCode,
            String creator);

    public boolean dropMenuRoleByRole(String roleCode);

    public boolean editMenuRole(String id, String roleCode, String menuCode,
            String updater);

    public List<ZC703661Res> queryMenuList(String roleCode);

    public List<ZC703661Res> queryMenuList(String roleCode, String pMenuCode,
            boolean isGetChild);

    @SuppressWarnings("rawtypes")
    public Page queryRoleList(String menuCode);

}
