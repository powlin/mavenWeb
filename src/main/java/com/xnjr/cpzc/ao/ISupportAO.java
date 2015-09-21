/**
 * @Title ISupportAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:15:57 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;

/**
 * 支持记录
 * 
 * @author: xieyj
 * @since: 2015年8月22日 上午8:15:57
 * @history:
 */
public interface ISupportAO {

    @SuppressWarnings("rawtypes")
    public Page querySupport(String id, String proId, String userId,
            String status, String createDatetimeStart,
            String createDatetimeEnd, String start, String limit);
}
