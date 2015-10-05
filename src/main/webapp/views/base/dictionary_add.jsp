<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>基础数据</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		var data = {};
		data['pId'] = '0';
		var url = $("#base_path").val() + "/dict/list";
		doGetAjax(url, data, fillSelSuccessBack);
		
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
			var url = $("#base_path").val() + "/dict/add";
			doPostAjax(url, data, doSuccessBack);
		});
		
		$("#jsForm").validate({
			rules: {
				key: {
					required: true,
					maxlength: 32
				},
				value: {
					required: true,
					maxlength: 64
				},
				pId: {
					required: true,
					maxlength: 11
				},
				remark: {
					maxlength: 100
				}
			},
			messages: {
				key: {
					required: "请输入字典键",
					maxlength: jQuery.format("字典键不能大于{0}个字符")
				},
				value: {
					required: "请输入字典值",
					maxlength: jQuery.format("字典值不能大于{0}个字符")
				},
				pId: {
					required: "请选择父级字典",
					maxlength: jQuery.format("父级字典不能大于{0}个字符")
				},
				remark: {
					maxlength: jQuery.format("备注不能大于{0}个字符")
				}
			}
		});
	});
	
	function fillSelSuccessBack(res){
		var data = res.data;
		var html = "<option value=''>请选择</option>"+"<option value='0'>父级节点</option>";
		if(typeof(data) != "undefined"){
			for(var i = 0;i < data.length;i++){
				html += "<option value='"+data[i].id+"'>"+data[i].key+"</option>";
			}
		}
		$("#pId").html(html);
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/base/dictionary_add.htm";
		}else{
			alert(res.msg);
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
	    	<li><a href="<%=request.getContextPath()%>/views/base/dictionary.htm">数据字典</a></li>
	    	<li id="operContent">新增数据字典</li>
   		</ul>
    </div>
    <form id="jsForm">
	    <div class="formbody">
	    <div class="formtitle"><span>字典信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>数据字典键:</label><input type="text" id="key" name="key" class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>数据字典值:</label><input type="text" id="value" name="value" class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>数据字典父级键:</label><select id="pId" name="pId" class="dfinput">
			    	<option value="">请选择</option>
			    	<option value="0">父级节点</option>
			    	<option value="10">父亲序号</option>
			    </select></li>
			    <li><label><span class="inline_red visibility_hid">*</span>备注:</label><input type="text" id="remark" name="remark" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>