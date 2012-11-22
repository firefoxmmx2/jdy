<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.aisino2.sysadmin.domain.User" %>
<%@ page import="com.aisino2.sysadmin.domain.Loginlog" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%@page import="com.aisino2.cache.CacheManager" %>
<%
	String path = request.getContextPath();
	String basePath = "http" + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String loginOutPath="http" + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/login.jsp";
	String pfdxbm=(String)request.getParameter("pfdxbm");
	//String pfdxbm="J0132130200016";
	String ympath=(String)request.getParameter("ympath");
	//String ympath="basic/jfglsystem/Jfjcqkadd-lgbs.jsp";
	String jcz=(String)request.getParameter("jcz");
	
	User currentUser = new User();
	currentUser.setLoginlog(new Loginlog());
	User userKey_user = (User)session.getAttribute("userKey_user");
	if(userKey_user==null){
		session.setAttribute("userKey_user",currentUser);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />     
		<title></title>
		<link rel="stylesheet" href="css/stylemenu.css" type="text/css" />
		<link rel="stylesheet" href="css/jdMenu.css" type="text/css" />
		<link rel="stylesheet" href="css/jdMenu.jdsharp.css" type="text/css" />
		<link rel="stylesheet" href="css/jquery.alerts.css"  type="text/css" media="screen" />
		<script language="javascript" type="text/javascript" src="javascript/jquery.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/ext/adapter/jquery/ext-jquery-adapter.js"></script>
        <script language="javascript" type="text/javascript" src="javascript/ext/adapter/ext/ext-base.js"></script>
        <script language="javascript" type="text/javascript" src="javascript/ext/ext-all.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.bgiframe.js?"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.dimensions.js?"></script>

		<script language="javascript" type="text/javascript" src="javascript/jdsharp.js?"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.jdMenu.js?"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.jframe.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.form.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.ui.draggable.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.alerts.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.combobox.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.combocheckbox.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/valdate.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/dictDropDown.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/shxxTime.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/icctwocjjs.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/ickDxrV1.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/mjjczDxrV1.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/forOffineJs.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/shenfenzhengVal.js"></script>
 		<script language="javascript" type="text/javascript" src="javascript/gspicture.js"></script><!-- liufengAdd -->
		<script language="javascript" type="text/javascript" src="javascript/htmlConfig.js" charset="utf-8"></script>
        <script language="javascript" type="text/javascript" src="javascript/htmlConfig_lgy.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="javascript/md5.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.ingrid-0.9.2.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/gad-cxtj-ksdld.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/gad-cxtj-csld.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/hylb-link-qyzfl.js"></script>
		<!-- to have Ingrid save her state (selected rows, page number, column sort & direction); just include the jQ cookie plugin -->
		<script language="javascript" type="text/javascript" src="javascript/jquery.cookie.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/ui.datepicker.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="javascript/DateTimeMask.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.lightbox-0.5.js"></script>
		<link rel="stylesheet" href="css/jquery.lightbox-0.5.css" type="text/css"></link>
		<script language="javascript" type="text/javascript" src="javascript/jquery.mypagination.js"></script>
		<link rel="stylesheet" href="css/mypagination.css" type="text/css"></link>
		<link rel="stylesheet" href="css/site.css" type="text/css" />
		<link rel="stylesheet" href="css/ingrid.css" type="text/css" />
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<link rel="stylesheet" href="css/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
	    <style type="text/css">
<!--
body { scroll:no; }
html { overflow-x: hidden; overflow-y: hidden; }

BODY {background-image: URL(images/zh.gif); 
background-position: center;
background-repeat: no-repeat; 
background-attachment: fixed;} 
--> 
        </style>
</head>
<script type="text/javascript">
	var pfdxbm="<%=pfdxbm%>";
	var jcz="<%=jcz%>";
	$(document).ready(function (){
		//页面高度页面宽度
		allPageWidth = document.body.clientWidth;
		pageWidth=1020;
		pageHeight=document.body.clientHeight;
		document.getElementById("allDiv").style.width=pageWidth;
		document.getElementById("allDiv").style.height=pageHeight;
		
		$("#iframes").empty();
		$("#iframes").load("<%=ympath%>");
		$("#iframes").show("slow");
		$("#kjjindudiv").hide();
	}).keydown(function(e){
		if(event.keyCode == 13){
			if(e.target.nodeName!=null && e.target.nodeName.toUpperCase()!="TEXTAREA")
				event.keyCode = 9;
		}
	});
	
	//点击叉号关闭调用
	$(window).unload(function(){
		window.open("unload.jsp","newwindow","height=0,width=0,toolbar=no,menubar=no,scrollbars=no,location=no,status=no,left=20000,top=2000");
	});
</script>
<body> 
	<div id="kjjindudiv" style="position:absolute;width:220px;height:20px;left:50%;top:50%;margin-left:-110px;margin-top:-10px;border:solid 3px #ccc;z-index:99;"><img src="images/jindutiao.gif"/></div>	
<table width="1020" border="0"  align="center" cellpadding="0" cellspacing="0">
  	<tr>
	<td><div id="allDiv" align="center">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="3"></td>
					</tr>
			  	</table>
				<div id=iframes onload='$("iframes").show("slow");'
					style="top: 150px; background-color: #ffffff;  padding: 0px; ">
				</div>
	</div></td>
  	</tr>
</table>
		
</body>
</html>
