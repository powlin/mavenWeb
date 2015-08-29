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
	/* $(".click").click(function(){
		$(".tip").fadeIn(200);
	}); */
	
	//查询
	/* var data = {};
	data['start'] = 0;
	data['limit'] = 1;
	var url = $("#base_path").val() + "/menumgr/querymenu";
	doPostAjax(url, data, function(){}); */
	
	$(".deletemenu").click(function(){
		/* var cmi = checkMenuItem(); */
		if(cmi != ''){
			if(!confirm("是否确认删除选中记录？")){
				return false;
			}
			var data = {};
			data['menuCodes'] = cmi;
			var url = $("#base_path").val() + "/menumgr/deletemenu";
			doPostAjax(url, data, doSuccessBack);
		}else{
			alert("请至少选择一条记录");
		}
	});
  
	$(".tiptop a").click(function(){
		$(".tip").fadeOut(200);
	});

	$(".sure").click(function(){
		$(".tip").fadeOut(100);
	  
	});
	
	//添加菜单
	$('#addmenuBtn').click(function() {
		var data = {};
		var t = $('#addmenuForm').serializeArray();
		
		$.each(t, function() {
			data[this.name] = this.value;
		});
		var url = $("#base_path").val() + "/menumgr/addmenu";
		doPostAjax(url, data, addmenuSuccessBack);
	});
	
	//添加菜单
	$('#updatemenuBtn').click(function() {
		var data = {};
		var t = $('#updatemenuForm').serializeArray();
		
		$.each(t, function() {
			data[this.name] = this.value;
		});
		var url = $("#base_path").val() + "/menumgr/updatemenu";
		doPostAjax(url, data, doSuccessBack);
	});

  	$(".cancel").click(function(){
	  	$(".tip").fadeOut(100);
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
			title : '上级菜单编号',
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
		$('#tableList').bootstrapTable('refresh');
	});
});

function operateFormatter(value, row) {
    return ['<a href="#" class="edit">查看</a> <a href="#" class="del">删除</a>'].join('');
    //<button class="btn btn-primary btn-xs edit">修改</button>&nbsp;&nbsp;<button class="btn btn-danger btn-xs del">删除</button>&nbsp;<button class="btn btn-danger btn-xs choice">分配菜单</button>'].join('');
}

window.operateEvents = {
    'click .edit': function (e, value, row, index) {
    	$("#operate_id").val("edit");
    },
    'click .del': function (e, value, row, index) {
    	if(!confirm("是否确认删除菜单"+row.menuCode+"?")){
    		return false;
    	}
    	var url = $("#base_path").val() + "/menumgr/menu/deletemenu";
    	var data = {menuCode:row.menuCode};
		doPostAjax(url, data, doSuccessDel);
    },
    'click .choice': function (e, value, row, index) {
    	window.location.href = $("#base_path").val()+"/page/system/role_menu.jsp?role_code="+row.roleCode+"&role_name="+row.roleName;
    }
};

function addmenuSuccessBack(res){
	var menuCode = res.menuCode;
	alert(menuCode);
}

function doSuccessBack(res) {
	alert (res.success) ;
	var errorInfo = res.errorInfo;
	alert(errorInfo);
}

function doSuccessDel(res) {
	if (res.success == true) {
		alert("删除成功");
		$('#tableList').bootstrapTable('refresh');
	}else{
		alert("删除失败");
	}
}

/* function checkMenuItem(){
	var check_val = "";
	var mi = "input.menuitem[type=checkbox]";
	for(var i = 0;i < $(mi).length;i++){
		if($(mi).eq(i).is(":checked")){
			check_val = check_val + $(mi).eq(i).val() + ",";
		}
	}
	if(check_val.length > 0){
		check_val = check_val.substring(0, check_val.length-1);
	}
	return check_val;
} */
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">系统管理</a></li>
		    <li><a href="#">菜单设置</a></li>
	    </ul>
    </div>
    <div class="leftinfo">
	    <div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group mr40">
							<label for="menuCode" class="control-label-first">菜单编号:</label> <input class="input-sm" type="text"
								class="form-control" id="menu_code_search" placeholder="请输入菜单编号">
						</div>
						<div class="form-group">
							<label for="parentCode" class="control-label">父菜单编号:</label> <input class="input-sm" type="text"
								class="form-control" id="parent_code_search" placeholder="请选择父菜单编号">
						</div>&nbsp;
						<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
						<button id="addBtn" class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#myModal">新增</button>
					</div>
				</div>
				<table id="tableList"></table>
			</div>
		</div>
    	<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">菜单设置</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form" id="addmenuForm">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">菜单编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="menuCode"
										placeholder="请输入菜单编号">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">菜单名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="menuName"
										placeholder="请输入菜单名称">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">菜单地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="menuUrl"
										placeholder="请输入菜单地址">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">父菜单编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="parentCode"
										placeholder="请输入父菜单编号">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">菜单顺序号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="orderNo"
										placeholder="请输入菜单顺序号">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="remark"
										placeholder="请输入备注">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button id="addmenuBtn" class="btn btn-primary">保存</button>
						<button class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
