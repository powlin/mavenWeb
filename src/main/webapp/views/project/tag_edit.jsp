<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>标签设置</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		//初始化赋值
		var isHot = $("#isHot").val();
		if(isHot == '1'){
			$("input[name='isHot']").eq(0).attr("checked","checked");
		}
		var isRecommend = $("#isRecommend").val();
		if(isRecommend == '1'){
			$("input[name='isRecommend']").eq(0).attr("checked","checked");
		}
		
		$('#subBtn').click(function() {
			$("#isHot").val("0");
			if($('#isHotCheck').attr('checked')) {
				$("#isHot").val("1");
			}
			$("#isRecommend").val("0");
			if($('#isRecommend').attr('checked')) {
				$("#isRecommend").val("1");
			}
			var path = $("#base_path").val() + "/projectTag/edit";
		    $('#tagForm').attr("action", path).submit();
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value = "${operate}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">营销管理</a></li>
	    	<li><a href="#">项目位置</a></li>
	    	<li>标签设置</li>
   		</ul>
    </div>
    <form id="tagForm" method="post">
    <input type="hidden" id="proId" name="proId" value = "${project.proId}"/>
    <input type="hidden" id="isHot" name="isHot" value = "${project.isHot}"/>
	<input type="hidden" id="isRecommend" name="isRecommend" value = "${project.isRecommend}"/>
	    <div class="formbody">
	    <div class="formtitle"><span>项目信息</span></div>
	        <table class="filetable">
	        	<tr>
	        		<th>项目编号</th>
	        		<td>${project.proId}</td>
	        		<th>项目名称:</th>
	        		<td>${project.name}</td>
	        	</tr>
	        	<tr>
	        		<th>项目类型:</th>
	        		<td id="proType">${project.type}</td>
	        		<th>发起城市:</th>
	        		<td>${project.province} &nbsp;${project.city}</td>
	        	</tr>
	        	<tr>
	        		<th>目标金额:</th>
	        		<td>${project.targetAmount}</td>
	        		<th>筹集天数:</th>
	        		<td>${project.raiseDays}</td>
	        	</tr>
	        	<tr>
	        		<th>发起人编号:</th>
	        		<td>${project.userId}</td>
	        		<th>申请时间:</th>
	        		<td id="createDatetime">${project.createDatetime}</td>
	        	</tr>
	        	<tr>
	        		<th>标签:</th>
	        		<td colspan="3">
	        		<input type="checkbox" name="isHotCheck">是否热门 &nbsp;
			    	<input type="checkbox" name="isRecommendCheck">是否推荐 &nbsp;</td>
	        </table>
	        <br/>
			<input id="subBtn" type="button" class="btn mr20" value="提交"/>&nbsp;
			<input id="backBtn" type="button" class="btn ml20" value="返回"/>&nbsp;
	    </div>
    </form>
</body>
</html>