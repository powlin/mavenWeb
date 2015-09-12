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
		doAjax(url, data, false, "GET", 'json', fillSelSuccessBack, doError);
		
		var pId = "#pId>option";
		for(var i = 0;i < $(pId).length;i++){
			if($(pId).val() == $("#pIdHid").val()){
				$(pId).attr("selected", "selected");
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
			data['id'] = $("#id").val();
			var url = $("#base_path").val() + "/dict/edit";
			doPostAjax(url, data, doSuccessBack);
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
	
	function checkForm(){
		var value = $("#value");
		if(value.val() == ""){
			value.next().removeClass("hid");
			return false;
		}
		var pId = $("#pId");
		if(pId.val() == ""){
			pId.next().removeClass("hid");
			return false;
		}
		return true;
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/base/dictionary.htm";
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
	
	function doError(res){
		
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="pIdHid" value="${dict.pId}"/>
	<input type="hidden" id="id" value="${id}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">基础数据</a></li>
	    	<li><a href="#">数据字典</a></li>
	    	<li id="operContent">新增数据字典</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>字典信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>数据字典键:</label><label>${dict.key}</label></li>
			    <li><label><span class="inline_red">*</span>数据字典值:</label><input type="text" id="value" name="value" value="${dict.value}" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">数据字典值不能为空</span></li>
			    <li><label><span class="inline_red">*</span>数据字典父级键:</label><select id="pId" name="pId" class="dfinput" onblur="toggleMess(this)">
			    	<option value="">请选择</option>
			    	<option value="0">父级节点</option>
			    	<option value="10">父亲序号</option>
			    </select><span class="inline_red hid">数据字典父级键不能为空</span></li>
			    <li><label><span class="inline_red visibility_hid">*</span>备注:</label><input type="text" id="remark" name="remark" value="${dict.remark}" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>