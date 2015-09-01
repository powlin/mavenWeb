/**
 * @Title Li779065Res.java 
 * @Package com.ibis.account.dto.res 
 * @Description 
 * @author miyb  
 * @date 2015-5-20 下午2:05:41 
 * @version V1.0   
 */
package com.xnjr.cpzc.dto.res;

/** 
 * @author: miyb 
 * @since: 2015-5-20 下午2:05:41 
 * @history:
 */
public class ZC703665Res {
    // 是否成功
    private boolean isSuccess;

    public ZC703665Res() {
    }

    public ZC703665Res(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }
}
