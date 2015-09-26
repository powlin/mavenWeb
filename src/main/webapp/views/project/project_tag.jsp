<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>众筹管理</title>
<jsp:include page="../../components/jsp/include.jsp" />
<script type="text/javascript">
var typeData=null;
var statusData=null;
	$(function() {
		var data = {"pKey":"p_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		var data = {"pKey":"p_status"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data, false, doSuccessBackStatus);
		// 绑定列表
		$('#tableList').bootstrapTable({
			method : "get",
			url :  $("#base_path").val() + "/project/page",
			height : $(window).height() - 120,
			striped : true,
			singleSelect : true,
			queryParams : function(params) {
				return {
					proId : $("#proIdSearch").val(),
					name : $("#nameSearch").val(),
					type : $("#typeSearch").val(),
					status : $("#statusSearch").val(),
					isHot : $('#isHotCheck').val(),
					isRecommend : $('#isRecommendCheck').val(),
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
				title : '编号',
				align : 'left',
				valign : 'middle',
				width : 300,
				sortable : false
			},{
				field : 'name',
				title : '名称',
				align : 'left',
				valign : 'middle',
				width : 300,
				sortable : false
			},{
				field : 'type',
				title : '类型',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false,
				formatter : typeFormatter
			},{
				field : 'targetAmount',
				title : '目标金额',
				align : 'right',
				valign : 'middle',
				width : 200,
				sortable : false,
				formatter : moneyFormatter
			},{
				field : 'raiseDays',
				title : '筹集天数',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false
			},{
				field : 'status',
				title : '状态',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false,
				formatter : statusFormatter
			 },{
				field : 'isHot',
				title : '是否热门',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false,
				formatter : isValueFormatter
			 },{
				field : 'isRecommend',
				title : '是否推荐',
				align : 'left',
				valign : 'middle',
				width : 200,
				sortable : false,
				formatter : isValueFormatter
			 },{
				field : 'createDatetime',
				title : '创建时间',
				align : 'left',
				valign : 'middle',
				width : 500,
				sortable : false,
				formatter : dateFormatter
			 },{
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
			$('#tableList').bootstrapTable('refresh',{url: $("#base_path").val() + "/project/page"});
		});
	});
	
	function moneyFormatter(value, row){
		return moneyFormat(value, 2);
	}
	
	function doSuccessBackType(res){
		var data = res.data;
		typeData = data;
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#typeSearch").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#typeSearch").html(html);
	}
	
	function doSuccessBackStatus(res){
		var data = res.data;
		statusData = data;
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#statusSearch").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#statusSearch").html(html);
	}
	
	function operateFormatter(value, row) {
		return ['<button class="btn btn-link btn-xs tag">设置</button>'].join('');
    }
	
	function typeFormatter(value, row) {
		for(var i = 0;i < typeData.length;i++){
			if(typeData[i].key == value){
				return typeData[i].value;
			}
		}
    }
	
	function isValueFormatter(value, row) {
		var returnVal = "";
		if(value == "0"){
			returnVal = "否";
		}else if(value == "1"){
			returnVal = "是";
		}
		return returnVal;
    }
	
	function statusFormatter(value, row) {
		for(var i = 0;i < statusData.length;i++){
			if(statusData[i].key == value){
				return statusData[i].value;
			}
		}
    }
	
	function dateFormatter(value, row){
		return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
	}
	
	window.operateEvents = {
        'click .tag': function (e, value, row, index) {
        	window.location.href = $("#base_path").val() + "/projectTag/detail?proId="+row.proId;
        }
	};
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="tag"
		value="${tag}" />
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">营销管理</a></li>
		    <li><a href="#">项目查询</a></li>
	    </ul>
    </div>
    <div class="panel-body">
		<div id="custom-toolbar" style="margin-bottom: 8px">
			<div class="form-inline" role="form">
					<div class="form-group">
						<label for="proIdSearch" class="control-label-first">编号:</label> <input class="input-sm" type="text"
							class="form-control" id="proIdSearch" placeholder="请输入编号">
					</div>
					<div class="form-group">
						<label for="nameSearch" class="control-label">名称:</label> <input class="input-sm" type="text"
							class="form-control" id="nameSearch" placeholder="请输入名称">
					</div>
					<div class="form-group">
						<label for="typeSearch" class="control-label">类型:</label>
							<select id="typeSearch" name="typeSearch" class="form-control"></select>
					</div>
					<div class="form-group">
						<label for="statusSearch" class="control-label">状态:</label>
							<select id="statusSearch" name="statusSearch" class="form-control"></select>
					</div>
					<div class="form-group">
						<label for="isHotSearch" class="control-label">是否热门:</label>
							<select id="isHotSearch" name="isHotSearch" class="form-control">
								<option value="" selected=”selected“>请选择</option>
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
					</div>
					<div class="form-group">
						<label for="isRecommendCheck" class="control-label">是否推荐:</label>
							<select id="isRecommendCheck" name="isRecommendCheck" class="form-control">
								<option value="" selected=”selected“>请选择</option>
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
					</div>
					<button id="searchBtn" class="btn btn-default btn-sm">搜索</button>
				</div>
			</div>
			<table id="tableList"></table>
	</div>
</body>
</html>