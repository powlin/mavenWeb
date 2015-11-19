package com.yaoyan.service;

import java.util.List;

import com.yaoyan.domain.Menu;

public interface SysUserService {

    Boolean login(String loginName, String loginPwd);

    /**
     * 查询所有生效的菜单
     * @return 
     * @create: 2015年11月8日 下午5:35:51 yuexia
     * @history:
     */
    List<Menu> queryBannerListValidate();

    void queryBannerListForTest();

}
