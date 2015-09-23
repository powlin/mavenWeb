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
		var data = {"pKey":"p_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		$("#createDatetime").text(dateFormat($("#createDatetime").text(),'yyyy-MM-dd HH:mm:ss'));
		$("#targetAmount").text(moneyFormat($("#targetAmount").text(), 2));
		$("#raiseDays").text(parseInt($("#raiseDays").text()));
		
		//初始化赋值
		var isHot = $("#isHot").val();
		if(isHot == '1'){
			$("input[name='isHotCheck']").eq(0).attr("checked","checked");
		}
		var isRecommend = $("#isRecommend").val();
		if(isRecommend == '1'){
			$("input[name='isRecommendCheck']").eq(0).attr("checked","checked");
		}
		
		$('#subBtn').click(function() {
			$("#isHot").val("0");
			if($('#isHotCheck').is(':checked')) {
				$("#isHot").val("1");
			}
			
			$("#isRecommend").val("0");
			if($('#isRecommendCheck').is(':checked')) {
				$("#isRecommend").val("1");
			}
			var path = $("#base_path").val() + "/projectTag/edit";
		    $('#tagForm').attr("action", path).submit();
		});
		
		$('#backBtn').click(function() {
			window.location.href = $("#base_path").val() + "/views/project/project_tag.htm";
		});
	});
	
	function doSuccessBackType(res){
		var data = res.data;
		var proType = $("#proType").text();
		if(typeof(data) != "undefined"){//判断undefined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == proType){
					$("#proType").text(data[i].value);
					return;
				}
			}
		}
	}
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
    <input type="hidden" id="isHot" name="isHot" value = "${projectTag.isHot}"/>
	<input type="hidden" id="isRecommend" name="isRecommend" value = "${projectTag.isRecommend}"/>
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
	        		<td id="targetAmount">${project.targetAmount}</td>
	        		<th>筹集天数:</th>
	        		<td id="raiseDays">${project.raiseDays}</td>
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
	        		<input type="checkbox" id="isHotCheck" name="isHotCheck">是否热门 &nbsp;
			    	<input type="checkbox" id="isRecommendCheck" name="isRecommendCheck">是否推荐 &nbsp;</td>
	        </table>
	        <br/>
			<input id="subBtn" type="button" class="btn mr20" value="提交"/>&nbsp;
			<input id="backBtn" type="button" class="btn ml20" value="返回"/>&nbsp;
	    </div>
    </form>
</body>
</html>