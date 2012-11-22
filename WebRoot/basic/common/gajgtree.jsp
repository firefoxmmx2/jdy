<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants"%>

<%
	//登录用户所在部门父节点id
	int parentdeptid = -1;
	User user = new User();
	//获得登录用户session
	user = (User)session.getAttribute(Constants.userKey);
	if(user == null)
		response.sendRedirect("login.jsp");
	else
		parentdeptid = user.getDepartment().getParentdepartid().intValue();
 %>
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
    	<td style="text-align:right"><a href="#" id='b_xuanze'  class="addbutton" onclick='xuanze();'>[确定]</a></td>
   	</tr>
</table> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
		<div class="treediv" style='width:400px'>
			<!--表单样式开始 -->
			<table width="100%" align="center" cellpadding="1" cellspacing="3" class="titleTable" >
            	<tr>
                	<td class="tdContent" >
                  		<table width="100%" border='0'  align="center" cellpadding="1" cellspacing="1" class="listTable">
  							
  							<tr>
    							<td valign="top">
       								<div id="depart_treeDropDown" style="width:100%;background-color:#eef6ff; border :0px solid Silver; overflow:auto;"></div>
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
$("#depart_treeDropDown").css({height:300});
  var itemSelect = 0;
  var parentdeptid = '<%=parentdeptid%>';
  tree=new dhtmlXTreeObject("depart_treeDropDown","100%","100%",parentdeptid);
  tree.setImagePath("<c:out value="${pageContext.request.contextPath}"/>/images/tree/");
  //显示checkBoxes
  tree.enableCheckBoxes(1);
  //子父连带
  tree.tscheck=true;
  tree.setOnCheckHandler(doOnCheck);
  tree.setXMLAutoLoading("<c:out value="${pageContext.request.contextPath}"/>/sysadminDefault/deptTree_tree.action?");
  tree.loadXML("<c:out value="${pageContext.request.contextPath}"/>/sysadminDefault/deptTree_tree.action");
  var allgxdwname="";  //所有公安机关名称 
  var allgxdwbm="";    //所有公安机关的代码 
  
  function doOnCheck(itemId){
    var flagcheck = tree.isItemChecked(itemId); //判断结点是否被选中,1为选中 0未选中
    var userdatavalue = tree.getUserData(itemId,itemId);
    //alert(userdatavalue);
    var userdatavalueArr = userdatavalue.split(",");
    var departid=itemId;
    var departcode=userdatavalueArr[0];
    var departbrevitycode=userdatavalueArr[1];
    var departlevel=userdatavalueArr[2];
    var departfullcode=userdatavalueArr[4];
    var isleaf=userdatavalueArr[5];
    var userData = "<Params>";
			userData += "<Param name='departid'>"+departid+"</Param>";
			userData += "<Param name='departcode'>"+departcode+"</Param>";
			userData += "<Param name='departbrevitycode'>"+departbrevitycode+"</Param>";
			userData += "<Param name='departfullcode'>"+departfullcode+"</Param>";
			userData += "<Param name='departlevel'>"+departlevel+"</Param>";
			userData += "<Param name='isleaf'>"+isleaf+"</Param>";
			userData += "</Params>";
			
			
	if(flagcheck==1){
	   getgxdw({dataxml:userData,reXml:"1",codeXml:""});
	   
	}else if(flagcheck==0){
	   getgxdw({dataxml:userData,reXml:"0",codeXml:""});
    }
   }
  
  //选中
  function getgxdw(userData){
    jQuery.ajax({
			type: 'POST',
			url: "<c:out value="${pageContext.request.contextPath}"/>/basicsystem/treeGajg_xctb.action",
			data: userData,
			async: true,
			dataType: 'json',
			success: function(json){
			    
				 Response(json);					
			}
		});
  }
  
  function Response(json){
    allgxdwname=json.reXml;  
    allgxdwbm=json.codeXml;
  }
 
  function xuanze(){
        mcId = gmcId;
		dmId = gdmId;
		if($("#" + mcId).attr("id")!=null&&$("#" + mcId).attr("id")!=undefined )
 		{
 			$("#" + mcId).attr("value",allgxdwname);
 		}
 		if($("#" + dmId).attr("id")!=null&&$("#" + dmId).attr("id")!=undefined )
 		{
 			$("#" + dmId).attr("value",allgxdwbm);
 		}
 		$("#divs_" + mcId).remove();
  }
 
  
  //点击清除按钮，清除调用框及相应隐藏框的值
	function fnclear()
	{
		if($("#" + gmcId).attr("id")!=null&&$("#" + gmcId).attr("id")!=undefined )
 		{
 			$("#" + gmcId).val("");
 		}
 		if($("#" + gdmId).attr("id")!=null&&$("#" + gdmId).attr("id")!=undefined )
 		{
 			$("#" + gdmId).val("");
 		}
 		if($("#" + gjsdmId).attr("id")!=null&&$("#" + gjsdmId).attr("id")!=undefined )
 		{
 			$("#" + gjsdmId).val("");
 		}
 		if($("#" + glevel).attr("id")!=null&&$("#" + glevel).attr("id")!=undefined )
 		{
 			$("#" + glevel).val("");
 		}
 		if($("#" + gitemid).attr("id")!=null&&$("#" + gitemid).attr("id")!=undefined )
 		{
 			$("#" + gitemid).val("");
 		}
 		if($("#" + gparentItemId).attr("id")!=null&&$("#" + gparentItemId).attr("id")!=undefined )
 		{
 			$("#" + gparentItemId).val("");
 		}
 		if($("#" + gfullcode).attr("id")!=null&&$("#" + gfullcode).attr("id")!=undefined )
 		{
 			$("#" + gfullcode).val("");
 		}
 		if($("#" + gisLeaf).attr("id")!=null&&$("#" + gisLeaf).attr("id")!=undefined )
 		{
 			$("#" + gisLeaf).val("");
 		}

    }
  
</script>
<script>

</script>
</html>