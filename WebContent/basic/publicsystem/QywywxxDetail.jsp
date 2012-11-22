<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#q_qywywxxid").attr("value",dataid);
		setDetail();
	}); 
		
	function updatediv (json) { 
	    $("#csfe").append(setNull(json.LQywywxx[0].csfe));
		$("#zafzrxm").append(setNull(json.LQywywxx[0].zafzrxm));
		$("#ksyysj").append(setNull(json.LQywywxx[0].ksyysj));
		$("#jsyysj").append(setNull(json.LQywywxx[0].jsyysj));
		$("#djrq").append(setNull(json.LQywywxx[0].djrq));
		$("#txrxm").append(setNull(json.LQywywxx[0].txrxm));
		$("#drwywqksm").append(setNull(json.LQywywxx[0].drwywqksm));
		
		if(setNull(json.LQywywxx[0].sffsaj)==1){
		  $("#sffsaj").append("是");
		}else{
		  $("#sffsaj").append("否");
		}
		
		if(setNull(json.LQywywxx[0].sfglbmjc)==1){
		  $("#sfglbmjc").append("是");
		}else{
		  $("#sfglbmjc").append("否");
		}
		
		daggleDiv("qywywxx_detail");
	}	
</script>
<input type="hidden" id="q_qywywxxid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">无业务信息上报详情</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qywywxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" cellpadding="3" cellspacing="0" class="detail" id="detail">
	<tr height="20">
		<td width="10%" class="distd1">单位负责人</td>
		<td width="15%" class="detailtd2"><span id="csfe"></span></td>
		<td width="10%" class="distd1">治安负责人</td>
		<td width="15%" class="detailtd2"><span id="zafzrxm"></span></td>
	</tr>
	<tr height="20">
		<td width="10%" class="distd1">营业开始时间</td>
		<td width="15%" class="detailtd2"><span id="ksyysj"></span></td>
		<td width="10%" class="distd1">营业结束时间</td>
		<td width="15%" class="detailtd2"><span id="jsyysj"></span></td>
	</tr>
	
	<tr height="20">
		<td width="10%" class="distd1">是否有治安、刑事案件或事故发生</td>
		<td width="15%" class="detailtd2"><span id="sffsaj"></span></td>
		<td width="10%" class="distd1">是否有管理部门检查</td>
		<td width="15%" class="detailtd2"><span id="sfglbmjc"></span></td>
	</tr>
	<tr height="20">
		<td width="10%" class="distd1">登记日期</td>
		<td width="15%" class="detailtd2"><span id="djrq"></span></td>
		<td width="10%" class="distd1">填写人</td>
		<td width="15%" class="detailtd2"><span id="txrxm"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">当日无业务上报情况说明</td>
		<td class="detailtd2" colspan= "3"><span id="drwywqksm"></span></td>
	</tr>
</table>