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
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript">
	$(function() {
		
		var data = {};
		data['menuCode'] = $("#menuCode").val();
		var url = $("#base_path").val() + "/menumgr/menu/detailjson";
		doGetAjax(url, data, fillSelSuccessBack);
		
		var operate = $("#operate").val();
		if(operate == "edit"){
			$("#operContent").text("修改菜单");
		}
		
		//提交
		$('#subBtn').click(function() {
			var data = {};
			var t = $('form').serializeArray();
			$.each(t, function() {
				data[this.name] = this.value;
			});
			var operator = $("#operate").val() != "edit"?"add":"edit";
			var url = $("#base_path").val() + "/menumgr/menu/" + operator;
			doPostAjax(url, data, doSuccessBack);
		});
	});
	
	function doSuccessBack(res) {
		if (res.success == true) {
			alert("操作成功");
			window.location.href = $("#base_path").val() + "/views/system/menu_mgr.htm";
		}else{
			alert(res.msg);
		}
	}
	
	function fillSelSuccessBack(res){
		var data = eval("(" + res.data + ")");
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){
			for(var i = 0;i < data.length;i++){
				if(data[i].menuCode == $("#parentCodeVal").val()){
					html += "<option selected='selected' value='"+data[i].menuCode+"'>"+data[i].menuCode + "   " + data[i].menuName+"</option>";
				}else{
					html += "<option value='"+data[i].menuCode+"'>"+data[i].menuCode + "   " + data[i].menuName+"</option>";
				}
			}
		}
		$("#parentCodeSel").html(html);
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path" value="<%=request.getContextPath()%>" />
	<input type="hidden" id="parentCodeVal" value="${menu.parentCode}"/>
	<input type="hidden" id="operate" value = "${operate}"/>
	<div class="place">
    	<span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">系统管理</a></li>
	    	<li><a href="#">菜单设置</a></li>
	    	<li id="operContent">新增菜单</li>
   		</ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>菜单信息</span></div>
		    <ul class="forminfo">
			    <li><label>菜单编号:</label><input type="text" id="menuCode" name="menuCode" value ="${menu.menuCode}"  class="dfinput"/></li>
			    <li><label>菜单名称:</label><input type="text" name="menuName" value ="${menu.menuName}"  class="dfinput"/></li>
			    <li><label>菜单地址:</label><input type="text" name="menuUrl" value ="${menu.menuUrl}"  class="dfinput"/></li>
			    <li><label>父菜单编号:</label><select id="parentCodeSel" name="parentCode" value ="${menu.parentCode}" class="dfinput"></select></li>
			    <li><label>菜单顺序号:</label><input type="text" name="orderNo" value ="${menu.orderNo}"  class="dfinput"/></li>
			    <li><label>备注:</label><input type="text" name="remark" value="${menu.remark}" class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>