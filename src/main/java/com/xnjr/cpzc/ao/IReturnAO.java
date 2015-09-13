/**
 * @Title IReturnModeAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:23:50 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.ZC703309Res;

/** 
 * 回报模式
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:23:50 
 * @history:
 */
public interface IReturnAO {

    public List<ZC703309Res> queryReturnList(String prodId);
}
