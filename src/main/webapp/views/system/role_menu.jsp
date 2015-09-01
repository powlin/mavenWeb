<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>分配菜单</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/components/ligerui/css/ligerui-tree.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/components/css/main.css">
<script src="<%=request.getContextPath()%>/components/js/jquery-1.11.3.js"></script>
<script src="<%=request.getContextPath()%>/components/ligerui/js/base.js"></script>
<script src="<%=request.getContextPath()%>/components/ligerui/js/ligerTree.resource.js"></script>
<script src="<%=request.getContextPath()%>/components/js/ajax_com.js"></script>
</head>
<script type="text/javascript" language="javascript">
$(function() {
	//下拉菜单
	doGetAjax($("#base_path").val()+"/sysAuth/menu/nodelist", null, doMenuNode);
});
function doMenuNode(nodes){
	$("#treeMenu").ligerTree({
		nodeWidth:300,
		data:nodes.data,
		checkbox: true,
		isExpand: true,
		idFieldName :'id',
		parentIDFieldName :'pid'
	});
	
	$("#subBtn").click(function() {
		var nodeArr = new Array();
		var nodeData = $("#treeMenu").ligerGetTreeManager().getChecked();
		for (var i = 0; i < nodeData.length; i++){
			nodeArr[i] = nodeData[i]['data']['id'];
		}
		var url = $("#base_path").val() + "/sysAuth/roleMenu/edit";
    	var data = {role_code:"1111",menus:nodeArr};
		doPostAjax(url, data, doSuccessBack);
	});
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/system/role.htm";
		}else{
			alert(res.msg);
		}
	}
}
</script>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" id="operate_id"/>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">系统管理</a></li>
		    <li><a href="#">分配菜单</a></li>
	    </ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>菜单列表</span></div>
		    <div id="treeMenu"></div>
	    </div>
	    <input id="subBtn" type="button" class="btn mr40" value="提交"/>
    </form>
</body>
</html>