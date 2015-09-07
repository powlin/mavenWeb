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
		//查询所有角色列表
		var data = {};
		data['role_code'] = "";
		data['role_level'] = "";
		data['create_datetime_start'] = "";
		data['create_datetime_end'] = "";
		var url = $("#base_path").val() + "/sysAuth/role/list";
		/* doGetAjax(url, data, doQueryRoleListSuccessBack); */
		doAjax(url, data, false, "GET", 'json', doQueryRoleListSuccessBack, doError);
		
		//查询当前用户的角色
		var data1 = {};
		data1['userCode'] = $("#userCode").val();
		var url = $("#base_path").val() + "/sysAuth/user/role";
		doGetAjax(url, data1, doQueryUserRoleSuccessBack);
		
		//提交
		$('#subBtn').click(function() {
			var data = {};
			var t = $('form').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			data['userCode'] = $("#userCode").val();
			var url = $("#base_path").val() + "/sysUser/user/editRole";
			doPostAjax(url, data, doSuccessBack);
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
	
	function doQueryRoleListSuccessBack(res){
		var data = res.data;
		var html = "";
		if(typeof(data) != "undefined"){
			for(var i = 0;i < data.length;i++){
				html += "<option value='"+data[i].roleCode+"'>" + data[i].roleName + "</option>";
			}
		}
		$("select.roleList").html(html);
	}
	
	function doQueryUserRoleSuccessBack(res){
		var data = res.data;
		var roleCode = "select.roleCode>option";
		if(typeof(data) != "undefined"){
			for(var i = 0;i < $(roleCode).length;i++){
				if($(roleCode).eq(i).val() == data[0].roleCode){
					$(roleCode).eq(i).attr("selected", "selected");
				}
			}
		}
	}
	
	function doError(res){
		
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="userCode" name="userCode" value = "${user.userCode}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">用户管理</a></li>
	    	<li><a href="#">用户设置</a></li>
	    	<li id="operContent">设置角色</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>用户信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>用户编号:</label><label>${user.userCode}</label></li>
			    <li><label><span class="inline_red">*</span>用户角色:</label><select class="dfinput roleList roleCode" name="roleCode"></select></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>