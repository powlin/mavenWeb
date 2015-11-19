package com.yaoyan.dao;

import java.util.List;

import com.yaoyan.domain.Menu;

public interface SysUserDao {

    List<Menu> queryBannerListValidate();

    void queryBannerListForTest();

}
