<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../public/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta  http-equiv="x-ua-compatible" content="ie=7"/>
	<%@ include file="../../public/includeScript.jsp"%>
<script type="text/javascript">
$().ready(function() {
	yhjslbflag='ptry';
	$("#lgmod_userid").val(parent.parent.uid);
	lgmod_detailUrl="<%=request.getContextPath()%>/sysadmin/queryModUser_user.action";
	lgmod_modifyUrl="<%=request.getContextPath()%>/sysadmin/modify_user.action";
	mod = "<%=request.getContextPath()%>/sysadmin/findUserType_user.action";
	getDictItemBox("lgmod_yhjslb","lgmod_yhjslb","dm_yhjslb");
	jQuery.post(mod,params,mod_userTypeBack,"json");
	a_yhjslb = $("#lgmod_yhjslb").attr("value");
	$("#lgmod_yhjslb").change(function(){
		a_yhjslb = $("#lgmod_yhjslb").attr("value");
		if(a_yhjslb==1){
			$("#lgmod_usertype").attr("value",'9999M');
			yhjslbflag='glry';//管理人员
			$("#lgmod_yhlbtd").css("display","none");
		}else{
			yhjslbflag='ptry';//普通人员
			$("#lgmod_yhlbtd").css("display","block");
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
	lgmod_setDetail();
});

function mod_userTypeBack(json){ //用户类别
	$("#lgmod_yhlb").html(setNull(json.strResult));
}

function lgmod_setDetail(){
	setParams("lgmod_");
	jQuery.post(lgmod_detailUrl,params,lgmod_Detail,"json");
}

function lgmod_Detail(lgmodjson){
	$("#lgmod_username").attr("value",setNull(lgmodjson.LUser[0].username));
	$("#lgmod_useraccount").attr("value",setNull(lgmodjson.LUser[0].useraccount));
	$("#lgmod_idnum").attr("value",setNull(lgmodjson.LUser[0].idnum));
	$("#lgmod_mobilephone").attr("value",setNull(lgmodjson.LUser[0].mobilephone));
	$("#lgmod_mjid").attr("value",setNull(lgmodjson.LUser[0].mjid));
	$("#ins_gxmj").attr("value",setNull(lgmodjson.LUser[0].mjname));
	var usertype = setNull(lgmodjson.LUser[0].usertype);
	var type = new Array();
	type = usertype.split(",");
	for ( var i = 0; i < type.length; i++) {
		$("#yhlb_"+type[i]).attr("checked","true");
	}
}

function lgdUser_mod(){
	if(user_modVerify()){
		$("#lgmod_mjid").val($("#ins_mjid").val());
		setParams("lgmod_");
		jQuery.ajax({
			type: 'POST',
			url: lgmod_modifyUrl,
			data: params,
			async: true,
			dataType: 'json',
			success: function(reflag){
				if(reflag.result=="success"){
					$("#lgdmod_userMsg").show().html("修改成功！");
					parent.parent.dept_setPageList(1);
				}
			}
		});
	}
}

function user_modVerify(){
	$("#lgdmod_userMsg").empty();
	var isCanPlay = false;
	if(yhjslbflag=='ptry'){
		$("#lgmod_yhlb").find("input[type='checkbox']").each(function(){
			if($(this).attr("checked")==true){
				isCanPlay = true;
			}
		});
		if(!isCanPlay){
			jAlert("请选择用户类别","提示");
			return false;
		}
	}
	if(yhjslbflag=='ptry'){
		$("#lgmod_usertype").attr("value","");
		$("#lgmod_yhlb").find("input[type='checkbox']").each(function(){
		if($(this).attr("checked")==true){
				var thisid = $(this).attr("id").replace('yhlb_','');
				$("#lgmod_usertype").attr("value",$("#lgmod_usertype").attr("value")+thisid+",");
			}
		});
	}
	if(!isCanPlay && yhjslbflag == ""){
		jAlert("请选择用户类别","提示");
		return false;
	}
	if (!checkControlValue("lgmod_username","String",1,20,null,1,"用户姓名"))
		return false;
	if (!checkControlValue("lgmod_idnum","String",1,20,null,0,"身份证号"))
		return false;
	if (!checkControlValue("lgmod_mobilephone","String",1,20,null,0,"联系电话"))
		return false;
	if (!checkControlValue("ins_gxmj","String",1,80,null,1,"管辖民警"))
		return false;
	return true;
}
</script>
<html> 
  <body>
<input type="hidden" id="lgmod_userid"/>
<input type="hidden" id="lgmod_usertype"/>
<input type="hidden" id="lgmod_mjid"/>
<input type="hidden" id="ins_mjid"/>
<table width="450" border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable">
	<tr>
        <td width="15%" class="wdtd_ordinary">用户姓名</td>
        <td width="35%" class="wdtd_input"><input type="text" class="inputstyle"  id="lgmod_username"/></td>
        <td width="15%" class="wdtd_ordinary">登陆账号</td>
        <td width="35%" class="wdtd_input"><input type="text" class="readonly"  id="lgmod_useraccount" readonly="readonly"/></td>
	</tr>
	<tr>
        <td  class="wdtd_ordinary">身份证号</td>
        <td  class="wdtd_input"><input type="text" class="inputstyle"  id="lgmod_idnum"/></td>
        <td  class="wdtd_ordinary">联系电话</td>
        <td  class="wdtd_input"><input type="text" class="inputstyle"  id="lgmod_mobilephone"/></td>
	</tr>
	<tr>
		<td class="wdtd_ordinary">管辖民警</td>
        <td class="wdtd_input"><input type="text" class="inputstyle"  id="ins_gxmj" readonly="readonly"/>
        <a id="link_gxmj" style='display: none;' href="<%=request.getContextPath()%>/business/ldrksystem/Mjlb.jsp"></a>
        </td>
        <td class="wdtd_ordinary">角色类别</td>
	    <td class="wdtd_input"><select id="lgmod_yhjslb"></select></td>
	</tr>
	<tr  id="lgmod_yhlbtd" style="display:block" align="center">
	  <td  class="wdtd_ordinary" >用户类别</td>
	  <td  class="wdtd_input" colspan="3" height="200">
	  <div class="scrollbarface" style="overflow-y:yes;overflow-x:hidden;height:100;width:100%;">
		  <span id="lgmod_yhlb"></span>
	  </div></td>
	</tr>
</table>
<table width="460" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
      <td colspan="4" align="right"><a href="#" class="addbutton" id="querys" onClick="lgdUser_mod();">保存</a></td>
    </tr>
</table>
<div id="lgdmod_userMsg" width="90%" align="center" style="display: none;font-size:10px;color:red;font-weight: bold;"></div>
  </body>
</html>
