<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#q_dzxzid").attr("value",dataid);
			setDetail();
	}); 
	
	
		
	function updatediv (json) { 
		$("#dzxzid").append(setNull(json.LAddressdetail[0].dzxzid));
		$("#addressid").append(setNull(json.LAddressdetail[0].addressid));
		$("#dzxzmc").append(setNull(json.LAddressdetail[0].dzxzmc));
	}	
</script>
<input type="hidden" id="q_dzxzid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">明细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#addressdetail_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" cellpadding="3" cellspacing="0" class="detail" id="detail">
	<tr height="20">
		<td class="distd1">地址详址ID</td>
		<td class="detailtd2"><span id="dzxzid"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">地址ID</td>
		<td class="detailtd2"><span id="addressid"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">地址详址名称</td>
		<td class="detailtd2"><span id="dzxzmc"></span></td>
	</tr>
</table>