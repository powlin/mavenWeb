<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>系统账户</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
$(function(){
	var data = {};
	var url = $("#base_path").val() + "/account/sysAccount";
	doGetAjaxIsAsync(url, data, false, doGetSysAccountSuccessBack);
	
	var data = {"pKey":"a_status"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackAdjust);
	
	$("#createDatetime").text(dateFormatter($("#createDatetime").text()));
	$("#updateDatetime").text(dateFormatter($("#updateDatetime").text()));
});

function doGetSysAccountSuccessBack(res){
	$("#accountNumber").text(res.data.accountNumber);
	$("#accountName").text(res.data.accountName);
	$("#amount").text(moneyFormatter(res.data.amount));
	$("#status").text(res.data.status);
	$("#currency").text(res.data.currency);
	$("#createDatetime").text(res.data.createDatetime);
	$("#updateDatetime").text(res.data.updateDatetime);
}
function moneyFormatter(value){
	return moneyFormat(value, 2);
}

function doSuccessBackAdjust(res){
	var data = res.data;
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#status").text()){
				$("#status").text(data[i].value);
			}
		}
	}
}
function dateFormatter(value){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}

</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li>账户查询</li>
	    	<li>系统账户</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>系统账户信息</span></div>
		    <ul class="forminfo">
			    <li><label>账户编号:</label><label id="accountNumber"></label></li>
			    <li><label>账户名称:</label><label id="accountName"></label></li>
			    <li><label>币种:</label><label id="currency"></label></li>
			    <li><label>账户金额:</label><label id="amount"></label></li>
			    <li><label>账户状态:</label><label id="status"></label></li>
			    <li><label>创建时间:</label><label id="createDatetime"></label></li>
			    <li><label>更新时间:</label><label id="updateDatetime"></label></li>
			</ul>
	    </div>
    </form>
</body>
</html>