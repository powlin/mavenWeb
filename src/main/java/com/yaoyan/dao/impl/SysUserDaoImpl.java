package com.yaoyan.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @SuppressWarnings("unchecked")
    @Override
    public List<Menu> queryRoleMenu(String pMenuCode, boolean isGetChild) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("pMenuCode", pMenuCode);
        param.put("isGetChild", isGetChild);
        return getSqlMapClientTemplate().queryForList("query-rolemenu", param);
    }

}
