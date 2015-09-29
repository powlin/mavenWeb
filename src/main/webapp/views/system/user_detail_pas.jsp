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
		
		var operate = $("#operate").val();
		if(operate == "edit"){
			$("#operContent").text("修改用户密码");
		}
		
		//提交
		$('#subBtn').click(function() {
		    if(!$("#jsForm").valid()){
				return false;
			}
			var data = {};
			var t = $('form').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			data['userCode'] = $("#userCodeHid").val();
			var url = $("#base_path").val() + "/sysUser/user/editPas";
			doPostAjax(url, data, doSuccessBack);
		});
		
		$("#jsForm").validate({
			rules: {
				oldPwd: {
					required: true,
					maxlength: 128
				},
				newPwd: {
					required: true,
					maxlength: 128
				}
			},
			messages: {
				oldPwd: {
					required: "请输入旧密码",
					maxlength: jQuery.format("旧密码不能大于{0}个字符")
				},
				newPwd: {
					required: "请输入新密码",
					maxlength: jQuery.format("新密码不能大于{0}个字符")
				}
			}
		});
	});
	
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
	<input type="hidden" id="userCodeHid" value = "${user.userCode}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">用户管理</a></li>
	    	<li><a href="#">用户设置</a></li>
	    	<li id="operContent">修改用户密码</li>
   		</ul>
    </div>
    <form id="jsForm">
	    <div class="formbody">
	    <div class="formtitle"><span>用户信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>用户名:</label><label>${user.userCode}</label></li>
			    <li><label><span class="inline_red">*</span>用户姓名:</label><label>${user.userName}</label></li>
			    <li><label><span class="inline_red">*</span>旧密码:</label><input type="password" id="oldPwd" name="oldPwd" value ="${user.oldPwd}"  class="dfinput" onblur="toggleMess(this)"/></li>
			    <li><label><span class="inline_red">*</span>新密码:</label><input type="password" id="newPwd" name="newPwd" value ="${user.newPwd}"  class="dfinput" onblur="toggleMess(this)"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>