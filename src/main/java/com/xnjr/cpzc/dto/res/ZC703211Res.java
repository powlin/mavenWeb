package com.xnjr.cpzc.dto.res;

/**
 * @author: yuexia 
 * @since: 2015年9月20日 上午10:23:56 
 * @history:
 */
public class ZC703211Res {

    // 账户编号
    private String accountNumber;

    // 账户名称
    private String accountName;

    // 账户状态
    private String status;

    // 账户金额
    private String amount;

    // 币种
    private String currency;

    // 创建时间
    private String createDatetime;

    // 更新时间
    private String updateDatetime;

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(String createDatetime) {
        this.createDatetime = createDatetime;
    }

    public String getUpdateDatetime() {
        return updateDatetime;
    }

    public void setUpdateDatetime(String updateDatetime) {
        this.updateDatetime = updateDatetime;
    }

}
