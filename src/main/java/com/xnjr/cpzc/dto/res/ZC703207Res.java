package com.xnjr.cpzc.dto.res;

/**
 * 红冲蓝补审核
 * @author: yuexia 
 * @since: 2015年9月11日 下午10:34:59 
 * @history:
 */
public class ZC703207Res {
    // 红冲蓝补申请编号
    private String rbNo;

    // 审核人ID
    private String checkUser;

    // 审核结果
    private String checkResult;

    // 备注
    private String remark;

    public String getRbNo() {
        return rbNo;
    }

    public void setRbNo(String rbNo) {
        this.rbNo = rbNo;
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser;
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
