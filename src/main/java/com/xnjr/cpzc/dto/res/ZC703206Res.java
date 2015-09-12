package com.xnjr.cpzc.dto.res;

/**
 * 红冲蓝补申请
 * @author: yuexia 
 * @since: 2015年9月11日 下午8:25:48 
 * @history:
 */
public class ZC703206Res {
    // 账户编号
    private String accountNumber;

    // 金额
    private String amount;

    // 申请人ID
    private String applyUser;

    // 申请理由
    private String applyNote;

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(String applyUser) {
        this.applyUser = applyUser;
    }

    public String getApplyNote() {
        return applyNote;
    }

    public void setApplyNote(String applyNote) {
        this.applyNote = applyNote;
    }

}
