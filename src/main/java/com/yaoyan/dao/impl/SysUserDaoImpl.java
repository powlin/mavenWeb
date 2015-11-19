package com.yaoyan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yaoyan.dao.BaseDao;
import com.yaoyan.dao.SysUserDao;
import com.yaoyan.domain.Menu;

@Repository
public class SysUserDaoImpl extends BaseDao implements SysUserDao {

    @SuppressWarnings("unchecked")
    @Override
    public List<Menu> queryBannerListValidate() {
        return getSqlMapClientTemplate()
            .queryForList("query-bannerlist-validate");
    }

    @Override
    public void queryBannerListForTest() {
        getSqlMapClientTemplate().queryForList("query-bannerlist-fortest");
    }

}
