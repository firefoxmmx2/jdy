<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		daggleDiv(detailid);
		$("#q_ryxxczrzid").attr("value",dataid);
		$("#m_ryxxczrzid").attr("value",dataid);
		setDetail();
		$("#m_czsj").attr("readonly","true");
		$("#m_czsj").datepicker();
	}); 
	function updatediv (json) { 
		$("#m_ryxxczrzid").attr("value",setNull(json.LRyxxczrz[0].ryxxczrzid));
		$("#m_czsj").attr("value",setNull(json.LRyxxczrz[0].czsj));
		$("#m_czlx").attr("value",setNull(json.LRyxxczrz[0].czlx));
		$("#m_cznr").attr("value",setNull(json.LRyxxczrz[0].cznr));
		$("#m_czr").attr("value",setNull(json.LRyxxczrz[0].czr));
		$("#m_qybm").attr("value",setNull(json.LRyxxczrz[0].qybm));
		$("#m_cyrybh").attr("value",setNull(json.LRyxxczrz[0].cyrybh));
	}	
	function modifyVerify(){
		if (!checkControlValue("m_ryxxczrzid","Integer",-9999999999,9999999999,null,0,"人员信息操作日志ID"))
			return false;
		if (!checkControlValue("m_czsj","Date",null,null,null,0,"操作时间"))
			return false;
		if (!checkControlValue("m_czlx","String",1,40,null,0,"操作类型"))
			return false;
		if (!checkControlValue("m_cznr","String",1,2000,null,0,"操作内容"))
			return false;
		if (!checkControlValue("m_czr","String",1,30,null,0,"操作人"))
			return false;
		if (!checkControlValue("m_qybm","String",1,20,null,0,"企业编码"))
			return false;
		if (!checkControlValue("m_cyrybh","String",1,20,null,0,"从业人员编号"))
			return false;
		return true;
	}
</script>
<input type="hidden" id="q_ryxxczrzid">
<input type="hidden" id="m_ryxxczrzid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">修改</td>
      <td ><a href="#" id="closeDiv" onclick='$("#Ryxxczrz_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="modify">
	<tr height="20">
		<td class="distd">人员信息操作日志ID</td>
		<td class="detailtd"><input type="text" id="m_ryxxczrzid" value="0"></td>
		<td class="distd">操作时间</td>
		<td class="detailtd"><input type="text" id="m_czsj" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">操作类型</td>
		<td class="detailtd"><input type="text" id="m_czlx" value=""></td>
		<td class="distd">操作内容</td>
		<td class="detailtd"><input type="text" id="m_cznr" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">操作人</td>
		<td class="detailtd"><input type="text" id="m_czr" value=""></td>
		<td class="distd">企业编码</td>
		<td class="detailtd"><input type="text" id="m_qybm" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">从业人员编号</td>
		<td class="detailtd"><input type="text" id="m_cyrybh" value=""></td>
	</tr>
<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setUpdate();'>保存</a></td></tr>
</table>
