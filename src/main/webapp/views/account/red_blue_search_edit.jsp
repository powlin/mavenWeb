<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>财务管理</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		$("#amount").text(moneyFormatter($("#amountHid").val()));
		
		var data = {"pKey":"direction_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		
		//提交
		$('#subBtnY').click(function(){
			submitForm(this, "1");
		});
		
		//提交
		$('#subBtnN').click(function(){
			submitForm(this, "0");
		});
	});
	
	function submitForm(e, val){
		var data = {};
		data['rbNo'] = $("#rbNo").val();
		data['checkResult'] = val;
		var url = $("#base_path").val() + "/account/redBlueSearchEdit";
		doPostAjax(url, data, doSuccessBack);
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/account/red_blue_search.htm";
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

	function doSuccessBackType(res){
		var data = res.data;
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#direction").val()){
					$("#directionLabel").text(data[i].value);
				}
			}
		}
	}
	function moneyFormatter(value){
		return moneyFormat(value, 2);
	}
	
	function clickBack(){
		window.location.href = $("#base_path").val() + "/views/account/red_blue_search.htm";
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="rbNo" name="rbNo" value="${account.rbNo}"/>
	<input type="hidden" id="direction" value="${account.direction}"/>
	<input type="hidden" id="amountHid" value="${account.amount}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">财务管理</a></li>
	    	<li><a href="#">红冲蓝补</a></li>
	    	<li id="operContent">红冲蓝补审核</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>红冲蓝补审核</span></div>
		    <ul class="forminfo">
			    <li><label>申请编号:</label><label>${account.rbNo}</label></li>
			    <li><label>账户编号:</label><label>${account.accountNumber}</label></li>
			    <li><label>金额:</label><label id="amount"></label></li>
			    <li><label>方向:</label><label id="directionLabel"></label></li>
			    <li><label>申请人ID:</label><label>${account.applyUser}</label></li>
			    <li><label>申请说明:</label><label>${account.applyNote}</label></li>
			    <!-- <li><label><span class="inline_red">*</span>备注:</label><input type="text" id="remark" name="remark" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">备注不能为空</span></li> -->
			    <li>
			    	<input id="subBtnY" type="button" class="btn mr40" value="通过"/>
				    <input id="subBtnN" type="button" class="btn mr40" value="不通过"/>
				    <input type="button" onclick="clickBack()" class="btn mr40" value="返回"/>
			    </li>
			</ul>
	    </div>
    </form>
</body>
</html>