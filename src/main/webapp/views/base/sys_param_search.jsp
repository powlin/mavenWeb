<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础数据</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
var typeData=null;
$(function() {
	var data = {"pKey":"param_type"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
	
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/sysParam/page",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				code : $("#code_search").val(),
				name : $("#name_search").val(),
				type : $("#type_search").val(),
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
			field : 'code',
			title : '参数编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'name',
			title : '参数名称',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'type',
			title : '类型',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : typeFormatter
		}, {
			field : 'value',
			title : '参数值',
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
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'creator',
			title : '创建人',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'updateDatetime',
			title : '修改时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'updater',
			title : '修改人',
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

function doSuccessBackType(res){
	var data = res.data;
	typeData = data;
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].key == $("#type_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#type_search").html(html);
}

function typeFormatter(value, row) {
	for(var i = 0;i < typeData.length;i++){
		if(typeData[i].key == value){
			return typeData[i].value;
		}
	}
}

function operateFormatter(value, row) {
	return ['<button class="btn btn-link btn-xs edit">修改</button><button class="btn btn-link btn-xs del">删除</button>'].join('');
}

window.operateEvents = {
	'click .edit': function (e, value, row, index) {
    	window.location.href = $("#base_path").val() + "/sysParam/detail?code="+row.code+"&operate=edit";
    },
	'click .del': function (e, value, row, index) {
		if(!confirm("是否确认删除系统参数"+row.code+"?")){
    		return false;
    	}
    	var url = $("#base_path").val() + "/sysParam/drop";
    	var data = {code:row.code};
		doPostAjax(url, data, doSuccessDel);
	}
};

function doSuccessDel(res) {
	if (res.success == true) {
		alert("删除成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("删除失败");
	}
}

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">系统参数</a></li>
		    <li><a href="#">查询系统参数</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<label for="code" class="control-label-first">参数编号:</label> <input class="input-sm" type="text"
								class="form-control" id="code_search" placeholder="请输入参数编号">
						</div>
						<div class="form-group mr40">
							<label for="name" class="control-label">参数名称:</label> <input class="input-sm" type="text"
								class="form-control" id="name_search" placeholder="请输入参数名称">
						</div>
						<div class="form-group mr40">
							<label for="type" class="control-label">类型:</label> <select class="input-sm"
								class="form-control" id="type_search"></select>
						</div>&nbsp;
						<div class="form-group mr40">
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
