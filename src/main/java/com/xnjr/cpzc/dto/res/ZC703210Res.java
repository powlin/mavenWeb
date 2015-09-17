package com.xnjr.cpzc.dto.res;

/**
 * @author: yuexia 
 * @since: 2015年9月17日 下午10:14:05 
 * @history:
 */
public class ZC703210Res {

    // 不平账编号
    private String ubNo;

    // 调账人 ID
    private String adjustUser;

    // 调账结果
    private String adjustResult;

    // 备注
    private String remark;

    public String getUbNo() {
        return ubNo;
    }

    public void setUbNo(String ubNo) {
        this.ubNo = ubNo;
    }

    public String getAdjustUser() {
        return adjustUser;
    }

    public void setAdjustUser(String adjustUser) {
        this.adjustUser = adjustUser;
    }

    public String getAdjustResult() {
        return adjustResult;
    }

    public void setAdjustResult(String adjustResult) {
        this.adjustResult = adjustResult;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
