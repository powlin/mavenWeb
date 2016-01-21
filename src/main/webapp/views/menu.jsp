<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<jsp:include page="../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		var pMenuCode = $("#pMenuCode").val();
		if(pMenuCode == null || pMenuCode == "" || pMenuCode == undefined){
			return;
		}
		var data = {"pmenuCode":pMenuCode,"isGetChild":true};
		doPostAjax($("#basePath").val() + "/sysUser/roleMenu/list", data, doSuccessMenu);
	});

	function doSuccessMenu(res) {
		var pMenuCode = $("#pMenuCode").val();
		if (res.success == true) {
			// 一级菜单
			$.each(res.data, function(i, item) {
				if(item.parentCode == pMenuCode){
	            	$(".leftmenu").append("<dd><div class=\"title\"><span><img src=\"../components/images/leftico01.png\" /></span>"+item.menuName+"</div><ul id=\""+item.menuCode+"\" class=\"menuson\"></ul>")
	            	// 二级菜单
	    			$.each(res.data, function(j, j_item) {
	    				if(item.menuCode == j_item.parentCode){
	    	            	$("#"+item.menuCode).append("<li><cite></cite><a id=\"child_menu_"+i+"\" href=\"<%=request.getContextPath()%>"+j_item.menuUrl+"\" target=\"rightFrame\">"+j_item.menuName+"</a><i></i></li>");
	    	            }
	    	        });
				}
	        });
			
			//导航切换
			$(".menuson li").click(function(){
				$(".menuson li.active").removeClass("active")
				$(this).addClass("active");
			});
			$('.title').click(function(){
				var $ul = $(this).next('ul');
				$('dd').find('ul').slideUp();
				if($ul.is(':visible')){
					$(this).next('ul').slideUp();
				}else{
					$(this).next('ul').slideDown();
				}
			});
			
			//获取第一个菜单链接，显示左边属性
			$("#child_menu_0")[0].click();
		}else{
			alert("系统异常，请重新登录");
		}
	}
	
</script>
</head>
<body style="background:#f0f9fd;">
<input type="hidden" id="basePath" value="<%=request.getContextPath()%>" />
<input type="hidden" id="pMenuCode" value="${pMenuCode}" />
	<div class="lefttop"><span></span>功能导航</div>
    <dl class="leftmenu"></dl>
</body>
</html>
