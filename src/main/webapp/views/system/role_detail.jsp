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
		var data = {"pKey":"r_level"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		var operate = $("#operate").val();
		if(operate == "edit"){
			$("#operContent").text("修改角色");
			var role_level = $("#role_level_hid").val();
			if(role_level != null && role_level != "0"){
				 $("select[name='role_level'] option[value='"+ role_level +"']").attr("selected", true);
			}
		}
		
		$("#jsForm").validate({
			rules: {
				roleCode: {
					required: true,
					maxlength: 32
				},
				roleName: {
					required: true,
					maxlength: 32
				},
				roleLevel: "required",
				remark: {
					required: true,
					maxlength: 100
				}
			},
			messages: {
				roleCode: {
					required: "请输入角色编号",
					maxlength: jQuery.format("角色编号不能大于{0}个字符")
				},
				roleName: {
					required: "请输入角色名称",
					maxlength: jQuery.format("角色名称不能大于{0}个字符")
				},
				roleLevel: "请选择角色等级",
				remark: {
					required: "请输入备注",
					maxlength: jQuery.format("备注不能大于{0}个字符")
				}
			}
		});
		
		//提交
		$('#subBtn').click(function() {
		    if(!$("#jsForm").valid()){
		    	return;
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
	
	function doSuccessBackType(res){
		var data = res.data;
		typeData = data;
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#roleLevel").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#roleLevel").html(html);
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/system/role.htm";
		}else{
			alert(res.msg);
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
	    	<li>用户管理</li>
	    	<li><a href="<%=request.getContextPath()%>/views/system/role.htm">角色设置</a></li>
	    	<li id="operContent">新增角色</li>
   		</ul>
    </div>
    <form id="jsForm">
	    <div class="formbody">
	    <div class="formtitle"><span>角色信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>角色编号:</label><input type="text" id="roleCode" name="roleCode" value ="${role.roleCode}"  class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>角色名称:</label><input type="text" id="roleName" name="roleName" value ="${role.roleName}"  class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>角色等级:</label>
				    <select id="roleLevel" name="roleLevel" class="dfinput">
					</select>
				</li>
			    <li><label><span class="inline_red ">*</span>备注:</label><input type="text" name="remark" value="${role.remark}" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>