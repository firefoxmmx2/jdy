<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">

//寄递物品信息保存时验证方法
function jdfpxxtjVerify(){
	
	if (!checkControlValue("jdwp_jdpmc","String",1,30,null,1,"内件品名"))
		return false;
	if (!checkControlValue("jdwp_jdpsm","Float",0,9999.9,1,1,"数量"))
		return false;
	return true;
}
//寄递物品信息添加
function jdwpxxtj(){
	if(jdfpxxtjVerify()){
		//调用添加寄递物品行的方法
		jdwpxxadd();
	}		
}
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
<table>
	<tr>
		<td class="red" >大类</td>
		<td class="pagetd"><select id="dl" class="select1"><option>物品</option></select></td>
	</tr>
	<tr>
		<td class="red">小类</td>
		<td class="pagetd"><select id="jdwp_jdplx" class="select1"><option>药品</option></select></td>
	</tr>
	<tr>
		<td class="red">内件品名</td>
		<td class="detailtd"><input type="text" id="jdwp_jdpmc" class="inputstyle" value="" /></td>
	</tr>
	<tr>
		<td class="red">数量</td>
		<td class="detailtd"><input type="text" id="jdwp_jdpsm" class="inputstyle" value="" /></td>
	</tr>
	<tr><td height="9"></td></tr>
	<tr height="25" align="center">
		<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='jdwpxxtj();'>保存</a></td>
	</tr>
</table>

