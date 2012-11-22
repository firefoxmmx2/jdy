<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/dhtmlXTree.css">
<link href="<c:out value="${pageContext.request.contextPath}"/>/css/style.css" rel="stylesheet" type="text/css">
<script  src="<c:out value="${pageContext.request.contextPath}"/>/javascript/dhtmlXCommon.js"></script>
<script  src="<c:out value="${pageContext.request.contextPath}"/>/javascript/dhtmlXTree.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  background="images/toolbar.gif">
    <tr>
    	<td width="70%"  style="text-align:left"></td>
    	<td width="30%" style="text-align:center"><img src="images/clear.gif" width="16" height="16" /><a href="#" id='b_clear'  class="fontbutton1" onclick='fnclear();'>[清除]</a></td>
   	</tr>
</table> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
		<div class="treediv" style='width:350px'>
			<!--表单样式开始 -->
			<table width="100%" align="center" cellpadding="1" cellspacing="3" class="titleTable" >
            	<tr>
                	<td class="tdContent" >
                  		<table width="100%" border='0'  align="center" cellpadding="1" cellspacing="1" class="listTable">
  							
  							<tr>
    							<td valign="top">
       								<div id="dictItem_treeDropDown" style="width:100%;background-color:#eef6ff; border :0px solid Silver; overflow:auto;"></div>
	    						</td>
							</tr>	
       					</table>   
                	</td>
            	</tr>
        	</table>
		</div>
	</td>
  </tr>
</table>
</body>

<script>
$("#dictItem_treeDropDown").css({height:300});
var itemSelect = 0;

  hylbzfltree=new dhtmlXTreeObject("dictItem_treeDropDown","100%","100%",0);
  //tree=new dhtmlXTreeObject("depart_treeDropDown","100%","100%",parentID);
  hylbzfltree.setImagePath("<c:out value="${pageContext.request.contextPath}"/>/images/tree/");
  //显示checkBoxes
  /////////////tree.enableCheckBoxes(1);
  //子父连带
  //tree.tscheck=true;
  hylbzfltree.setOnClickHandler(doOnClick);
  hylbzfltree.setXMLAutoLoading("<c:out value="${pageContext.request.contextPath}"/>/sysadminDefault/hylbzflTree_tree.action?allhylbdm="+ghylbbz);
  //tree.loadXML("<c:out value="${pageContext.request.contextPath}"/>/privisys/department.do?method=tree&id=0");
  hylbzfltree.loadXML("<c:out value="${pageContext.request.contextPath}"/>/sysadminDefault/hylbzflTree_tree.action?allhylbdm="+ghylbbz);
  function doOnClick(itemId)
  {
	  		var hylbdm=hylbzfltree.getUserData(itemId,'hylbdm');
	  		if (hylbdm == null || hylbdm==undefined)	hylbdm="";
	  		var hylb=hylbzfltree.getUserData(itemId,'hylb');
	  		if (hylb == null || hylb==undefined)	hylb="";
	  		var qyzflbm=hylbzfltree.getUserData(itemId,'qyzflbm');
	  		if (qyzflbm == null || qyzflbm==undefined)	qyzflbm="";
	  		var qyzflmc=hylbzfltree.getUserData(itemId,'qyzflmc');
	  		if (qyzflmc == null || qyzflmc==undefined)	qyzflmc="";
	  	if(gymgn=="cx"||!hylbzfltree.hasChildren(itemId)
	  		||(hylbdm=='N'&&qyzflbm!=""&&qyzflmc!="")
			){
	  		$("#"+gdmId).val(hylbdm);
	  		if (gitemid!=null){
	  			$("#"+gitemid).val(hylb);
	  		}
	  		$("#"+gdictCode).val(qyzflbm);
	  		if (gcodeValue!=null)
	  			$("#"+gcodeValue).val(qyzflmc);
	  		$("#"+gmcId).val(hylbzfltree.getItemText(itemId));
	  		$("#divs_" + gmcId).remove();
	  	}
  }
  
  //点击清除按钮，清除调用框及相应隐藏框的值
	function fnclear()
	{
 		if($("#" + gdmId).attr("id")!=null&&$("#" + gdmId).attr("id")!=undefined )
 		{
 			$("#" + gdmId).val("");
 		}
 		if($("#" + gitemid).attr("id")!=null&&$("#" + gitemid).attr("id")!=undefined )
 		{
 			$("#" + gitemid).val("");
 		}
 		if($("#" + gdictCode).attr("id")!=null&&$("#" + gdictCode).attr("id")!=undefined )
 		{
 			$("#" + gdictCode).val("");
 		}
 		if($("#" + gcodeValue).attr("id")!=null&&$("#" + gcodeValue).attr("id")!=undefined )
 		{
 			$("#" + gcodeValue).val("");
 		}
 		if($("#" + gmcId).attr("id")!=null&&$("#" + gmcId).attr("id")!=undefined )
 		{
 			$("#" + gmcId).val("");
 		}
    }
  
</script>
<script>

</script>
</html>