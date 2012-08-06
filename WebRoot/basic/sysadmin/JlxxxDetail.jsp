<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#q_jlxid").attr("value",dataid);
			setDetail();
	}); 
	
	
		
	function updatediv (json) { 
		$("#jlxid").append(setNull(json.LJlxxx[0].jlxid));
		$("#addressid").append(setNull(json.LJlxxx[0].addressid));
		$("#jlxdm").append(setNull(json.LJlxxx[0].jlxdm));
		$("#jlxmc").append(setNull(json.LJlxxx[0].jlxmc));
	}	
</script>
<input type="hidden" id="q_jlxid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">明细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#jlxxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" cellpadding="3" cellspacing="0" class="detail" id="detail">
	<tr height="20">
		<td class="distd1">街路巷ID</td>
		<td class="detailtd2"><span id="jlxid"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">地址ID</td>
		<td class="detailtd2"><span id="addressid"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">街路巷代码</td>
		<td class="detailtd2"><span id="jlxdm"></span></td>
	</tr>
	<tr height="20">
		<td class="distd1">街路巷名称</td>
		<td class="detailtd2"><span id="jlxmc"></span></td>
	</tr>
</table>