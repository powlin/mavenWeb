/**
 * @Title IProjectAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:14:36 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;

/** 
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:14:36 
 * @history:
 */
public interface IProjectAO {

    @SuppressWarnings("rawtypes")
    public Page queryProjectPage(String proId, String userId, String name,
            String type, String status, String start, String limit);

    public boolean firstApproveProject(String proId, String checkUser,
            String checkResult, String remark);

    public boolean flowProject(String proId, String checkUser, String remark);

    public boolean payAmountProject(String proId, String checkUser,
            String firstPayAmount, String firstPayFee, String remark);

    public boolean confirmSendOut(String proId, String checkUser,
            String checkResult, String remark);
}
