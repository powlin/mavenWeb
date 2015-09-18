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
		var data = {"pKey":"direction_type"};
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
			checkNum($("#amount").val(),"金额");
			var url = $("#base_path").val() + "/account/redBlueApply";
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function doSuccessBackType(res){
		var data = res.data;
		typeData = data;
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#direction").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#direction").html(html);
	}
	
	function checkForm(){
		var accountNumber = $("#accountNumber");
		if(accountNumber.val() == ""){
			accountNumber.next().removeClass("hid");
			return false;
		}
		var amount = $("#amount");
		if(amount.val() == ""){
			amount.next().removeClass("hid");
			return false;
		}
		var applyNote = $("#applyNote");
		if(applyNote.val() == ""){
			applyNote.next().removeClass("hid");
			return false;
		}
		return true;
	}
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/account/red_blue_apply.htm";
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
	    	<li><a href="#">财务管理</a></li>
	    	<li><a href="#">红冲蓝补</a></li>
	    	<li id="operContent">红冲蓝补申请</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>红冲蓝补申请</span></div>
		    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>账户编号:</label><input type="text" id="accountNumber" name="accountNumber" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">账户编号不能为空</span></li>
			    <li><label><span class="inline_red">*</span>方向:</label>
				    <select id="direction" name="direction" class="dfinput" onblur="toggleMess(this)">
				    	<option value="">--请选择--</option>
					</select><span class="inline_red hid">方向不能为空</span>
				</li>
			    <li><label><span class="inline_red">*</span>金额:</label><input type="text" id="amount" name="amount" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">金额不能为空</span></li>
			    <li><label><span class="inline_red">*</span>申请理由:</label><input type="text" id="applyNote" name="applyNote" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">申请理由不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>