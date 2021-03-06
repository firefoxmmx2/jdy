<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		daggleDiv(detailid);
		$("#q_wscqyid").attr("value",dataid);
		$("#m_wscqyid").attr("value",dataid);
		setDetail();
		$("#m_wscrq").attr("readonly","true");
		$("#m_wscrq").datepicker();
	}); 
	function updatediv (json) { 
		$("#m_wscqyid").attr("value",setNull(json.LWscqy[0].wscqyid));
		$("#m_hylbdm").attr("value",setNull(json.LWscqy[0].hylbdm));
		$("#m_hylb").attr("value",setNull(json.LWscqy[0].hylb));
		$("#m_wscrq").attr("value",setNull(json.LWscqy[0].wscrq));
		$("#m_dsjgdm").attr("value",setNull(json.LWscqy[0].dsjgdm));
		$("#m_dsjgmc").attr("value",setNull(json.LWscqy[0].dsjgmc));
		$("#m_fxjdm").attr("value",setNull(json.LWscqy[0].fxjdm));
		$("#m_fxjmc").attr("value",setNull(json.LWscqy[0].fxjmc));
		$("#m_gxdwdm").attr("value",setNull(json.LWscqy[0].gxdwdm));
		$("#m_gxdwmc").attr("value",setNull(json.LWscqy[0].gxdwmc));
		$("#m_qybm").attr("value",setNull(json.LWscqy[0].qybm));
		$("#m_qymc").attr("value",setNull(json.LWscqy[0].qymc));
		$("#m_lxdh").attr("value",setNull(json.LWscqy[0].lxdh));
		$("#m_ztdm").attr("value",setNull(json.LWscqy[0].ztdm));
	}	
	function modifyVerify(){
		if (!checkControlValue("m_wscqyid","Integer",-9999999999,9999999999,null,0,"未上传企业ID"))
			return false;
		if (!checkControlValue("m_hylbdm","String",1,2,null,0,"行业类别代码"))
			return false;
		if (!checkControlValue("m_hylb","String",1,40,null,0,"行业类别"))
			return false;
		if (!checkControlValue("m_wscrq","Date",null,null,null,0,"未上传日期"))
			return false;
		if (!checkControlValue("m_dsjgdm","String",1,20,null,0,"地市机关代码"))
			return false;
		if (!checkControlValue("m_dsjgmc","String",1,60,null,0,"地市机关名称"))
			return false;
		if (!checkControlValue("m_fxjdm","String",1,20,null,0,"分县局代码"))
			return false;
		if (!checkControlValue("m_fxjmc","String",1,60,null,0,"分县局名称"))
			return false;
		if (!checkControlValue("m_gxdwdm","String",1,20,null,0,"管辖单位代码"))
			return false;
		if (!checkControlValue("m_gxdwmc","String",1,60,null,0,"管辖单位名称"))
			return false;
		if (!checkControlValue("m_qybm","String",1,20,null,0,"企业编码"))
			return false;
		if (!checkControlValue("m_qymc","String",1,120,null,0,"企业名称"))
			return false;
		if (!checkControlValue("m_lxdh","String",1,30,null,0,"联系电话"))
			return false;
		if (!checkControlValue("m_ztdm","String",1,2,null,0,"状态代码"))
			return false;
		return true;
	}
</script>
<input type="hidden" id="q_wscqyid">
<input type="hidden" id="m_wscqyid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">修改</td>
      <td ><a href="#" id="closeDiv" onclick='$("#Wscqy_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="modify">
	<tr height="20">
		<td class="distd">未上传企业ID</td>
		<td class="detailtd"><input type="text" id="m_wscqyid" value="0"></td>
		<td class="distd">行业类别代码</td>
		<td class="detailtd"><input type="text" id="m_hylbdm" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">行业类别</td>
		<td class="detailtd"><input type="text" id="m_hylb" value=""></td>
		<td class="distd">未上传日期</td>
		<td class="detailtd"><input type="text" id="m_wscrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">地市机关代码</td>
		<td class="detailtd"><input type="text" id="m_dsjgdm" value=""></td>
		<td class="distd">地市机关名称</td>
		<td class="detailtd"><input type="text" id="m_dsjgmc" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">分县局代码</td>
		<td class="detailtd"><input type="text" id="m_fxjdm" value=""></td>
		<td class="distd">分县局名称</td>
		<td class="detailtd"><input type="text" id="m_fxjmc" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">管辖单位代码</td>
		<td class="detailtd"><input type="text" id="m_gxdwdm" value=""></td>
		<td class="distd">管辖单位名称</td>
		<td class="detailtd"><input type="text" id="m_gxdwmc" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">企业编码</td>
		<td class="detailtd"><input type="text" id="m_qybm" value=""></td>
		<td class="distd">企业名称</td>
		<td class="detailtd"><input type="text" id="m_qymc" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">联系电话</td>
		<td class="detailtd"><input type="text" id="m_lxdh" value=""></td>
		<td class="distd">状态代码</td>
		<td class="detailtd"><input type="text" id="m_ztdm" value=""></td>
	</tr>
<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setUpdate();'>保存</a></td></tr>
</table>
