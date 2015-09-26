<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>系统参数新增</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		var data = {"pKey":"param_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		
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
			var url = $("#base_path").val() + "/sysParam/add";
			doPostAjax(url, data, doSuccessBack);
		});
	});

	function doSuccessBackType(res){
		var data = res.data;
		var html = "";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#type").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#type").html(html);
	}
	
	function checkForm(){
		var code = $("#code");
		if(code.val() == ""){
			code.next().removeClass("hid");
			return false;
		}
		var name = $("#name");
		if(name.val() == ""){
			name.next().removeClass("hid");
			return false;
		}
		var value = $("#value");
		if(value.val() == ""){
			value.next().removeClass("hid");
			return false;
		}
		var remark = $("#remark");
		if(remark.val() == ""){
			remark.next().removeClass("hid");
			return false;
		}
		return true;
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/base/sys_param_edit.htm";
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
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">基础数据</a></li>
	    	<li><a href="#">系统参数</a></li>
	    	<li>参数新增</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>参数信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>参数编号:</label><input type="text" id="code" name="code" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">参数编号不能为空</span></li>
			    <li><label><span class="inline_red">*</span>参数名称:</label><input type="text" id="name" name="name" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">参数名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>参数类型:</label><select id="type" name="type" class="dfinput" onblur="toggleMess(this)">
			    </select><span class="inline_red hid">参数类型不能为空</span></li>
			    <li><label><span class="inline_red">*</span>参数值:</label><input type="text" id="value" name="value" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">参数值不能为空</span></li>
			    <li><label><span class="inline_red">*</span>备注:</label><input type="text" id="remark" name="remark" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">备注不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>