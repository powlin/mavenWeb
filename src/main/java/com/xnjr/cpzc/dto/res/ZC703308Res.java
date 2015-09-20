/**
 * @Title ZC703308Res.java 
 * @Package com.xnjr.cpzc.dto.res 
 * @Description 
 * @author Administrator  
 * @date 2015年8月31日 下午11:00:43 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/**
 * @author: hongyang
 * @since: 2015年8月31日 下午11:00:43
 * @history:
 */
public class ZC703308Res {
	/* 回报编号 */
	private String id;
	/* 所属项目编号 */
	private String proId;
	/* 回报金额 */
	private String amount;
	/* 回报名称 */
	private String name;
	/* 回报图片 */
	private String picture;
	/* 是否需要限制人数 */
	private String needLimit;
	/* 限制人数的多少 */
	private String limitNum;
	/* supportMaxCount */
	private String supportMaxCount;
	/* 回报类型 */
	private String returnType;
	/* 回报天数 */
	private String returnExpectedDays;

	public ZC703308Res() {
		super();
	}

	public ZC703308Res(String id, String proId, String amount, String name,
			String picture, String needLimit, String limitNum,
			String supportMaxCount, String returnType, String returnExpectedDays) {
		super();
		this.id = id;
		this.proId = proId;
		this.amount = amount;
		this.name = name;
		this.picture = picture;
		this.needLimit = needLimit;
		this.limitNum = limitNum;
		this.supportMaxCount = supportMaxCount;
		this.returnType = returnType;
		this.returnExpectedDays = returnExpectedDays;
	}

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
