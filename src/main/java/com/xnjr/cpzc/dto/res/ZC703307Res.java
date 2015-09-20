/**
 * @Title ZC703307Res.java 
 * @Package com.xnjr.cpzc.dto.res 
 * @Description 
 * @author Administrator  
 * @date 2015年8月28日 下午9:37:17 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/**
 * @author: Administrator
 * @since: 2015年8月28日 下午9:37:17
 * @history:
 */
public class ZC703307Res {
	/* 是否成功 */
	private String isSuccess;

	public ZC703307Res() {
		super();
	}

	public ZC703307Res(String isSuccess) {
		super();
		this.isSuccess = isSuccess;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}

}
