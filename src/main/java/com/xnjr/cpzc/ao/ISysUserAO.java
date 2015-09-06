/**
 * @Title ISysUserAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月25日 下午3:07:46 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.Page;

/** 
 * 系统用户
 * @author: xieyj 
 * @since: 2015年8月25日 下午3:07:46 
 * @history:
 */
public interface ISysUserAO {

    /**
     * 用户登录
     * @param loginName 用户名
     * @param loginPwd 用户密码
     * @param loginIp ip地址
     * @return 
     * @create: 2015年8月17日 上午11:22:16 xieyj
     * @history:
     */
    public boolean login(String loginName, String loginPwd, String loginIp);

    /**
     * 查询用户
     * @param userCode
     * @param userName
     * @param status
     * @param orderDir 
     * @param orderColumn 
     * @param limit 
     * @param start 
     * @return 
     * @create: 2015年8月30日 下午8:56:36 yuexia
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public Page queryMenuPage(String userCode, String userName, String status,
            String start, String limit, String orderColumn, String orderDir);

    /**
     * 查询用户列表
     * @param userCode
     * @param userName
     * @param status
     * @return 
     * @create: 2015年8月30日 下午9:48:57 yuexia
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public List queryUserList(String userCode, String userName, String status);

    /**
     * 新增用户
     * @param userCode
     * @param userName
     * @param password
     * @param creator
     * @return 
     * @create: 2015年8月30日 下午10:28:18 yuexia
     * @history:
     */
    public boolean addUser(String userCode, String userName, String password,
            String creator);

    /**
     * 更改密码
     * @param userCode
     * @param oldPwd
     * @param newPwd
     * @param updater
     * @return 
     * @create: 2015年8月30日 下午10:42:08 yuexia
     * @history:
     */
    public boolean editUserPas(String userCode, String oldPwd, String newPwd,
            String updater);

    /**
     * 更新状态
     * @param userCode
     * @param status
     * @param updater
     * @return 
     * @create: 2015年9月1日 下午7:44:34 yuexia
     * @history:
     */
    public boolean editUserSta(String userCode, String status, String updater);

}
