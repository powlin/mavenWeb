/**
 * @Title ZC703306Res.java 
 * @Package com.xnjr.cpzc.dto.res 
 * @Description 
 * @author Administrator  
 * @date 2015年8月27日 上午12:05:42 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/**
 * @author: hongyang
 * @since: 2015年8月27日 上午12:05:42
 * @history:
 */
public class ZC703306Res {
	/* 是否成功 */
	private Boolean isSuccess;

	public ZC703306Res() {
		super();
	}

	public ZC703306Res(Boolean isSuccess) {
		super();
		this.isSuccess = isSuccess;
	}

	public Boolean getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

}
