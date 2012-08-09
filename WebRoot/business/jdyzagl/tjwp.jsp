<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
$(document).ready(function() {	
	
}); 

</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递物品信息添加</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#zxzybaydwdzcl_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<table style="padding-left: 170px;">
	<tr>
		<td style="float:left;" align="left" class="red" >大类</td>
		<td align="left" width="23%" class="pagetd"><select id="ljxx_jjrzjlx" class="select1"><option></option></select></td>
	</tr>
	<tr>
		<td class="red">小类</td>
		<td width="23%" class="pagetd"><select id="ljxx_jjrzjlx" class="select1"><option></option></select></td>
	</tr>
	<tr>
		<td class="red">内件品名</td>
		<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
	</tr>
	<tr>
		<td class="red">数据量</td>
		<td class="detailtd"><input type="text" id="a_gwyqcqzqxdm" class="inputstyle" value="" /></td>
	</tr>
	<tr><td height="9"></td></tr>
	<tr height="25" align="center">
		<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='valadateCode();'>保存</a></td>
	</tr>
</table>

