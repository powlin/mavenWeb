/**
 * @Title ProjectController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年9月8日 下午11:55:55 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xnjr.cpzc.ao.IImageAO;
import com.xnjr.cpzc.ao.IProjectAO;
import com.xnjr.cpzc.ao.IReturnAO;
import com.xnjr.cpzc.ao.ISupportAO;
import com.xnjr.cpzc.dto.res.Page;
import com.xnjr.cpzc.dto.res.ZC703307Res;
import com.xnjr.cpzc.dto.res.ZC703308Res;
import com.xnjr.cpzc.dto.res.ZC703309Res;

/** 
 * @author: xieyj 
 * @since: 2015年9月8日 下午11:55:55 
 * @history:
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController extends BaseController {
    @Autowired
    IProjectAO projectAO;

    @Autowired
    ISupportAO supportAO;

    @Autowired
    IReturnAO returnAO;

    @Autowired
    IImageAO imageAO;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView doForwardView(
            @RequestParam(value = "op_status") String op_status) {
        ModelAndView view = new ModelAndView("/project/project_list");
        view.addObject("op_status", op_status);
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    public Page queryProjectPage(
            @RequestParam(value = "proId", required = false) String proId,
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "isHot", required = false) String isHot,
            @RequestParam(value = "isRecommend", required = false) String isRecommend,
            @RequestParam(value = "start", required = true) String start,
            @RequestParam(value = "limit", required = true) String limit) {
        return projectAO.queryProjectPage(proId, userId, name, type, status,
            isHot, isRecommend, start, limit);
    }

    @RequestMapping(value = "/support/search", method = RequestMethod.GET)
    public ModelAndView doSupportSearch(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "status", required = true) String status) {
        ModelAndView view = new ModelAndView("/project/support_list");
        view.addObject("proId", proId);
        view.addObject("status", status);
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/support/page", method = RequestMethod.GET)
    @ResponseBody
    public Page querySopportPage(
            @RequestParam(value = "id", required = false) String id,
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "userId", required = false) String userId,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "createDatetimeStart", required = false) String createDatetimeStart,
            @RequestParam(value = "createDatetimeEnd", required = false) String createDatetimeEnd,
            @RequestParam(value = "start", required = true) String start,
            @RequestParam(value = "limit", required = true) String limit) {
        return supportAO.querySupport(id, proId, userId, status,
            createDatetimeStart, createDatetimeEnd, start, limit);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView editProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "name", required = true) String name,
            @RequestParam(value = "type", required = true) String type,
            @RequestParam(value = "province", required = true) String province,
            @RequestParam(value = "city", required = true) String city,
            @RequestParam(value = "picture", required = true) String picture,
            @RequestParam(value = "video", required = false) String video,
            @RequestParam(value = "summary", required = true) String summary,
            @RequestParam(value = "detail", required = true) String detail,
            @RequestParam(value = "targetAmount", required = true) String targetAmount,
            @RequestParam(value = "raiseDays", required = true) String raiseDays) {
        boolean flag = projectAO.editProject(proId, name, type, province, city,
            picture, video, summary, detail, targetAmount, raiseDays);
        ModelAndView view = null;
        if (flag == true) {
            view = new ModelAndView("/project/project_approve");
            if (StringUtils.isNotBlank(proId)) {
                @SuppressWarnings("rawtypes")
                Page page = projectAO.queryProjectPage(proId, null, null, null,
                    null, null, null, "0", "10");
                if (page != null && page.getList() != null) {
                    List<ZC703309Res> returnList = returnAO
                        .getAllReturnByProId(proId);
                    view.addObject("project", page.getList().get(0));
                    view.addObject("returnList", returnList);
                }
            }
        } else {
            view = new ModelAndView("/error/error");
        }
        return view;
    }

    /**
     * 图片预览
     * @param imagePath
     * @return 
     * @create: 2015年9月24日 上午10:21:49 xieyj
     * @history:
     */
    @RequestMapping(value = "/image/preview", method = RequestMethod.POST)
    @ResponseBody
    public String doPreview(
            @RequestParam(value = "imagePath", required = true) String imagePath) {
        imagePath = "/aab.jpg";
        return imageAO.getImageStr(imagePath);
    }

    @RequestMapping(value = "/return/add", method = RequestMethod.POST)
    public ModelAndView doAddReturn(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "amount", required = true) String amount,
            @RequestParam(value = "name", required = true) String name,
            @RequestParam(value = "picture", required = true) MultipartFile picFile,
            @RequestParam(value = "summary", required = true) String summary,
            @RequestParam(value = "needLimit", required = true) String needLimit,
            @RequestParam(value = "limitNum", required = false) String limitNum,
            @RequestParam(value = "supportMaxCount", required = false) String supportMaxCount,
            @RequestParam(value = "returnType", required = true) String returnType,
            @RequestParam(value = "returnExpectedDays", required = true) String returnExpectedDays)
            throws IllegalStateException, IOException {
        supportMaxCount = "-1";
        // 图片保存
        if (picFile != null) {
            String path = servletContext.getAttribute("picUrl").toString()
                    + "/" + picFile.getOriginalFilename();
            File localFile = new File(path);
            // 写文件到本地
            picFile.transferTo(localFile);
        }

        // 数据保存
        returnAO.addReturn(proId, amount, name, picFile.getOriginalFilename(),
            summary, needLimit, limitNum, supportMaxCount, returnType,
            returnExpectedDays);
        Map<String, String> map = new HashMap<String, String>();
        map.put("proId", proId);
        map.put("operate", "approve");
        ModelAndView view = new ModelAndView("redirect:/project/check", map);
        return view;
    }

    @RequestMapping(value = "/return/edit", method = RequestMethod.POST)
    public ModelAndView doEditReturn(
            @RequestParam(value = "id", required = true) String id,
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "amount", required = true) String amount,
            @RequestParam(value = "name", required = true) String name,
            @RequestParam(value = "picture", required = false) MultipartFile picture,
            @RequestParam(value = "summary", required = true) String summary,
            @RequestParam(value = "needLimit", required = true) String needLimit,
            @RequestParam(value = "limitNum", required = false) String limitNum,
            @RequestParam(value = "supportMaxCount", required = false) String supportMaxCount,
            @RequestParam(value = "returnType", required = true) String returnType,
            @RequestParam(value = "returnExpectedDays", required = true) String returnExpectedDays) {

        supportMaxCount = "-1";
        returnAO.editReturn(id, amount, name, picture.getOriginalFilename(),
            summary, needLimit, limitNum, supportMaxCount, returnType,
            returnExpectedDays);

        Map<String, String> map = new HashMap<String, String>();
        map.put("proId", proId);
        map.put("operate", "approve");
        ModelAndView view = new ModelAndView("redirect:/project/check", map);
        return view;
    }

    @RequestMapping(value = "/return/del", method = RequestMethod.POST)
    @ResponseBody
    public ZC703307Res doDropReturn(
            @RequestParam(value = "id", required = true) String id) {
        return returnAO.dropReturn(id);
    }

    @RequestMapping(value = "/return/detail", method = RequestMethod.GET)
    public ModelAndView doGetReturn(
            @RequestParam(value = "id", required = false) String id,
            @RequestParam(value = "proId", required = false) String proId,
            @RequestParam(value = "operate", required = true) String operate) {
        ModelAndView view = new ModelAndView("/project/return_edit");
        if (operate.equals("edit")) {
            ZC703308Res res = returnAO.getReturn(id);
            view.addObject("returnDO", res);
        }
        view.addObject("proId", proId);
        return view;
    }

    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public ModelAndView doGetProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "operate", required = false) String operate) {
        String url = "/project/project_detail";
        if ("approve".equals(operate)) {
            url = "/project/project_approve";
        }
        ModelAndView view = new ModelAndView(url);
        if (StringUtils.isNotBlank(proId)) {
            Page page = projectAO.queryProjectPage(proId, null, null, null,
                null, null, null, "0", "10");
            if (page != null && page.getList() != null) {
                List<ZC703309Res> returnList = returnAO
                    .getAllReturnByProId(proId);
                view.addObject("project", page.getList().get(0));
                view.addObject("returnList", returnList);
                view.addObject("operate", operate);
            }
        }
        return view;
    }

    @RequestMapping(value = "/approve", method = RequestMethod.POST)
    @ResponseBody
    public boolean doFirstApproveProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "checkResult", required = true) String checkResult,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.firstApproveProject(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }

    @RequestMapping(value = "/flow", method = RequestMethod.POST)
    @ResponseBody
    public boolean doFlowProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.flowProject(proId,
            this.getSessionUser().getUserCode(), remark);
    }

    @RequestMapping(value = "/payAmount", method = RequestMethod.POST)
    @ResponseBody
    public boolean doPayAmountProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "firstPayAmount", required = true) String firstPayAmount,
            @RequestParam(value = "firstPayFee", required = true) String firstPayFee,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.payAmountProject(proId, this.getSessionUser()
            .getUserCode(), firstPayAmount, firstPayFee, remark);
    }

    @RequestMapping(value = "/repay", method = RequestMethod.POST)
    @ResponseBody
    public boolean doConfirmSendProject(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "checkResult", required = true) String checkResult,
            @RequestParam(value = "remark", required = true) String remark) {
        return projectAO.confirmSendOut(proId, this.getSessionUser()
            .getUserCode(), checkResult, remark);
    }
}
