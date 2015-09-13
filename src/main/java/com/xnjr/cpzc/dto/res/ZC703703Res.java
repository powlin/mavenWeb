package com.xnjr.cpzc.dto.res;

/**
 * 数据字典新增
 * @author: yuexia 
 * @since: 2015年9月12日 下午8:56:18 
 * @history:
 */
public class ZC703703Res {
    // 数据字典键
    private String key;

    // 数据字典值
    private String value;

    // 数据字典父级键
    private String pId;

    // 备注
    private String remark;

    // 创建人
    private String creator;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

}
