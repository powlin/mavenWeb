/**
 * @Title ZC703504Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年9月6日 下午3:14:33 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * @author: haiqingzheng 
 * @since: 2015年9月6日 下午3:14:33 
 * @history:
 */
public class ZC703504Req {
    private String proId;

    private String checkUser;

    private String firstPayAmount;

    private String firstPayFee;

    private String remark;

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }

    public String getFirstPayAmount() {
        return firstPayAmount;
    }

    public void setFirstPayAmount(String firstPayAmount) {
        this.firstPayAmount = firstPayAmount;
    }

    public String getFirstPayFee() {
        return firstPayFee;
    }

    public void setFirstPayFee(String firstPayFee) {
        this.firstPayFee = firstPayFee;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
