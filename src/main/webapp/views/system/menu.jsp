<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>菜单管理</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
	$(function() {
		//下拉菜单
		doGetAjax("/user/menu/list", null, doPMenuBack);
		
		// 绑定列表
		$('#tableList').bootstrapTable({
			method : "get",
			url : "/user/menu/page",
			height : $(window).height() - 120,
			striped : true,
			singleSelect : true,
			queryParams : function(params) {
				return {
					menu_code : $("#menu_code_search").val(),
					parent_code : $("#parent_code_search").val(),
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
				title : '访问地址',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'parentCode',
				title : '父级菜单',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'orderNo',
				title : '排序编号',
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
			}],
			onLoadSuccess : function() {
			},
			onLoadError : function() {
				mif.showErrorMessageBox("数据加载失败！");
			}
		});

		// 查询
		$('#searchBtn').click(function() {
			$('#tableList').bootstrapTable('refresh');
			
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
			var url = $("#base_path").val() + "/user/menu/" + operator;
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function doPMenuBack(res){
		if (res.success == true) {
			$.each(res.data, function(i, item) {
				$("#parent_code").append("<option value=\"" + item.menuCode + "\">" + item.menuCode + " " + item.menuName + "</option>");
			});
		}
	}

	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			$('#myModal').modal('hide');
			$('#tableList').bootstrapTable('refresh');
		}
	}
	
	function operateFormatter(value, row) {
        return ['<button class="btn btn-primary btn-xs edit">修改</button>&nbsp&nbsp<button class="btn btn-danger btn-xs del">删除</button>'].join('');
    }
	
    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
        	$("#operate_id").val("edit");
            $('#myModal').modal('show');
            $('input[name="menu_code"]').val(row.menuCode);
            $('input[name="menu_name"]').val(row.menuName);
            $('input[name="menu_url"]').val(row.menuUrl);
            $('input[name="parent_code"]').val(row.parentCode);
            $('input[name="order_no"]').val(row.orderNo);
            $('input[name="remark"]').val(row.remark);
        },
        'click .del': function (e, value, row, index) {
        	var url = $("#base_path").val() + "/user/menu/drop";
        	var data = {menu_code:row.menuCode};
			doPostAjax(url, data, doSuccessDel);
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
	<div class="panel panel-default">
		<div class="panel-heading">菜单管理
			<span class="text-right"><button id="addBtn" class="btn btn-primary btn-sm" data-toggle="modal"
				data-target="#myModal">新增</button></span>
	    </div>
		<div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group">
							<label for="menu_code" class="control-label-first">菜单编号:</label> <input class="input-sm" type="text"
								class="form-control" id="menu_code_search" placeholder="请输入菜单编号">
						</div>
						<div class="form-group">
							<label for="parent_code" class="control-label">父级菜单编号:</label> <input class="input-sm" type="text"
								class="form-control" id="parent_code_search" placeholder="请选择父级菜单编号">
						</div>&nbsp;
						<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
					</div>
				</div>
				<table id="tableList"></table>
			</div>
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
					<form class="form-horizontal" role="form" id="form">
						<div class="form-group">
							<label for="menu_code" class="col-sm-2 control-label">菜单编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="menu_code"
									placeholder="请输入菜单编号">
							</div>
						</div>
						<div class="form-group">
							<label for="menu_name" class="col-sm-2 control-label">菜单名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="menu_name"
									placeholder="请输入菜单名称">
							</div>
						</div>
						<div class="form-group">
							<label for="menu_url" class="col-sm-2 control-label">访问地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="menu_url"
									placeholder="请输入访问地址">
							</div>
						</div>
						<div class="form-group">
							<label for="parent_code" class="col-sm-2 control-label">父级菜单编号</label>
							<div class="col-sm-10">
								<select id="parent_code" class="form-control" name="parent_code">
									<option value="">--请选择--</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="order_no" class="col-sm-2 control-label">排序号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="order_no"
									placeholder="请输入排序号">
							</div>
						</div>
						
						<div class="form-group">
							<label for="remark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="remark"
									placeholder="请输入备注">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="subBtn" class="btn btn-primary">保存</button>
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>