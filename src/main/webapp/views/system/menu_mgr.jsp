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
	$(".click").click(function(){
		$(".tip").fadeIn(200);
	});
  
	$(".addmenu").click(function(){
		$(".addmenudiv").fadeIn(200);
	});
  
	$(".tiptop a").click(function(){
		$(".tip").fadeOut(200);
	});

	$(".sure").click(function(){
		$(".tip").fadeOut(100);
	  
	});
	//登录
	$('#addmenuBtn').click(function() {
		var data = {};
		var t = $('#addmenuForm').serializeArray();
		
		$.each(t, function() {
			data[this.name] = this.value;
		});
		var url = $("#base_path").val() + "/menumgr/addmenu";
		doPostAjax(url, data, doSuccessBack);
	});

  	$(".cancel").click(function(){
	  	$(".tip").fadeOut(100);
	});

});

function doSuccessBack(res) {
	if (res.errorCode == 0) {
		//window.location.href = $("#base_path").val()+"/views/system/menu_mgr.jsp";
	}else{
		
	}
}
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
    <div class="rightinfo">
    <div class="tools">
    	<ul class="toolbar">
	        <li class="click addmenu"><span><img src="<%=request.getContextPath()%>/components/images/t01.png" /></span>添加</li>
	        <li class="click"><span><img src="<%=request.getContextPath()%>/components/images/t02.png" /></span>修改</li>
	        <li><span><img src="<%=request.getContextPath()%>/components/images/t03.png" /></span>删除</li>
        	<li><span><img src="<%=request.getContextPath()%>/components/images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
        	<li><span><img src="<%=request.getContextPath()%>/components/images/t05.png" /></span>设置</li>
        </ul>
    </div>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="../components/images/px.gif" /></i></th>
        <th>标题</th>
        <th>标题</th>
        <th>标题</th>
        <th>用户</th>
        <th>籍贯</th>
        <th>发布时间</th>
        <th>是否审核</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130908</td>
        <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>admin</td>
        <td>江苏南京</td>
        <td>2013-09-09 15:05</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../components/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    <div class="tip addmenu">
    	<div class="tiptop"><span>添加菜单</span><a></a></div>
        
    	<div class="tipinfo">
	        <form id="addmenuForm">
	        	<input name="menuCode" type="text" value="01141"/>
	        	<input name="menuName" type="text" value="测试菜单"/>
	        	<input name="menuUrl" type="text" value="/std-account/account"/>
	        	<input name="parentCode" type="text" value=""/>
	        	<input name="orderNo" type="text" value="1"/>
	        	<input name="remark" type="text" value="测试"/>
	        </form>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button" id="addmenuBtn" class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
