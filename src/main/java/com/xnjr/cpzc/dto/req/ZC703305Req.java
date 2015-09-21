/**
 * @Title ZC703305Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author Administrator  
 * @date 2015年8月25日 下午10:55:01 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/**
 * 设置单条项目回报
 * 
 * @author: hongyang
 * @since: 2015年8月25日 下午10:55:01
 * @history:
 */
public class ZC703305Req {
    /* 项目ID */
    private String proId;

    /* 支持金额 */
    private String amount;

    /* 回报名称 */
    private String name;

    /* 回报图片 */
    private String picture;

    /* 概述 */
    private String summary;

    /* 是否需要限制人数 */
    private String needLimit;

    /* 人数限制 */
    private String limitNum;

    /* 单人最大支持次数 */
    private String supportMaxCount;

    /* 回报方式 */
    private String returnType;

    /* 预计回报时间 */
    private String returnExpectedDays;

    public ZC703305Req() {
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getNeedLimit() {
        return needLimit;
    }

    public void setNeedLimit(String needLimit) {
        this.needLimit = needLimit;
    }

    public String getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(String limitNum) {
        this.limitNum = limitNum;
    }

    public String getSupportMaxCount() {
        return supportMaxCount;
    }

    public void setSupportMaxCount(String supportMaxCount) {
        this.supportMaxCount = supportMaxCount;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public String getReturnExpectedDays() {
        return returnExpectedDays;
    }

    public void setReturnExpectedDays(String returnExpectedDays) {
        this.returnExpectedDays = returnExpectedDays;
    }

}
