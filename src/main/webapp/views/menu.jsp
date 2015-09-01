<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="../components/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../components/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){	
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
})	
</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能导航</div>
    <dl class="leftmenu">
	    <dd>
		    <div class="title">
		    <span><img src="../components/images/leftico01.png" /></span>系统管理
		    </div>
	    	<ul class="menuson">
		        <li class="active"><cite></cite><a href="<%=request.getContextPath()%>/views/system/menu_mgr.htm" target="rightFrame">菜单设置</a><i></i></li>
		        <li><cite></cite><a href="<%=request.getContextPath()%>/page/trade/system.jsp" target="rightFrame">数据字典设置</a><i></i></li>
		        <li><cite></cite><a href="#" target="rightFrame">系统参数设置</a><i></i></li>
		        <li><cite></cite><a href="#" target="rightFrame">地理区域设置</a><i></i></li>
		        <li><cite></cite><a href="#" target="rightFrame">费率配置设置</a><i></i></li>
	        </ul>
	    </dd>
	    <dd>
		    <div class="title">
		    <span><img src="../components/images/leftico02.png" /></span>用户管理
		    </div>
		    <ul class="menuson">
		        <li><cite></cite><a href="#" target="rightFrame">部门设置</a><i></i></li>
		        <li><cite></cite><a href="#" target="rightFrame">岗位设置</a><i></i></li>
		        <li><cite></cite><a href="<%=request.getContextPath()%>/views/system/role.htm" target="rightFrame">角色设置</a><i></i></li>
		        <li><cite></cite><a href="<%=request.getContextPath()%>/views/system/user_mgr.htm" target="rightFrame">用户设置</a><i></i></li>
		    </ul>     
	    </dd>
    </dl>
</body>
</html>
