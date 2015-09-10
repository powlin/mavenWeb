/**
 * @Title ZC703405Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年8月24日 下午1:27:40 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/** 
 * @author: haiqingzheng 
 * @since: 2015年8月24日 下午1:27:40 
 * @history:
 */
public class ZC703405Req extends ABaseDO {
    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 4322391625167447L;

    // 产品众筹项目ID
    private String proId;

    // 发起人ID
    private String userId;

    // 产品众筹项目名称
    private String name;

    // 产品众筹项目类型 e.g.科技、农业、艺术..
    private String type;

    // 项目状态
    private String status;

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}