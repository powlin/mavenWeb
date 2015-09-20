/**
 * @Title IReturnAO.java 
 * @Package com.xnjr.cpzc.ao 
 * @Description 
 * @author xieyj  
 * @date 2015年8月22日 上午8:23:50 
 * @version V1.0   
 */
package com.xnjr.cpzc.ao;

import java.util.List;

import com.xnjr.cpzc.dto.res.ZC703305Res;
import com.xnjr.cpzc.dto.res.ZC703306Res;
import com.xnjr.cpzc.dto.res.ZC703307Res;
import com.xnjr.cpzc.dto.res.ZC703308Res;
import com.xnjr.cpzc.dto.res.ZC703309Res;

/** 
 * 回报模式
 * @author: xieyj 
 * @since: 2015年8月22日 上午8:23:50 
 * @history:
 */
public interface IReturnAO {

    /**
     * 新增项目回报
     * @param proId
     * @param amount
     * @param name
     * @param picture
     * @param needLimit
     * @param limitNum
     * @param supportMaxCount
     * @param returnType
     * @param returnExpectedDays
     * @return 
     * @create: 2015年9月7日 下午4:42:10 haiqingzheng
     * @history:
     */
    public ZC703305Res addReturn(String proId, String amount, String name,
            String picture, String needLimit, Integer limitNum,
            Integer supportMaxCount, String returnType,
            Integer returnExpectedDays);

    /**
     * 修改项目回报
     * @param id
     * @param amount
     * @param name
     * @param picture
     * @param needLimit
     * @param limitNum
     * @param supportMaxCount
     * @param returnType
     * @param returnExpectedDays
     * @return 
     * @create: 2015年9月7日 下午4:40:16 haiqingzheng
     * @history:
     */
    public ZC703306Res editReturn(String id, Integer amount, String name,
            String picture, String needLimit, Integer limitNum,
            String supportMaxCount, String returnType, String returnExpectedDays);

    /**
     * 删除项目回报
     * @param id
     * @return 
     * @create: 2015年9月7日 下午4:42:22 haiqingzheng
     * @history:
     */
    public ZC703307Res dropReturn(String id);

    /**
     * 获取项目回报明细
     * @param id
     * @return 
     * @create: 2015年9月19日 下午11:28:45 xieyj
     * @history:
     */
    public ZC703308Res getReturn(String id);

    /**
     * 根据产品编号，获取所有回报
     * @param proId
     * @return 
     * @create: 2015年9月19日 下午11:37:35 xieyj
     * @history:
     */
    public List<ZC703309Res> getAllReturnByProId(String proId);

}
