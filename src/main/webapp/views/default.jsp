<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="../components/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
</script>
</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    	<li>系统首页</li>
	    </ul>
    </div>
</body>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>
