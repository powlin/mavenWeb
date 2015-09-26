<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>投资记录</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
	$(function() {
		//var data = {"pKey":"p_status"};
		//var url = $("#base_path").val() + "/dict/list";
		//doGetAjaxIsAsync(url, data, false, doSuccessBackStatus);
		// 绑定列表
		$('#tableList').bootstrapTable({
			method : "get",
			url :  $("#base_path").val() + "/project/support/page",
			height : $(window).height() - 120,
			striped : true,
			singleSelect : true,
			queryParams : function(params) {
				return {
					proId : $("#proId").val(),
					id : $("#id").val(),
					userId : $("#userIdSearch").val(),
					createDatetimeStart : $("#createDatetimeStartSearch").val(),
					createDatetimeEnd : $("#createDatetimeEndSearch").val(),
					start : params.offset / params.limit + 1,
					limit : params.limit
					};
				},
			queryParamsType : 'limit',
			responseHandler : function(res) {
				return {
					rows : res.data.list,
					total : res.data.totalCount
				};
			},
			pagination : true,
			sidePagination : 'server', // 服务端请求
			totalRows : 0,
			pageNumber : 1,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			columns : [{
				field : 'id',
				title : '支持编号',
				align : 'left',
				valign : 'middle',
				width : 300,
				sortable : false
				},{
				field : 'proName',
				title : '项目名称',
				align : 'left',
				valign : 'middle',
				width : 300,
				sortable : false
				},{
				field : 'userId',
				title : '用户编号',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
				},{
				field : 'realName',
				title : '真实姓名',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
				},{
				field : 'returnId',
				title : '回报编号',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
				},{
				field : 'returnName',
				title : '回报名称',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
				},{
				field : 'amount',
				title : '金额',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
				},{
				field : 'createDatetime',
				title : '创建时间',
				align : 'left',
				valign : 'middle',
				width : 500,
				sortable : false,
				formatter : dateFormatter
				}],
			onLoadSuccess : function() {
			},
			onLoadError : function() {
				mif.showErrorMessageBox("数据加载失败！");
			}
		});
		// 查询
		$('#searchBtn').click(function() {
			$('#tableList').bootstrapTable('refresh',{url: $("#base_path").val() + "/project/support/page"});
		});
	});
	
	function dateFormatter(value, row){
		return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="proId" value="${proId}"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">项目管理</a></li>
		    <li><a href="#">众筹审批</a></li>
		    <li><a href="#">支持记录</a></li>
	    </ul>
    </div>
    <div class="panel-body">
		<div id="custom-toolbar" style="margin-bottom: 8px">
			<div class="form-inline" role="form">
					<div class="form-group">
						<label for="idSearch" class="control-label-first">支持编号:</label> <input class="input-sm" type="text"
							class="form-control" id="idSearch">
					</div>
					<div class="form-group">
						<label for="userIdSearch" class="control-label">发起人编号:</label> <input class="input-sm" type="text"
							class="form-control" id="userIdSearch">
					</div>
					<div class="form-group">
							<label for="createDatetimeStartSearch" class="control-label-first">投资日期起:</label> <input type="text" class="input-sm dfdate" id="createDatetimeStartSearch" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD'})"/>
					</div>
					<div class="form-group">
						<label for="createDatetimeEndSearch" class="control-label-first">投资日期止:</label> <input type="text" class="input-sm dfdate" id="createDatetimeEndSearch" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD'})"/>
					</div>
					<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
				</div>
			</div>
			<table id="tableList"></table>
	</div>
</body>
</html>