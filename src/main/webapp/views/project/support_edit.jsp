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
	});
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value="${operate}" />
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">项目管理</a></li>
	    	<li><a href="#">众筹审批</a></li>
	    	<li id="operContent">设置支持</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>回报信息</span></div>
	    <input type="hidden" id="id" name="id" value ="${returnDO.id}" class="dfinput" />
	    <ul class="forminfo">
			    <li><label><span class="inline_red">*</span>金额:</label><input type="text" id="amount" name="amount" value ="${returnDO.amount}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">金额不能为空</span></li>
			    <li><label><span class="inline_red">*</span>名称:</label><input type="text" id="name" name="name" value ="${returnDO.name}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">回报名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>概述:</label><textarea id="summary" name="summary" class="textinput" >${returnDO.summary}</textarea></li>
			    <li><label><span class="inline_red">*</span>回报数量:</label><input type="text" id="name" name="name" value ="${returnDO.name}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">角色名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>图片:</label><input type="text" id="picture" name="picture" value ="${returnDO.picture}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">图片不能为空</span></li>
			    <li><label><span class="inline_red">*</span>物流方式:</label><input type="text" id="name" name="name" value ="${returnDO.name}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">角色名称不能为空</span></li>
			    <li><label><span class="inline_red">*</span>回报时间:</label><input type="text" id="name" name="name" value ="${returnDO.name}"  class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">角色名称不能为空</span></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>