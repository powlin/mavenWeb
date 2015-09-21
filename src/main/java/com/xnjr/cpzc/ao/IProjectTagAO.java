/**
 * @Title IProjectTagAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年9月22日 上午12:07:15 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

/** 
 * @author: xieyj 
 * @since: 2015年9月22日 上午12:07:15 
 * @history:
 */
public interface IProjectTagAO {

    /**
     * 获取具体标签
     * @param proId
     * @return 
     * @create: 2015年9月22日 上午12:09:17 xieyj
     * @history:
     */
    public Object getDetail(String proId);

    /**
     * 更改标签
     * @param proId
     * @param isHot
     * @param isRecommend
     * @return 
     * @create: 2015年9月22日 上午12:09:31 xieyj
     * @history:
     */
    public boolean editProjectTag(String proId, String isHot, String isRecommend);

}
