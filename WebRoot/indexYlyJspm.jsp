<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.aisino2.sysadmin.domain.User" %>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%@page import="com.aisino2.cache.CacheManager" %>
<%@ page import="com.aisino2.sysadmin.domain.Loginlog" %>
<%

User currentUser = new User();
	currentUser.setLoginlog(new Loginlog());
	String userKey_user = (String)session.getAttribute("userKey_user");
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
		<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css"
			media="screen" />
		<script language="javascript" type="text/javascript" src="javascript/jquery.js"></script>
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
		<script language="javascript" type="text/javascript" src="javascript/forOffineJs.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/shenfenzhengVal.js"></script>
 		<script language="javascript" type="text/javascript" src="javascript/gspicture.js"></script><!-- liufengAdd -->
		<script language="javascript" type="text/javascript" src="javascript/htmlConfig.js" charset="utf-8"></script>
        <script language="javascript" type="text/javascript" src="javascript/htmlConfig_lgy.js" charset="utf-8"></script>
		<script src="javascript/md5.js" language="javascript" type="text/javascript"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.ingrid-0.9.2.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/gad-cxtj-ksdld.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/gad-cxtj-csld.js"></script>
		<script language="javascript" type="text/javascript" src="javascript/hylb-link-qyzfl.js"></script>
		<!-- to have Ingrid save her state (selected rows, page number, column sort & direction); just include the jQ cookie plugin -->
		<script language="javascript" type="text/javascript" src="javascript/jquery.cookie.js"></script>
		<script src="javascript/ui.datepicker.js" language="javascript" type="text/javascript"
			charset="utf-8"></script>
		<script src="javascript/DateTimeMask.js" language="javascript" type="text/javascript"
			charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="javascript/jquery.lightbox-0.5.js"></script>
		<link rel="stylesheet" href="css/jquery.lightbox-0.5.css" type="text/css"></link>
		<script language="javascript" type="text/javascript" src="javascript/jquery.mypagination.js"></script>
		<link rel="stylesheet" href="css/mypagination.css" type="text/css"></link>
		<link rel="stylesheet" href="css/site.css" type="text/css" />
		<link rel="stylesheet" href="css/ingrid.css" type="text/css" />
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		<link rel="stylesheet" href="css/ui.datepicker.css" type="text/css"
			media="screen" title="core css file" charset="utf-8" />
	    <style type="text/css">
<!--
body { scroll:no; }
html { overflow-x: hidden; overflow-y: hidden; }

#apDiv1 {
	position:absolute;
	width:200px;
	z-index:2001;
}
BODY {background-image: URL(images/zh.gif); 
background-position: center;
background-repeat: no-repeat; 
background-attachment: fixed;} 
--> 
        </style>
</head>
<script type="text/javascript">
	//报警客户端调用getGxdwbm方法时所需要的密码 ， 乔晓光用到得
	var clientCallPassword = "";
	//报警控件用到函数
	//创建场所编码和场所名称的session 用于客户端民警登陆取得客户端得场所编码和场所名称  ， 乔晓光用到得
	var shouYeJiaZaiYeMian;
	var ukeyid = '';
	$(document).ready(function (){
	     //判断用户类别
		//getGxdwbm();
		//页面高度页面宽度
		allPageWidth = document.body.clientWidth;
		pageWidth=1020;
		pageHeight=document.body.clientHeight;
		document.getElementById("allDiv").style.width=pageWidth;
		document.getElementById("allDiv").style.height=pageHeight;
		shouYeJiaZaiXiang(); //首页加载项
		helpContr();
	});
	
	
	function shouYeJiaZaiXiang(){
		$("#iframes").load("business/Ylfwzagl/YlyjspmMan.jsp");
	}
	
	
        
        //返回首页
        function fnloginSy()
        {
			jiaZaiShouYeYeMian();
			clearTimeout(testtime); //// 清空setTimeout现成	
        }
        
        function fnlogout()
        {   
            $(window).unbind("unload");
        	jConfirm('确认退出本系统？', '提示信息', function(r) {
	    	if(r==true){
				//$(document).children().remove();


        		var sUrl="sysadmin/loginout_login.action";
          		jQuery.ajax({
					type: 'POST',
					url: sUrl,
					data: params,
					async: false,
					dataType: 'json',
					success: update_page
				});
			}else{
			   return false;
			}
		});
        	clearTimeout(testtime); //// 清空setTimeout现成
        }
        
        
        
	function setCssPath(path){
		if(path==null || path==""){
			path = "css";
		}
		//setCssUrl(path);//换图片地址
		var linkHtml = "";
		var linkList = $(document).find("link");
		linkList.each(function(){
			var thisHref = $(this).attr("href");
			thisHref = thisHref.substr(thisHref.indexOf("/"));
			linkHtml += "<link rel='stylesheet' href='"+path+thisHref+"' type='text/css' />";
	    });
	    linkList.remove();
	    $("head").append($(linkHtml));
	}
function setCssUrl(temp_css){

	var usertype = "";
	var lb="0";
	if(temp_css=='css'){
		var lb="0";
	}
	 if(temp_css=='cssblue'){
		var lb="1";
	}
	 if(temp_css=='cssred'){
		var lb="2";
	}
		if(usertype.indexOf("14")!=-1||usertype.indexOf("144")!=-1)
		 	$('#header').css('background-image','url(images/logo_'+lb+'11.jpg)');
		if(usertype.indexOf("11")!=-1||usertype.indexOf("141")!=-1)
		 	$('#header').css('background-image','url(images/logo_'+lb+'13.jpg)');
		if(usertype.indexOf("12")!=-1||usertype.indexOf("142")!=-1)
		 	$('#header').css('background-image','url(images/logo_'+lb+'14.jpg)');
		if(usertype.indexOf("13")!=-1||usertype.indexOf("143")!=-1)
		 	$('#header').css('background-image','url(images/logo_'+lb+'12.jpg)');
		
}
//初始化左右移动按钮及操作
var moveArray = new Array();
function initMoveMethod(){
	moveArray.push(0);
	var liList = $("#div_menumain #menumain > li");
 	var lastMenuWidth = 0;
 	var index=0;
	var pageMenuWidth = 0;
 	var length=liList.length;
 	for(;index<length;index++){
 		lastMenuWidth = liList.eq(index).width();
 		pageMenuWidth = pageMenuWidth + lastMenuWidth;
 		if(pageMenuWidth>=pageWidth-lastMenuWidth){
 			if(index%2!=0){
 				index = index - 1;
 			}
 			break;
 		}
 	}
 	if(index<length){
 		$("#div_moveMenu").html('<img src="images/left.gif" style="cursor:hand" onclick="ceshi(-1)" first="1" />&nbsp;<img src="images/right.gif" style="cursor:hand" onclick="ceshi(1)" last="0" />&nbsp;');
 	}
 	
 	shuzi = index;
 	yidongcishu = 0;
 	liList.slice(index).hide();
 	moveArray.push(index);
}
//左右移动操作方法
var yidongcishu = 0;
var shuzi = 0;
function ceshi(yiDongWay){
	var liList = $("#div_menumain #menumain > li");
	var liLength = liList.length;
	
	var sliceLiList;
 	var index=0;
	var pageMenuWidth = 0;
	var lastMenuWidth = 0;

	if(yiDongWay==1){	
		if(shuzi<liLength-1){
			liList.hide();
			sliceLiList = liList.slice(shuzi);
			var length = sliceLiList.length;
			for(;index<length;index++){
		 		lastMenuWidth = sliceLiList.eq(index).width();
		 		pageMenuWidth = pageMenuWidth + lastMenuWidth;
		 		if(pageMenuWidth>=pageWidth-lastMenuWidth){
			 		if(index%2!=0){
		 				index = index - 1;
		 			}
		 			break;
		 		}
		 	}
		 	shuzi = shuzi + index;
		 	sliceLiList.slice(0,index).show().find("li").show("slow");

			var firstImg = $("#div_moveMenu").find("img:first");
			if(firstImg.attr("first")=="1"){
				firstImg.attr("src","images/left1.gif");
				firstImg.attr("first","0");
			}
			if(shuzi>=liLength-1){
				$("#div_moveMenu").find("img:last").attr("src","images/right1.gif").attr("last","1");
			}
			yidongcishu++;
			moveArray.push(shuzi);
	 	}
	}else{
		if(yidongcishu>0){
			liList.hide();
			var currIndex = moveArray[yidongcishu];
			liList.slice(moveArray[yidongcishu-1],currIndex).show().find("li").show("slow");
			yidongcishu--;
			shuzi = currIndex;
		}
		var lastImg = $("#div_moveMenu").find("img:last");
		if(lastImg.attr("last")=="1"){
			lastImg.attr("src","images/right.gif");
			lastImg.attr("last","0");
		}
		if(yidongcishu==0){
			$("#div_moveMenu").find("img:first").attr("src","images/left.gif").attr("first","1");;
		}
	}
}
	
	/**
	 * 帮助控制
	 */
    function helpContr(){
        var usertype = "";
        var ssdwbm = "";
        var usertypeAttay = usertype.split(",");
        if (ssdwbm == "" || ssdwbm == "null" || ssdwbm == null) {
            //公安段
            if(usertype=='14'){
                $("#help").attr("href", "help/Ylygad_help.jsp");
			}else{
				$("#help").attr("href", "help/help_gad.jsp");
			}
                if(usertype == "11" || usertype == "12"){//制卡和采集
                	$("#help").attr("href", "help/Nohelp.jsp");
                }
        }
        else {
            //企业的
            //属于两个企业的用户
            if ((usertypeAttay.length) * 1 > 1) {
                $("#help").attr("href", "help/help_qyd.jsp");
            }
            else {
                //属于一个企业的用户
                if (usertype == "13" || usertype == "14"||usertype== "143" || usertype== "144" ) {//娱乐业
                    //$("#help").attr("href", "help/help_qyd_yly.html");
                    if(usertype=='14'){
                    	$("#help").attr("href", "help/Ylygad_help.jsp");
					}else{
						$("#help").attr("href", "help/Ylyqyd_help.jsp");
					}
                }
               
                if (usertype == "24") {//旅馆业
                    $("#help").attr("href", "help/help_qyd_lgy.html");
                }
                if (usertype == "42" || usertype == "43" || usertype == "44") {//机修业
                    $("#help").attr("href", "help/help_qyd_jxy.html");
                }
                if (usertype == "72" || usertype == "73" || usertype == "74") {//二手机
                    $("#help").attr("href", "help/help_qyd_esj.html");
                }
                if (usertype == "51" || usertype == "52" || usertype == "53") {//印章业
                    $("#help").attr("href", "help/help_qyd_yzy.html");
                }
                if (usertype == "92" || usertype == "93" || usertype == "94") {//出租车
                    $("#help").attr("href", "help/help_qyd_czc.html");
                }
                if (usertype == "112" || usertype == "113" || usertype == "114") {//剧毒化学品
                    $("#help").attr("href", "help/help_qyd_jdhxp.html");
                }
                if (usertype == "91") {//出租屋
                    $("#help").attr("href", "help/help_qyd_czfw.html");
                }
                if (usertype == "32" || usertype == "33" || usertype == "34") {//典当业
                    $("#help").attr("href", "help/help_qyd_ddy.html");
                }
                if (usertype == "62" || usertype == "63" || usertype == "64") {//旧机动车
                    $("#help").attr("href", "help/help_qyd_esc.html");
                }
                if (usertype == "102" || usertype == "103" || usertype == "104") {//汽车租赁
                    $("#help").attr("href", "help/help_qyd_qczl.html");
                }
                if (usertype == "82" || usertype == "83" || usertype == "84") {//废旧金属
                    $("#help").attr("href", "help/help_qyd_fjjs.html");
                }
                if (usertype == "121" || usertype == "122") {//重点单位
                    $("#help").attr("href", "help/help_qyd_zddw.html");
                }
                
            }
            
        }
    }
	//点击叉号关闭调用
	$(window).unload(function(){
		window.open("unload.jsp","newwindow","height=0,width=0,toolbar=no,menubar=no,scrollbars=no,location=no,status=no,left=20000,top=2000");
	});
</script>
	<body> 
	<input type="hidden" id="b_useraccount" value=""/>
	<input id="police" type="hidden" runat="server"/>
	<input id="loginukeyid" type="hidden" runat="server"/>
		<table width="1020" border="0"  align="center" cellpadding="0" cellspacing="0">
  <tr>
<td><div id="allDiv" align="center">
			<div id="antiFooter">
				<div id="header">
					<div id="logo">
                    <div style="float:left; padding-top:2px; padding-left:540px;" >
                    <table width="53%" border="0" align="left" cellpadding="3" cellspacing="0">
    <tr>
    <td class="fontpart"></td>
  </tr>
   <tr>
    <td class="fontpart" id="loginlogNUm" ></td>
  </tr>
</table>
</div>
				<table width="155" border="0" align="right" cellpadding="0"
							cellspacing="0">
	  <tr>
								<td rowspan="2">
									<a class="sy" href="#" id='login' onclick='fnloginSy();'></a>								</td>
								<td rowspan="2">
									<a class="pass" href="#" id='modifypassword'
										onclick='fnmodifypassword();'></a>								</td>
								<td rowspan="2">
									<a class="out" href="#" id='logout' onclick='fnlogout();'></a>								</td>
                                    			<td rowspan="2"><a class="help"   href="#"  id='help'></a></td>
				  </tr>
							<tr>
							  <td height="3"></td>
				  </tr>
							<tr>
								<td colspan="5" align="right">
									<table width="60" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="19">
												<a href="#" onclick="setCssPath('css');"
													 class="bottonskin1"></a>											</td>
											<td>
												<a href="#" onclick="setCssPath('cssblue');"
													 class="bottonskin2"></a>											</td>
											<td>
												<a href="#" onclick="setCssPath('cssred');"
													 class="bottonskin3"></a>											</td>
											<td width="20"></td>
										</tr>
									</table>								</td>
							</tr>
					  </table>
				  </div><div id="div_moveMenu" style="float:right"></div>
					<div  id="div_menumain"><ul id='menumain' class='jd_menu jd_menu_jdsharp'></ul></div>
				</div>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="3"></td>
					</tr>
			  </table>
				<div id=iframes onload='$("iframes").show("slow");'
					style="top: 150px; background-color: #ffffff;  padding: 0px; ">
				</div>

				<div id="password_modify" class="page-layout" src="#"
					style="display: none; top: 110px; left: 350px; width: 300px;"></div>
			</div>
		</div></td>
  </tr>
</table>
		

<script type="text/javascript">
     
</script>
<div id="apDiv1"><embed name="music" src="sound/call.wav" autostart="false" loop="true" hidden="true"><!-- 报警音乐 --></div>

<div id="man_help" class="page-layout" src="#" style="top:180px; left:300px;display:none;width:600px;">
</body>
</html>
