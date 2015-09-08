/**
 * @Title ILaunchAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:14:36 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;

/** 
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:14:36 
 * @history:
 */
public interface IProgramAO {

    @SuppressWarnings("rawtypes")
    public Page queryProgramPage(String proId, String userId, String name,
            String type, String status, String start, String limit);

    public boolean firstApproveProgram(String proId, String checkUser,
            String checkResult, String remark);
}
