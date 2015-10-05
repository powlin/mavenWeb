<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>系统参数修改</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {

		var data = {"pKey":"param_type"};
		var url = $("#base_path").val() + "/dict/list";
		doAjax(url, data, false, "GET", 'json', fillSelSuccessBack, doError);
		
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
			data['code'] = $("#code").val();
			var url = $("#base_path").val() + "/sysParam/edit";
			doPostAjax(url, data, doSuccessBack);
		});
		
		$("#jsForm").validate({
			rules: {
				name: {
					required: true,
					maxlength: 32
				},
				type: {
					required: true,
					maxlength: 1
				},
				value: {
					required: true,
					maxlength: 64
				},
				remark: {
					maxlength: 100
				}
			},
			messages: {
				name: {
					required: "请输入参数名称",
					maxlength: jQuery.format("参数名称不能大于{0}个字符")
				},
				type: {
					required: "请选择参数类型",
					maxlength: jQuery.format("参数类型不能大于{0}个字符")
				},
				value: {
					required: "请输入参数值",
					maxlength: jQuery.format("参数值不能大于{0}个字符")
				},
				remark: {
					maxlength: jQuery.format("备注不能大于{0}个字符")
				}
			}
		});
	});
	
	function fillSelSuccessBack(res){
		var data = res.data;
		var html = "";
		if(typeof(data) != "undefined"){
			for(var i = 0;i < data.length;i++){
				if($("#typeHid").val() == data[i].key){
					html += "<option selected = 'selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#type").html(html);
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/base/sys_param_search.htm";
		}else{
			alert(res.msg);
		}
	}
	
	function doError(res){
		
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="code" value="${sysParam.code}"/>
	<input type="hidden" id="typeHid" value="${sysParam.type}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">基础数据</a></li>
	    	<li><a href="<%=request.getContextPath()%>/views/base/sys_param_search.htm">系统参数</a></li>
	    	<li id="operContent">参数修改</li>
   		</ul>
    </div>
    <form id="jsForm">
	    <div class="formbody">
	    <div class="formtitle"><span>参数信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>参数编号:</label><label>${sysParam.code}</label></li>
			    <li><label><span class="inline_red">*</span>参数名称:</label><input type="text" id="name" name="name" value="${sysParam.name}" class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>类型:</label><select id="type" name="type" class="dfinput">
			    </select></li>
			    <li><label><span class="inline_red">*</span>参数值:</label><input type="text" id="value" name="value" value="${sysParam.value}" class="dfinput"/></li>
			    <li><label><span class="inline_red visibility_hid">*</span>备注:</label><input type="text" id="remark" name="remark" value="${sysParam.remark}" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>