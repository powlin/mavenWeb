<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script language="javascript">
	$(function(){
    	$('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    	$('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })
});  
</script> 

</head>
<body style="background:#edf6fa;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">错误提示</a></li>
    </ul>
    </div>
    <div class="error">
    <br/>
    <h1>系统错误</h1><br/>
    <h2>不好意思，系统出错，请联系管理员处理！</h2><br/>
    <h2>错误信息：${exception.message}</h2><br/>
    <div class="reindex"><a href="<%=request.getContextPath()%>/views/login.jsp" target="_parent">返回登录页</a></div>
    </div>
</body>
</html>