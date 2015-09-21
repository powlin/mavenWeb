/**
 * @Title ZC703403.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author xieyj  
 * @date 2015年8月21日 下午7:23:38 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/** 
 * 新增支持
 * @author: xieyj 
 * @since: 2015年8月21日 下午7:23:38 
 * @history:
 */
public class ZC703403Req extends ABaseDO {
    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 1L;

    // 支持编号
    private String id;

    // 项目编号
    private String proId;

    // 投资人编号
    private String userId;

    // 回报编号
    private String returnId;

    // 状态
    private String status;

    // 创建开始时间
    private String createDatetimeStart;

    // 创建结束时间
    private String createDatetimeEnd;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public String getReturnId() {
        return returnId;
    }

    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateDatetimeStart() {
        return createDatetimeStart;
    }

    public void setCreateDatetimeStart(String createDatetimeStart) {
        this.createDatetimeStart = createDatetimeStart;
    }

    public String getCreateDatetimeEnd() {
        return createDatetimeEnd;
    }

    public void setCreateDatetimeEnd(String createDatetimeEnd) {
        this.createDatetimeEnd = createDatetimeEnd;
    }
}
