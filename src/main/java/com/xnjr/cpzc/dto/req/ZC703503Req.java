/**
 * @Title ZC703503Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年9月5日 下午4:25:45 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * @author: haiqingzheng 
 * @since: 2015年9月5日 下午4:25:45 
 * @history:
 */
public class ZC703503Req {
    private String proId;

    private String checkUser;

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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
