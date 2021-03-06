<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#a_sksj").attr("readonly","true");
		$("#a_sksj").datepicker();
		$("#a_sxsj").attr("readonly","true");
		$("#a_sxsj").datepicker();
	}); 
	function addVerify(){
		if (!checkControlValue("a_ickyjid","Integer",-9999999999,9999999999,null,0,"IC卡预警ID"))
			return false;
		if (!checkControlValue("a_qyid","Integer",-9999999999,9999999999,null,0,"企业ID"))
			return false;
		if (!checkControlValue("a_qybm","String",1,20,null,0,"企业编码"))
			return false;
		if (!checkControlValue("a_qymc","String",1,120,null,0,"企业名称"))
			return false;
		if (!checkControlValue("a_sksj","Date",null,null,null,0,"刷卡时间"))
			return false;
		if (!checkControlValue("a_dsjgdm","String",1,20,null,0,"地市机关代码"))
			return false;
		if (!checkControlValue("a_dsjgmc","String",1,60,null,0,"地市机关名称"))
			return false;
		if (!checkControlValue("a_fxjdm","String",1,20,null,0,"分县局代码"))
			return false;
		if (!checkControlValue("a_fxjmc","String",1,60,null,0,"分县局名称"))
			return false;
		if (!checkControlValue("a_gxdwdm","String",1,20,null,0,"管辖单位代码"))
			return false;
		if (!checkControlValue("a_gxdwmc","String",1,60,null,0,"管辖单位名称"))
			return false;
		if (!checkControlValue("a_cyrybh","String",1,30,null,0,"从业人员编号"))
			return false;
		if (!checkControlValue("a_xm","String",1,100,null,0,"姓名"))
			return false;
		if (!checkControlValue("a_xmpy","String",1,60,null,0,"姓名拼音"))
			return false;
		if (!checkControlValue("a_ickh","String",1,100,null,0,"卡ID号"))
			return false;
		if (!checkControlValue("a_kh","String",1,20,null,0,"卡号"))
			return false;
		if (!checkControlValue("a_xb","String",1,2,null,0,"性别"))
			return false;
		if (!checkControlValue("a_ywm","String",1,60,null,0,"英文名"))
			return false;
		if (!checkControlValue("a_ywx","String",1,60,null,0,"英文姓"))
			return false;
		if (!checkControlValue("a_wgrjyxkz","String",1,60,null,0,"外国人就业许可证号"))
			return false;
		if (!checkControlValue("a_cyzjdm","String",1,40,null,0,"常用证件代码"))
			return false;
		if (!checkControlValue("a_cyzj","String",1,100,null,0,"常用证件"))
			return false;
		if (!checkControlValue("a_zjhm","String",1,20,null,0,"证件号码"))
			return false;
		if (!checkControlValue("a_cylbdm","String",1,4,null,0,"从业类别代码"))
			return false;
		if (!checkControlValue("a_cylb","String",1,60,null,0,"从业类别"))
			return false;
		if (!checkControlValue("a_yjyy","String",1,300,null,0,"预警原因"))
			return false;
		if (!checkControlValue("a_sxsj","Date",null,null,null,0,"ic卡失效时间"))
			return false;
		if (!checkControlValue("a_ryid","Integer",-9999999999,9999999999,null,0,"从业人员ID"))
			return false;
		return true;
	}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#ickyj_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="add">
	<tr height="20">
		<td class="distd">IC卡预警ID</td>
		<td class="detailtd"><input type="text" id="a_ickyjid" class="inputstyle" value="0"></td>
		<td class="distd">企业ID</td>
		<td class="detailtd"><input type="text" id="a_qyid" class="inputstyle" value="0"></td>
	</tr>
	<tr height="20">
		<td class="distd">企业编码</td>
		<td class="detailtd"><input type="text" id="a_qybm" class="inputstyle" value=""></td>
		<td class="distd">企业名称</td>
		<td class="detailtd"><input type="text" id="a_qymc" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">刷卡时间</td>
		<td class="detailtd"><input type="text" id="a_sksj" class="inputstyle" value=""></td>
		<td class="distd">地市机关代码</td>
		<td class="detailtd"><input type="text" id="a_dsjgdm" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">地市机关名称</td>
		<td class="detailtd"><input type="text" id="a_dsjgmc" class="inputstyle" value=""></td>
		<td class="distd">分县局代码</td>
		<td class="detailtd"><input type="text" id="a_fxjdm" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">分县局名称</td>
		<td class="detailtd"><input type="text" id="a_fxjmc" class="inputstyle" value=""></td>
		<td class="distd">管辖单位代码</td>
		<td class="detailtd"><input type="text" id="a_gxdwdm" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">管辖单位名称</td>
		<td class="detailtd"><input type="text" id="a_gxdwmc" class="inputstyle" value=""></td>
		<td class="distd">从业人员编号</td>
		<td class="detailtd"><input type="text" id="a_cyrybh" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">姓名</td>
		<td class="detailtd"><input type="text" id="a_xm" class="inputstyle" value=""></td>
		<td class="distd">姓名拼音</td>
		<td class="detailtd"><input type="text" id="a_xmpy" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">卡ID号</td>
		<td class="detailtd"><input type="text" id="a_ickh" class="inputstyle" value=""></td>
		<td class="distd">卡号</td>
		<td class="detailtd"><input type="text" id="a_kh" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">性别</td>
		<td class="detailtd"><input type="text" id="a_xb" class="inputstyle" value=""></td>
		<td class="distd">英文名</td>
		<td class="detailtd"><input type="text" id="a_ywm" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">英文姓</td>
		<td class="detailtd"><input type="text" id="a_ywx" class="inputstyle" value=""></td>
		<td class="distd">外国人就业许可证号</td>
		<td class="detailtd"><input type="text" id="a_wgrjyxkz" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">常用证件代码</td>
		<td class="detailtd"><input type="text" id="a_cyzjdm" class="inputstyle" value=""></td>
		<td class="distd">常用证件</td>
		<td class="detailtd"><input type="text" id="a_cyzj" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">证件号码</td>
		<td class="detailtd"><input type="text" id="a_zjhm" class="inputstyle" value=""></td>
		<td class="distd">从业类别代码</td>
		<td class="detailtd"><input type="text" id="a_cylbdm" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">从业类别</td>
		<td class="detailtd"><input type="text" id="a_cylb" class="inputstyle" value=""></td>
		<td class="distd">预警原因</td>
		<td class="detailtd"><input type="text" id="a_yjyy" class="inputstyle" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">ic卡失效时间</td>
		<td class="detailtd"><input type="text" id="a_sxsj" class="inputstyle" value=""></td>
		<td class="distd">从业人员ID</td>
		<td class="detailtd"><input type="text" id="a_ryid" class="inputstyle" value="0"></td>
	</tr>
<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setadd();'>保存</a></td></tr>
</table>