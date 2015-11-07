package com.yaoyan.service.impl;

import org.springframework.stereotype.Service;

import com.yaoyan.service.BaseService;
import com.yaoyan.service.SysUserService;

@Service
public class SysUserServiceImpl extends BaseService implements SysUserService {

    @Override
    public Boolean login(String loginName, String loginPwd) {
        return true;
    }

}
