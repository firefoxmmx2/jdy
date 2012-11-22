<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.jit.attr.JitAcComp"%>
<%@ page import="com.jit.attr.GenGACode"%>
<%@page import="java.security.cert.X509Certificate,java.util.Vector,com.jit.attr.GAACInfo"%>
<%@page import="com.ibatis.common.resources.Resources"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%
	Properties loginProp = Resources.getResourceAsProperties("DisplayerStrings.properties");
	String loginBbh = loginProp.getProperty("loginBbh"); //登陆页右下角显示版本号内容
	if(loginBbh!=null&&!"".equals(loginBbh)){
		loginBbh = new String(loginBbh.getBytes("ISO8859_1"), "GBK");
	} else {
		loginBbh = "";
	}
	
    //看 是否session过期掉的这个页面。
    String sessionout=request.getParameter("sessionout");
       if(sessionout==null){
         sessionout="no";
       }
       
        String skhdcsbm=request.getParameter("skhdcsbm");
	    String skhdcsmc=request.getParameter("skhdcsmc");
	     String kjtuichu=request.getParameter("kjtuichu");//从控件中页面上的退出
	    if(kjtuichu==null) kjtuichu="noindex";
	  
	   if(skhdcsbm ==null||skhdcsbm.equals("")){
	     skhdcsbm="nocsbm";
	     skhdcsmc ="nocsmc";
	   }
  
%>

<%
	/**IpMac ipmac = new IpMac();
    String ip = "";
    ip =ipmac.getIpAddr(request);
    String mac="";
	mac= ipmac.getMACAddress(ip);*/
	//if("read MAC error!".equals(mac))
	//	mac= "";
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<%=request.getContextPath()%>/css/ingrid.css" rel="stylesheet"  type="text/css"/>
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script  src="javascript/jquery.js" type="text/javascript"></script>
<script src="javascript/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="javascript/jquery.alerts.js" type="text/javascript"></script>
<script src="javascript/IE8.js" type="text/javascript"></script>

<script src="javascript/htmlConfig.js" type="text/javascript"></script>
<script src="javascript/md5.js" type="text/javascript"></script>
<script src="javascript/valdate.js" type="text/javascript"></script>
	
		
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<script type="text/javascript">
var sessionout="<%=sessionout%>";
 //如果session过期，直接打开
if(sessionout=='yes'){
    if (typeof(skhdcsbmflag) != "undefined" ){
        if (skhdcsbmflag == 'null'|| skhdcsbmflag ==''){
            window.location.href='login.jsp';
	    }else{
	        window.location.href='login.jsp?skhdcsbm='+skhdcsbmflag+'&skhdcsmc='+skhdcsmcflag+'&kjtuichu=index';
        }
    }else{
        window.location.href='login.jsp';
    }
}



</script>
<script type="text/javascript">
//$.ajax()方式



var userAcc; ///用户名
var userPass; //密码

$(document).ready(function (){
	$("#loginBbh").html('<%=loginBbh %>');
	
	$("#p_useraccount").focus();
   	$('#sendajax').click(function (){ //直接把onclick事件写在了JS中，而不需要混在XHTML中了
   	 	  if (checkControlValue("p_useraccount","String",1,30,null,1,"用户名") && checkControlValue("t_password","String",1,100,null,1,"密码")){	
          		//hash = hex_md5(#("p_password"));
          		//alert(hex_md5($("#t_password").val()));
          		$("#p_password").val(hex_md5($("#t_password").val()));
          		//alert($("#p_password").val());
          		setParams("p_");
          		var sUrl="sysadmin/login_login.action";
          		$("#div_login").show(); //打开 AJAX 等待动画
          		jQuery.ajax({
					type: 'POST',
					url: sUrl,
					data: params,
					async: true,
					dataType: 'json',
					success: update_page,
					complete: function(){
						$("#div_login").hide(); //关闭 AJAX 等待动画
					}
				});
          }	
       	
	});
	pageWidth=document.body.clientWidth;
	pageHeight=document.body.clientHeight;
    $("#div_login").css({
		position: 'absolute',
		zIndex: 99999999,
		padding: 0,
		margin: 0,
		top: (pageHeight/2+20) + 'px',
		left: (pageWidth/2-120) + 'px'
	});
	$("#div_login").hide();
	
	
	/////证书部分
	//sfzh = "110102198506020018";
	//certsflag = "1";
	
});


function update_page (json) { //回传函数实体，参数为XMLhttpRequest.responseText
		$("#waitTable").css("display","none");
      if (json.result=="success"){
      	//window.location="index1.jsp";//分批加载菜单
      	window.location="temp-index.jsp";//一次取出所有菜单
      }else{
      	jAlert(json.result, '登录信息');
      	$("#p_useraccount").val("");
      	$("#p_password").val("");
      	$("#t_password").val("");
      }
      
}
//光标处于密码框时，按回车时进行登录
function fnkeypress()
{
	if(event.keyCode == 13)
	{
		$('#sendajax').click();
	}
}

//点击取消
function fnreset()
{
	 $("#p_useraccount").val("");
     $("#p_password").val("");
     $("#t_password").val("");
}

//创建场所编码和场所名称
var sscsbm ="<%=skhdcsbm%>";
var sscs ="<%=skhdcsmc%>";
var kjtuichu="<%=kjtuichu%>";

if(sscsbm!='nocsbm'){

creatSessionForCsbmCsmc(sscsbm,sscs);
}else{

  if (typeof(skhdcsbmflag) == "undefined" ){
	}else{
      if(skhdcsbmflag!='null'&&skhdcsbmflag!=''){
         sscsbm =skhdcsbmflag;
         sscs = skhdcsmcflag
         kjtuichu ='index';
        //  if(!ff){
            creatSessionForCsbmCsmc(sscsbm,sscs);
           //}
        }
    }
}


//创建场所编码和场所名称的session 用于客户端民警登陆取得客户端得场所编码和场所名称
	  function creatSessionForCsbmCsmc(csbm,csmc){
	      
	      var sUrl="sysadmin/creatSessionForCsbmCsmc_login.action";
	      var aa=3;//0失败，1成功
	     jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: {csbm:csbm,csmc:csmc,kjtuichu:kjtuichu},
			async: false,
			dataType: 'json',
			success: function (json) {
			aa=1;
			
			},
		   error: function (json) {
			 aa=0;
			}
		
			});
			
	  }







</script>
<!-- 获得ip地址和mac地址，采用浏览器自带ActiveX控件 start  20100903由于该方法用到ActiveX控件，不再采用该方法-->
<!-- 
<OBJECT id=locator classid=CLSID:76A64158-CB41-11D1-8B02-00600806D9B6 VIEWASTEXT></OBJECT>
<OBJECT id=foo classid=CLSID:75718C9A-F029-11d1-A1AC-00C04FB6C223></OBJECT>
<SCRIPT language=JScript>
   var service = locator.ConnectServer();
   var MACAddr ;
   var IPAddr ;
   service.Security_.ImpersonationLevel=3;
   service.InstancesOfAsync(foo, 'Win32_NetworkAdapterConfiguration');
</SCRIPT>
<SCRIPT language=JScript event=OnObjectReady(objObject,objAsyncContext) for=foo>
if((typeof(objObject) != "undefined" )){
	   if(objObject.IPEnabled != null && objObject.IPEnabled != "undefined" && objObject.IPEnabled == true)
	   {
		    if(objObject.MACAddress != null && objObject.MACAddress != "undefined")
		    {
		    	MACAddr = objObject.MACAddress;
		    	if(MACAddr==null)
		    		MACAddr = "";
		    	$("#p_loginmac").val(MACAddr);
		    }
		   
		    if(objObject.IPEnabled && objObject.IPAddress(0) != null && objObject.IPAddress(0) != "undefined")
		    {
		    	IPAddr = objObject.IPAddress(0);
		    	if(IPAddr==null)
		    		IPAddr = "";
		    	$("#p_loginip").val(IPAddr);
		    }
		        
	    }
    }else{
	     MACAddr = "";
	     IPAddr = "";
	     $("#p_loginmac").val(MACAddr);
	     $("#p_loginip").val(IPAddr);
	   
    }
    
</SCRIPT> -->
<!-- 获得ip地址和mac地址，采用浏览器自带ActiveX控件 end  20100903由于该方法用到ActiveX控件，不再采用该方法-->
</head>
<body style="padding-top:90px" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no" >
<!-- ImageReady Slices  -->
<table width="850" height="435" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td colspan="2">
			<img src="images/login_01.gif" width="850" height="282" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images/login_02.gif" width="607" height="153" alt=""></td>
		<td background="images/login_03.gif" width="243" height="79">
        <table width="217" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="26" valign="top"><label>
              <input  type="text" class="logininput" name="p_useraccount" id="p_useraccount" />
            </label></td>
          </tr>
          <tr>
            <td height="25"> 
            <input name="t_password" id="t_password" type="password" class="logininput" onkeypress="fnkeypress();"/>
            <input name="p_password" id="p_password" type="hidden"/></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%"></td>
          <td width="30%"><a href="#" class="loginbotton"  id="sendajax">确认</a></td>
          <td width="28%"><a href="#"  class="loginbotton" onclick='fnreset()'>取消</a></td>
          <td width="12%"></td>
        </tr>
      </table></td>
	</tr>
<tr>
		<td  width="243" height="74" valign="bottom" background="images/login_04.gif" >
			<TABLE>
				<TR><TD width="10PX">&nbsp;</TD><TD style="FONT: 12px Tahoma;" id="loginBbh"></TD></TR>
				<TR><TD height="1PX"></TD></TR>
			</TABLE>
		</td>
  </tr>
</table>
<!-- End ImageReady Slices -->
	<div id=div_login style="position:absolute; background:url(images/loadingbg.gif); width:243px; height:55px;font-size:13px; font-weight:bold; color:#666666;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td height="17px;"></td></tr>
		<tr><td width="15"></td>
		    <td><img src="images/loading.gif"/></td>
		    <td>登录中，请稍候......</td>
		</tr>
		</table>
	</div>
</body>
</html>