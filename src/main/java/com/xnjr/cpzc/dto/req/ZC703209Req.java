package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/**
 * 
 * @author: yuexia 
 * @since: 2015年9月17日 下午9:03:18 
 * @history:
 */
public class ZC703209Req extends ABaseDO {

    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 7389682386866259384L;

    // 不平账编号
    private String ubNo;

    // 支付编号
    private String refNo;

    // 业务类型
    private String bizType;

    // 对账日期起
    private String checkDateStart;

    // 对账日期止
    private String checkDateEnd;

    // 对账结果
    private String checkResult;

    // 调账人编号
    private String adjustUser;

    // 调账时间start
    private String adjustDatetimeStart;

    // 调账时间end
    private String adjustDatetimeEnd;

    // 调账结果
    private String adjustResult;

    // 调账人ID
    private String accountNumber;

    public String getRefNo() {
        return refNo;
    }

    public void setRefNo(String refNo) {
        this.refNo = refNo;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public String getCheckDateStart() {
        return checkDateStart;
    }

    public void setCheckDateStart(String checkDateStart) {
        this.checkDateStart = checkDateStart;
    }

    public String getCheckDateEnd() {
        return checkDateEnd;
    }

    public void setCheckDateEnd(String checkDateEnd) {
        this.checkDateEnd = checkDateEnd;
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }

    public String getAdjustUser() {
        return adjustUser;
    }

    public void setAdjustUser(String adjustUser) {
        this.adjustUser = adjustUser;
    }

    public String getAdjustDatetimeStart() {
        return adjustDatetimeStart;
    }

    public void setAdjustDatetimeStart(String adjustDatetimeStart) {
        this.adjustDatetimeStart = adjustDatetimeStart;
    }

    public String getAdjustDatetimeEnd() {
        return adjustDatetimeEnd;
    }

    public void setAdjustDatetimeEnd(String adjustDatetimeEnd) {
        this.adjustDatetimeEnd = adjustDatetimeEnd;
    }

    public String getAdjustResult() {
        return adjustResult;
    }

    public void setAdjustResult(String adjustResult) {
        this.adjustResult = adjustResult;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public String getUbNo() {
        return ubNo;
    }

    public void setUbNo(String ubNo) {
        this.ubNo = ubNo;
    }

}
