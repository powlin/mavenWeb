<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="../components/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../components/js/jquery.js"></script>
<link href="../components/css/ligerui-tree.css" rel="stylesheet" type="text/css" />
<!--script src="js/ligerTree.js" type="text/javascript"></script-->

<script src="js/base.js" type="text/javascript"></script>
<script src="js/ligerTree_1.js" type="text/javascript"></script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    
    <li><a href="#">树形结构</a></li>
    </ul>
    </div>
    
     

    <div class="tree_mian">
    <div class="tree_item">
        <input type="text" class="l-text" value="节点名" id="txtNode"  /> 
        <a class="l-button" onclick="addTreeItem()" >增加节点</a>
            <a class="l-button" onclick="removeTreeItem()" >删除节点</a>
         <a class="l-button" onclick="clearTreeItem()" >清空节点</a>

         <a class="l-button" onclick="addTreeItem2()" >增加节点(带子节点)</a>
    </div>


     <!-- 带复选框和图标 -->
<div class="tree_wrap">
    <ul class="l-tree">
        <li id="bb">
            <span>节点1</span>
            <ul>
                <li id="1222">
                    <span>节点1.1</span>
                     <ul>
                        <li id="11" ischecked="true"><span>节点1.1.2</span></li>
                        <li id="222"><span>节点1.1.2</span></li>
                     </ul>
                 </li>
                 <li id="333"><span>节点1.2</span></li>
            </ul>
        </li> 
        <li id="333"><span>节点2</span></li>
        <li id="444"><span>节点1.2</span>
            <span>节点3</span>
            <ul>
                <li id="555" ischecked="true"><span>节点3.1</span></li>
                <li id="666"><span>节点3.2</span></li>
            </ul>
        </li>
    </ul>
    </div>

    <a class="l-button" onclick="getChecked()" style="float:left;margin-right:10px;">获取选择(复选框)</a> 
    <div id="aaa"></div>
    
    <div class="mt10"><input name="" type="button" class="btn" value="保存节点"></div>
</div>
    
   
   <script type="text/javascript">
        var manager = null;
        $(function ()
        {
            $(".l-tree").ligerTree({ checkbox: true });
            manager = $(".l-tree").ligerGetTreeManager();
        });
        function addTreeItem()
        {
            var node = manager.getSelected();
            var nodes = [];
            nodes.push({ text: $("#txtNode").val() });
            if (node)
                manager.append(node.target, nodes); 
            else
                manager.append(null, nodes);
        }
        function addTreeItem2()
        {
            var node = manager.getSelected();
            var nodes = [];
            nodes.push({ text: $("#txtNode").val(), children: [{ text: '111', children: [{ text: '222'}]}] });
            if (node)
                manager.append(node.target, nodes);
            else
                manager.append(null, nodes);
        }
        function removeTreeItem()
        {
            var node = manager.getSelected();
            if (node)
                manager.remove(node.target);
            else
                alert('请先选择节点');
        }
        function clearTreeItem()
        {
            manager.clear();
        }

        function GetParentElement(oElement, parentTagName) {
         // 注意 parentTagName必须大写
             oElement = oElement.parentNode;

                if(!oElement){
                     while (oElement.tagName != null && oElement.tagName !=parentTagName) {
                        oElement = oElement.parentNode;
                        
                    }
                    return oElement;
                }else{

                }
        }
        
       //获取选择的节点
        function getChecked()
        {
            var notes = manager.getChecked();
            var numbers = "";
            var _targetby ="";

           for (var i = 0; i < notes.length; i++){
                var _this = notes[i];
                    _target = _this.target;
                _targetId = _target.getAttribute('id');
                _targetby += _targetId +',';
                var _parent = $('#'+_targetId).parents('li');
                _parent.each(function(){
                  
                   _parentsn = $(this).attr('id')
                    numbers+= _parentsn +','
                    
                })
           }

           console.log(_targetby)
           numbers += _targetby + ',';
           numbers=numbers.substring(0,numbers.length-2) 
          // alert('id='+numbers)
        }

       // $(function(){
       //      $('.l-tree').find('li').each(function(){
       //          $(this).click(function(){
                   
       //              $(this).find('.l-checkbox:eq(0)').addClass('l-checkbox-checked')
       //          })
       //      })
       // })



    </script>

</body>

</html>
