<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>支持操作</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		//初始化赋值
		var needLimit = $("#needLimit").val();
		if(needLimit != undefined && needLimit != null && needLimit != ''){
			$("input[name='needLimit']").eq(needLimit).attr("checked","checked");
		}
		var returnType = $("#returnType").val();
		if(returnType != undefined && returnType != null && returnType != ''){
			$("input[name='returnType']").eq(returnType).attr("checked","checked");
		}
		
		$('#subBtn').click(function() {
			var id = $("#id").val();
			var operate = "edit";
			if(id == undefined || id == null || id == ''){
				operate = "add";
			}
			var path = $("#base_path").val() + "/project/return/" + operate;
		    $('#returnForm').attr("action", path).submit();
		});
	});
	
	
	
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">项目管理</a></li>
	    	<li><a href="#">众筹审批</a></li>
	    	<li id="operContent">设置支持</li>
   		</ul>
    </div>
    <form id="returnForm" method="post" enctype="multipart/form-data">
	    <div class="formbody">
	    <div class="formtitle"><span>回报信息</span></div>
	    <input type="hidden" id="id" name="id" value ="${returnDO.id}"/>
	    <input type="hidden" id="proId" name="proId" value ="${proId}"/>
	    <input type="hidden" id="needLimit" value="${returnDO.needLimit}" />
	    <input type="hidden" id="returnType" value="${returnDO.returnType}" />
	    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>金额:</label><input type="text" id="amount" name="amount" value ="${returnDO.amount}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">金额不能为空</span></li>
			    <li><label><span class="inline_red">*</span>名称:</label><input type="text" id="name" name="name" value ="${returnDO.name}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">回报名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>概述:</label><textarea id="summary" name="summary" class="textinput" >${returnDO.summary}</textarea></li>
			    <li><label><span class="inline_red">*</span>回报数量:</label><input type="radio" name="needLimit" value="0" checked>不限 &nbsp;<input type="radio" name="needLimit" value="1">限制
			    <input type="text" id="limitNum" name="limitNum" value ="${returnDO.limitNum}"  class="dfinput hid" onblur="toggleMess(this)"/><span id="limitNumTip" class="inline_red hid">限制数量不能为空</span></li>
			    <li><label><span class="inline_red">*</span>图片:</label>
			    <input type="file" id="picture" name="picture" onblur="toggleMess(this)"/><span class="inline_red hid">请上传图片</span></li>
			    <li><label><span class="inline_red">*</span>发放方式:</label>
			    <input type="radio" name="returnType" value="0" checked>短信 &nbsp;
			    <input type="radio" name="returnType" value="1">全国包邮（含港澳台） &nbsp;
			    <input type="radio" name="returnType" value="2">全国包邮（不含港澳台） &nbsp;
			    <li><label><span class="inline_red">*</span>回报时间:</label>项目预计成功后<input type="text" id="returnExpectedDays" name="returnExpectedDays" value ="${returnDO.returnExpectedDays}"  class="dfinput" onblur="toggleMess(this)"/>天后发放回报<span class="inline_red hid">回报发放天数不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="提交"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>