package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;

/**
 * 
 * @author: xieyj 
 * @since: 2015年8月17日 上午10:33:42 
 * @history:
 */
public interface IAccountAO {

    @SuppressWarnings("rawtypes")
    Page queryAccountPage(String realName, String accountNumber, String status,
            String start, String limit, String orderColumn, String orderDir);

    @SuppressWarnings("rawtypes")
    Page queryAccountMoneyList(String ajNo, String bizType,
            String createDatetimeStart, String createDatetimeEnd,
            String realName, String accountNumber, String start, String limit,
            String orderColumn, String orderDir);

}
