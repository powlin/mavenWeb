package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/**
 * 
 * @author: yuexia 
 * @since: 2015年9月12日 下午1:29:14 
 * @history:
 */
public class ZC703208Req extends ABaseDO {

    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 6156854586175408148L;

    // 红冲蓝补申请编号
    private String rbNo;

    // 账户编号
    private String accountNumber;

    // 方向 红冲还是蓝补
    private String direction;

    // 状态
    private String status;

    // 申请人ID
    private String applyUser;

    // 审核人ID
    private String checkUser;

    // 申请时间start
    private String applyDatetimeStart;

    // 申请时间end
    private String applyDatetimeEnd;

    public String getRbNo() {
        return rbNo;
    }

    public void setRbNo(String rbNo) {
        this.rbNo = rbNo;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(String applyUser) {
        this.applyUser = applyUser;
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }

    public String getApplyDatetimeStart() {
        return applyDatetimeStart;
    }

    public void setApplyDatetimeStart(String applyDatetimeStart) {
        this.applyDatetimeStart = applyDatetimeStart;
    }

    public String getApplyDatetimeEnd() {
        return applyDatetimeEnd;
    }

    public void setApplyDatetimeEnd(String applyDatetimeEnd) {
        this.applyDatetimeEnd = applyDatetimeEnd;
    }

}
