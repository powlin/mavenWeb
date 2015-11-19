package com.yaoyan.domain;

/** 
 * @author: linyy 
 * @since: 2015年11月08日 16:53:08
 * @history:
 */
public class Menu {
    private Integer id;

    private String menuCode;

    private String menuName;

    private String menuUrl;

    private String parentCode;

    private String orderNo;

    private String remark;

    private int status;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Menu(String menuCode, String menuName, String menuUrl,
            String parentCode, String orderNo, String remark, int status) {
        this.menuCode = menuCode;
        this.menuName = menuName;
        this.menuUrl = menuUrl;
        this.parentCode = parentCode;
        this.orderNo = orderNo;
        this.remark = remark;
        this.status = status;
    }

}
