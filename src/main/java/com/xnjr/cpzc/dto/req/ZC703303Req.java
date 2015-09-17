/**
 * @Title ZC703303Req.java 
 * @Package com.xnjr.cpzc.dto.req 
 * @Description 
 * @author haiqingzheng  
 * @date 2015年8月21日 下午2:21:52 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * @author: haiqingzheng 
 * @since: 2015年8月21日 下午2:21:52 
 * @history:
 */
public class ZC703303Req {
    // 项目编号
    private String proId;

    // 产品众筹项目名称
    private String name;

    // 产品众筹项目类型 e.g.科技、农业、艺术...
    private String type;

    // 项目发起省份
    private String province;

    // 项目发起城市
    private String city;

    // 项目图片URL地址
    private String picture;

    // 项目介绍视频地址
    private String video;

    // 项目概况
    private String summary;

    // 项目详情
    private String detail;

    // 目标筹集金额
    private String targetAmount;

    // 筹集天数
    private String raiseDays;

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
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

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(String targetAmount) {
        this.targetAmount = targetAmount;
    }

    public String getRaiseDays() {
        return raiseDays;
    }

    public void setRaiseDays(String raiseDays) {
        this.raiseDays = raiseDays;
    }
}
