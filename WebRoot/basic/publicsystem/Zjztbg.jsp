<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#q_qyid").attr("value",qyjbxx_dataid);
		$("#manbq_zjzt").selectBox({code:"dm_yyzt"});
		manzjztOnchange();
		qyjbxx_setDetail();
		
	});
	function qyjbxx_updatediv(json){
		$("#zx_qybm").append(setNull(json.LQyjbxx[0].qybm));
		$("#zx_qymc").append(setNull(json.LQyjbxx[0].qymc));
		$("#m_zjztdm").attr("value",setNull(json.LQyjbxx[0].zjztdm));
		$("#m_zjztmc").attr("value",setNull(json.LQyjbxx[0].zjztmc));
		$("#manbq_zjzt").setValue(setNull(json.LQyjbxx[0].zjztdm),115);
		$("#m_qyid").attr("value",setNull(json.LQyjbxx[0].qyid));
	}
	function manzjztOnchange(){ //装机状态
		var zjztkey = $("#manbq_zjzt").attr("value");
		var zjztval = $("#manbq_zjzt").attr("title");
		$("#m_zjztdm").attr("value",zjztkey);
		$("#m_zjztmc").attr("value",zjztval);
	}
	function qyjbxx_zjztmodifyVerify(){
		var zjztdm = $("#m_zjztdm").attr("value");
		if(zjztdm==null||zjztdm==''||zjztdm=='null'){
			jAlert('请选择装机状态','提示信息',null,"div_manbq_zjzt");
			return false;
		}
		return true;
	}
</script>
</head>

<body>
<input type="hidden" id="q_qyid">
<input type="hidden" id="m_qyid">
<input type="hidden" id="m_zjztdm">
<input type="hidden" id="m_czlx" value="装机状态变更">
<input type="hidden" id="m_zjztmc">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">企业装机状态变更</td>
      <td align="right" class="title1"><a href="#" id="closeDiv" onclick='$(&quot;#qyjbxx_detail&quot;).hideAndRemove(&quot;show&quot;);'class="close"></a></td>
    </tr>
</table>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="2"></td>
		</tr>
	</table>
<table width="100%" border="0" cellspacing="0" cellpadding="2" class="detail">
  <tr>
    <td width="35%" class="distd1">企业名称</td>
    <td width="65%" class="detailtd2"><span type="text" id="zx_qymc"></span></td>
  </tr>
  <tr>
    <td class="distd1">企业编码</td>
    <td class="detailtd2"><span type="text" id="zx_qybm"></span></td>
  </tr>
  <tr>
    <td class="distd1">装机状态</td>
    <td class="detailtd2"><select name="select" id="manbq_zjzt" onchange="manzjztOnchange();"><option></option></select></td>
  </tr>
  <tr>
    <td colspan="2"><a href="#" hidefocus="true" class="submitbutton" title="保存" onclick='qyjbxx_zjztbg();'>保存</a></td>
  </tr>
</table>
</body>
</html>
