<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎产品众筹后台管理系统</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/components/css/style.css"/>
<script src="<%=request.getContextPath()%>/components/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/components/js/cloud.js"></script>
<script type="text/javascript">
	$(function(){
	    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){
	    	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    	});
		
		//登录
		$('#loginBtn').click(function() {
			var data = {};
			var t = $('#loginForm').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			var url = $("#base_path").val() + "/sysUser/login";
			$('#loginForm').attr("action", url).submit();
		});
		
		var em = $("#errMes").val();
		if(em != '' && typeof(em) != 'undefined'){
			alert(em);
		}
	});
	
	
</script>
</head>
<body style="background-color:#1c77ac; background-image:url(<%=request.getContextPath()%>/components/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
    <input type="hidden" id="errMes" value="${errMes}"/>
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>
	<div class="logintop">    
	    <span>欢迎登录后台管理界面平台</span>    
	    <ul>
		    <li><a href="#">回首页</a></li>
		    <li><a href="#">帮助</a></li>
		    <li><a href="#">关于</a></li>
	    </ul>    
	</div>
    <div class="loginbody">
    	<span class="systemlogo"></span>
    	<form id="loginForm" method="post">
		    <div class="loginbox">
			    <ul>
				    <li>
				    	<input name="login_name" type="text" class="loginuser"/>
				    </li>
					<li>
			        	<input name="login_pwd" type="password" class="loginpwd"/>
			        </li>
			    	<li>
			    		<input id="loginBtn" type="button" class="loginbtn" value="登录"/>
			    		<input type="checkbox" value="" checked="checked"/>记住密码
			    	</li>
		    	</ul>
	    	</div>
	   </form>
    </div>
    <div class="loginbm">版权所有  2015  <a href="＃">ommo.cn</a>杭州雄牛金融科技有限公司</div>
</body>
</html>