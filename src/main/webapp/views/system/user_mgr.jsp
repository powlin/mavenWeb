<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户设置</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
var typeData=null;
$(document).ready(function(){
	var data = {"pKey":"u_status"};
	var url = $("#base_path").val() + "/dict/list";
	doGetAjaxIsAsync(url, data,false, doSuccessBackType);
	
	//添加用户
	$('#addBtn').click(function() {
		window.location.href = $("#base_path").val() + "/sysUser/user/detail?operate=add";
	});

});

$(function() {
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/sysUser/user/page",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				userCode : $("#user_code_search").val(),
				userName : $("#user_name_search").val(),
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
			field : 'userCode',
			title : '用户名',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'userName',
			title : '用户姓名',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'status',
			title : '状态',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : userStatusFormatter
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
			title : '更新时间',
			align : 'left',
			valign : 'middle',
			sortable : false,
			formatter : dateFormatter
		}, {
			field : 'updater',
			title : '更新人',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'operate',
			title : '操作',
			width : 240,
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
			if(data[i].key == $("#status_search").val()){
				html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
			}else{
				html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
			}
		}
	}
	$("#status_search").html(html);
}

function userStatusFormatter(value, row) {
	for(var i = 0;i < typeData.length;i++){
		if(typeData[i].key == value){
			return typeData[i].value;
		}
	}
}

function dateFormatter(value, row){
	return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
}

//<button id="addBtn" class="btn btn-primary btn-sm" data-toggle="modal"
//								data-target="#myModal">新增</button>
function operateFormatter(value, row) {
	var zx = '';
	if(row.status == '1'){
		zx = '锁定';
	}else if(row.status == '2'){
		zx = '恢复';
	}
    return ['<button class="btn btn-link btn-xs editPas">修改密码</button>&nbsp;&nbsp;<button class="btn btn-link btn-xs editSta">'+zx+'</button>&nbsp;&nbsp;<button class="btn btn-link btn-xs editRole">设置角色</button>'].join('');
    //<button class="btn btn-primary btn-xs edit">修改</button>&nbsp;&nbsp;<button class="btn btn-danger btn-xs del">删除</button>&nbsp;<button class="btn btn-danger btn-xs choice">分配菜单</button>'].join('');
}

window.operateEvents = {
    'click .editPas': function (e, value, row, index) {
    	window.location.href = $("#base_path").val() + "/sysUser/user/detailPas?userCode="+row.userCode+"&operate=edit";
    },'click .editRole': function (e, value, row, index) {
    	window.location.href = $("#base_path").val() + "/sysUser/user/detailRole?userCode="+row.userCode+"&operate=edit";
    },'click .editSta': function (e, value, row, index) {
    	var data = {'userCode':row.userCode, 'status':row.status, 'operate':'edit'};
		var url = $("#base_path").val() + "/sysUser/user/editSta";
		doPostAjax(url, data, doSuccessBack);
    	/* window.location.href = $("#base_path").val() + "/sysUser/user/editSta?userCode="+row.userCode+"&status="+row.status+"&operate=edit"; */
    }
};

function doSuccessBack(res){
	if(res.success == true){
		alert("更改成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("更改失败");
	}
}

function doSuccessDel(res) {
	if (res.success == true) {
		alert("删除成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("删除失败");
	}
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<input type="hidden" id="operate" value="${operate}"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">用户管理</a></li>
		    <li><a href="#">用户设置</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<button id="addBtn" class="btn btn-primary btn-sm">新增</button>
						</div>
						<div class="form-group mr40">
							<label for="userCode" class="control-label-first">用户名:</label> <input class="input-sm" type="text"
								class="form-control" id="user_code_search" placeholder="请输入用户名">
						</div>
						<div class="form-group mr40">
							<label for="userName" class="control-label">用户姓名:</label> <input class="input-sm" type="text"
								class="form-control" id="user_name_search" placeholder="请输入用户姓名">
						</div>
						<div class="form-group mr40">
							<label for="status" class="control-label">状态:</label> <select class="input-sm"
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
