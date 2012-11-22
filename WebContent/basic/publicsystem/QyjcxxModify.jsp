<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@include file="../../public/common.jsp" %>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
	String currDate = sdf.format(new Date());
 %>
<script type="text/javascript">
	$(document).ready(function() {
		var currDate = "<%=currDate%>";
		$("#dqrq").attr("value",currDate);
	    bc_bottonMoveRight(3); 
		daggleDiv(detailid);
		$("#q_qycfid").attr("value",dataid);
		$("#m_qycfid").attr("value",dataid);
		setDetail();
		$("#m_qyjcrq").attr("readonly","true");
		$("#m_qyjcrq").datepicker();
		$("#m_pzrq").attr("readonly","true");
		$("#m_pzrq").datepicker();
		$("#m_zxrq").attr("readonly","true");
		$("#m_zxrq").datepicker();
			$("#m_hylbdm").selectBoxhylb({code:"flgy"});//行业类别	
			$("#m_cflbbm").selectBox({code:"dm_jclb"});
		$("#m_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 奖励
		$("#m_jcmxlb").val($("#m_jcmxlbdm").attr('title'));
		$("#m_cflb").val($("#m_cflbbm").attr('title'));
		$("#m_cflbbm").change(function(){
			$("#m_cflb").val($("#m_cflbbm").attr('title'));
			if($("#m_cflbbm").val()==0){
				$("#m_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 奖励
			}else{
				$("#m_jcmxlbdm").selectBox({code:"dm_qycflb(jxy)"});//明细 处罚
			}
			$("#m_jcmxlb").val($("#m_jcmxlbdm").attr('title'));
		});
		$("#m_jcmxlbdm").change(function(){
			$("#m_jcmxlb").val($("#m_jcmxlbdm").attr('title'));
		});
		$("#m_pzjg").click(function(){ //管辖单位
			getGxdw("m_pzjg","m_pzjgdm");
		});
		$('#m_qymc').click(function(){
			if($("#m_hylbdm").val()!=''){
					dataid=$("#m_hylbdm").val();
					getTy_item("m_qymc","m_qybm");
			}
		});
		$('#m_hylb').val($("#m_hylbdm").attr('title'));
		$("#m_hylbdm").change(function(){
			$("#m_hylb").val($('#m_hylbdm').attr('title'));
		});
		$("#m_hylbdm").setAttr("readonly",true);
		showOrHideJLTr('jl_', 'none');
		showOrHideJLTr('dhnr_', 'none');
	}).unbind("keydown");
	
	function updatediv (json) { 
		$("#m_qyid").attr("value",setNull(json.LQyjcxx[0].qyid));
		$("#m_qycfid").attr("value",setNull(json.LQyjcxx[0].qycfid));
		$("#m_hylbdm").setValue(setNull(json.LQyjcxx[0].hylbdm));
		$("#m_hylb").attr("value",setNull(json.LQyjcxx[0].hylb));
		$("#m_qyjcrq").attr("value",setNull(json.LQyjcxx[0].qyjcrq));
		$("#m_cfdjxh").attr("value",setNull(json.LQyjcxx[0].cfdjxh));
		$("#m_cflbbm").setValue(setNull(json.LQyjcxx[0].cflbbm));
		if($("#m_cflbbm").val()==0){
			$("#m_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 奖励
			$("#m_jcmxlbdm").setValue(setNull(json.LQyjcxx[0].jcmxlbdm));
		}else{
			$("#m_jcmxlbdm").selectBox({code:"dm_qycflb(jxy)"});//明细 处罚
			$("#m_jcmxlbdm").setValue(setNull(json.LQyjcxx[0].jcmxlbdm));
		}
		$("#m_qybm").attr("value",setNull(json.LQyjcxx[0].qybm));
		$("#m_qymc").attr("value",setNull(json.LQyjcxx[0].qymc));
		$("#m_cflb").attr("value",setNull(json.LQyjcxx[0].cflb));
		$("#m_jcmxlb").attr("value",setNull(json.LQyjcxx[0].jcmxlb));
		$("#m_xzcfpzwh").attr("value",setNull(json.LQyjcxx[0].xzcfpzwh));
		$("#m_pzjgdm").attr("value",setNull(json.LQyjcxx[0].pzjgdm));
		$("#m_pzjg").attr("value",setNull(json.LQyjcxx[0].pzjg));
		$("#m_pzrbh").attr("value",setNull(json.LQyjcxx[0].pzrbh));
		$("#m_pzrxm").attr("value",setNull(json.LQyjcxx[0].pzrxm));
		$("#m_pzrq").attr("value",setNull(json.LQyjcxx[0].pzrq));
		$("#m_zxrbh").attr("value",setNull(json.LQyjcxx[0].zxrbh));
		$("#m_zxrxm").attr("value",setNull(json.LQyjcxx[0].zxrxm));
		$("#m_zxrq").attr("value",setNull(json.LQyjcxx[0].zxrq));
		$("#m_qkms").attr("value",setNull(json.LQyjcxx[0].qkms));
		$("#m_yjly").attr("value",setNull(json.LQyjcxx[0].yjly));
		$("#m_jcfd").attr("value",setNull(json.LQyjcxx[0].jcfd));
		$("#m_bjcr").attr("value",setNull(json.LQyjcxx[0].bjcr));
		hylbOnchangeModify();
		//显示行政拘留tr
		var jcmxlbdm = json.LQyjcxx[0].jcmxlbdm;
		if(jcmxlbdm == '10'){
			jlFlage = 1;
			showOrHideJLTr('jl_', 'block');
			showOrHideJLTr('dhnr_', 'block');
			$("#m_jlrxm").attr("value",setNull(json.LQyjcxx[0].jlrxm));
			$("#m_jlrsfzh").attr("value",setNull(json.LQyjcxx[0].jlrsfzh));
			$("#m_dhnr").attr("value",setNull(json.LQyjcxx[0].dhnr));
		}
	}	
	function modifyVerify(){
		if (!checkControlValue("m_xzcfpzwh","String",1,20,null,0,"行政处罚批准文号"))
			return false;
		if (!checkControlValue("m_hylb","String",1,40,null,1,"行业类别"))
			return false;
		if (!checkControlValue("m_qymc","String",1,40,null,1,"企业名称"))
			return false;
		if (!checkControlValue("m_cflb","String",1,100,null,1,"奖惩类别"))
			return false;
		if (!checkControlValue("m_jcmxlb","String",1,100,null,1,"奖惩明细类别"))
			return false;
		if (!checkControlValue("m_pzjg","String",1,100,null,0,"批准机构"))
			return false;
		if (!checkControlValue("m_pzrbh","String",1,30,null,0,"批准人编号"))
			return false;
		if (!checkControlValue("m_pzrxm","String",1,100,null,0,"批准人姓名"))
			return false;
		if (!checkControlValue("m_pzrq","Date",null,null,null,0,"批准日期"))
			return false;
		if (!checkControlValue("m_zxrbh","String",1,30,null,0,"执行人编号"))
			return false;
		if (!checkControlValue("m_zxrxm","String",1,100,null,0,"执行人姓名"))
			return false;
		if (!checkControlValue("m_zxrq","Date",null,null,null,0,"执行日期"))
			return false;
		if (!checkControlValue("m_jcfd","String",1,100,null,1,"奖惩幅度"))
			return false;
		if (!checkControlValue("m_bjcr","String",1,100,null,0,"被奖惩人"))
			return false;
		if (!checkControlValue("m_qyjcrq","Date",null,null,null,1,"企业奖惩日期"))
			return false;
		if (!checkControlValue("m_qkms","String",1,2000,null,1,"情况描述"))
			return false;
		if (!checkControlValue("m_yjly","String",1,2000,null,0,"依据理由"))
			return false;
		//拘留显示内容判断
		if(jlFlage == '1'){
			if (!checkControlValue("m_jlrxm","String",1,100,null,1,"拘留人姓名"))
				return false;
			if (!checkControlValue("m_jlrsfzh", "String", 1, 20, null, 1, "拘留人身份证号"))
				return false;
			if (!checkControlValue("m_dhnr","String",1,2000,null,1,"电话内容"))
				return false;
		}
		if($("#m_pzrq").val()!=""||$("#m_pzrq").val()!=null){
			if (!checkDateEarlier("m_pzrq","批准日期","dqrq","当前日期","DATE"))
				return false;
		}
		if($("#m_zxrq").val()!=""||$("#m_zxrq").val()!=null){
			if (!checkDateEarlier("m_zxrq","执行日期","dqrq","当前日期","DATE"))
				return false;
		}
		if (!checkDateEarlier("m_pzrq","批准日期","m_zxrq","执行日期","DATE"))
				return false;
		if (!checkDateEarlier("m_qyjcrq","企业奖惩日期","dqrq","当前日期","DATE"))
			return false;
		return true;
	}
	function hylbOnchangeModify(){
		var hylb=$("#m_hylbdm").val();
		var cflbbm=$("#m_cflbbm").val();
		var csorqymc = "企业名称";
		var csorqybm = "企业编码";
		var jcdjxh = "奖惩登记序号";
		var xzjcpwh = "行政奖惩决定书文号";
		var jclb = "奖惩类别";
		var jcmclb = "奖惩明细类别";
		var jcfd = "奖惩幅度";
		var qyjcrq = "企业奖惩日期";
		var yjly = "依据理由";
		if(hylb=='J'){
			csorqymc = "场所名称";
			csorqybm = "场所编码";
			jcdjxh = "处罚/奖励登记序号";
			xzjcpwh = "处罚/奖励行政决定书文号";
			jclb = "处罚/奖励类别";
			jcmclb = "处罚/奖励明细类别";
			jcfd = "处罚/奖励幅度";
			qyjcrq = "处罚/奖励日期";
			yjly = "处罚/奖励依据";
		} else if(hylb=='T'){
			if(cflbbm=='0'){
				$('#pzjg_mod').text("作出表彰奖励决定的公安机关");
				$('#pzrbm_mod').text("作出表彰奖励决定的其他单位");
				$('#pzrq_mod').text("表彰奖励日期");
				yjly="表彰奖励原因";
				$('#qkms_mod').text("表彰奖励内容");
			}else {
				$('#pzjg_mod').text("作出处罚决定的公安机关");
				$('#pzrbm_mod').text("作出处罚决定的其他单位");
				$('#pzrq_mod').text("处罚日期");
				yjly="处罚原因";
				$('#qkms_mod').text("处罚内容");
			}
		}
		$('#qymc_mod').text(csorqymc);
		$('#qybm_mod').text(csorqybm);
		$('#jcdjxh_mod').text(jcdjxh);
		$('#xzjcpwh_mod').text(xzjcpwh);
		$('#jclb_mod').text(jclb);
		$('#jcmclb_mod').text(jcmclb);
		$('#jcfd_mod').text(jcfd);
		$('#qyjcrq_mod').text(qyjcrq);
		$('#yjly_mod').text(yjly);
	}
	
	function showOrHideJLTr(smallId, state){ //显示隐藏 TR
		$("tr[id^='"+smallId+"']").each(function(){
			$(this)[0].style.display=''+state;
		});
	}
	
	$("#m_jlrsfzh").blur(function(){//当填写身份证号码失去焦点后，去判断身份证号码
		//如果身份证证号填写不为15或18位，则直接返回让他重新填写
		var zjhm = $("#m_jlrsfzh").attr("value").toUpperCase();
		  if(!isIdCardNo(zjhm))
		  {
		 	 $("#m_jlrsfzh").val("");//清空
		     //$("#a_zjhm").focus();//得到焦点
		     //alert("请输入15位或18位的身份证号码");
		    return false;
		  }else{
		  	if(zjhm.length==15){		  	
			   zjhm=change15to18(zjhm);
			}
		  }		  
		//证件号码就用用户自己填写的，如15位的不在去转换为18位
		$("#m_jlrsfzh").val(zjhm.toUpperCase());
	});
	
	//奖惩明细类别为行政拘留时显示行政拘留填写内容
	var jlFlage = '0';//行政拘留必填项判断标志
	function jcmxlbdmOnchange(){
		var jcmxlbdm = $("#m_jcmxlbdm").val();
		if (jcmxlbdm == '10'){
			showOrHideJLTr('jl_', 'block');
			showOrHideJLTr('dhnr_', 'block');
			jlFlage = '1';
		} else {
			showOrHideJLTr('jl_', 'none');
			showOrHideJLTr('dhnr_', 'none');
			$("#m_jlrxm").attr("value", "");
			$("#m_jlrsfzh").attr("value", "");
			$("#m_dhnr").attr("value", "");
			jlFlage = '0';
		}
	} 
	
	function cflbbmOnchange(){
		var cflbbm = $("#m_cflbbm").val();
		if (cflbbm == '0'){
			showOrHideJLTr('jl_', 'none');
			showOrHideJLTr('dhnr_', 'none');
			$("#m_jlrxm").attr("value", "");
			$("#m_jlrsfzh").attr("value", "");
			$("#m_dhnr").attr("value", "");
			jlFlage = '0';
		}
		var hylb=$("#m_hylbdm").val();
		if(hylb=='T'){
			if(cflbbm == '0'){
				$('#pzjg_mod').text("作出表彰奖励决定的公安机关");
				$('#pzrbm_mod').text("作出表彰奖励决定的其他单位");
				$('#pzrq_mod').text("表彰奖励日期");
				$('#yjly_mod').text("表彰奖励原因");
				$('#qkms_mod').text("表彰奖励内容");
			}else {
				$('#pzjg_mod').text("作出处罚决定的公安机关");
				$('#pzrbm_mod').text("作出处罚决定的其他单位");
				$('#pzrq_mod').text("处罚日期");
				$('#yjly_mod').text("处罚原因");
				$('#qkms_mod').text("处罚内容");
			}
		}
	}
</script>
<input type="hidden" id="q_qycfid">
<input type="hidden" id="dqrq">
<input type="hidden" id="m_qycfid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">修改</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyjcxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="modify">
	<tr height="20">
		<td class="distd">行业类别</td>
		<td class="detailtd"><select id="m_hylbdm" onchange="hylbOnchangeModify();"></select>
		<input type="hidden"class="inputstyle" id="m_hylb" value=""></td>
		<td class="red"></td>
		<td class="detailtd"></td>
	</tr>
	<tr height="20">
		<td class="red" width="18%" id="qymc_mod">企业名称</td>
		<td class="detailtd" width="29%"><input type="text" class="inputstyle" id="m_qymc" value="" readonly="readonly"></td>
		<td class="distd" width="24%" id="qybm_mod">企业编码</td>
		<td class="detailtd" width="31%"><input type="text" readonly class="readonly" id="m_qybm" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd" id="jcdjxh_mod">奖惩登记序号</td>
		<td class="detailtd"><input type="text"class="readonly" id="m_cfdjxh" value=""></td>
		<td class="distd" id="xzjcpwh_mod">行政奖惩决定书文号</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_xzcfpzwh"
			onkeyup="htjdOnkeyupVal('m_xzcfpzwh','pwh');" onblur="htjdOnBlurNotOnlyZfVal('m_xzcfpzwh','pwh');"></td>
	</tr>
	<tr height="20">
		<td class="distd" id="jclb_mod">奖惩类别</td>
		<td class="detailtd"><select id="m_cflbbm" onchange="cflbbmOnchange();"></select>
		<input type="hidden"class="inputstyle" id="m_cflb" value=""></td>
		<td class="distd" id="jcmclb_mod">奖惩明细类别</td>
		<td class="detailtd"><select id="m_jcmxlbdm" onchange="jcmxlbdmOnchange();"></select>
		<input type="hidden"class="inputstyle" id="m_jcmxlb" value=""></td>
	</tr>
	
	<tr height="20" id="jl_tr">
		<td class="red">拘留人姓名</td>
		<td class="detailtd">
			<input type="text"class="inputstyle" id="m_jlrxm"
			onkeyup="htjdOnkeyupVal('m_jlrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('m_jlrxm','xingming');">
        </td>
		<td class="red">拘留人身份证号</td>
		<td class="detailtd">
		<input type="text" class="inputstyle" id="m_jlrsfzh" value=""></td>
	</tr>
	<tr height="20" id="dhnr_tr">
		<td class="red">电话内容</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="m_dhnr" cols="56" rows="4"></textarea></td>
	</tr>
	
	<tr height="20">
		<td class="distd" id="pzjg_mod">批准机构</td>
		<td class="detailtd">
		<input type="text"class="inputstyle" id="m_pzjg" value="" readonly="readonly">
		<input type="hidden" id="m_pzjgdm"></td>
		<td class="distd" id="pzrbm_mod">批准人编号</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_pzrbh"
			onkeyup="htjdOnkeyupVal('m_pzrbh','shuzi');" onblur="htjdOnBlurNotOnlyZfVal('m_pzrbh','shuzi');"></td>
	</tr>
	<tr height="20">
		<td class="distd">批准人姓名</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_pzrxm"
			onkeyup="htjdOnkeyupVal('m_pzrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('m_pzrxm','xingming');"></td>
		<td class="distd" id="pzrq_mod">批准日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_pzrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">执行人编号</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_zxrbh"
			onkeyup="htjdOnkeyupVal('m_zxrbh','shuzi');" onblur="htjdOnBlurNotOnlyZfVal('m_zxrbh','shuzi');"></td>
		<td class="distd">执行人姓名</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_zxrxm"
			onkeyup="htjdOnkeyupVal('m_zxrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('m_zxrxm','xingming');"></td>
	</tr>
	<tr height="20">
		<td class="distd">执行日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_zxrq" value=""></td>
		<td class="red" id="jcfd_mod">奖惩幅度</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_jcfd" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">被奖惩人</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_bjcr"
			onkeyup="htjdOnkeyupVal('m_bjcr','xingming');" onblur="htjdOnBlurNotOnlyZfVal('m_bjcr','xingming');"></td>
		<td class="red" id="qyjcrq_mod">企业奖惩日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="m_qyjcrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="red" id="qkms_mod">情况描述</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="m_qkms" cols="56" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd" id="yjly_mod">依据理由</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="m_yjly" cols="56" rows="4"></textarea></td>
	</tr>
<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setUpdate();'>保存</a></td></tr>
</table>
