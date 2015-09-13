<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统设置</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
$(function() {
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/dict/page",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				key : $("#key_search").val(),
				value : $("#value_search").val(),
				pKey : $("#pKey_search").val(),
				pValue : $("#pValue_search").val(),
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
			title : '编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'key',
			title : '数据字典键',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'value',
			title : '数据字典值',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'pId',
			title : '父级编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'pKey',
			title : '父级键',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'pValue',
			title : '父级值',
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
			title : '更改时间',
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

function operateFormatter(value, row) {
	return ['<button class="btn btn-link btn-xs edit">修改</button><button class="btn btn-link btn-xs del">删除</button>'].join('');
}

window.operateEvents = {
	'click .edit': function (e, value, row, index) {
    	window.location.href = $("#base_path").val() + "/dict/detail?key="+row.key+"&id="+row.id+"&operate=edit";
    },
	'click .del': function (e, value, row, index) {
		if(!confirm("是否确认删除数据字典"+row.id+"?")){
    		return false;
    	}
    	var url = $("#base_path").val() + "/dict/drop";
    	var data = {id:row.id};
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
		    <li><a href="#">数据字典</a></li>
		    <li><a href="#">查询数据字典</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40 mt10">
							<label for="key" class="control-label-first">数据字典键:</label> <input class="input-sm" type="text"
								class="form-control" id="key_search" placeholder="请输入数据字典键">
						</div>
						<div class="form-group mr40 mt10">
							<label for="value" class="control-label">数据字典值:</label> <input class="input-sm" type="text"
								class="form-control" id="value_search" placeholder="请输入数据字典值">
						</div>
						<div class="form-group mr40 mt10">
							<label for="pKey" class="control-label">数据字典父级键:</label> <input class="input-sm" type="text"
								class="form-control" id="pKey_search" placeholder="请输入数据字典父级键">
						</div>
						<div class="form-group mr40 mt10">
							<label for="pValue" class="control-label">数据字典父级值:</label> <input class="input-sm" type="text"
								class="form-control" id="pValue_search" placeholder="请输入数据字典父级值">
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
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
