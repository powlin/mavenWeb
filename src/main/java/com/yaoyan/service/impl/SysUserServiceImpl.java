package com.yaoyan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaoyan.dao.SysUserDao;
import com.yaoyan.domain.Menu;
import com.yaoyan.service.BaseService;
import com.yaoyan.service.SysUserService;

@Service
public class SysUserServiceImpl extends BaseService implements SysUserService {

    @Autowired
    protected SysUserDao sysUserDao;

    @Override
    public Boolean login(String loginName, String loginPwd) {
        return true;
    }

    @Override
    public List<Menu> queryBannerListValidate() {
        return sysUserDao.queryBannerListValidate();
    }

    @Override
    public void queryBannerListForTest() {
        sysUserDao.queryBannerListForTest();
    }

}
