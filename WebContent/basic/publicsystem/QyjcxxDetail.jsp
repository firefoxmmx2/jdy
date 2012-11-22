<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		daggleDiv(detailid);
		$("#q_qycfid").attr("value",dataid);
		showOrHideJLTr('jl_', 'none');
		showOrHideJLTr('dhnr_', 'none');
		setDetail();
	}); 
	
	
		
	function updatediv (json) { 
		$("#qyid").append(setNull(json.LQyjcxx[0].qyid));
		$("#qycfid").append(setNull(json.LQyjcxx[0].qycfid));
		$("#hylbdm").val(setNull(json.LQyjcxx[0].hylbdm));
		$("#hylb").append(setNull(json.LQyjcxx[0].hylb));
		$("#qyjcrq").append(setNull(json.LQyjcxx[0].qyjcrq));
		$("#cfdjxh").append(setNull(json.LQyjcxx[0].cfdjxh));
		$("#cflbbm").val(setNull(json.LQyjcxx[0].cflbbm));
		$("#cflb").append(setNull(json.LQyjcxx[0].cflb));
		$("#jcmxlb").append(setNull(json.LQyjcxx[0].jcmxlb));
		$("#xzcfpzwh").append(setNull(json.LQyjcxx[0].xzcfpzwh));
		$("#pzjgdm").append(setNull(json.LQyjcxx[0].pzjgdm));
		$("#pzjg").append(setNull(json.LQyjcxx[0].pzjg));
		$("#pzrbh").append(setNull(json.LQyjcxx[0].pzrbh));
		$("#pzrxm").append(setNull(json.LQyjcxx[0].pzrxm));
		$("#pzrq").append(setNull(json.LQyjcxx[0].pzrq));
		$("#zxrbh").append(setNull(json.LQyjcxx[0].zxrbh));
		$("#zxrxm").append(setNull(json.LQyjcxx[0].zxrxm));
		$("#zxrq").append(setNull(json.LQyjcxx[0].zxrq));
		$("#qkms").append(setNull(json.LQyjcxx[0].qkms));
		$("#yjly").append(setNull(json.LQyjcxx[0].yjly));
		$("#jcfd").append(setNull(json.LQyjcxx[0].jcfd));
		$("#bjcr").append(setNull(json.LQyjcxx[0].bjcr));
		$("#qymc").append(setNull(json.LQyjcxx[0].qymc));
		$("#qybm").append(setNull(json.LQyjcxx[0].qybm));

		cflbbmOnchange_detail();
		//显示行政拘留tr
		var jcmxlbdm = json.LQyjcxx[0].jcmxlbdm;
		if(jcmxlbdm == '10'){
			showOrHideJLTr('jl_', 'block');
			showOrHideJLTr('dhnr_', 'block');
			$("#jlrxm").append(setNull(json.LQyjcxx[0].jlrxm));
			$("#jlrsfzh").append(setNull(json.LQyjcxx[0].jlrsfzh));
			$("#dhnr").append(setNull(json.LQyjcxx[0].dhnr));
		}
	}	
	
	function showOrHideJLTr(smallId, state){ //显示隐藏 TR
		$("tr[id^='"+smallId+"']").each(function(){
			$(this)[0].style.display=''+state;
		});
	}
	
	function cflbbmOnchange_detail(){
		var cflbbm = $("#cflbbm").val();
		var hylb=$("#hylbdm").val();
		if(hylb=='T'){
			if(cflbbm == '0'){
				$('#pzjg_detail').text("作出表彰奖励决定的公安机关");
				$('#pzrbm_detail').text("作出表彰奖励决定的其他单位");
				$('#pzrq_detail').text("表彰奖励日期");
				$('#yjly_detail').text("表彰奖励原因");
				$('#qkms_detail').text("表彰奖励内容");
			}else {
				$('#pzjg_detail').text("作出处罚决定的公安机关");
				$('#pzrbm_detail').text("作出处罚决定的其他单位");
				$('#pzrq_detail').text("处罚日期");
				$('#yjly_detail').text("处罚原因");
				$('#qkms_detail').text("处罚内容");
			}
		}
	}
</script>
<input type="hidden" id="q_qycfid">
<input type="hidden" id="cflbbm">
<input type="hidden" id="hylbdm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">明细</td>
      <td align="right" class="title1"><a href="#" id="closeDiv" onclick='$("#qyjcxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="detail" class="detail">
	<tr height="20">
			<td class="distd1" width="20%">行业类别</td>
		<td class="detailtd2" width="30%">
		<span   id="hylb" value="">
		</td>
			<td class="distd1" width="20%"> </td>
		<td class="detailtd2" width="30%">
		 
		</td>
		
	</tr>
    <tr height="20">
			<td class="distd1" width="20%">企业名称</td>
		<td class="detailtd2" width="30%">
		<span type="text"class="spanstyle" id="qymc" value="" readonly="readonly">
		</td>
			<td class="distd1" width="20%">企业编码</td>
		<td class="detailtd2" width="30%">
		<span type="text"class="spanstyle" id="qybm" value="" readonly="readonly">
		</td>
		
	</tr>
	<tr height="20"> 
		<td class="distd1" width="20%">奖惩登记序号</td>
		<td class="detailtd2" style="word-break : break-all; width:200px;  " width="30%"><span  id="cfdjxh" value=""></td>
	<td class="distd1" width="20%">行政奖惩决定书文号</td>
		<td class="detailtd2" width="30%" style="width: 150px;"><span   id="xzcfpzwh" value=""></td>
	</tr>
	
	<tr height="20">
		<td class="distd1" width="20%">奖惩类别</td>
		<td class="detailtd2" width="30%">
		<span   id="cflb" >
		
		</td>
		<td class="distd1" width="20%">奖惩明细类别</td>
		<td class="detailtd2" width="30%">
		<span   id="jcmxlb" value="">
		</td>
	</tr>
	
	<tr height="20" id="jl_tr">
		<td class="distd1" width="20%">拘留人姓名</td>
		<td class="detailtd2" width="30%" style="width: 200px;"><span type="text"class="spanstyle" id="jlrxm" value=""></td>
		<td class="distd1" width="20%">拘留人身份证号</td>
		<td class="detailtd2" width="30%" style="width: 150px;"><span type="text"class="spanstyle" id="jlrsfzh" value=""></td>
	</tr>
	
	<tr height="20" id="dhnr_tr">
		<td class="distd1">电话内容</td>
		<td colspan="5" class="detailtd2">
		  <textarea name="textarea" id="dhnr"  cols="55" rows="5" readonly="readonly"></textarea>
   		</td>
	</tr>
	
	<tr height="20">
		<td class="distd1" width="20%" id="pzjg_detail" style="word-break:break-all;">批准机构</td>
		<td class="detailtd2" width="30%">
		<span   id="pzjg" value=""  >
		</td>
		<td class="distd1" width="20%" id="pzrbm_detail" style="word-break:break-all;">批准人编号</td>
		<td class="detailtd2" width="30%" style="width: 150px;"><span type="text"class="spanstyle" id="pzrbh" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd1" width="20%">批准人姓名</td>
		<td class="detailtd2" width="30%" style="width: 200px;"><span type="text"class="spanstyle" id="pzrxm" value=""></td>
		<td class="distd1" width="20%" id="pzrq_detail">批准日期</td>
		<td class="detailtd2" width="30%"><span type="text"class="spanstyle" id="pzrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd1" width="20%">执行人编号</td>
		<td class="detailtd2" width="30%"><span type="text"class="spanstyle" id="zxrbh" value=""></td>
		<td class="distd1" width="20%">执行人姓名</td>
		<td class="detailtd2" width="30%" style="width: 150px;"><span type="text"  id="zxrxm" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd1" width="20%">执行日期</td>
		<td class="detailtd2" width="30%"><span type="text"  id="zxrq" value=""></td>
		<td class="distd1" width="20%">奖惩幅度</td>
		<td class="detailtd2" width="30%" style="width: 150px;"><span type="text"  id="jcfd" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd1" width="20%" >被奖惩人</td>
		<td class="detailtd2" width="30%" style="width: 200px;"><span type="text"  id="bjcr" value=""></td>
		<td class="distd1" width="20%">企业奖惩日期</td>
		<td class="detailtd2" width="30%"><span type="text"  id="qyjcrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd1" id="qkms_detail">情况描述</td>
		<td colspan="5" class="detailtd2">
		  <textarea name="textarea" id="qkms"  cols="55" rows="5" readonly="readonly"></textarea>
    </td>
	</tr>
	<tr height="20">
		<td class="distd1" id="yjly_detail">依据理由</td>
		<td colspan="5" class="detailtd2">
		  <textarea name="textarea" id="yjly"  cols="55" rows="5" readonly="readonly"></textarea>
    </td>
	</tr>
</table>