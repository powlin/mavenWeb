/**
 * @Title ZC703505Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年9月7日 下午2:15:02 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * @author: haiqingzheng 
 * @since: 2015年9月7日 下午2:15:02 
 * @history:
 */
public class ZC703505Req {
    private String proId;

    private String checkUser;

    private String checkResult;

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
