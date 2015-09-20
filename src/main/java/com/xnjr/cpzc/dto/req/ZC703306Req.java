/**
 * @Title ZC703306Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author Administrator  
 * @date 2015年8月26日 下午11:59:23 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/**
 * 修改项目回报
 * 
 * @author: hongyang
 * @since: 2015年8月26日 下午11:59:23
 * @history:
 */
public class ZC703306Req {
	/* 回报Id */
	private String id;
	/* 支持金额 */
	private Integer amount;
	/* 回报名称 */
	private String name;
	/* 回报图片 */
	private String picture;
	/* 是否需要限制人数 */
	private String needLimit;
	/* 人数限制 */
	private Integer limitNum;
	/* 单人最大支持次数 */
	private String supportMaxCount;
	/* 回报方式 */
	private String returnType;
	/* 预计回报时间 */
	private String returnExpectedDays;

	public ZC703306Req() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
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
