package com.xnjr.cpzc.dto.req;

/**
 * 数据字典修改
 * @author: yuexia 
 * @since: 2015年9月12日 下午9:54:39 
 * @history:
 */
public class ZC703705Req {
    private String id;

    // 数据字典值
    private String value;

    // 数据字典父级键
    private String pId;

    // 备注
    private String remark;

    // 修改人
    private String updater;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

}
