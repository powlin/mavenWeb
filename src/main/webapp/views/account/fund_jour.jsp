<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户管理</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
var typeData=null;
$(function() {
	var data = {"pKey":"biz_type"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
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
			field : 'accountNumber',
			title : '账户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'bizType',
			title : '业务类型',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : bizTypeFormatter
		}, {
			field : 'transAmount',
			title : '发生金额',
			align : 'right',
			valign : 'middle',
			sortable : false,
			formatter : moneyFormatter
		}, {
			field : 'preAmount',
			title : '发生前金额',
			align : 'right',
			valign : 'middle',
			sortable : false,
			formatter : moneyFormatter
		}, {
			field : 'postAmount',
			title : '发生后金额',
			align : 'right',
			valign : 'middle',
			sortable : false,
			formatter : moneyFormatter
		}, {
			field : 'remark',
			title : '备注',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'createDatetime',
			title : '发生时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'operate',
			title : '操作',
			align : 'center',
			valign : 'middle',
			formatter : operateFormatter,
			events : operateEvents
		}]
	});

	// 查询
	$('#searchBtn').click(function() {
		$('#tableList').bootstrapTable('refresh',{url: $("#base_path").val() + "/account/moneyList"});
	});
});

function bizTypeFormatter(value, row) {
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
			if(data[i].key == $("#biz_type_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#biz_type_search").html(html);
}

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}
function operateFormatter(value, row) {
	return ['<button class="btn btn-link btn-xs detail">详情</button>'].join('');
}

window.operateEvents = {
	'click .detail': function (e, value, row, index) {
		window.location.href = $("#base_path").val() + "/account/jour/detail?ajNo="+row.ajNo;
	}
};
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li>账户查询</li>
		    <li>资金流水</li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<label for="ajNo" class="control-label-first">流水号:</label> <input class="input-sm" type="text"
								class="form-control" id="aj_no_search" placeholder="请输入流水号">
						</div>
						<div class="form-group mr40">
							<label for="accountNumber" class="control-label-first">账户编号:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户编号">
						</div>
						<div class="form-group mr40">
							<label for="createDatetimeStart" class="control-label-first">发生时间起:</label> <input type="text" class="input-sm dfdate" id="create_datetime_start_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入发生时间起"/>
						</div>
						<div class="form-group mr40">
							<label for="createDatetimeEnd" class="control-label-first">发生时间止:</label> <input type="text" class="input-sm dfdate" id="create_datetime_end_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入发生时间止"/>
						</div>
						<div class="form-group mr40 mt10">
							<label for="bizType" class="control-label">业务类型:</label> <select class="input-sm"
								class="form-control" id="biz_type_search">
								</select>
						</div>
						&nbsp;
						<div class="form-group mt10">
							<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
						</div>
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
