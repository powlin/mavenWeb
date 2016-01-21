package com.yaoyan.dao;

import java.util.List;

import com.yaoyan.domain.Menu;

public interface SysUserDao {

    /**
     * 查询所有生效的菜单
     * @return 
     * @create: 2015年11月8日 下午5:35:51 yuexia
     * @history:
     */
    List<Menu> queryBannerListValidate();

    /**
     * 查询角色清单
     * @param pMenuCode
     * @param isGetChild
     * @return 
     * @create: 2015年12月8日 下午9:35:08 yuexia
     * @history:
     */
    List<Menu> queryRoleMenu(String pMenuCode, boolean isGetChild);

}
