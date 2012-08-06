<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../public/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta  http-equiv="x-ua-compatible" content="ie=7"/>
	<%@ include file="../../public/includeScript.jsp"%>
<script type="text/javascript">
$().ready(function() {
	yhjslbflag = "ptry";
	$("#ins_addressid").val(parent.parent.addressid);
	$("#ins_departid").val(parent.parent.detid);
	user_insertUrl="<%=request.getContextPath()%>/sysadmin/insert_user.action";
	usls = "<%=request.getContextPath()%>/sysadmin/findUserType_user.action";
	getDictItemBox("yhjslb","yhjslb","dm_yhjslb");
	jQuery.post(usls,params,userTypeBack,"json");
	a_yhjslb = $("#yhjslb").attr("value");
	$("#yhjslb").change(function(){
		a_yhjslb = $("#yhjslb").attr("value");
		if(a_yhjslb==1){
			$("#ins_usertype").attr("value",'9999M');
			yhjslbflag='glry';//管理人员
			$("#yhlbtd").css("display","none");
		}else{
			yhjslbflag='ptry';//普通人员
			$("#yhlbtd").css("display","block");
		}
	});
	$("a#link_gxmj").fancybox({
		'width'			: 400,
		'height'		: 255,
		'overlayShow'	: false,
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic',
		'type'			: 'iframe'
	});
	$("#ins_gxmj").bind("click",function(){
		$("#link_gxmj").click();
		return false;
	});
});

function userTypeBack(json){ //用户类别
	$("#yhlb").html(setNull(json.strResult));
}

function lgdUser_add(){
	if(user_addVerify()){
		$("#ins_password").val(hex_md5($("#ra_password").val())); //MD5 加密
		setParams("ins_");
		jQuery.ajax({
			type: 'POST',
			url: user_insertUrl,
			data: params,
			async: true,
			dataType: 'json',
			success: function(reflag){
				if(reflag.result=="success"){
					$("#ins_userMsg").show().html("添加成功！");
					parent.parent.dept_setPageList(1);
				}else if(reflag.result=="fail"){
					$("#ins_userMsg").show().html("地址代码重复，请重新输入!");
				}
			}
		});
	}
}

function user_addVerify(){
	$("#ins_userMsg").empty();
	var isCanPlay = false;
	if(yhjslbflag=='ptry'){
		$("#yhlb").find("input[type='checkbox']").each(function(){
			if($(this).attr("checked")==true){
				isCanPlay = true;
			}
		});
		if(!isCanPlay){
			jAlert("请选择用户类别","提示");
			return false;
		}
	}
	var ra = $("#ra_password").val();
	var re = $("#re_repassword").val();
	if (!checkControlValue("ins_username","String",1,20,null,1,"用户姓名"))
		return false;
	if (!checkControlValue("ins_useraccount","String",1,20,null,1,"登陆账号"))
		return false;
	if (!checkControlValue("ra_password","String",1,20,null,1,"用户密码"))
		return false;
	if (!checkControlValue("re_repassword","String",1,20,null,1,"重复密码"))
		return false;
	if(re != ra){
		$("#ins_userMsg").show().html("密码不一致，请重新输入!");
		return false;
	}
	if (!checkControlValue("ins_idnum","String",1,20,null,0,"身份证号"))
		return false;
	if (!checkControlValue("ins_mobilephone","String",1,20,null,0,"联系电话"))
		return false;
	if (!checkControlValue("ins_gxmj","String",1,80,null,1,"管辖民警"))
		return false;
	valCode();
	if(!canCommit)
		return false;
	if(yhjslbflag=='ptry'){
		$("#ins_usertype").attr("value","");
		$("#yhlb").find("input[type='checkbox']").each(function(){
		if($(this).attr("checked")==true){
				var thisid = $(this).attr("id").replace('yhlb_','');
				$("#ins_usertype").attr("value",$("#ins_usertype").attr("value")+thisid+",");
			}
		});
	}
	if(!isCanPlay && yhjslbflag == ""){
		jAlert("请选择用户类别","提示");
		return false;
	}
	return true;
}

function valCode(){ //验证代码
	setParams("ins_");
	var sUrl="<%=request.getContextPath()%>/sysadmin/validateUser_user.action";
	jQuery.ajax({
		type: 'POST',
		url: sUrl,
		data: params,
		async: false,
		dataType: 'json',
		success: function(result){						
			var rows  = eval(result);
			valCodeBack(rows);
		}
	});
}
function valCodeBack(json){
	if(json.result=="success"){
		if(json.strResult=="1"){
			jAlert('此账号已存在!','验证信息');
			canCommit=false;
		}else{
			canCommit=true;
		}
	}else{
		canCommit=false;
	}
}

</script>
<html>
  <body>
<input type="hidden" id="ins_addressid"/>
<input type="hidden" id="ins_departid"/>
<input type="hidden" id="ins_password"/>
<input type="hidden" id="ins_usertype"/>
<input type="hidden" id="ins_mjid"/>
<table width="450" border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable">
	<tr>
        <td width="15%" class="wdtd_ordinary">用户姓名</td>
        <td width="35%" class="wdtd_input"><input type="text" class="inputstyle"  id="ins_username"/></td>
        <td width="15%" class="wdtd_ordinary">登陆账号</td>
        <td width="35%" class="wdtd_input"><input type="text" class="inputstyle"  id="ins_useraccount" onblur="valCode();"/></td>
	</tr>
	<tr>
		<td class="wdtd_ordinary">用户密码</td>
        <td class="wdtd_input"><input type="password" class="inputstyle" id="ra_password"/></td>
        <td class="wdtd_ordinary">重复密码</td>
        <td class="wdtd_input"><input type="password" class="inputstyle" id="re_repassword"/></td>
	</tr>
	<tr>
        <td class="wdtd_ordinary">身份证号</td>
        <td class="wdtd_input"><input type="text" class="inputstyle"  id="ins_idnum"/></td>
        <td class="wdtd_ordinary">联系电话</td>
        <td class="wdtd_input"><input type="text" class="inputstyle"  id="ins_mobilephone"/></td>
	</tr>
	<tr>
		<td class="wdtd_ordinary">管辖民警</td>
        <td class="wdtd_input"><input type="text" class="inputstyle"  id="ins_gxmj" readonly="readonly"/>
        <a id="link_gxmj" style='display: none;' href="<%=request.getContextPath()%>/business/ldrksystem/Mjlb.jsp"></a>
        </td>
        <td class="wdtd_ordinary">角色类别</td>
	    <td class="wdtd_input"><select id="yhjslb"></select></td>
	</tr>
	<tr  id="yhlbtd" style="display:block" align="center">
	  <td  class="wdtd_ordinary" >用户类别</td>
	  <td  class="wdtd_input" colspan="3" height="200">
	  <div class="scrollbarface" style="overflow-y:yes;overflow-x:hidden;height:100;width:100%;">
		  <span id="yhlb"></span>
	  </div></td>
	</tr>
</table>
<table width="460" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
      <td colspan="4" align="right"><a href="#" class="addbutton" id="querys" onClick="lgdUser_add();">保存</a></td>
    </tr>
</table>
<div id="ins_userMsg" width="90%" align="center" style="display: none;font-size:10px;color:red;font-weight: bold;z-index:1000;"></div>
  </body>
</html>
