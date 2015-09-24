<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>菜单管理</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		var operate = $("#operate").val();
		if(operate == "edit"){
			$("#operContent").text("修改角色");
			var role_level = $("#role_level_hid").val();
			if(role_level != null && role_level != "0"){
				 $("select[name='role_level'] option[value='"+ role_level +"']").attr("selected", true);
			}
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
			var operator = $("#operate").val() != "edit"?"add":"edit";
			var url = $("#base_path").val() + "/sysAuth/role/" + operator;
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function checkForm(){
		var roleCode = $("#roleCode");
		if(roleCode.val() == ""){
			roleCode.next().removeClass("hid");
			return false;
		}
		var roleName = $("#roleName");
		if(roleName.val() == ""){
			roleName.next().removeClass("hid");
			return false;
		}
		var roleLevel = $("#roleLevel");
		if(roleLevel.val() == ""){
			roleLevel.next().removeClass("hid");
			return false;
		}
		return true;
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/system/role.htm";
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
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value = "${operate}"/>
	<input type="hidden" id="role_level_hid" value = "${role.roleLevel}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">用户管理</a></li>
	    	<li><a href="<%=request.getContextPath()%>/views/system/role.htm">角色设置</a></li>
	    	<li id="operContent">新增角色</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>角色信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>角色编号:</label><input type="text" id="roleCode" name="role_code" value ="${role.roleCode}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">角色编号不能为空</span></li>
			    <li><label><span class="inline_red">*</span>角色名称:</label><input type="text" id="roleName" name="role_name" value ="${role.roleName}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">角色名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>角色等级:</label>
				    <select id="roleLevel" name="role_level" class="dfinput">
						<option value="1">财务级别</option>
						<option value="2">运营推广级别</option>
						<option value="3">风控级别</option>
					</select>
				</li>
			    <li><label><span class="inline_red visibility_hid">*</span>备注:</label><input type="text" name="remark" value="${role.remark}" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>