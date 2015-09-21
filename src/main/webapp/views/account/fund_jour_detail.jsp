<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>资金流水详情</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
$(function(){
	$("#createDatetimeLabel").text(dateFormatter($("#createDatetime").val()));
	$("#transAmount").text(moneyFormatter($("#transAmountHid").val()));
	$("#preAmount").text(moneyFormatter($("#preAmountHid").val()));
	$("#postAmount").text(moneyFormatter($("#postAmountHid").val()));
});
function dateFormatter(value){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}
function moneyFormatter(value){
	return moneyFormat(value, 2);
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="transAmountHid" value="${account.transAmount}"/>
	<input type="hidden" id="preAmountHid" value="${account.preAmount}"/>
	<input type="hidden" id="postAmountHid" value="${account.postAmount}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">账户管理</a></li>
	    	<li><a href="#">资金流水查询</a></li>
	    	<li id="operContent">资金流水详情</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>账户信息</span></div>
		    <ul class="forminfo">
			    <li><label>流水号:</label><label>${account.ajNo}</label></li>
			    <li><label>业务类型:</label><label>${account.bizType}</label></li>
			    <li><label>相关订单号:</label><label>${account.refNo}</label></li>
			    <li><label>发生金额:</label><label id="transAmount"></label></li>
			    <li><label>发生前金额:</label><label id="preAmount"></label></li>
			    <li><label>发生后金额:</label><label id="postAmount"></label></li>
			    <li><label>备注:</label><label>${account.remark}</label></li>
			    <li><label>创建时间:</label><label id="createDatetimeLabel"></label></li>
			    <li><label>用户编号:</label><label>${account.userId}</label></li>
			    <li><label>真实姓名:</label><label>${account.realName}</label></li>
			    <li><label>账户编号:</label><label>${account.accountNumber}</label></li>
			</ul>
	    </div>
    </form>
</body>
</html>