/**
 * @Title SysUserAOImpl.java 
 * @Package com.xnjr.cpzc.ao.impl 
 * @Description 
 * @author xieyj  
 * @date 2015年8月17日 上午10:44:49 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.xnjr.cpzc.ao.ISysUserAO;
import com.xnjr.cpzc.dto.req.ZC703171Req;
import com.xnjr.cpzc.dto.req.ZC703173Req;
import com.xnjr.cpzc.dto.req.ZC703174Req;
import com.xnjr.cpzc.dto.req.ZC703175Req;
import com.xnjr.cpzc.dto.req.ZC703176Req;
import com.xnjr.cpzc.dto.req.ZC703654Req;
import com.xnjr.cpzc.dto.req.ZC703665Req;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.SuccessRes;
import com.xnjr.cpzc.exception.BizException;
import com.xnjr.cpzc.http.BizConnecter;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * 系统用户模块
 * @author: xieyj 
 * @since: 2015年8月16日 下午2:32:15 
 * @history:
 */
@Service
public class SysUserAOImpl implements ISysUserAO {

    @Override
    public boolean login(String loginName, String loginPwd, String loginIp) {
        if (StringUtils.isBlank(loginName)) {
            throw new BizException("ZC703176", "登录名不能为空");
        }
        if (StringUtils.isBlank(loginPwd)) {
            throw new BizException("ZC703176", "密码不能为空");
        }
        ZC703176Req zc703176Req = new ZC703176Req();
        zc703176Req.setUserCode(loginName);
        zc703176Req.setPassword(loginPwd);
        zc703176Req.setLoginIp(loginIp);
        return BizConnecter.getBizData("703176",
            JsonUtils.object2Json(zc703176Req), SuccessRes.class).isSuccess();
    }

    @SuppressWarnings("rawtypes")
    @Override
    public Page queryMenuPage(String userCode, String userName, String status,
            String start, String limit, String orderColumn, String orderDir) {
        ZC703175Req zc703175Req = new ZC703175Req();
        zc703175Req.setUserCode(userCode);
        zc703175Req.setUserName(userName);
        zc703175Req.setStatus(status);
        zc703175Req.setStart(start);
        zc703175Req.setLimit(limit);
        zc703175Req.setOrderColumn(orderColumn);
        zc703175Req.setOrderDir(orderDir);
        String jsonStr = BizConnecter.getBizData("703175",
            JsonUtils.object2Json(zc703175Req));
        return JsonUtils.json2Bean(jsonStr, Page.class);
    }

    @SuppressWarnings("rawtypes")
    @Override
    public List queryUserList(String userCode, String userName, String status) {
        ZC703174Req zc703174Req = new ZC703174Req();
        zc703174Req.setUserCode(userCode);
        zc703174Req.setUserName(userName);
        zc703174Req.setStatus(status);
        String jsonStr = BizConnecter.getBizData("703174",
            JsonUtils.object2Json(zc703174Req));
        return JsonUtils.json2Bean(jsonStr, List.class);
    }

    @Override
    public boolean addUser(String userCode, String userName, String password,
            String creator) {
        ZC703171Req zc703171Req = new ZC703171Req();
        zc703171Req.setUserCode(userCode);
        zc703171Req.setUserName(userName);
        zc703171Req.setPassword(password);
        zc703171Req.setCreator(creator);
        return BizConnecter.getBizData("703171",
            JsonUtils.object2Json(zc703171Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean editUserPas(String userCode, String oldPwd, String newPwd,
            String updater) {
        if (StringUtils.isBlank(userCode)) {
            throw new BizException("ZC703172", "用户编号不能为空");
        }
        if (StringUtils.isBlank(oldPwd)) {
            throw new BizException("ZC703172", "旧密码不能为空");
        }
        if (StringUtils.isBlank(newPwd)) {
            throw new BizException("ZC703172", "新密码不能为空");
        }
        if (StringUtils.isBlank(updater)) {
            throw new BizException("ZC703172", "角色修改人ID不能为空");
        }

        ZC703176Req zc703176Req = new ZC703176Req();
        zc703176Req.setUserCode(userCode);
        zc703176Req.setOldPwd(oldPwd);
        zc703176Req.setNewPwd(newPwd);
        zc703176Req.setUpdater(updater);

        return BizConnecter.getBizData("703172",
            JsonUtils.object2Json(zc703176Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean editUserSta(String userCode, String status, String updater) {
        ZC703173Req zc703173Req = new ZC703173Req();
        zc703173Req.setUserCode(userCode);
        zc703173Req.setStatus(status);
        zc703173Req.setUpdater(updater);
        return BizConnecter.getBizData("703173",
            JsonUtils.object2Json(zc703173Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean addUserRole(String userCode, String roleCode,
            String creator) {
        ZC703654Req zc703654Req = new ZC703654Req();
        zc703654Req.setUserCode(userCode);
        zc703654Req.setRoleCode(roleCode);
        zc703654Req.setCreator(creator);
        return BizConnecter.getBizData("703654",
            JsonUtils.object2Json(zc703654Req), SuccessRes.class).isSuccess();
    }

    @Override
    public boolean deleteUserRole(String userCode) {
        ZC703665Req zc703665Req = new ZC703665Req();
        zc703665Req.setUserCode(userCode);
        return BizConnecter.getBizData("703655",
            JsonUtils.object2Json(zc703665Req), SuccessRes.class).isSuccess();
    }
}
