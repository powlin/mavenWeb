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
	var data = {"pKey":"a_status"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/account/page",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				realName : $("#real_name_search").val(),
				accountNumber : $("#account_number_search").val(),
				status : $("#status_search").val(),
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
			field : 'accountNumber',
			title : '账户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		},{
			field : 'userId',
			title : '用户编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'realName',
			title : '用户姓名',
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
			field : 'frozenAmount',
			title : '冻结金额',
			align : 'right',
			valign : 'middle',
			sortable : false,
			formatter : moneyFormatter
		}, {
			field : 'currency',
			title : '币种',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'status',
			title : '账户状态',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : accountStatusFormatter
		}, {
			field : 'createDatetime',
			title : '创建时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'updateDatetime',
			title : '修改时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}]
	});

	// 查询
	$('#searchBtn').click(function() {
		$('#tableList').bootstrapTable('refresh');
	});
});

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
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
			if(data[i].key == $("#status_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#status_search").html(html);
}

function accountStatusFormatter(value, row) {
	for(var i = 0;i < typeData.length;i++){
		if(typeData[i].key == value){
			return typeData[i].value;
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
		    <li>账户查询</li>
		    <li>会员账户</li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<label for="accountNumber" class="control-label">账户编号:</label> <input class="input-sm" type="text"
								class="form-control" id="account_number_search" placeholder="请输入账户编号">
						</div>
						<div class="form-group mr40">
							<label for="realName" class="control-label-first">用户姓名:</label> <input class="input-sm" type="text"
								class="form-control" id="real_name_search" placeholder="请输入用户姓名">
						</div>
						<div class="form-group mr40">
							<label for="accountNumber" class="control-label">账户状态:</label> <select class="input-sm"
								class="form-control" id="status_search">
								</select>
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
