/**
 * @Title ZC703205Res.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author linyy  
 * @date 2015年9月9日 下午20:50:00
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/** 
 * 资金流水查询
 * @author: linyy 
 * @since: 2015年9月9日 下午20:50:15 
 * @history:
 */
public class ZC703205Res {
    private String ajNo;

    private String bizType;

    private String refNo;

    private String transAmount;

    private String preAmount;

    private String postAmount;

    private String status;

    private String remark;

    private String createDatetime;

    private String userId;

    private String realName;

    private String accountNumber;

    public String getAjNo() {
        return ajNo;
    }

    public void setAjNo(String ajNo) {
        this.ajNo = ajNo;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public String getRefNo() {
        return refNo;
    }

    public void setRefNo(String refNo) {
        this.refNo = refNo;
    }

    public String getTransAmount() {
        return transAmount;
    }

    public void setTransAmount(String transAmount) {
        this.transAmount = transAmount;
    }

    public String getPreAmount() {
        return preAmount;
    }

    public void setPreAmount(String preAmount) {
        this.preAmount = preAmount;
    }

    public String getPostAmount() {
        return postAmount;
    }

    public void setPostAmount(String postAmount) {
        this.postAmount = postAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(String createDatetime) {
        this.createDatetime = createDatetime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

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

}
