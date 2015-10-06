package com.xnjr.cpzc.ao;

import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703211Res;

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

    boolean redBlueApply(String accountNumber, String direction, String amount,
            String applyNote, String userCode);

    boolean redBlueSearchEdit(String rbNo, String checkUser,
            String checkResult, String remark);

    @SuppressWarnings("rawtypes")
    Page redBlueSearch(String rbNo, String accountNumber, String direction,
            String status, String applyUser, String checkUser,
            String applyDatetimeStart, String applyDatetimeEnd, String start,
            String limit, String orderColumn, String orderDir);

    @SuppressWarnings("rawtypes")
    Page querySysCheckPage(String ubNo, String refNo, String bizType,
            String checkDateStart, String checkDateEnd, String checkResult,
            String adjustUser, String adjustDatetimeStart,
            String adjustDatetimeEnd, String adjustResult,
            String accountNumber, String start, String limit,
            String orderColumn, String orderDir);

    boolean sysCheckEdit(String ubNo, String adjustUser, String adjustResult,
            String remark);

    ZC703211Res getSysParam();

    @SuppressWarnings("rawtypes")
    Page queryJourList(String sjNo, String bizType, String createDatetimeStart,
            String createDatetimeEnd, String accountNumber, String start,
            String limit, String orderColumn, String orderDir);

}
