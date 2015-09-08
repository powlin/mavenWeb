<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户管理</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
$(function() {
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/account/moneyList",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				ajNo : $("#aj_no_search").val(),
				bizType : $("#biz_type_search").val(),
				createDatetimeStart : $("#create_datetime_start_search").val(),
				createDatetimeEnd : $("#create_datetime_end_search").val(),
				realName : $("#real_name_search").val(),
				accountNumber : $("#account_number_search").val(),
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
			field : 'ajNo',
			title : '流水号',
			align : 'left',
			valign : 'middle',
			sortable : false,
			width: 100
		}, {
			field : 'bizType ',
			title : '业务类型',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'refNo',
			title : '相关订单号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'transAmount',
			title : '发生金额',
			align : 'right',
			valign : 'middle',
			sortable : false
		}, {
			field : 'preAmount',
			title : '发生前金额',
			align : 'right',
			valign : 'middle',
			sortable : false
		}, {
			field : 'postAmount',
			title : '发生后金额',
			align : 'right',
			valign : 'middle',
			sortable : false
		}, {
			field : 'status',
			title : '状态',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'remark',
			title : '备注',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'createDatetime',
			title : '创建时间',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'userId',
			title : '用户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'realName',
			title : '真实姓名',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'accountNumber ',
			title : '账户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}]
	});

	// 查询
	$('#searchBtn').click(function() {
		$('#tableList').bootstrapTable('refresh');
	});
});

</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">账户管理</a></li>
		    <li><a href="#">账户查询</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40 mt10">
							<label for="ajNo" class="control-label-first">流水号:</label> <input class="input-sm" type="text"
								class="form-control" id="aj_no_search" placeholder="请输入流水号">
						</div>
						<div class="form-group mr40 mt10">
							<label for="bizType" class="control-label">业务类型:</label> <select class="input-sm"
								class="form-control" id="biz_type_search">
									<option value="">请选择</option>
									<option value="12">转入</option>
									<option value="-12">转出</option>
									<option value="19">蓝补</option>
									<option value="-19">红冲</option>
									<option value="51">冻结</option>
									<option value="-51">解冻</option>
								</select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="createDatetimeStart" class="control-label-first">产生时间起:</label> <input class="input-sm" type="text"
								class="form-control" id="create_datetime_start_search" placeholder="请输入产生时间起">
						</div>
						<div class="form-group mr40 mt10">
							<label for="createDatetimeEnd" class="control-label-first">流水号:</label> <input class="input-sm" type="text"
								class="form-control" id="create_datetime_end_search" placeholder="请输入产生时间止">
						</div>
						<div class="form-group mr40 mt10">
							<label for="realName" class="control-label-first">真实姓名:</label> <input class="input-sm" type="text"
								class="form-control" id="real_name_search" placeholder="请输入真实姓名">
						</div>
						<div class="form-group mr40 mt10">
							<label for="accountNumber" class="control-label-first">账户编号:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户编号">
						</div>&nbsp;
						<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
					</div>
				</div>
				<table id="tableList"></table>
			</div>
		</div>
		</div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
