/**
 * @Title ZC703507Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年9月19日 下午2:16:23 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * @author: haiqingzheng 
 * @since: 2015年9月19日 下午2:16:23 
 * @history:
 */
public class ZC703507Req {
    // 项目ID
    private String proId;

    // 是否是热门项目
    private String isHot;

    // 是否是推荐项目
    private String isRecommend;

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(String isRecommend) {
        this.isRecommend = isRecommend;
    }
}
