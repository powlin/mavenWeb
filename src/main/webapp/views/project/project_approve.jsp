<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>项目审批</title>
<jsp:include page="../../components/jsp/include_f.jsp" />
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor');
	$(function() {
		var data = {"pKey":"p_type"};
		var url = $("#base_path").val() + "/dict/list";
		doGetAjaxIsAsync(url, data,false, doSuccessBackType);
		$("#targetAmount").val(moneyFormat($("#targetAmount").val(), 2));
		
		// 保存
		$('#saveBtn').click(function() {
			var colNames=['项目编号','项目名称','项目类型','省份','城市','图片','视频','概述','具体描述','目标金额','筹集天数'];
			var isNulls=[1,1,1,1,1,1,0,1,1,1,1];
			var colValues=[$("#proId").val(),$("#name").val(),$("#type").val(),$("#province").val(),$("#city").val(),$("#picture").val(),$("#video").val(),$("#summary").val(),ue.getContent(),$("#targetAmount").val(),$("#raiseDays").val()];
			var colLengths=[32,64,4,4,4,64,128,128,1024,10,10];
			if(!checkData(colNames,isNulls,colValues,colLengths)){
				return;
			}
			$("#targetAmount").val(moneyFormatByEnLarge($("#targetAmount").val(), 0));
			var path = $("#base_path").val() + "/project/edit";
			$('#proForm').attr("method","post");
		    $('#proForm').attr("action", path).submit();
		});
		
		// 审核通过
		$('#appPassBtn').click(function() {
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"checkResult":"0","remark":remark};
			var url = $("#base_path").val() + "/project/approve";
			doPostAjax(url,data,doSuccessBackApp);
		});
		
		// 审核不通过
		$('#unAppPassBtn').click(function() {
			var remark = $("#remark").val();
			if(remark == undefined || remark == null || remark == ''){
				alert("备注不能为空");
				return;
			}
			var data = {"proId":$("#proId").val(),"checkResult":"1","remark":remark};
			var url = $("#base_path").val() + "/project/approve";
			doPostAjax(url,data,doSuccessBackUnApp);
		});
		
		$("#createDatetime").val(dateFormat($("#createDatetime").val(),'yyyy-MM-dd HH:mm:ss'));
	});
	
	function delReturn(id){
		var url = $("#base_path").val() + "/project/return/del";
		alert(url);
    	var data = {id:id};
		doPostAjax(url, data, doSuccessDel);
	}
	
	 function doSuccessDel(res) {
		if (res.success == true) {
			alert("删除成功");
			window.location.href = $("#base_path").val() + "/project/check?proId="+$("#proId").val()+"&operate=approve";
		}
	}
	
	function doSuccessBackApp(res){
		if (res.success == true) {
			alert("审核通过操作成功!");
			window.location.href = $("#base_path").val() + "/project/list?op_status=1";
		}else{
			alert(res.msg);
		}
	}
	
	function doSuccessBackUnApp(res){
		if (res.success == true) {
			alert("申请不通过审核成功!");
			window.location.href = $("#base_path").val() + "/project/list?op_status=1";
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
					html += "<option selected='selected' value='"+data[i].key+"'>"+data[i].value+"</option>";
				}else{
					html += "<option value='"+data[i].key+"'>"+data[i].value+"</option>";
				}
			}
		}
		$("#type").html(html);
	}
	
	/**
	 * 提示信息显示隐藏
	 * @param e
	 */
	function toggleMess(e){
		if($(e).val() != ""){
			$(e).next().addClass("hid");
		}else{
			$(e).next().removeClass("hid");
		}
	}
</script>
</head>
<body>
	<input type="hidden" id="base_path"
		value="<%=request.getContextPath()%>" />
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">项目管理</a></li>
		    <li><a href="#">众筹审批</a></li>
		    <li><a href="#">申请审批</a></li>
	    </ul>
    </div>
    <form id="proForm" >
	    <div class="formbody">
	    <div class="formtitle"><span>申请信息</span></div>
		    <ul class="forminfo">
			    <li><input type="hidden" id="proId" name="proId" value ="${project.proId}"/></li>
			    <li><label><span class="inline_red">*</span>项目名称:</label><input type="text" id="name" name="name" value ="${project.name}"  class="dfinput"/></li>
			    <li><label><span class="inline_red">*</span>项目类型:</label>
				    <select id="type" name="type" class="dfinput">
				    	<option value="${project.type}"></option>
					</select>
				</li>
				<li><label><span class="inline_red">*</span>发起省份:</label><input type="text" id="province" name="province" value ="${project.province}"  class="dfinput"/></li>
				<li><label><span class="inline_red">*</span>发起城市:</label><input type="text" id="city" name="city" value ="${project.city}"  class="dfinput" /></li>
				<li><label><span class="inline_red">*</span>项目图片:</label><input type="text" id="picture" name="picture" value ="${project.picture}"  class="dfinput"/><a href="javascript:void(0)" onclick=""></li>
				<li><label>&nbsp;&nbsp;&nbsp;&nbsp;项目视频:</label><input type="text" id="video" name="video" value ="${project.video}"  class="dfinput"/></li>
				<li><label><span class="inline_red">*</span>目标金额(元):</label><input type="text" id="targetAmount" name="targetAmount" value ="${project.targetAmount}" class="dfinput"/></li>
				<li><label><span class="inline_red">*</span>筹集天数:</label><input type="text" id="raiseDays" name="raiseDays" value ="${project.raiseDays}" class="dfinput" /></li>
				<li><label><span class="inline_red">*</span>项目概述:</label><textarea id="summary" name="summary" class="textinput" >${project.summary}</textarea></li>
				<li class="cfl"><label><span class="inline_red">*</span>项目详情:</label>
    				<script id="editor" name="detail" type="text/plain" style="width:900px;height:250px;float:left">${project.detail}</script>
				</li>
				<li><input type="hidden" id="userId" name="userId" value ="${project.userId}"  class="dfinput" readOnly="true"/></li>
				<li><input type="hidden" id="createDatetime" name="createDatetime" value ="${project.createDatetime}"  class="dfinput" readOnly="true"/></li>
				<li class="cfl"><label>&nbsp;&nbsp;&nbsp;&nbsp;回报列表:</label>
				<a href="<%=request.getContextPath()%>/project/return/detail?operate=add&proId=${project.proId}">新增回报</a>
				<table class="tablelist" style="width:87%; clear:none; float:left">
					    <tr>
						    <th>编号</th>
						    <th>回报名称</th>
						    <th>支持金额</th>
						    <th>是否限制人数</th>
						    <th>限制人数</th>
						    <th>回报天数</th>
						    <th>回报类型</th>
						    <th>操作</th>
						</tr>
						<tr>
						    <td>-1</td>
						    <td>无私支持</td>
						    <td>0.0</td>
						    <td>不限</td>
						    <td>0</td>
						    <td></td>
						    <td>其他</td>
						    <td></td>
						</tr>
						<c:forEach var="domain" items="${returnList}" varStatus="status">
							<tr>
							    <td>${domain.id}</td>
							    <td>${domain.name}</td>
							    <td>${domain.amount}</td>
							    <td><c:choose>
							    <c:when test="${domain.needLimit == '1'}">  
							    是
							    </c:when>
							    <c:otherwise>否</c:otherwise>
							    </c:choose></td>
							    <td>${domain.limitNum}</td>
							    <td>${domain.returnExpectedDays}</td>
							    <td><c:choose>
							    <c:when test="${domain.returnType == '1' || domain.returnType == '2'}">  
							    实物
							    </c:when>
							    <c:otherwise>虚拟信息</c:otherwise>
							    </c:choose></td>
							    <td><a href="<%=request.getContextPath()%>/project/return/detail?operate=edit&id=${domain.id}">修改</a>&nbsp;
							    <a href="javascript:void(0)" onclick="delReturn('${domain.id}')">删除</a></td>
							</tr>
						</c:forEach>
					</table>
				</li>
				<li><label><span class="inline_red">*</span>审核信息</label><input type="text" id="remark" name="remark" class="dfinput" onblur="toggleMess(this)"/><span class="inline_red hid">审核备注不能为空</span>
				</li>
			    <li><input id="saveBtn" type="button" class="btn mr40" value="确认保存" />&nbsp;<input id="appPassBtn" type="button" class="btn mr40" value="审核通过"/>&nbsp;&nbsp;<input id="unAppPassBtn" type="button" class="btn" value="审核不通过"/></li>
			</ul>
	    </div>
    </form>
</body>
</html>