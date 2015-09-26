<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单设置</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	var data = {};
	var url = $("#base_path").val() + "/menumgr/menu/detailjson";
	doGetAjax(url, data, fillSelSuccessBack);
	
	//添加菜单
	$('#addBtn').click(function() {
		window.location.href = $("#base_path").val() + "/menumgr/menu/detail?operate=add";
	});
	
});

$(function() {
	// 绑定列表
	$('#tableList').bootstrapTable({
		method : "get",
		url : $("#base_path").val() + "/menumgr/menu/page",
		height : $(window).height() - 120,
		striped : true,
		singleSelect : true,
		queryParams : function(params) {
			return {
				menuCode : $("#menu_code_search").val(),
				parentCode : $("#parent_code_search").val(),
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
			field : 'menuCode',
			title : '菜单编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'menuName',
			title : '菜单名称',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'menuUrl',
			title : '菜单url',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'parentCode',
			title : '父菜单编号',
			align : 'left',
			valign : 'middle',
			sortable : false
		}, {
			field : 'orderNo',
			title : '菜单顺序',
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
			width : 200,
			align : 'center',
			valign : 'middle',
			formatter : operateFormatter,
			events : operateEvents
		}]
	});

	// 查询
	$('#searchBtn').click(function() {
		$('#tableList').bootstrapTable('refresh',{url: $("#base_path").val() + "/menumgr/menu/page"});
	});
});

//<button id="addBtn" class="btn btn-primary btn-sm" data-toggle="modal"
//								data-target="#myModal">新增</button>
function operateFormatter(value, row) {
    return ['<button class="btn btn-link btn-xs edit">修改</button><button class="btn btn-link btn-xs del">删除</button>'].join('');
    //<button class="btn btn-primary btn-xs edit">修改</button>&nbsp;&nbsp;<button class="btn btn-danger btn-xs del">删除</button>&nbsp;<button class="btn btn-danger btn-xs choice">分配菜单</button>'].join('');
}

window.operateEvents = {
    'click .edit': function (e, value, row, index) {
    	window.location.href = $("#base_path").val() + "/menumgr/menu/detail?operate=edit"+ "&menuCode="+row.menuCode+"&parentCode="+row.parentCode;
    },
    'click .del': function (e, value, row, index) {
    	if(!confirm("是否确认删除菜单"+row.menuCode+"?")){
    		return false;
    	}
    	var url = $("#base_path").val() + "/menumgr/menu/delete";
    	var data = {menuCode:row.menuCode};
		doPostAjax(url, data, doSuccessDel);
    },
    'click .choice': function (e, value, row, index) {
    	window.location.href = $("#base_path").val()+"/page/system/role_menu.jsp?role_code="+row.roleCode+"&role_name="+row.roleName;
    }
};
function addmenuSuccessBack(res){
	if(res.success == true){
		alert("新增成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("新增失败");
	}
}

function doSuccessBack(res) {
	
}

function doSuccessDel(res) {
	if (res.success == true) {
		alert("删除成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("删除失败");
	}
}

function fillSelSuccessBack(res){
	var data = eval("(" + res.data + ")");
	var html = "<option value=''>请选择</option>";
	if(typeof(data) != "undefined"){//判断undifined
		for(var i = 0;i < data.length;i++){
			if(data[i].menuCode == $("#parentCodeVal").val()){
				html += "<option selected='selected' value='"+data[i].menuCode+"'>"+data[i].menuCode + "   " + data[i].menuName+"</option>";
			}else{
				html += "<option value='"+data[i].menuCode+"'>"+data[i].menuCode + "   " + data[i].menuName+"</option>";
			}
		}
	}
	$("#parent_code_search").html(html);
}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<input type="hidden" id="operate" value="${operate}"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li>权限管理</li>
		    <li>菜单管理</li>
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
							<label for="menuCode" class="control-label-first">菜单编号:</label> <input class="input-sm" type="text"
								class="form-control" id="menu_code_search" placeholder="请输入菜单编号">
						</div>
						<div class="form-group">
							<label for="parentCode" class="control-label">父菜单编号:</label> <select class="input-sm"
								class="form-control" id="parent_code_search"></select>
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
