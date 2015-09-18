<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>系统对账处理详情</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
var adjustResultData=null;
$(function(){
	$("#checkDate").text(dateFormatter($("#checkDateHid").val()));
	var data = {"pKey":"adjust_result"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackAdjust);
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
		data['ubNo'] = $("#ubNo").val();
		var url = $("#base_path").val() + "/account/sysCheckEdit";
		doPostAjax(url, data, doSuccessBack);
	});
});

function checkForm(){
	var remark = $("#remark");
	if(remark.val() == ""){
		remark.next().removeClass("hid");
		return false;
	}
	return true;
}

function doSuccessBackAdjust(res){
	var data = res.data;
	adjustResultData = data;
	var html = "";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#adjust_result_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#adjust_result_search").html(html);
}
function dateFormatter(value){
	return dateFormat(value,'yyyy-MM-dd');
}
function toggleMess(e){
	if($(e).val() != ""){
		$(e).next().addClass("hid");
	}else{
		$(e).next().removeClass("hid");
	}
}

function doSuccessBack(res) {
	if (res.success == true) {
		alert("操作成功");
		window.location.href = $("#base_path").val() + "/views/account/sys_check.htm";
	}else{
		alert(res.msg);
	}
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="ubNo" value="${sysCheck.ubNo}">
	<input type="hidden" id="checkDateHid" value="${sysCheck.checkDate}">
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">日终清算</a></li>
	    	<li><a href="#">系统对账</a></li>
	    	<li id="operContent">系统对账处理详情</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>不平账信息</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>不平帐编号:</label><label>${sysCheck.ubNo}</label></li>
			    <li><label><span class="inline_red">*</span>支付编号:</label><label>${sysCheck.refNo}</label></li>
			    <li><label><span class="inline_red">*</span>不平金额:</label><label>${sysCheck.amount}</label></li>
			    <li><label><span class="inline_red">*</span>业务类型:</label><label>${sysCheck.bizType}</label></li>
			    <li><label><span class="inline_red">*</span>对账日期:</label><label id="checkDate"></label></li>
			    <li><label><span class="inline_red">*</span>对账结果:</label><label>${sysCheck.checkResult}</label></li>
			    <li><label><span class="inline_red">*</span>调账时间:</label><label>${sysCheck.adjustDatetime}</label></li>
			    <li><label><span class="inline_red">*</span>调账结果:</label><select id="adjust_result_search" name="adjustResult" class="dfinput"></select></li>
			    <li><label><span class="inline_red">*</span>备注:</label><input type="text" id="remark" name="remark" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">备注不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>