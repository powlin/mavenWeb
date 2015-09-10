<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>项目详情</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		$('#backBtn').click(function() {
			window.location.href = $("#base_path").val() + "/views/program/approve_program.htm";
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value = "${operate}"/>
	<input type="hidden" id="role_level_hid" value = "${role.roleLevel}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">项目管理</a></li>
	    	<li><a href="#">众筹审批</a></li>
	    	<li id="operContent">查看详情</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>项目信息</span></div>
		    <ul class="forminfo">
			    <li><label>项目编号:</label><label>${program.proId}</label></li>
			    <li><label>项目名称:</label><label>${program.name}</label></li>
			    <li><label>项目类型:</label><label>${program.type}</label></li>
			    <li><label>发起省份:</label><label>${program.province}</label></li>
			    <li><label>发起城市:</label><label>${program.city}</label></li>
			    <li><label>项目图片:</label><label>${program.picture}</label></li>
			    <li><label>项目视频:</label><label>${program.video}</label></li>
			    <li><label>项目概述:</label><label>${program.summary}</label></li>
			    <li><label>项目详情:</label><label>${program.detail}</label></li>
			    <li><label>目标筹集金额(元):</label><label>${program.targetAmount}</label></li>
			    <li><label>筹集期限(天):</label><label>${program.raiseDays}</label></li>
			    <li><label>发起人编号:</label><label>${program.userId}</label></li>
			    <li><label>申请时间:</label><label>${program.createDatetime}</label></li>
			   <li><input id="backBtn" type="button" class="btn mr40" value="返回"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>