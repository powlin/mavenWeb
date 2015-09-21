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
$(function(){
	$("#checkDate").text(dateFormatter($("#checkDateHid").val()));
	$("#amount").text(moneyFormatter($("#amountHid").val()));

	var data = {"pKey":"biz_type"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
	
	//提交
	$('#subBtnY').click(function(){
		submitForm(this, "1");
	});
	
	//提交
	$('#subBtnN').click(function(){
		submitForm(this, "2");
	});
});
function submitForm(e, val){
	var data = {};
	data['ubNo'] = $("#ubNo").val();
	data['adjustResult'] = val;
	var url = $("#base_path").val() + "/account/sysCheckEdit";
	doPostAjax(url, data, doSuccessBack);
}

function checkForm(){
	var remark = $("#remark");
	if(remark.val() == ""){
		remark.next().removeClass("hid");
		return false;
	}
	return true;
}

function doSuccessBackType(res){
	var data = res.data;
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#bizTypeHid").val()){
				$("#bizType").text(data[i].value);
			}
		}
	}
}

function dateFormatter(value){
	return dateFormat(value,'yyyy-MM-dd');
}
function moneyFormatter(value){
	return moneyFormat(value, 2);
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

function clickBack(){
	window.location.href = $("#base_path").val() + "/views/account/sys_check.htm";
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="ubNo" value="${sysCheck.ubNo}">
	<input type="hidden" id="checkDateHid" value="${sysCheck.checkDate}">
	<input type="hidden" id="amountHid" value="${sysCheck.amount}">
	<input type="hidden" id="bizTypeHid" value="${sysCheck.bizType}">
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
			    <li><label><span class="inline_red">*</span>不平金额:</label><label id="amount"></label></li>
			    <li><label><span class="inline_red">*</span>业务类型:</label><label id="bizType"></label></li>
			    <li><label><span class="inline_red">*</span>对账日期:</label><label id="checkDate"></label></li>
			    <li><label><span class="inline_red">*</span>对账结果:</label><label>${sysCheck.checkResult}</label></li>
			    <li><label><span class="inline_red">*</span>调账时间:</label><label>${sysCheck.adjustDatetime}</label></li>
			    <li>
			    	<input id="subBtnY" type="button" class="btn mr40" value="手工调账"/>
			    	<input id="subBtnN" type="button" class="btn mr40" value="不调账"/>
			    	<input type="button" class="btn mr40" value="返回" onclick="clickBack()"/>
			    </li>
			</ul>
	    </div>
    </form>
</body>
</html>