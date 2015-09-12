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
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/components/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/components/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/components/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	$(function() {
		var data = {"pKey":"p_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		
		// 审核通过
		$('#appPassBtn').click(function() {
			var data = {"proId":$("#proId").val(),"checkResult":"0","remark":"审核通过"};
			var url = $("#base_path").val() + "/project/approve";
			doPostAjax(url,data,doSuccessBackApp);
		});
		
		// 审核不通过
		$('#unAppPassBtn').click(function() {
			var data = {"proId":$("#proId").val(),"checkResult":"1","remark":"审核不通过"};
			var url = $("#base_path").val() + "/project/approve";
			doPostAjax(url,data,doSuccessBackUnApp);
		});
	});
	
	function doSuccessBackApp(res){
		if (res.success == true) {
			alert("审核通过操作成功!");
			window.location.href = $("#base_path").val() + "/views/project/approve_project.htm";
		}else{
			alert(res.msg);
		}
	}
	
	function doSuccessBackUnApp(res){
		if (res.success == true) {
			alert("申请不通过审核成功!");
			window.location.href = $("#base_path").val() + "/views/project/approve_project.htm";
		}else{
			alert(res.msg);
		}
	}
	
	function doSuccessBackType(res){
		var data = res.data;
		var html = "<option value=''>请选择</option>";
		if(typeof(data) != "undefined"){//判断undifined
			for(var i = 0;i < data.length;i++){
				if(data[i].key == $("#type").val()){
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].key + "   " + data[i].value+"</option>";
				}
			}
		}
		$("#type").html(html);
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
		    <li><a href="#">项目管理</a></li>
		    <li><a href="#">众筹审批</a></li>
		    <li><a href="#">申请审批</a></li>
	    </ul>
    </div>
    <form>
	    <div class="formbody">
	    <div class="formtitle"><span>申请信息</span></div>
		    <ul class="forminfo">
			    <li><label>项目编号:</label><input type="text" id="proId" name="proId" value ="${project.proId}"  class="dfinput"/></li>
			    <li><label>项目名称:</label><input type="text" id="name" name="name" value ="${project.name}"  class="dfinput"/></li>
			    <li><label>项目类型:</label>
				    <select id="type" name="type" class="dfinput">
				    	<option value="${project.type}"></option>
					</select>
				</li>
				<li><label>发起省份:</label><input type="text" id="province" name="province" value ="${project.province}"  class="dfinput"/></li>
				<li><label>发起城市:</label><input type="text" id="city" name="city" value ="${project.city}"  class="dfinput"/></li>
				<li><label>项目图片:</label><input type="text" id="picture" name="picture" value ="${project.picture}"  class="dfinput"/></li>
				<li><label>项目视频:</label><input type="text" id="video" name="video" value ="${project.video}"  class="dfinput"/></li>
				<li><label>项目概述:</label><textarea id="summary" name="summary" value ="${project.summary}"  class="dfinput"></textarea></li>
				<li class="cfl"><label>项目详情:</label>
    				<script id="editor" type="text/plain" style="width:900px;height:250px;float:left"></script>
				</li>
				<li><label>目标筹集金额(元):</label><input type="text" id="targetAmount" name="targetAmount" value ="${project.targetAmount}"  class="dfinput"/></li>
				<li><label>筹集期限(天):</label><input type="text" id="raiseDays" name="raiseDays" value ="${project.raiseDays}"  class="dfinput"/></li>
				<li><label>发起人编号:</label><input type="text" id="userId" name="userId" value ="${project.userId}"  class="dfinput"/></li>
				 <li><label>申请时间:</label><input type="text" id="createDatetime" name="createDatetime" value ="${project.createDatetime}"  class="dfinput"/></li>
			    <li><input id="subBtn" type="button" class="btn mr40" value="确认保存"/>&nbsp;<input id="appPassBtn" type="button" class="btn mr40" value="审核通过"/>&nbsp;<input id="unappPassBtn" type="button" class="btn mr40" value="审核不通过"/></li>
			</ul>
			<script type="text/javascript"> 
    			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    			var ue = UE.getEditor('editor');
    		</script>
	    </div>
    </form>
</body>
</html>