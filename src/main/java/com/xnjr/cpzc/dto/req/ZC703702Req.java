/**
 * @Title ZC703702Req.java 
 * @Package com.ibis.account.dto.req 
 * @Description 
 * @author miyb  
 * @date 2015-5-20 下午2:03:56 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.req;

/** 
 * 查询不分页列表
 * @author: miyb 
 * @since: 2015-5-20 下午2:03:56 
 * @history:
 */
public class ZC703702Req {
    private String key;

    private String value;

    private String pKey;

    private String pValue;

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

    public String getpKey() {
        return pKey;
    }

    public void setpKey(String pKey) {
        this.pKey = pKey;
    }

    public String getpValue() {
        return pValue;
    }

    public void setpValue(String pValue) {
        this.pValue = pValue;
    }
}
