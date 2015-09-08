/**
 * @Title ZC703204Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author xieyj  
 * @date 2015年8月19日 下午7:41:26 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/** 
 * 查询资金账户
 * @author: xieyj 
 * @since: 2015年8月19日 下午7:41:26 
 * @history:
 */
public class ZC703204Req extends ABaseDO {
    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 7911517227875022396L;

    // 用户真实姓名
    private String realName;

    // 账户账号
    private String accountNumber;

    // 账户状态
    private String status;

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
