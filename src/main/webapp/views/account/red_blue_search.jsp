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
		url : $("#base_path").val() + "/account/redBlueSearch",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				rbNo : $("#rb_no_search").val(),
				accountNumber : $("#account_number_search").val(),
				direction : $("#direction_search").val(),
				status : $("#status_search").val(),
				applyUser : $("#apply_user_search").val(),
				checkUser : $("#check_user_search").val(),
				applyDatetimeStart : $("#apply_datetime_start_search").val(),
				applyDatetimeEnd : $("#apply_datetime_end_search").val(),
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
			field : 'rbNo',
			title : '红冲蓝补申请编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		},{
			field : 'accountNumber',
			title : '账户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'amount',
			title : '金额',
			align : 'right',
			valign : 'middle',
			sortable : false
		}, {
			field : 'direction',
			title : '方向',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'status',
			title : '账户状态',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'applyUser',
			title : '申请人ID',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'applyNote',
			title : '申请说明',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'applyDatetime',
			title : '申请时间',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'checkUser',
			title : '审核人ID',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'checkDatetime',
			title : '审核时间',
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
			field : 'operate',
			title : '操作',
			width : 100,
			align : 'center',
			valign : 'middle',
			formatter : operateFormatter,
			events : operateEvents
		}]
	});

	// 查询
	$('#searchBtn').click(function() {
		$('#tableList').bootstrapTable('refresh');
	});
});

function operateFormatter(value, row) {
	if(row.status == 1){
		return ['<button class="btn btn-link btn-xs examine">审核</button>'].join('');
	}else{
		return [''].join('');
	}
}

window.operateEvents = {
  'click .examine': function (e, value, row, index) {
  	window.location.href = $("#base_path").val() + "/account/redBlueSearchDetail?rbNo="+row.rbNo;
  }
};
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">财务管理</a></li>
		    <li><a href="#">红冲蓝补记录查询</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40 mt10">
							<label for="rbNo" class="control-label-first">红冲蓝补申请编号:</label> <input class="input-sm" type="text"
								class="form-control" id="rb_no_search" placeholder="请输入红冲蓝补申请">
						</div>
						<div class="form-group mr40 mt10">
							<label for="accountNumber" class="control-label">账户编号:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户编号">
						</div>
						<div class="form-group mr40 mt10">
							<label for="direction" class="control-label">方向:</label> <select class="input-sm"
								class="form-control" id="direction_search">
									<option value="">请选择</option>
									<option value="1">蓝补，价钱</option>
									<option value="0">红冲，减钱</option>
								</select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="status" class="control-label">状态:</label> <select class="input-sm"
								class="form-control" id="status_search">
									<option value="">请选择</option>
									<option value="1">待审批</option>
									<option value="2">审批不通过</option>
									<option value="3">审批已通过</option>
								</select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyUser" class="control-label">申请人ID:</label> <input class="input-sm" type="text"
								class="form-control" id="apply_user_search" placeholder="请输入申请人ID">
						</div>
						<div class="form-group mr40 mt10">
							<label for="checkUser" class="control-label">审核人ID:</label> <input class="input-sm" type="text"
								class="form-control" id="check_user_search" placeholder="请输入审核人ID">
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyDatetimeStart" class="control-label">申请时间start:</label> <input class="input-sm dfdate" type="text"
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="apply_datetime_start_search" placeholder="请输入申请时间start">
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyDatetimeEnd" class="control-label">申请时间end:</label> <input class="input-sm dfdate" type="text"
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="apply_datetime_end_search" placeholder="请输入申请时间start">
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
