/**
 * @Title MemberController_haiqing.java 
 * @Package com.ibis.pz.controller 
 * @Description 
 * @author 茜茜  
 * @date 2015年3月12日 下午11:15:22 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xnjr.cpzc.ao.IMenuAO;
import com.xnjr.cpzc.ao.IRoleAO;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703633Res;
import com.xnjr.cpzc.dto.res.ZC703643Res;

/** 
 * @author: 茜茜 
 * @since: 2015年3月12日 下午11:15:22 
 * @history:
 */

@Controller
@RequestMapping(value = "/sysAuth")
public class AuthorityController extends BaseController {
    @Autowired
    protected IRoleAO roleAO;

    @Autowired
    protected IMenuAO menuAO;

    // ******************** 角色模块 ***************************
    @RequestMapping(value = "/role/add", method = RequestMethod.POST)
    @ResponseBody
    public ZC703643Res addRole(@RequestParam("role_code") String roleCode,
            @RequestParam("role_name") String roleName,
            @RequestParam("role_level") String roleLevel,
            @RequestParam(value = "remark", required = false) String remark) {
        return roleAO.addRole(roleCode, roleName, roleLevel, this
            .getSessionUser().getUser_id(), remark);
    }

    @RequestMapping(value = "/role/edit", method = RequestMethod.POST)
    @ResponseBody
    public boolean editRole(@RequestParam("role_code") String roleCode,
            @RequestParam("role_name") String roleName,
            @RequestParam("role_level") String roleLevel,
            @RequestParam("remark") String remark) {
        return roleAO.editRole(roleCode, roleName, roleLevel, this
            .getSessionUser().getUser_id(), remark);
    }

    @RequestMapping(value = "/role/drop", method = RequestMethod.POST)
    @ResponseBody
    public boolean dropRole(@RequestParam("role_code") String roleCode) {
        return roleAO.dropRole(roleCode);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/role/list", method = RequestMethod.GET)
    @ResponseBody
    public List queryRoleList(
            @RequestParam(value = "role_code", required = false) String roleCode,
            @RequestParam(value = "role_level", required = false) String roleLevel,
            @RequestParam(value = "create_datetime_start", required = false) String createDatetimeStart,
            @RequestParam(value = "create_datetime_end", required = false) String createDatetimeEnd) {
        return roleAO.queryRoleList(roleCode, roleLevel, createDatetimeStart,
            createDatetimeEnd);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/role/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryRolePage(
            @RequestParam(value = "role_code", required = false) String roleCode,
            @RequestParam(value = "role_level", required = false) String roleLevel,
            @RequestParam(value = "create_datetime_start", required = false) String createDatetimeStart,
            @RequestParam(value = "create_datetime_end", required = false) String createDatetimeEnd,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "order_column", required = false) String orderColumn,
            @RequestParam(value = "order_dir", required = false) String orderDir) {
        return roleAO.queryRolePage(roleCode, roleLevel, createDatetimeStart,
            createDatetimeEnd, start, limit, orderColumn, orderDir);
    }

    // ******************** 菜单模块 ***************************
    @RequestMapping(value = "/menu/add", method = RequestMethod.POST)
    @ResponseBody
    public ZC703633Res addMenu(
            @RequestParam("menu_code") String menuCode,
            @RequestParam("menu_name") String menuName,
            @RequestParam("menu_url") String menuUrl,
            @RequestParam(value = "parent_code", required = false) String parentCode,
            @RequestParam("order_no") String orderNo,
            @RequestParam(value = "remark", required = false) String remark) {
        return menuAO.addMenu(menuCode, menuName, menuUrl, parentCode, orderNo,
            remark);
    }

    @RequestMapping(value = "/menu/drop", method = RequestMethod.POST)
    @ResponseBody
    public boolean dropMenu(@RequestParam("menu_code") String menuCode) {
        return menuAO.dropMenu(menuCode);
    }

    @RequestMapping(value = "/menu/edit", method = RequestMethod.POST)
    @ResponseBody
    public boolean editMenu(@RequestParam("menu_code") String menuCode,
            @RequestParam("menu_name") String menuName,
            @RequestParam("menu_url") String menuUrl,
            @RequestParam("parent_code") String parentCode,
            @RequestParam("order_no") String orderNo,
            @RequestParam("remark") String remark) {
        return menuAO.editMenu(menuCode, menuName, menuUrl, parentCode,
            orderNo, remark);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/menu/list", method = RequestMethod.GET)
    @ResponseBody
    public List queryMenuList(
            @RequestParam(value = "menu_code", required = false) String menuCode,
            @RequestParam(value = "parent_code", required = false) String parentCode) {
        return menuAO.queryMenuList(menuCode, parentCode);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/menu/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryMenuPage(
            @RequestParam(value = "menu_code", required = false) String menuCode,
            @RequestParam(value = "parent_code", required = false) String parentCode,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "order_column", required = false) String orderColumn,
            @RequestParam(value = "order_dir", required = false) String orderDir) {
        return menuAO.queryMenuPage(menuCode, parentCode, start, limit,
            orderColumn, orderDir);
    }
}
