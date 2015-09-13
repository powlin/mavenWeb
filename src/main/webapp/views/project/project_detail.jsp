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
<title>项目详情</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		$('#backBtn').click(function() {
			if($("#operate").val() == null || $("#operate").val() == undefined || $("#operate").val() ==''){
				window.location.href = $("#base_path").val() + "/views/project/project_all.htm";
			}else if($("#operate").val() == "flow"){
				window.location.href = $("#base_path").val() + "/project/list?op_status=2";
			}else if($("#operate").val() == "recheck"){
				window.location.href = $("#base_path").val() + "/project/list?op_status=3";
			}else if($("#operate").val() == "confirmRepay"){
				window.location.href = $("#base_path").val() + "/project/list?op_status=5";
			}
		});
		
		if($("#operate").val() == null || $("#operate").val() == undefined || $("#operate").val() ==''){
			$("#amountTr").css('display','none'); 
			$("#feeTr").css('display','none'); 
			$("#remarkTr").css('display','none');
			$("#flowBtn").css('display','none');
			$("#payBtn").css('display','none');
			$("#repayBtn").css('display','none');
			$("#unRepayBtn").css('display','none');
		}else if($("#operate").val() == "flow"){
			$("#amountTr").css('display','none'); 
			$("#feeTr").css('display','none');
			$("#payBtn").css('display','none');
			$("#repayBtn").css('display','none');
			$("#unRepayBtn").css('display','none');
		}else if($("#operate").val() == "recheck"){
			$("#repayBtn").css('display','none');
			$("#unRepayBtn").css('display','none');
		}else if($("#operate").val() == "confirmRepay"){
			$("#amountTr").css('display','none'); 
			$("#feeTr").css('display','none'); 
			$("#flowBtn").css('display','none');
			$("#payBtn").css('display','none');
		}
		
		//流标
		$('#flowBtn').click(function() {
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"remark":remark};
			var url = $("#base_path").val() + "/project/flow";
			doPostAjax(url,data,doSuccessBackFlow);
		});
		
		//放款
		$('#payBtn').click(function() {
			var firstPayAmount = $("#firstPayAmount").val();
			if(firstPayAmount == undefined || firstPayAmount == null || firstPayAmount == ''){
				alert("首付金额不能为空");
				return;
			}
			if(checknumber(firstPayAmount)) { 
				alert("首付金额只允许输入数字！"); 
				return false; 
			}
			var firstPayFee = $("#firstPayFee").val();
			if(firstPayFee == undefined || firstPayFee == null || firstPayFee == ''){
				alert("手续费不能为空");
				return;
			}
			if(checknumber(firstPayFee)) { 
				alert("手续费只允许输入数字！"); 
				return false; 
			}
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"firstPayAmount":"firstPayAmount","firstPayFee":firstPayFee,"remark":remark};
			var url = $("#base_path").val() + "/project/flow";
			doPostAjax(url,data,doSuccessBackFlow);
		});
		
		//平台偿还确认，审批通过
		$('#repayBtn').click(function() {
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"checkResult":"0","remark":remark};
			var url = $("#base_path").val() + "/project/repay";
			doPostAjax(url,data,doSuccessBackFlow);
		});
		
		//平台偿还确认，审批不通过
		$('#unRepayBtn').click(function() {
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"checkResult":"1","remark":remark};
			var url = $("#base_path").val() + "/project/repay";
			doPostAjax(url,data,doSuccessBackFlow);
		});
	});
	
	function doSuccessBackFlow(res){
		if (res.success == true) {
			alert("操作成功!");
			window.location.href = $("#base_path").val() + "/project/_list?op_status=2";
		}else{
			alert(res.msg);
		}
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate" value = "${operate}"/>
	<input type="hidden" id="proId" value = "${project.proId}"/>
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
	        <table class="filetable">
	        	<tr>
	        		<th>项目编号</th>
	        		<td>${project.proId}</td>
	        		<th>项目名称:</th>
	        		<td>${project.name}</td>
	        	</tr>
	        	<tr>
	        		<th>项目类型:</th>
	        		<td>${project.type}</td>
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
	        		<th>项目概述</th>
	        		<td colspan="3">${project.summary}</td>
	        	</tr>
	        	<tr>
	        		<th>发起人编号:</th>
	        		<td>${project.userId}</td>
	        		<th>申请时间:</th>
	        		<td>${project.createDatetime}</td>
	        	</tr>
	        	<tr>
	        		<th>回报方式:</th>
	        		<td colspan="3">
	        		<table class="imgtable">
	        			<tr>
						    <th>编号</th>
						    <th>回报名称</th>
						    <th>支持金额</th>
						    <th>是否限制人数</th>
						    <th>限制人数</th>
						    <th>回报天数</th>
						    <th>回报类型</th>
						    <!-- <th>操作</th> -->
						</tr>
						<tr>
						    <td>-1</td>
						    <td>无私支持</td>
						    <td>0.0</td>
						    <td>不限</td>
						    <td>0</td>
						    <td></td>
						    <td>其他</td>
						    <!-- <td></td> -->
						</tr>
						<c:forEach var="domain" items="${returnList}" varStatus="status">     
							<tr>
							    <td>${domain.id}</td>
							    <td>${domain.name}</td>
							    <td>${domain.amount}</td>
							    <td><c:choose>
							    <c:when test="${domain.needLimit == '1'}">  
							    是
							    </c:when>
							    <c:otherwise>否</c:otherwise>
							    </c:choose></td>
							    <td>${domain.limitNum}</td>
							    <td>${domain.returnExpectedDays}</td>
							    <td>
							    </td>
							     <!--<td>修改  &nbsp;删除</td> -->
							</tr>
						</c:forEach> 
					</table>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th>实际筹集金额:</th>
	        		<td>${project.actualAmount}</td>
	        		<th>超过目标金额:</th>
	        		<td>${project.actualAmount - project.targetAmount}</td>
	        	</tr>
	        	<tr id="amountTr">
	        		<th>首付金额:</th>
	        		<td colspan="3">
	        			<input type="text" id="firstPayAmount" name="firstPayAmount" class="dfinput"/>
	        		</td>
	        	</tr>
	        	<tr id="feeTr">
	        		<th>手续费:</th>
	        		<td colspan="3">
	        			<input type="text" id="firstPayFee" name="firstPayFee" class="dfinput"/>
	        		</td>
	        	</tr>
	        	<tr id="remarkTr">
	        		<th>备注:</th>
	        		<td colspan="3">
	        			<input type="text" id="remark" name="remark" class="dfinput"/>
	        		</td>
	        	</tr>
	        </table>
	        <br/>
			<input id="flowBtn" type="button" class="btn mr40" value="流标"/>&nbsp;
			<input id="payBtn" type="button" class="btn mr40" value="放款"/>&nbsp;
			<input id="repayBtn" type="button" class="btn mr40" value="审批通过"/>&nbsp;
			<input id="unRepayBtn" type="button" class="btn mr40" value="审批不通过"/>&nbsp;
			<input id="backBtn" type="button" class="btn ml40" value="返回"/>&nbsp;
	    </div>
    </form>
</body>
</html>