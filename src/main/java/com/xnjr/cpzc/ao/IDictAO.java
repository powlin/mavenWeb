/**
 * @Title IDictAO.java 
 * @Package com.xnjr.cpzc.system 
 * @Description 
 * @author xieyj  
 * @date 2015年9月10日 上午8:50:17 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.Page;

/** 
 * @author: xieyj 
 * @since: 2015年9月10日 上午8:50:17 
 * @history:
 */
public interface IDictAO {
    /**
     * @param start
     * @param limit
     * @param condition
     * @return 
     * @create: 2015年9月10日 上午8:56:42 xieyj
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public Page queryDictPage(String key, String value, String pKey,
            String pValue, int start, int limit);

    /**
     * @param key
     * @param value
     * @param pKey
     * @param pValue
     * @return 
     * @create: 2015年9月10日 上午8:57:42 xieyj
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public List queryDictList(String key, String value, String pKey,
            String pValue);

}
