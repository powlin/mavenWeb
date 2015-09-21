/**
 * @Title ProjectController.java 
 * @Package com.xnjr.cpzc.controller 
 * @Description 
 * @author xieyj  
 * @date 2015年9月8日 下午11:55:55 
 * @version V1.0   
 */
package com.xnjr.cpzc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xnjr.cpzc.ao.IProjectAO;
import com.xnjr.cpzc.ao.IProjectTagAO;

/** 
 * @author: xieyj 
 * @since: 2015年9月8日 下午11:55:55 
 * @history:
 */
@Controller
@RequestMapping(value = "/projectTag")
public class ProjectTagController extends BaseController {
    @Autowired
    IProjectAO projectAO;

    @Autowired
    IProjectTagAO projectTagAO;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView doListView() {
        ModelAndView view = new ModelAndView("/project/project_all");
        view.addObject("tag", "1");
        return view;
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView doDetailView(
            @RequestParam(value = "proId", required = true) String proId) {
        ModelAndView view = new ModelAndView("/project/tag_edit");
        view.addObject("project", projectAO.getRichProject(proId));
        return view;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView doEditTag(
            @RequestParam(value = "proId", required = true) String proId,
            @RequestParam(value = "isHot", required = true) String isHot,
            @RequestParam(value = "isRecommend", required = true) String isRecommend) {
        boolean flag = projectTagAO.editProjectTag(proId, isHot, isRecommend);
        ModelAndView view = null;
        if (flag == true) {
            view = new ModelAndView("/project/project_all");
            view.addObject("tag", "1");
        } else {
            view = new ModelAndView("/error/error");
        }
        return view;
    }
}
