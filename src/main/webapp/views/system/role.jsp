<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>角色管理</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
	$(function() {
		// 绑定列表
		$('#tableList').bootstrapTable({
			method : "get",
			url : $("#base_path").val() + "/sysAuth/role/page",
			height : $(window).height() - 120,
			striped : true,
			singleSelect : true,
			queryParams : function(params) {
				return {
					role_code : $("#role_code_search").val(),
					role_level : $("#role_level_search").val(),
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
				field : 'roleCode',
				title : '角色编号',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'roleName',
				title : '角色名称',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'roleLevel',
				title : '角色等级',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'creator',
				title : '创建人',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'createDatetime',
				title : '创建时间',
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
		
		// 新增
		$('#addBtn').click(function() {
			window.location.href = $("#base_path").val() + "/sysAuth/role/detail?operate=add";
		});
		
		$("#myModel").on("show.bs.modal", function() {
	         $(this).removeData("bs.modal");
		});

		//新增提交
		$('#subBtn').click(function() {
			var data = {};
			var t = $('form').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			var operator = $("#operate_id").val() != "edit"?"add":"edit";
			var url = $("#base_path").val() + "/sysAuth/role/" + operator;
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			$('#myModal').modal('hide');
			$('#tableList').bootstrapTable('refresh');
		}
	}
	
	function operateFormatter(value, row) {
        return ['<button class="btn btn-link btn-xs edit">修改</button>&nbsp;&nbsp;<button class="btn btn-link btn-xs del">删除</button>&nbsp;<button class="btn btn-link btn-xs choice">分配菜单</button>'].join('');
    }
	
    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
        	window.location.href = $("#base_path").val() + "/sysAuth/role/detail?role_code="+row.roleCode+"&operate=edit";
        },
        'click .del': function (e, value, row, index) {
        	var url = $("#base_path").val() + "/sysAuth/role/drop";
        	var data = {role_code:row.roleCode};
			doPostAjax(url, data, doSuccessDel);
        },
        'click .choice': function (e, value, row, index) {
        	window.location.href = $("#base_path").val()+"/views/system/role_menu.jsp?role_code="+row.roleCode+"&role_name="+row.roleName;
        }
    };
    
    function doSuccessDel(res) {
		if (res.success == true) {
			alert("删除成功");
			$('#tableList').bootstrapTable('refresh');
		}
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate_id"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">系统管理</a></li>
		    <li><a href="#">菜单设置</a></li>
	    </ul>
	    
    </div>
	<div class="panel-body">
		<div>
			<div id="custom-toolbar" style="margin-bottom: 8px">
				<div class="form-inline" role="form">
					<div class="form-group mr40">
						<label for="menu_code" class="control-label-first">角色编号:</label> <input class="input-sm" type="text"
							class="form-control" id="role_code_search">
					</div>
					<div class="form-group">
						<label for="parent_code" class="control-label">角色等级:</label>
						<select id="role_level_search" class="form-control" name="role_level">
							<option value="">请选择</option>
							<option value="1">1 财务级别</option>
							<option value="2">2 运营推广级别</option>
							<option value="3">3 风控级别</option>
						</select>
					</div>&nbsp;
					<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
					<button id="addBtn" class="btn btn-primary btn-sm">新增</button>
				</div>
			</div>
			<table id="tableList"></table>
		</div>
	</div>
</body>
</html>