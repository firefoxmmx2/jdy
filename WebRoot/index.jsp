<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="public/common.jsp" %>
<%@ page import="com.aisino2.sysadmin.domain.User" %>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%@page import="com.aisino2.cache.CacheManager" %>
<%@page import="com.ibatis.common.resources.Resources"%>
<%
	Properties msgProp = Resources.getResourceAsProperties("showMessage.properties");
	String showMessage = msgProp.getProperty("com.aisino2.ldrksystem.showMessage");
	
	Object shouquanObj = session.getAttribute("shouquanEndDate");
	String shouquanEndDate =  (shouquanObj!=null&&!"".equals((String)shouquanObj)?(String)shouquanObj:""); //客服校验返回值
	String path = request.getContextPath();
	String basePath = "http" + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String loginOutPath="http" + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/login.jsp";
	String usertype="";
	String username="";
	String departmentname="";
	String useraccount="";
	String password="";
	


	//登录用户ID，用于获得菜单
	int userid = 0;
	User user = new User();
	//获得登录用户session
	user = (User) session.getAttribute(Constants.userKey);
	if (user == null)
		response.sendRedirect("login.jsp");
	else
		userid = user.getUserid().intValue();

	 usertype = user.getUsertype();
	 username = user.getUsername();
	
		password=user.getPassword();
		useraccount=user.getUseraccount();
	
	 departmentname = user.getDepartment().getDepartname();
	 String departcode = user.getDepartment().getDepartcode();
	String departLevel = user.getDepartment().getDepartlevel().toString();
	if(departmentname == null || "".equalsIgnoreCase(departmentname))
		departmentname = "暂无";
		
		
		
		
		
			//客户端软件中，点击退出按钮用到的，变量
		Object   csbmcsmc = session.getAttribute("csbmcsmc");
	     String skhdcsbm=null;
	    String skhdcsmc=null;
	     String bmmc ="novalue";
		if(csbmcsmc!=null){
		   bmmc  = (String)csbmcsmc;
		   int a = bmmc.indexOf(",|");
		  skhdcsbm =bmmc.substring(0,a);
		  skhdcsmc = bmmc.substring(a+2, bmmc.length());
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
		<%-- 加入图表插件 --%>
		<script language="JavaScript" src="javascript/FusionCharts.js"></script>
		<script language="JavaScript" src="javascript/ChartsCreate.js"></script>
    <link href="css/notificationmsg.css" rel="stylesheet" type="text/css" />
			
			
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
<!--通过include指令嵌入用于CA登录后进行处理的代码与index页面一同编译-->
<%@include file="/ca/checkUsbkey.jsp" %>

<script type="text/javascript">
	var SMALLMSG ;
	var GADQYD = 1;
	var QYD = 2;
	var showmessageflag = 0;
	var countkyqk;
	var countxctb;
	$(document).ready(function(){
		daggleDiv("password_modify");
		getMsg();
	     setInterval(function(){
	    	 getMsg();
	     },120*1000);

	     $('#closebutton1').click(function(){ $('#msg2').slideUp(1000); });
	});
	//消息滚动
	function scrollNews(obj) {  
	    var $self = obj.find("ul:first");  
	    var lineHeight = $self.find("li:first").height(); //获取行高   
	    $self.animate({ "marginTop": -lineHeight + "px" }, 500, function() {  
	        $self.css({ marginTop: 0 }).find("li:first").appendTo($self); //appendTo能直接移动元素   
	    })  
	}
	function getMsg(){
		$.ajax({
 		   type: "POST",
 		   url: "jdy/queryMsg_xxts.action",
 		   dataType:"json",
 		   success: function(msg){
 			  if(msg!=""&&msg.lxxts!=""&&msg.lxxts.length>0){
 				 $("#msgUl").empty();
 				  for(var i=0;i<msg.lxxts.length;i++){
 					  var xxts=msg.lxxts[i];
 					  var xxbt=xxts.xxbt;
 					  var xxnr=xxts.xxnr;
 					  eval("var clhs ="+xxts.clhs);;
 					 $("#msgUl").append("<li><a href='#' title='"+xxbt+":"+xxnr+"'>"+xxbt+":"+xxnr+"</a></li>");
 					$("#msgUl").find("li:last").find('a').click(clhs);
 				  }
 	 		     $('#msg2').slideDown(1000,function(){
 	 		    	 setTimeout(function(){$('#msg2').slideUp(1000)},60 * 1000);
 	 		    	 if($("#msgUl").find("li").length>9){
 	 		    		 var scrollTimer;  
 	  	    		    $("#twitter").hover(function() {  
 	  	    		    	window.clearInterval(scrollTimer);  
 	  	    		    }, function() {  
 	  	    		        scrollTimer = setInterval(function() {  
 	  	    		            scrollNews( $("#twitter"));  
 	  	    		        }, 3000);
 	  	    		    }).trigger("mouseleave"); 
 	 		    	 }
 	 	          }); 
 			  }
 		   }
 		});
	}
	
	function initPromptBox(msg){
     //$('#closebutton').click(function(){ $('#msg1').slideUp(1000); });
     //$('#msg1').slideDown(1000,function(){setTimeout(function(){$('#msg1').slideUp(1000);},60 * 1000); });
     
     if(showmessageflag==GADQYD){
         var kyqk = "您有"+countkyqk+"条可疑情况还未处理！";
         var xctb = "您有"+countxctb+"条协查通报还未回复！";
         if(countkyqk!=0&&countxctb!=0){    
             $("#modalbody").html(kyqk+"</br></br>&nbsp<a href='#' onclick='showxctb(1);'>"+xctb+"</a>"); 
         }else if(countkyqk==0&&countxctb!=0){
             $("#modalbody").html("<a href='#' onclick='showxctb(1);'>"+xctb+"</a>");
         }else if(countkyqk!=0&&countxctb==0){
             $("#modalbody").text(kyqk);
         }
      }else if(showmessageflag==QYD){
          $("#modalbody").html("<a href='#' onclick='showxctb(2);'>"+msg+"</a>");
      }
      setTimeout(function(){helpContr();},30 * 60 * 1000);   //隔30s,再次弹出
     }
     
     //点击可疑情况链接
     /*function showkyqk(){
 	 	$("#iframes").empty();
		$("#iframes").load("basic/publicsystem/KyqkMan_GACX.jsp");
		$("#iframes").show("slow"); 
		$("#kyqkTag").val("1"); 
     }*/
     //点击协查通报链接
     function showxctb(value){
 	 	$("#iframes").empty();
 	 	if(value==1){
 	 	  $("#iframes").load("basic/basicsystem/XctbGadHf.jsp");
 	 	}else if(value==2){
 	 	  $("#iframes").load("basic/basicsystem/csdxctbMan.jsp");
 	 	}
		$("#iframes").show("slow"); 
		$("#xctbTag").val("1"); 
     }

	//报警客户端调用getGxdwbm方法时所需要的密码 ， 乔晓光用到得
	var loginOutPath="<%=loginOutPath%>";
	var clientCallPassword = "";
	//报警控件用到函数
	function getGxdwbm(){
		var gxdwbm = "<%=session.getAttribute("gxdwbm")%>";
		var username = "<%=username%>";
		var userid = "<%=userid%>";
		var departname = "<%=departmentname%>";
		var usertype = "<%=usertype%>";
		var useraccount = "<%=useraccount%>";
		//----------通过账号获得密码
		setParams("b_");
		var sUrl="sysadmin/queryPasswordByUseraccount_user.action";
		jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function update_clientCallPassword (json){ //回传函数实体，参数为XMLhttpRequest.responseText
				if (json.result=="success") {
					clientCallPassword=json.passwordResult;
				} else  {
					clientCallPassword="";
				}
			},
			complete: function(){ }
		});
		return gxdwbm.toString()+":"+usertype.toString()+":"+departname.toString()+":"+username.toString()+":"+userid.toString()+":"+useraccount.toString()+":"+clientCallPassword.toString();
	  }
	//创建场所编码和场所名称的session 用于客户端民警登陆取得客户端得场所编码和场所名称  ， 乔晓光用到得
	function creatSessionForCsbmCsmc(csbm,csmc){
		var sUrl="sysadmin/creatSessionForCsbmCsmc_login.action";
		var aa=3;//0失败，1成功
		jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: {csbm:csbm,csmc:csmc},
			async: false,
			dataType: 'json',
			success: function (json) {
				aa=1;
			},
			error: function (json) {
				aa=0;
			}
		});
		return aa;
	}
	var testtime;
	var shouYeJiaZaiYeMian;
	$(document).ready(function (){
	
	     //判断用户类别
	    var user_type = "<%=usertype%>";
	    
		//是否弹出提示通知通报信息
    	getHylbdm(user_type);
    	
    	
	    var utype=user_type.split(",");
		for(var i=0;i<utype.length;i++){
			if(utype[i]=="14"||utype[i]=="144"){ //娱乐业公安用户
			$("#police").val(1);// 1 可以使用离线读卡信息
			break;
			}
		}
	        
		getGxdwbm();
		//页面加载时，生成菜单
		setMenu();
		//页面高度页面宽度
		allPageWidth = document.body.clientWidth;
		pageWidth=1020;
		pageHeight=document.body.clientHeight;
		document.getElementById("allDiv").style.width=pageWidth;
		document.getElementById("allDiv").style.height=pageHeight;
		shouYeJiaZaiXiang(); //首页加载项
		xiazailixian(); //下载离线
		clearTimeout(testtime); //// 清空setTimeout现成
		helpContr();
		cachuli();//ca登录时做页面处理
		$("#kjjindudiv").hide();
	}).keydown(function(e){
		if(event.keyCode == 13){
			if(e.target.nodeName!=null && e.target.nodeName.toUpperCase()!="TEXTAREA")
				event.keyCode = 9;
		}
	});
	
	getLoginlogNum();


	function shouYeJiaZaiXiang(){
	 	var hyflag = 0; ///行业类别  2为旅馆业
	 	
	 	var usertype = "<%=usertype%>";
	 	if(usertype.indexOf("24")!=-1)
	 	    hyflag = 2;
	 	if(usertype.indexOf("51")!=-1)
	 	    hyflag = 4;
	 	if(usertype.indexOf("52")!=-1)
	 	    hyflag = 5;
	 	if(usertype.indexOf("83")!=-1)
	 	    hyflag = 83;
	 	if(usertype.indexOf("84")!=-1)
	 	    hyflag = 84;
	 	if(usertype.indexOf("91")!=-1)
	 	    hyflag = 91;
	 	if(usertype.indexOf("93")!=-1||usertype.indexOf("92")!=-1)
	 	    hyflag = 93;
	 	if(usertype.indexOf("94")!=-1)
	 	    hyflag = 94;		
	 	if(usertype.indexOf("43")!=-1)
	 	    hyflag = 13;
	 	if(usertype.indexOf("103")!=-1||usertype.indexOf("102")!=-1)
	 	    hyflag = 16;
	 	if(usertype.indexOf("73")!=-1||usertype.indexOf("72")!=-1)
	 	    hyflag = 17;
	 	if(usertype.indexOf("14")!=-1||usertype.indexOf("144")!=-1)
	 	    hyflag = 14;
	    if(usertype.indexOf("11")!=-1||usertype.indexOf("141")!=-1)
	 	    hyflag = 11;
	 	if(usertype.indexOf("12")!=-1||usertype.indexOf("142")!=-1)
	 	    hyflag = 12;
	 	if(usertype.indexOf("13")!=-1||usertype.indexOf("143")!=-1)
	 	    hyflag = 3;
 	    if(usertype.indexOf("152")!=-1)
 	    	hyflag =15;
 	    if(usertype.indexOf("154")!=-1)
	    	hyflag =18;
 	    if(usertype.indexOf("164")!=-1)
	    	hyflag =19;	
	    if(usertype.indexOf("234")!=-1)
	    	hyflag =20;	
	    if(usertype.indexOf("114")!=-1)
	    	hyflag =21;	
	    if(usertype.indexOf("233")!=-1)
	    	hyflag =233;
		//寄递业企业端
		if(usertype.indexOf('252')!=-1 || usertype.indexOf('253')!=-1)
			hyflag=253;
		//寄递业公安端
		if(usertype.indexOf('254')!=-1)
			hyflag=254;
		
	 	 /*
	 	if(usertype.indexOf("14")!=-1||usertype.indexOf("144")!=-1)
		 	$('#header').css('background-image','url(images/logo_011.jpg)');    
		if(usertype.indexOf("11")!=-1||usertype.indexOf("141")!=-1)
		 	$('#header').css('background-image','url(images/logo_013.jpg)');
		if(usertype.indexOf("12")!=-1||usertype.indexOf("142")!=-1)
		 	$('#header').css('background-image','url(images/logo_014.jpg)');
		if(usertype.indexOf("13")!=-1||usertype.indexOf("143")!=-1)
		 	$('#header').css('background-image','url(images/logo_012.jpg)');
		*/
	 	//////装载 旅馆业首页面方法/////////////////////////////////
	 	if(hyflag==2){
	 		var userLevel = <%=departLevel%>;
	 		if(userLevel<4){
				shouYeJiaZaiYeMian = "business/Lgyzagl/GatSyMan.jsp";
				jiaZaiShouYeYeMian();
	 		}else{
				shouYeJiaZaiYeMian = "business/Lgyzagl/zh.jsp";
				jiaZaiShouYeYeMian();
			}		
	 	//////装载 场所端首页面方法/////////////////////////////////
		}else if(hyflag==3){
				shouYeJiaZaiYeMian = "business/Ylfwzagl/yltz-qyd.jsp";
				jiaZaiShouYeYeMian();
		//////装载印章业公安端首页面方法/////////////////////////////////
		}else if(hyflag==4){
				shouYeJiaZaiYeMian = "business/yzyzagl/gadtz.jsp";
				jiaZaiShouYeYeMian();
				
		//////装载印章业企业端首页面方法/////////////////////////////////
		}else if(hyflag==5){
				shouYeJiaZaiYeMian = "business/yzyzagl/YzyQydTzMan.jsp";
				jiaZaiShouYeYeMian();
				
		//////装载废旧金属收购企业端首页面方法/////////////////////////////////
		}else if(hyflag==83){
				shouYeJiaZaiYeMian = "business/fjjssgyzagl/FjjsQydTzMan.jsp";
				jiaZaiShouYeYeMian();
				
		//////////装载废旧金属收购业公安端首页面方法/////////////////////////////
		}else if(hyflag==84){
				shouYeJiaZaiYeMian = "business/fjjssgyzagl/FjjsGadtz.jsp";
				jiaZaiShouYeYeMian();
				
		//////装载 出租屋行业首页面方法/////////////////////////////////
		}else if(hyflag==91){
				shouYeJiaZaiYeMian = "business/czfwzagl/zh.jsp";
				jiaZaiShouYeYeMian();
				
		//////装载 出租车行业企业端首页面方法/////////////////////////////////
		}else if(hyflag==93){
				shouYeJiaZaiYeMian = "business/czczagl/czcsy.jsp";
				jiaZaiShouYeYeMian();
				
		//////////装载出租车行业公安端首页面方法/////////////////////////////
		}else if(hyflag==94){
				//shouYeJiaZaiYeMian = "business/czczagl/CzcGadtz.jsp";
				//jiaZaiShouYeYeMian();
				
		//////////娱乐业公安端首页面方法/////////////////////////////
		}else if(hyflag==14){
				shouYeJiaZaiYeMian = "business/Ylfwzagl/yltz-gad.jsp";
				jiaZaiShouYeYeMian();
		
		//////////娱乐业制卡端首页面方法/////////////////////////////
		}else if(hyflag==11){
				shouYeJiaZaiYeMian = "basic/icksystem/Tz-zkd.jsp";
				jiaZaiShouYeYeMian();
		
		//////////娱乐业采集端首页面方法/////////////////////////////
		}else if(hyflag==12){
				shouYeJiaZaiYeMian = "basic/icksystem/Tz-cjd.jsp";
				jiaZaiShouYeYeMian();
				
		//////////机修企业首页面方法/////////////////////////////
		}else if(hyflag==13){
				shouYeJiaZaiYeMian = "business/jxyzagl/Jxsy.jsp";
				jiaZaiShouYeYeMian();
		//////////汽车租赁企业首页面方法/////////////////////////////
		}else if(hyflag==16){
				shouYeJiaZaiYeMian = "business/qczlzagl/qczlsy.jsp";
				jiaZaiShouYeYeMian();
		//////////二手手机企业首页面方法/////////////////////////////
		}else if(hyflag==17){
				shouYeJiaZaiYeMian = "business/esjzagl/Esjsy.jsp";
				jiaZaiShouYeYeMian();
		}else if (hyflag == 15){
				shouYeJiaZaiYeMian = "business/jdccjzagl/cjtz-qyd.jsp";
				jiaZaiShouYeYeMian();
		}else if(hyflag==18){
				shouYeJiaZaiYeMian = "business/jdccjzagl/JdccjGadtz.jsp";
				jiaZaiShouYeYeMian();
		}else if (hyflag == 19){
				shouYeJiaZaiYeMian = "business/wtjmzagl/Wtjmtz-gad.jsp";
				jiaZaiShouYeYeMian();
		}else if (hyflag == 20){//加载印刷业公安端台账
				shouYeJiaZaiYeMian = "business/ysyzagl/ysytz-gad.jsp";
				jiaZaiShouYeYeMian();
		}else if (hyflag == 21){//加载剧毒化学品公安端台账
				shouYeJiaZaiYeMian = "business/jdhxpsys/index-gnMan.jsp";
				jiaZaiShouYeYeMian();
		}else if (hyflag == 233){//加载印刷业企业端台账
				shouYeJiaZaiYeMian = "business/ysyzagl/ysytz-qyd.jsp";
				jiaZaiShouYeYeMian();

		} else if(hyflag==253){ //加载寄递业企业端台帐
			shouYeJiaZaiYeMian='business/jdyzagl/jdytz-qyd.jsp';
			jiaZaiShouYeYeMian();
		} else if(hyflag==254) { //加载寄递业公安端台帐
			shouYeJiaZaiYeMian='business/jdyzagl/jdytz-gad.jsp';
			jiaZaiShouYeYeMian();
		}
	}
	
	function jiaZaiShouYeYeMian(){
		$("#password_modify").empty();
	 	$("#iframes").empty();
	 	if(shouYeJiaZaiYeMian!=null && shouYeJiaZaiYeMian!="")
			$("#iframes").load(shouYeJiaZaiYeMian);
		$("#iframes").show("slow"); 
		$("#iframes").width("1020"); 
	}
	
	//生成顶级菜单
	function setMenu(){
         $.post(
         	"<%=request.getContextPath()%>/sysadmin/allMenu_menu.action", 
         	{userid:'<%=userid%>',usertype:'<%=usertype%>'},
         	 function(result)
         	 {
				$("#menumain").append($(result.treeMenuString));
				//document.getElementById("menumain").innerHTML = result;
				
				initMoveMethod();
         	 	
				setBeginMenu();
 			},
 			"json"); 
 		}
 		function setBeginMenu(){
 			$('ul.jd_menu').jdMenu();
 		}		
		//点击叶子菜单 导航到相应页面
        function showContent(obj)
        {	
            closemusic();           /////选择菜单的时候关闭报警音乐
            clearTimeout(testtime); //// 清空setTimeout现成
        	//$('#'+jQuery(obj).attr("id")).click(function (){
       		func_code = jQuery(obj).attr("id");
       		$("#password_modify").empty();
 	 		$("#iframes").empty();
			$("#iframes").load(jQuery(obj).attr("path"));
			$("#iframes").show("slow"); 	
        	//});
        }
        
        //返回首页
        function fnloginSy()
        {
			jiaZaiShouYeYeMian();
			clearTimeout(testtime); //// 清空setTimeout现成	
        }
        
        //退出系统  提示框为alert方式
        /*function fnlogout()
        {
        	if(confirm("确认退出本系统?"))
        	{	

        		//window.location.href='public/loginout.jsp';
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
        	}
        	else
        	{
        		return false;
        	}
        	clearTimeout(testtime); //// 清空setTimeout现成
        }*/
         //退出系统 提示框为jalert方式,采用CA登录方式，由于退出时需要退出到https页面，必须采用此方式
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
          //控件中的退出按钮用到得变量
	var bmmcflag="<%=bmmc%>";
	var skhdcsbmflag="<%=skhdcsbm%>";//瘦客户端得场所编码
	var skhdcsmcflag ="<%=skhdcsmc%>";//瘦客户端得场所名称
	function update_page (json) { //回传函数实体，参数为XMLhttpRequest.responseText
		window.opener=null;    
		//window.open("login.jsp");
		if(bmmcflag =='novalue'){
			window.open(loginOutPath,"","toolbar=yes,location=yes,directories=yes,menubar=yes,scrollbars=no,resizable=yes,status=yes,top=0,left=0,height="+screen.availHeight+",width="+screen.availWidth);
			window.close();
		}else{
			window.location.href='login.jsp?skhdcsbm='+skhdcsbmflag+'&skhdcsmc='+skhdcsmcflag+'&kjtuichu=index';
		}
		      //window.location.href='login.jsp';
		      //window.location.href='select.jsp';
	}
	//修改密码
	function fnmodifypassword() {
		//$("#iframes").empty();
		$("#password_modify").empty();
		$("#password_modify").load("public/passwordModify.jsp");
		$("#password_modify").show("slow");
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

	var usertype = "<%=usertype%>";
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
   /////关闭报警音乐
   function closemusic(){
      document.music.stop();
   }
   /////开始报警音乐
   function playmusic(){
      document.music.play();
   }
   
   function getLoginlogNum(){
		jQuery.ajax({
		   type: 'POST',
		   url: "sysadmin/getLoginlogNum_loginlog.action",
		   data: {},
		   async: true,
		   dataType: 'json',
		   success: function(json){
		     $("#loginlogNUm").text("今日共有"+json.logNum+"个,全部共有"+json.logNumAll+"个用户登录");
		   }
		});
	}
	
	//点击叉号关闭调用
	$(window).unload(function(){
		window.open("unload.jsp","newwindow","height=0,width=0,toolbar=no,menubar=no,scrollbars=no,location=no,status=no,left=20000,top=2000");
	});
	
	/**
	 * 帮助控制
	 */
    function helpContr(){
        var usertype = "<%=usertype%>";
        var ssdwbm = "<%=user.getSsdwbm()%>";
        var usertypeAttay = usertype.split(",");
        if (ssdwbm == "" || ssdwbm == "null" || ssdwbm == null) {
            //公安段
            if(usertype=='14'){
            	showmessageflag = GADQYD;      
                $("#help").attr("href", "help/Ylygad_help.jsp");
			}else{
				if(usertype!='9999')
            		showmessageflag = GADQYD;  
				$("#help").attr("href", "help/help_gad.jsp");
			}
                if(usertype == "11" || usertype == "12"|| usertype == "171"){//制卡和采集
            		showmessageflag = "";
                	$("#help").attr("href", "help/Nohelp.jsp");
                }
        }
        else {
            //企业的属于两个企业的用户
            if ((usertypeAttay.length) * 1 > 1) {
                $("#help").attr("href", "help/help_qyd.jsp");
            }
            else {
                //属于一个企业的用户
                if (usertype == "13" || usertype == "14"||usertype== "143" || usertype== "144" ) {//娱乐业
            		showmessageflag = QYD;
                    //$("#help").attr("href", "help/help_qyd_yly.html");
                    if(usertype=='14'){
            			 showmessageflag = GADQYD;
                    	$("#help").attr("href", "help/Ylygad_help.jsp");
					}else{
						$("#help").attr("href", "help/Ylyqyd_help.jsp");
					}
                }
               
                if (usertype == "24") {//旅馆业
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_lgy.html");
                }
                if (usertype == "42" || usertype == "43" || usertype == "44") {//机修业
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_jxy.html");
                }
                if (usertype == "72" || usertype == "73" || usertype == "74") {//二手机
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_esj.html");
                }
                if (usertype == "51" || usertype == "52" || usertype == "53") {//印章业
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_yzy.html");
                }
                if (usertype == "92" || usertype == "93" || usertype == "94") {//出租车
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_czc.html");
                }
                if (usertype == "112" || usertype == "113" || usertype == "114") {//剧毒化学品
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_jdhxp.html");
                }
                if (usertype == "91") {//出租屋
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_czfw.html");
                }
                if (usertype == "32" || usertype == "33" || usertype == "34") {//典当业
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_ddy.html");
                }
                if (usertype == "62" || usertype == "63" || usertype == "64") {//旧机动车
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_esc.html");
                }
                if (usertype == "102" || usertype == "103" || usertype == "104") {//汽车租赁
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_qczl.html");
                }
                if (usertype == "82" || usertype == "83" || usertype == "84") {//废旧金属
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_fjjs.html");
                }
                if (usertype == "121" || usertype == "122") {//重点单位
            		showmessageflag = QYD;
                    $("#help").attr("href", "help/help_qyd_zddw.html");
                }
                
            }
            
        }
        getHylbdm(showmessageflag);
        showMessage_qyd(showmessageflag);
    }
    
    /*********************************
    	公安端弹出提示框提示未处理的可疑情况
    	begin
    **********************************/
	function getHylbdm(showmessageflag){
		if(showmessageflag == GADQYD){ 
			jQuery.post("sysadmin/queryqbSelDictinhylb_dict_item.action","",getHylbdmBack,"json");
		}
	}
	function getHylbdmBack(json){
		if(json != null){
			$("#show_hylbbmall").val(json.ldata[0].fact_value);
			showMessage();
		}
	}
	
	function showMessage(){
		setParams("show_");
		jQuery.post("publicsystem/kyqkNum_kyqk.action",params,showMessageBack,"json");
	}
	
	function showMessageBack(json){
		if(json.LKyqk != null){
			countkyqk = json.LKyqk[0];
			showMessage_gadqyd();
	     }
     }
     
     //公安内网接收通告 
     function showMessage_gadqyd(){
       $("#qyd_jsdwbm").val("<%=departcode%>");
       setParams("qyd_");
	   jQuery.post("basicsystem/tztbNotReplyNum_xctb.action",params,showMessageBack_gadqyd,"json");
     }
     
     function showMessageBack_gadqyd(json){
       if(json.LXctb != null){
        countxctb = json.LXctb[0];
        var msg="";
        initPromptBox(msg);          
        }     
     }
     
     
     /*********************************
    	公安端弹出提示框提示未处理的可疑情况
    	end
    *********************************
    	企业端弹出提示框提示回复的通知通报
    	begin
    **********************************/
    function showMessage_qyd(showmessageflag){
    	if(showmessageflag == QYD){
    		$("#qyd_jsdwbm").val("<%=user.getSsdwbm()%>");
			setParams("qyd_");
			jQuery.post("basicsystem/tztbNotReplyNum_xctb.action",params,showMessageBack_qyd,"json");
		}
	}
	
	function showMessageBack_qyd(json){
		if(json.LXctb != null){
			countxctb = json.LXctb[0];
			if(countxctb != 0 && <%=showMessage%> == 1){
				var msg = "您有"+ countxctb +"条通知通报未回复！";
				initPromptBox(msg);
		     }
	     }
     }
     /*********************************
    	企业端弹出提示框提示回复的通知通报
    	end
    *********************************/
    
</script>
	<body> 
	<input type="hidden" id="xctbTag"/>
	<input type="hidden" id="kyqkTag"/>
	<input type="hidden" id="show_hylbbmall"/>
	<input type="hidden" id="qyd_jsdwbm"/>
	<div id="kjjindudiv" style="position:absolute;width:220px;height:20px;left:50%;top:50%;margin-left:-110px;margin-top:-10px;border:solid 3px #ccc;z-index:99;"><img src="images/jindutiao.gif"/></div>	
	<input type="hidden" id="b_useraccount" value="<%=useraccount%>"/>
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
    <td class="fontpart">当前用户:<%=username %>(<%=departmentname %>)</td>
  </tr>
   <tr>
    <td class="fontpart" id="loginlogNUm" ></td>
  </tr>
</table>
<!-- 
<div id="msg1">
            <div id="modal">
                <div class="modaltop">
                    <div class="modaltitle">信息提示：</div>
                    <span id="closebutton" style="CURSOR: hand">
	                    <img src="images/window/window_close.jpg" border="0" />
	                </span>
	            </div>
                <div class="modalbody">
                    <strong><span id="modalbody"></span></strong>
                </div>
            </div>
        </div> 
 -->
 <div id="msg2">
            <div id="modal2">
                <div class="modaltop2">
                    <div class="modaltitle">信息提示：</div>
                    <span id="closebutton1" style="CURSOR: hand">
	                    <img src="images/window/window_close.jpg" border="0" />
	                </span>
	            </div>
                <div class="modalbody" id="twitter">
                  <ul id="msgUl">
                   </ul> 
                </div>
            </div>
        </div> 
</div>
				<table width="155" border="0" align="right" cellpadding="0"
							cellspacing="0">
	  <tr>
								<td rowspan="2">
									<a class="sy" href="#" id='login' onclick='fnloginSy();'></a>	
															</td>
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
		
<%@include file="public/includeKongJian.jsp" %>
<%@include file="public/includegsWebTools.jsp" %>

<script type="text/javascript">
     
	<%		Globalpar globalpar = new Globalpar();
			Globalpar temp = null;
			List globList = null;
			
			String content_urls = "";
			String content_yzdz = "";
			String content_connJava = "";
			String content_deviceType = "";
			String content_yzdz_org = "";
			
			globalpar.setGlobalparcode("ylyurl");
			globList = CacheManager.getCacheGlobalpar(globalpar);
			if(globList!=null&&globList.size()>0){
				temp = (Globalpar)globList.get(0);
				content_urls = temp.getGlobalparvalue();	
			}
			
			globalpar.setGlobalparcode("kjvalidater");
			globList = CacheManager.getCacheGlobalpar(globalpar);
			if(globList!=null&&globList.size()>0){
				temp = (Globalpar)globList.get(0);
				content_yzdz = temp.getGlobalparvalue();	
				content_yzdz_org = content_yzdz;
				//content_yzdz =content_yzdz+","+password;
			}
			
			globalpar.setGlobalparcode("connjava");
			globList = CacheManager.getCacheGlobalpar(globalpar);
			if(globList!=null&&globList.size()>0){
				temp = (Globalpar)globList.get(0);
				content_connJava = temp.getGlobalparvalue();	
			}
			
			if(content_connJava.equals("3")){
			  content_yzdz =content_yzdz+","+password;
			}
			
			globalpar.setGlobalparcode("deviceType");
			globList = CacheManager.getCacheGlobalpar(globalpar);
			if(globList!=null&&globList.size()>0){
				temp = (Globalpar)globList.get(0);
				content_deviceType = temp.getGlobalparvalue();	
			}
	%>
	var content_urls = '<%=content_urls %>'; //系统全路径
	var content_yzdz = '<%=content_yzdz %>'; //验证文件
	var content_yzdz_org = '<%=content_yzdz_org %>'; //验证文件(不加密码值)
	var content_connJava = '<%=content_connJava %>'; //产品化和老程序标志
	var content_deviceType = '<%=content_deviceType %>'; //驱动标志
	function xiazailixian(){
		if(content_urls!=null&&content_urls!=''&&content_urls!='null'){
			var usertype="<%=usertype%>";
			var userid="<%=userid%>";
			var utype=usertype.split(",");
			for(var i=0;i<utype.length;i++){
				if(userid!=null&&(utype[i]=="13"||utype[i]=="143")){ //用户对象不为空、且为企业端用户 则下载offline
				WriteOffline('<%=user.getUsername() %>','<%=user.getUseraccount() %>');
				//if(content_connJava!=3){
			    	dictUpdate();
				//}
				break;
				
				}
			}
		}
	}
	var shouquanMes = '<%=shouquanEndDate %>'; //客服校验返回信息
	if(shouquanMes!=''){
		jAlert(''+shouquanMes,'提示'); //如果不需要校验,此信息不会提示。不会影响其他功能。
	}
	

</script>
<div id="apDiv1"><embed name="music" src="sound/call.wav" autostart="false" loop="true" hidden="true"><!-- 报警音乐 --></div>
<div id="man_help" class="page-layout" src="#" style="top:180px; left:300px;display:none;width:600px;">
</body>
</html>