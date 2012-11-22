<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.common.QjblUtil"%>
<%@ page import="com.aisino2.sysadmin.Constants;"%>
<%
	   String path = request.getContextPath(); 
	   //获得登录用户session
		User user = new User();
		user = (User) session.getAttribute(Constants.userKey);
		String qymc = user.getSsdwmc();
		String qybm = user.getSsdwbm();
		String deptQyxx = user.getDepartment().getDepartcode();
		//是否控制日常检查方式
		String sfkzrcjcfs = QjblUtil.queryQjblVal("sfkzrcjcfs");
		if(sfkzrcjcfs==null||"".equals(sfkzrcjcfs)){
			sfkzrcjcfs="0";
		}
		//检查权限模式
		String mjjcqxms = QjblUtil.queryQjblVal("mjjcqxms");
%>
<head>
<script type="text/javascript">
var qymc = "<%=qymc%>";
var qybm = "<%=qybm%>";
var deptQyxx = "<%=deptQyxx%>";
var deptJcz = null;
var sfkzrcjcfs = "<%=sfkzrcjcfs%>";
var mjjcqxms = "<%=mjjcqxms%>";
var userAcc;  //用户名
var userPass; //密码
$(document).ready(function (){
	$("#p_useraccount").focus();
   	$('#sendajax').click(function (){ 
   	 	  if (checkControlValue("p_useraccount","String",1,30,null,1,"用户名") && checkControlValue("t_password","String",1,100,null,1,"密码")){	
          		$("#p_password").val(hex_md5($("#t_password").val()));
          		setParams("p_");
          		var sUrl="sysadmin/galoginjy_login.action";
          		jQuery.ajax({
					type: 'POST',
					url: sUrl,
					data: params,
					async: true,
					dataType: 'json',
					success: loadrcjc
				});
          }	
	});
    $("#div_login").css({
		position: 'absolute',
		zIndex: 99999999,
		padding: 0,
		margin: 0,
		top: (pageHeight/2+20) + 'px',
		left: (pageWidth/2-120) + 'px'
	});
	$("#div_login").hide();
	
});


//点击取消
function fnreset()
{
	 $("#p_useraccount").val("");
     $("#p_password").val("");
     $("#t_password").val("");
}

function loadrcjc(json){
      if (json.result=="success"){
      	var deptJcz=setNull(json.user.department.departcode);
      	deptJcz=deptJcz.replace(/((00)*$)/g,"")
		if (mjjcqxms=="2"&&deptQyxx.indexOf(deptJcz)!=0){
			jAlert('该帐号无此场所权限','提示信息');
			$("#p_useraccount").val("");
	      	$("#p_password").val("");
	      	$("#t_password").val("");
		} else{
			$("#u_jcjgmc").val(setNull(json.user.department.departname));
	      	$("#u_jcjgdm").val(setNull(json.user.department.departcode));
	      	$("#u_jcrxm").val(setNull(json.user.username));
	      	$("#ga_jiaoyan").hideAndRemove("show");
	    	$("#rcjcman_load").empty();
			$("#rcjcman_load").load("basic/publicsystem/RcjcManAdd-qyd.jsp");
			$("#rcjcman_load").show("slow");
		}
      }else{
      	jAlert(json.result, '登录信息');
      	$("#p_useraccount").val("");
      	$("#p_password").val("");
      	$("#t_password").val("");
      }
}

</script>
</head>
<body style="padding-top:300px" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no" >
<!-- ImageReady Slices  -->
<div align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" class="title1">公安机关登录</td>
      <td><a href="#" id="closeDiv" onclick='$("#ga_jiaoyan").hideAndRemove("show");' class="close"></a></td>
    </tr>
    <tr>
      <td align="left"></td>
      <td></td>
    </tr>
</table></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="5"></td>
		</tr>
</table>

<table width="300" height="300" border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
        <table border="0" cellspacing="0" cellpadding="0" >
          <tr height="25">
            <td>用户名&nbsp;&nbsp;</td>
            <td>
              <input  type="text" class="inputstyle" name="p_useraccount" id="p_useraccount" />
            </td>
          </tr>
          <tr  height="25">
          	<td>密&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;</td>
            <td> 
            <input name="t_password" id="t_password" type="password" class="inputstyle"/>
            <input name="p_password" id="p_password" type="hidden"/></td>
          </tr>
          <tr>
            <td  height="6">
            	<input  type="hidden" class="logininput" name="p_loginip" id="p_loginip"/>
            	<input  type="hidden" class="logininput" name="p_loginmac" id="p_loginmac"/>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="39%"></td>
	          <td><a href="#" class="submitbutton"  id="sendajax">确定</a></td>
	          <td><a href="#" class="submitbutton" onclick='fnreset()'>取消</a></td>
	          <td width="16%">&nbsp;</td>
	        </tr>
      </table>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="5"></td>
		</tr>
</table>
</body>
