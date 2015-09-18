/**
 * @Title IDictAO.java 
 * @Package com.xnjr.cpzc.system 
 * @Description 
 * @author xieyj  
 * @date 2015年9月10日 上午8:50:17 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703712Res;

/** 
 * @author: xieyj 
 * @since: 2015年9月10日 上午8:50:17 
 * @history:
 */
public interface ISysParamAO {

    /**
     * @param code
     * @param name
     * @param type
     * @param start
     * @param limit
     * @param orderColumn
     * @param orderDir
     * @return 
     * @create: 2015年9月18日 下午9:45:10 yuexia
     * @history:
     */
    @SuppressWarnings("rawtypes")
    public Page querySysParamPage(String code, String name, String type,
            String start, String limit, String orderColumn, String orderDir);

    /**
     * @param code
     * @param name
     * @param type
     * @param value
     * @param remark
     * @param creator
     * @return 
     * @create: 2015年9月18日 下午10:11:41 yuexia
     * @history:
     */
    public boolean addSysParam(String code, String name, String type,
            String value, String remark, String creator);

    /**
     * @param code
     * @return 
     * @create: 2015年9月18日 下午10:48:35 yuexia
     * @history:
     */
    public ZC703712Res getSysParam(String code);

    /**
     * @param code
     * @param name
     * @param type
     * @param value
     * @param remark
     * @param updater
     * @return 
     * @create: 2015年9月18日 下午11:03:40 yuexia
     * @history:
     */
    public boolean editSysParam(String code, String name, String type,
            String value, String remark, String updater);

    /**
     * @param code
     * @return 
     * @create: 2015年9月18日 下午11:16:19 yuexia
     * @history:
     */
    public boolean dropSysParam(String code);

}
