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
var checkResultData=null;
var adjustResultData=null;
$(function() {
	var data = {"pKey":"biz_type"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);

	var data = {"pKey":"check_result"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackCheck);

	var data = {"pKey":"adjust_result"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackAdjust);
	
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/account/sysCheck",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				refNo : $("#ref_no_search").val(),
				bizType : $("#biz_type_search").val(),
				checkDateStart : $("#check_data_start_search").val(),
				checkDateEnd : $("#check_data_end_search").val(),
				checkResult : $("#check_result_search").val(),
				adjustUser : $("#adjust_user_search").val(),
				adjustDatetimeStart : $("#adjust_datetime_start_search").val(),
				adjustDatetimeEnd : $("#adjust_datetime_end_search").val(),
				adjustResult : $("#adjust_result_search").val(),
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
			field : 'ubNo',
			title : '不平帐编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'refNo',
			title : '支付编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'amount',
			title : '不平金额',
			align : 'right',
			valign : 'middle',
			sortable : false
		}, {
			field : 'bizType',
			title : '业务类型',
			align : 'middle',
			valign : 'middle',
			sortable : false,
			formatter : bizTypeFormatter
		}, {
			field : 'checkDate',
			title : '对账日期',
			align : 'middle',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'checkResult',
			title : '对账结果',
			align : 'middle',
			valign : 'middle',
			sortable : false,
			formatter : checkResultFormatter
		}, {
			field : 'adjustDatetime',
			title : '调账时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'adjustResult',
			title : '调账结果',
			align : 'middle',
			valign : 'middle',
			sortable : false,
			formatter : adjustResultFormatter
		}, {
			field : 'adjustUser',
			title : '调账人ID',
			align : 'left',
			valign : 'middle',
			sortable : false
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
		$('#tableList').bootstrapTable('refresh');
	});
});

function bizTypeFormatter(value, row) {
	for(var i = 0;i < typeData.length;i++){
		if(typeData[i].key == value){
			return typeData[i].value;
		}
	}
}

function checkResultFormatter(value, row) {
	for(var i = 0;i < checkResultData.length;i++){
		if(checkResultData[i].key == value){
			return checkResultData[i].value;
		}
	}
}

function adjustResultFormatter(value, row) {
	for(var i = 0;i < adjustResultData.length;i++){
		if(adjustResultData[i].key == value){
			return adjustResultData[i].value;
		}
	}
}

function doSuccessBackType(res){
	var data = res.data;
	typeData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#biz_type_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}
		}
	}
	$("#biz_type_search").html(html);
}

function doSuccessBackCheck(res){
	var data = res.data;
	checkResultData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#check_result_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}
		}
	}
	$("#check_result_search").html(html);
}

function doSuccessBackAdjust(res){
	var data = res.data;
	adjustResultData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#adjust_result_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}
		}
	}
	$("#adjust_result_search").html(html);
}

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd');
}
function operateFormatter(value, row) {
	return ['<button class="btn btn-link btn-xs detail">处理</button>'].join('');
}

window.operateEvents = {
	'click .detail': function (e, value, row, index) {
		window.location.href = $("#base_path").val() + "/account/sysCheckDetail?ubNo="+row.ubNo;
	}
};
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">日终清算</a></li>
		    <li><a href="#">账户对账</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40 mt10">
							<label for="refNo" class="control-label-first">支付编号:</label> <input class="input-sm" type="text"
								class="form-control" id="ref_no_search" placeholder="请输入支付编号">
						</div>
						<div class="form-group mr40 mt10">
							<label for="bizType" class="control-label">业务类型:</label> <select class="input-sm"
								class="form-control" id="biz_type_search"></select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="checkDateStart" class="control-label-first">对账日期起:</label> <input type="text" class="input-sm dfdate" id="check_date_start_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入对账日期起"/>
						</div>
						<div class="form-group mr40 mt10">
							<label for="checkDateEnd" class="control-label-first">对账日期止:</label> <input type="text" class="input-sm dfdate" id="check_date_end_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入对账日期止"/>
						</div>
						<div class="form-group mr40 mt10">
							<label for="checkResult" class="control-label-first">对账结果:</label> <select class="input-sm"
								class="form-control" id="check_result_search"></select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="adjustUser" class="control-label-first">调账人编号:</label> <input class="input-sm" type="text"
								class="form-control" id="adjust_user_search" placeholder="请输入调账人编号">
						</div>
						<div class="form-group mr40 mt10">
							<label for="adjustDatetimeStart" class="control-label-first">调账时间起:</label> <input type="text" class="input-sm dfdate" id="adjust_datetime_start_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入调账时间起"/>
						</div>
						<div class="form-group mr40 mt10">
							<label for="adjustDatetimeEnd" class="control-label-first">调账时间止:</label> <input type="text" class="input-sm dfdate" id="adjust_datetime_end_search" 
								onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" placeholder="请输入调账时间止"/>
						</div>
						<div class="form-group mr40 mt10">
							<label for="adjustResult" class="control-label-first">调账结果:</label> <select class="input-sm"
								class="form-control" id="adjust_result_search"></select>
						</div>
						<div class="form-group mr40 mt10">
							<label for="accountNumber" class="control-label-first">账户ID:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户ID">
						</div>&nbsp;
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
