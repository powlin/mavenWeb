package com.xnjr.cpzc.dto.res;

/**
 * 回报方式
 * @author: xieyj 
 * @since: 2015年9月13日 上午9:47:05 
 * @history:
 */
public class ZC703309Res {
    // 回报编号
    private String id;

    // 项目ID
    private String proId;

    // 项目支持金额
    private Long amount;

    // 项目名称
    private String name;

    // 项目图片
    private String picture;

    // 是否需要限制人数
    private String needLimit;

    // 限制数量
    private Integer limitNum;

    // 单人最大支持次数
    private Integer supportMaxCount;

    // 回报发放方式
    private String returnType;

    // 预计项目成功后几天内发放回报
    private Integer returnExpectedDays;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
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

    public String getNeedLimit() {
        return needLimit;
    }

    public void setNeedLimit(String needLimit) {
        this.needLimit = needLimit;
    }

    public Integer getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Integer limitNum) {
        this.limitNum = limitNum;
    }

    public Integer getSupportMaxCount() {
        return supportMaxCount;
    }

    public void setSupportMaxCount(Integer supportMaxCount) {
        this.supportMaxCount = supportMaxCount;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public Integer getReturnExpectedDays() {
        return returnExpectedDays;
    }

    public void setReturnExpectedDays(Integer returnExpectedDays) {
        this.returnExpectedDays = returnExpectedDays;
    }
}
