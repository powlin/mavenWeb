<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<jsp:include page="../components/jsp/include_f.jsp" />
<script type="text/javascript">
$(function(){
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	});
	//获取第一个菜单链接，显示左边属性
	if($("a.topmenu").length > 0){
		$("#menu0").click();
	}
	parent.frames["leftFrame"].location.href = $("#menu0").attr("href");
});
function locationReload(){
	window.parent.location.reload(true);
}
</script>
</head>
<body style="background:url(../components/images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="javascript:void(0)" onclick="locationReload()" target="_parent">
    系统首页
    	<!-- <img src="../components/images/logo.png" title="系统首页" /> -->
    </a>
    </div>
    <ul class="nav">
    	<c:forEach var="menu" items="${bannerList}" varStatus="status">     
      		<li><a id="menu${status.index}" class="topmenu" href="${menu.menuUrl}" target="leftFrame"><img src="../components/images/icon01.png" title="${menu.menuName}" /><h2>${menu.menuName}</h2></a></li>
		</c:forEach> 
    </ul>
    <div class="topright">    
    <ul>
    <li><span><img src="../components/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="../views/login.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${userCode}</span>
    <i>在线&nbsp;&nbsp;</i>
    </div>    
    
    </div>

</body>
</html>
