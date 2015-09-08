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
		// 绑定列表
		$('#tableList').bootstrapTable({
			method : "get",
			url :  $("#base_path").val() + "/program/page",
			height : $(window).height() - 120,
			striped : true,
			singleSelect : true,
			queryParams : function(params) {
				return {
					proId : $("#proIdSearch").val(),
					userId : $("#userIdSearch").val(),
					name : $("#nameSearch").val(),
					type : $("#typeSearch").val(),
					status : $("#statusSearch").val(),
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
				field : 'proId',
				title : '项目编号',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'userId',
				title : '发起人ID',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'name',
				title : '项目名称',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'type',
				title : '项目类型',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'province',
				title : '省份',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'city',
				title : '城市',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'picture',
				title : '照片',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'video',
				title : '视频',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'summary',
				title : '项目概述',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'detail',
				title : '项目详情',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'targetAmount',
				title : '目标筹集金额',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'targetAmount',
				title : '目标筹集金额',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'raiseDays',
				title : '筹集天数',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'collectCount',
				title : '收藏人数',
				align : 'left',
				valign : 'middle',
				sortable : false
		    }, {
				field : 'status',
				title : '项目状态',
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
				field : 'commentCount',
				title : '评论人数',
				align : 'left',
				valign : 'middle',
				sortable : false
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

		
	});
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate_id"/>
	<div class="panel panel-default">
		<div class="panel-heading">众筹审批
	    </div>
		<div class="panel-body">
			<div>
				<div id="custom-toolbar" style="margin-bottom: 8px">
					<div class="form-inline" role="form" onsubmit="return searchSys();">
						<div class="form-group">
							<label for="menu_code" class="control-label-first">项目编号:</label> <input class="input-sm" type="text"
								class="form-control" id="prodIdSearch" placeholder="请输入项目编号">
						</div>
						<div class="form-group">
							<label for="parent_code" class="control-label">发起人编号:</label> <input class="input-sm" type="text"
								class="form-control" id="userIdSearch" placeholder="请选择父级菜单编号">
						</div>
						<div class="form-group">
							<label for="parent_code" class="control-label">项目名称:</label> <input class="input-sm" type="text"
								class="form-control" id="nameSearch" placeholder="请选择父级菜单编号">
						</div>
						<div class="form-group">
							<label for="parent_code" class="control-label">项目类型:</label> <input class="input-sm" type="text"
								class="form-control" id="typeSearch" placeholder="请选择父级菜单编号">
						</div>
						<div class="form-group">
							<label for="parent_code" class="control-label">项目状态:</label> <input class="input-sm" type="text"
								class="form-control" id="statusSearch" placeholder="请选择父级菜单编号">
						</div>&nbsp;
						<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
					</div>
				</div>
				<table id="tableList"></table>
			</div>
		</div>
	</div>
</body>
</html>