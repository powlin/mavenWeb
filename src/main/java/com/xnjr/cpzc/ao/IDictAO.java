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
     * @param pId
     * @param pKey
     * @param pValue
     * @return 
     * @create: 2015年9月10日 上午8:57:42 xieyj
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public List queryDictList(String key, String value, String pId, String pKey,
            String pValue);

    /**
     * 数据字典分页查询
     * @param key
     * @param value
     * @param pKey
     * @param pValue
     * @param start
     * @param limit
     * @param orderColumn
     * @param orderDir
     * @return 
     * @create: 2015年9月12日 下午9:29:58 yuexia
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public Page queryDictPage(String key, String value, String pKey,
            String pValue, String start, String limit, String orderColumn,
            String orderDir);

    /**
     * 数据字典新增
     * @param key
     * @param value
     * @param pId
     * @param remark
     * @param creator
     * @return 
     * @create: 2015年9月12日 下午9:30:07 yuexia
     * @history:
     */
    public boolean addDict(String key, String value, String pId, String remark,
            String creator);

    /**
     * 数据字典删除
     * @param id
     * @return 
     * @create: 2015年9月12日 下午9:30:15 yuexia
     * @history:
     */
    public boolean dropDict(String id);

    /**
     * 数据字典修改
     * @param id
     * @param value
     * @param pId
     * @param remark
     * @param updater
     * @return 
     * @create: 2015年9月12日 下午9:52:32 yuexia
     * @history:
     */
    public boolean editMenu(String id, String value, String pId, String remark,
            String updater);

}
