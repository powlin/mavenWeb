package com.xnjr.cpzc.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xnjr.cpzc.ao.IMenuAO;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703632Res;
import com.xnjr.cpzc.dto.res.ZC703633Res;
import com.xnjr.cpzc.util.JsonUtils;

/**
 * 系统用户模块
 * @author: linyy 
 * @since: 2015年8月26日 下午22:51:04 
 * @history:
 */
@Controller
@RequestMapping(value = "/menumgr")
public class MenuMgrController extends BaseController {

    @Autowired
    protected IMenuAO menuAO;

    // ******** 添加菜单 *****
    @RequestMapping(value = "/menu/add", method = RequestMethod.POST)
    @ResponseBody
    public ZC703633Res addmenu(@RequestParam("menuCode") String menuCode,
            @RequestParam("menuName") String menuName,
            @RequestParam("menuUrl") String menuUrl,
            @RequestParam("parentCode") String parentCode,
            @RequestParam("orderNo") String orderNo,
            @RequestParam("remark") String remark) {
        // 添加菜单验证
        return menuAO.addMenu(menuCode, menuName, menuUrl, parentCode, orderNo,
            remark);
    }

    // ******** 修改菜单 *****
    @RequestMapping(value = "/menu/edit", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatemenu(@RequestParam("menuCode") String menuCode,
            @RequestParam("menuName") String menuName,
            @RequestParam("menuUrl") String menuUrl,
            @RequestParam("parentCode") String parentCode,
            @RequestParam("orderNo") String orderNo,
            @RequestParam("remark") String remark) {
        // 修改菜单验证
        return menuAO.editMenu(menuCode, menuName, menuUrl, parentCode, orderNo,
            remark);
    }

    // ******** 删除菜单 *****
    @RequestMapping(value = "/menu/delete", method = RequestMethod.POST)
    @ResponseBody
    public boolean deletemenu(@RequestParam("menuCode") String menuCode) {
        // 删除菜单验证
        return menuAO.dropMenu(menuCode);
    }

    // ******** 查询菜单 *****
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/menu/querymenupage", method = RequestMethod.POST)
    @ResponseBody
    public Page queryMenus(@RequestParam("menuCode") String menuCode,
            @RequestParam("parentCode") String parentCode) {
        Page queryMenuPage = menuAO.queryMenuPage(menuCode, parentCode, "", "",
            "", "");
        return queryMenuPage;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/menu/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryMenuPage(
            @RequestParam(value = "menuCode", required = false) String menuCode,
            @RequestParam(value = "parentCode", required = false) String parentCode,
            @RequestParam("start") String start,
            @RequestParam("limit") String limit,
            @RequestParam(value = "orderColumn", required = false) String orderColumn,
            @RequestParam(value = "orderDir", required = false) String orderDir) {
        return menuAO.queryMenuPage(menuCode, parentCode, start, limit,
            orderColumn, orderDir);
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/menu/detail", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView queryDetailMenu(
            @RequestParam(value = "menuCode", required = false) String menuCode,
            @RequestParam(value = "parentCode", required = false) String parentCode,
            @RequestParam("operate") String operate) {
        ModelAndView view = new ModelAndView("/system/menu_detail");
        if (StringUtils.isNotBlank(menuCode) && "edit".equals(operate)) {// 是修改则查询数据库
            List list = menuAO.queryMenuList(menuCode, parentCode);
            if (list != null && list.size() > 0) {
                view.addObject("menu", list.get(0));
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    @RequestMapping(value = "/menu/detailjson", method = RequestMethod.GET)
    @ResponseBody
    public String queryDetailMenuJson(
            @RequestParam(value = "menuCode", required = false) String menuCode) {
        List<ZC703632Res> list = menuAO.queryMenuList("", "");
        // if (menuCode != null && !"".equals(menuCode) && list != null) {
        // Iterator<ZC703632Res> iterator = list.iterator();
        // while (iterator.hasNext()) {
        // if (menuCode.equals(iterator.next().getMenuCode())) {//
        // 如果查询结果中的menuCode与页面一致，则不能选择为父节点
        // iterator.remove();
        // }
        // }
        // }
        return JsonUtils.object2Json(list);
    }

}
