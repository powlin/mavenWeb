/**
 * @Title ZC703212Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年9月20日 上午12:13:05 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/** 
 * 分页查询系统账户流水请求参数
 * @author: haiqingzheng 
 * @since: 2015年9月20日 上午12:13:05 
 * @history:
 */
public class ZC703212Req extends ABaseDO {
    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 5539336248161708622L;

    // 流水编号
    private String sjNo;

    // 流水编号
    private String ajNo;

    public String getAjNo() {
        return ajNo;
    }

    public void setAjNo(String ajNo) {
        this.ajNo = ajNo;
    }

    // 业务类型
    private String bizType;

    // 创建时间起
    private String createDatetimeStart;

    // 创建时间止
    private String createDatetimeEnd;

    // 账户编号
    private String accountNumber;

    public String getSjNo() {
        return sjNo;
    }

    public void setSjNo(String sjNo) {
        this.sjNo = sjNo;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public String getCreateDatetimeStart() {
        return createDatetimeStart;
    }

    public void setCreateDatetimeStart(String createDatetimeStart) {
        this.createDatetimeStart = createDatetimeStart;
    }

    public String getCreateDatetimeEnd() {
        return createDatetimeEnd;
    }

    public void setCreateDatetimeEnd(String createDatetimeEnd) {
        this.createDatetimeEnd = createDatetimeEnd;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

}
