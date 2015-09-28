<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>红冲蓝补查询</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
var typeData=null;
var statusData=null;
$(function() {
	var data = {"pKey":"direction_type"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
	var data = {"pKey":"rb_status"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data, false, doSuccessBackStatus);
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
			title : '申请编号',
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
			sortable : false,
			formatter : moneyFormatter
		}, {
			field : 'direction',
			title : '方向',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : directionFormatter
		}, {
			field : 'status',
			title : '状态',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : statusFormatter
		}, {
			field : 'applyUser',
			title : '申请人编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		},{
			field : 'applyDatetime',
			title : '申请时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
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
			sortable : false,
			formatter : dateFormatter
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
		$('#tableList').bootstrapTable('refresh',{url: $("#base_path").val() + "/account/redBlueSearch"});
	});
});

function doSuccessBackStatus(res){
	var data = res.data;
	statusData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#status_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#status_search").html(html);
}

function directionFormatter(value, row) {
	for(var i = 0;i < typeData.length;i++){
		if(typeData[i].key == value){
			return typeData[i].value;
		}
	}
}

function moneyFormatter(value, row){
	return moneyFormat(value, 2);
}

function doSuccessBackType(res){
	var data = res.data;
	typeData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#direction_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#direction_search").html(html);
}

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

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}

function statusFormatter(value, row) {
	for(var i = 0;i < statusData.length;i++){
		if(statusData[i].key == value){
			return statusData[i].value;
		}
	}
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li>红冲蓝补</li>
		    <li>调账查询</li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<label for="rbNo" class="control-label-first">申请编号:</label> <input class="input-sm" type="text"
								class="form-control" id="rb_no_search" placeholder="请输入申请编号">
						</div>
						<div class="form-group mr40">
							<label for="accountNumber" class="control-label">账户编号:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户编号">
						</div>
						<div class="form-group mr40">
							<label for="direction" class="control-label">方向:</label> <select class="input-sm"
								class="form-control" id="direction_search">
								</select>
						</div>
						<div class="form-group mr40">
							<label for="status" class="control-label">状态:</label> <select class="input-sm"
								class="form-control" id="status_search">
								</select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyUser" class="control-label">申请人编号:</label> <input class="input-sm" type="text"
								class="form-control" id="apply_user_search" placeholder="请输入申请人编号">
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyDatetimeStart" class="control-label">申请时间起:</label> <input class="input-sm dfdate" type="text"
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="apply_datetime_start_search" placeholder="请输入申请时间起">
						</div>
						<div class="form-group mr40 mt10">
							<label for="applyDatetimeEnd" class="control-label">申请时间止:</label> <input class="input-sm dfdate" type="text"
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="apply_datetime_end_search" placeholder="请输入申请时间止">
						</div>&nbsp;
						<div class="form-group mr40 mt10">
							<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
						</div>
					</div>
				</div>
				<table id="tableList"></table>
			</div>
		</div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
