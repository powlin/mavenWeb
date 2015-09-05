/**
 * @Title ZC703661Res.java 
 * @Package com.xnjr.cpzc.dto.res 
 * @Description 
 * @author xieyj  
 * @date 2015年9月2日 上午9:12:47 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/** 
 * @author: xieyj 
 * @since: 2015年9月2日 上午9:12:47 
 * @history:
 */
public class ZC703661Res {
    private String menuCode;

    private String menuName;

    private String menuUrl;

    private String parentCode;

    private String orderNo;

    private String remark;

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
