<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String useraccount = "";
	String password = "";
	useraccount = request.getParameter("useraccount");
	password = request.getParameter("password");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<%=request.getContextPath()%>/css/ingrid.css" rel="stylesheet"  type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script  src="javascript/jquery.js" type="text/javascript"></script>
<script src="javascript/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="javascript/jquery.alerts.js" type="text/javascript"></script>
<script src="javascript/ui.datepicker.js" type="text/javascript" charset="utf-8"></script>	
<script src="javascript/htmlConfig.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<script type="text/javascript">

//$.ajax()方式
$(document).ready(function (){

   	 	 //if (checkControlValue("p_useraccount","String",1,30,null,1,"用户名") && checkControlValue("t_password","String",1,100,null,1,"密码")){	
          		setParams("p_");
          		var sUrl="sysadmin/login_login.action";
          		jQuery.ajax({
					type: 'POST',
					url: sUrl,
					data: params,
					async: true,
					dataType: 'json',
					success: update_page,
					complete: function(){
					}
				});	
		//}
});

function update_page (json) { //回传函数实体，参数为XMLhttpRequest.responseText

      if (json.result=="success"){
      	window.location="temp-index.jsp";//一次取出所有菜单
      }else{
      	jAlert(json.result, '登录信息');
      	$("#p_useraccount").val("");
      	$("#p_password").val("");
      	$("#t_password").val("");
      }
      
}
</script>
</head>
<body style="padding-top:90px" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no" >
<!-- ImageReady Slices  -->
<input name="p_useraccount" id="p_useraccount"  type="hidden" value="<%=useraccount%>"/>
<input name="p_password" id="p_password" type="hidden" value="<%=password%>"/>


<!-- End ImageReady Slices -->

</body>
</html>