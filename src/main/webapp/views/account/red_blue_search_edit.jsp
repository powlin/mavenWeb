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
			data['rbNo'] = $("#rbNo").val();
			var url = $("#base_path").val() + "/account/redBlueSearchEdit";
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function checkForm(){
		var rbNo = $("#rbNo");
		if(rbNo.val() == ""){
			rbNo.next().removeClass("hid");
			return false;
		}
		var checkResult = $("#checkResult");
		if(checkResult.val() == ""){
			checkResult.next().removeClass("hid");
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
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="rbNo" name="rbNo" value="${rbNo}"/>
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
			    <li><label><span class="inline_red">*</span>红冲蓝补申请编号:</label><label>${rbNo}</label></li>
			    <li><label><span class="inline_red">*</span>审核结果:</label><select id="checkResult" name="checkResult" class="dfinput">
			    	<option value="1">通过</option>
			    	<option value="0">不通过</option>
			    </select></li>
			    <li><label><span class="inline_red">*</span>备注:</label><input type="text" id="remark" name="remark" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">备注不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>