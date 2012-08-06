<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../../public/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
$().ready(function() {
	tree = new dhtmlXTreeObject("departmentTree", "100%", "100%", 0);
	//tree.setSkin('dhx_skyblue');
	//设置单击节点的事件
	//tree.setOnClickHandler(function(id){openPathDocs(id);});
	tree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	//set plus images设置收缩节点图标
	tree.setImageArrays("plus", "", "", "", "plus_ar.gif", "plus_ar.gif");
	 //set minus images设置展开节点图标
	tree.setImageArrays("minus", "", "", "", "minus_ar.gif", "minus_ar.gif");
	tree.enableTreeLines(false);
	//tree.enableSmartXMLParsing(true);
	tree.setOnClickHandler(doOnClick);
	//tree.setOnOpenHandler(nextItem);
	//tree.attachEvent("onOpenEnd", function(nodeId, event) {
	    //doLog("An id of open item is " + nodeId);
	//});
	//tree.setDataMode("json");    //设置数据类型；默认是xml，注意：如果使用json加载数据，这里必须设置，否则dhtmlxtree会因为不会解析xml内容而抛出异常
	//tree.loadJSON("<%=request.getContextPath()%>/sysadmin/allMenu_ldrk_menu.action");
	tree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadmin/nextTree_ldrk_tree.action");
	tree.loadXML("<%=request.getContextPath()%>/sysadmin/deptTree_ldrk_tree.action");
});
</script>
<html>
  <body>
    <div id="departmentTree" style="width:100%;height:100%;background-color:#f5f5f5;border :1px solid Silver; overflow:auto;float:left;">
</div>
  </body>
</html>
