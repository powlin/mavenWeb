package com.xnjr.cpzc.dto.req;

import com.xnjr.cpzc.dto.res.ABaseDO;

/**
 * 分页查询系统参数
 * @author: xieyj 
 * @since: 2015年9月10日 下午10:32:21 
 * @history:
 */
public class ZC703711Req extends ABaseDO {
    /** 
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = 1L;

    // 参数编号
    private String code;

    // 参数名称
    private String name;

    // 类型
    private String type;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

}
