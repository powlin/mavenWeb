<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户管理</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		
		/* var data = {};
		data['role_code'] = "";
		data['role_level'] = "";
		data['create_datetime_start'] = "";
		data['create_datetime_end'] = "";
		var url = $("#base_path").val() + "/sysAuth/role/list";
		doGetAjax(url, data, doQueryRoleListSuccessBack); */
		
		var operate = $("#operate").val();
		if(operate == "edit"){
			$("#operContent").text("新增用户");
		}
		
		//提交
		$('#subBtn').click(function() {
			if(!checkForm()){
				return false;
			}
			var data = {};
			var t = $('form').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			/* var operator = $("#operate").val() != "edit"?"add":"edit"; */
			var url = $("#base_path").val() + "/sysUser/user/add";
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function checkForm(){
		var userCode = $("#userCode");
		if(userCode.val() == ""){
			userCode.next().removeClass("hid");
			return false;
		}
		var userName = $("#userName");
		if(userName.val() == ""){
			userName.next().removeClass("hid");
			return false;
		}
		var password = $("#password");
		if(password.val() == ""){
			password.next().removeClass("hid");
			return false;
		}
		return true;
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/system/user_mgr.htm";
		}else{
			alert(res.msg);
		}
	}
	
	function toggleMess(e){
		if($(e).val() != ""){
			$(e).next().addClass("hid");
		}else{
			$(e).next().removeClass("hid");
		}
	}
	
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value = "${operate}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">用户管理</a></li>
	    	<li><a href="#">用户设置</a></li>
	    	<li id="operContent">新增菜单</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>用户信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>用户名:</label><input type="text" id="userCode" name="userCode" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">用户编号不能为空</span></li>
			    <li><label><span class="inline_red">*</span>用户姓名:</label><input type="text" id="userName" name="userName" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">用户姓名不能为空</span></li>
			    <li><label><span class="inline_red">*</span>新密码:</label><input type="password" id="password" name="password" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">密码不能为空</span></li>
			    <!-- <li><label>用户角色:</label><label class="roleList">正在加载...</label></li> -->
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>