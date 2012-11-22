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
		$("#a_hylbdm").selectBoxhylb({code:"flgy"});//行业类别	
		$("#a_qyjcrq").attr("readonly","true");
		$("#a_qyjcrq").datepicker();
		$("#a_pzrq").attr("readonly","true");
		$("#a_pzrq").datepicker();
		$("#a_zxrq").attr("readonly","true");
		$("#a_zxrq").datepicker();
		$("#a_cflbbm").selectBox({code:"dm_jclb"});
		$("#a_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 处罚
		$("#a_jcmxlb").val($("#a_jcmxlbdm").attr('title'));
		$("#a_cflb").val($("#a_cflbbm").attr('title'));
		$("#a_cflbbm").change(function(){
			$("#a_cflb").val($("#a_cflbbm").attr('title'));
			if($("#a_cflbbm").val()==0){
				$("#a_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 奖励
			}else{
				$("#a_jcmxlbdm").selectBox({code:"dm_qycflb(jxy)"});//明细 处罚
			}
			$("#a_jcmxlb").val($("#a_jcmxlbdm").attr('title'));
		});
		$("#a_jcmxlbdm").change(function(){
			$("#a_jcmxlb").val($("#a_jcmxlbdm").attr('title'));
		});
		$("#a_pzjg").click(function(){ //管辖单位
			getGxdw("a_pzjg","a_pzjgdm");
		});
		$('#a_qymc').click(function(){
			if($("#a_hylbdm").val()!=''){
					dataid=$('#a_hylbdm').val();
					getTy_item("a_qymc","a_qybm");
			}
		});
		$('#a_hylb').val($("#a_hylbdm").attr('title'));
		$("#a_hylbdm").change(function(){
			$("#a_hylb").val($('#a_hylbdm').attr('title'));
		});
		hylbOnchangeAdd();
		//隐藏行政拘留的显示内容
		showOrHideJLTr('jl_', 'none');
		showOrHideJLTr('dhnr_', 'none');
	}).unbind("keydown");
	function addVerify(){
		if (!checkControlValue("a_xzcfpzwh","String",1,20,null,0,"行政奖惩决定书文号"))
			return false;
		if (!checkControlValue("a_hylb","String",1,40,null,1,"行业类别"))
			return false;
		if (!checkControlValue("a_qymc","String",1,40,null,1,"企业名称"))
			return false;
		if (!checkControlValue("a_cflb","String",1,100,null,1,"奖惩类别"))
			return false;
		if (!checkControlValue("a_jcmxlb","String",1,100,null,1,"奖惩明细类别"))
			return false;
		if (!checkControlValue("a_pzjg","String",1,100,null,0,"批准机构"))
			return false;
		if (!checkControlValue("a_pzrbh","String",1,30,null,0,"批准人编号"))
			return false;
		if (!checkControlValue("a_pzrxm","String",1,100,null,0,"批准人姓名"))
			return false;
		if (!checkControlValue("a_pzrq","Date",null,null,null,0,"批准日期"))
			return false;
		if (!checkControlValue("a_zxrbh","String",1,30,null,0,"执行人编号"))
			return false;
		if (!checkControlValue("a_zxrxm","String",1,100,null,0,"执行人姓名"))
			return false;
		if (!checkControlValue("a_zxrq","Date",null,null,null,0,"执行日期"))
			return false;
		if (!checkControlValue("a_jcfd","String",1,100,null,1,"奖惩幅度"))
			return false;
		if (!checkControlValue("a_bjcr","String",1,100,null,0,"被奖惩人"))
			return false;
		if (!checkControlValue("a_qyjcrq","Date",null,null,null,1,"企业奖惩日期"))
			return false;
		if (!checkControlValue("a_qkms","String",1,2000,null,1,"情况描述"))
			return false;
		if (!checkControlValue("a_yjly","String",1,2000,null,0,"依据理由"))
			return false;
		//拘留显示内容判断
		if(jlFlage == '1'){
			if (!checkControlValue("a_jlrxm","String",1,100,null,1,"拘留人姓名"))
				return false;
			if (!checkControlValue("a_jlrsfzh", "String", 1, 20, null, 1, "拘留人身份证号"))
				return false;
			if (!checkControlValue("a_dhnr","String",1,2000,null,1,"电话内容"))
				return false;
		}
		if($("#a_pzrq").val()!=""||$("#a_pzrq").val()!=null){
			if (!checkDateEarlier("a_pzrq","批准日期","dqrq","当前日期","DATE"))
				return false;
		}
		if($("#a_zxrq").val()!=""||$("#a_zxrq").val()!=null){
			if (!checkDateEarlier("a_zxrq","执行日期","dqrq","当前日期","DATE"))
				return false;
		}
		if (!checkDateEarlier("a_pzrq","批准日期","a_zxrq","执行日期","DATE"))
				return false;
		if (!checkDateEarlier("a_qyjcrq","企业奖惩日期","dqrq","当前日期","DATE"))
			return false;
		return true;
	}
	function setAddqyjc(){
		if (addVerify()){
			setParams("a_");
			jQuery.post(addUrl,params,addback,"json");
		}
	}
	function hylbOnchangeAdd(){
		$("#a_qymc").attr("value","");
		$("#a_qybm").attr("value","");
		var hylb=$("#a_hylbdm").val();
		var csorqymc = "企业名称";
		var csorqybm = "企业编码";
		var jcdjxh = "奖惩登记序号";
		var xzjcpwh = "行政奖惩决定书文号";
		var jclb = "奖惩类别";
		var jcmclb = "奖惩明细类别";
		var jcfd = "奖惩幅度";
		var qyjcrq = "企业奖惩日期";
		var yjly = "依据理由";
		if(hylb=='J'||hylb=='K'){
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
			$('#pzjg_add').text("作出表彰奖励决定的公安机关");
			$('#pzrbm_add').text("作出表彰奖励决定的其他单位");
			$('#pzrq_add').text("表彰奖励日期");
			yjly="表彰奖励原因";
			$('#qkms_add').text("表彰奖励内容");
		}
		$('#qymc_add').text(csorqymc);
		$('#qybm_add').text(csorqybm);
		$('#jcdjxh_add').text(jcdjxh);
		$('#xzjcpwh_add').text(xzjcpwh);
		$('#jclb_add').text(jclb);
		$('#jcmclb_add').text(jcmclb);
		$('#jcfd_add').text(jcfd);
		$('#qyjcrq_add').text(qyjcrq);
		$('#yjly_add').text(yjly);
	}
	
	function showOrHideJLTr(smallId, state){ //显示隐藏 TR
		$("tr[id^='"+smallId+"']").each(function(){
			$(this)[0].style.display=''+state;
		});
	}
	
	$("#a_jlrsfzh").blur(function(){//当填写身份证号码失去焦点后，去判断身份证号码
		//如果身份证证号填写不为15或18位，则直接返回让他重新填写
		var zjhm = $("#a_jlrsfzh").attr("value").toUpperCase();
		  if(!isIdCardNo(zjhm))
		  {
		 	 $("#a_jlrsfzh").val("");//清空
		     //$("#a_zjhm").focus();//得到焦点
		     //alert("请输入15位或18位的身份证号码");
		    return false;
		  }else{
		  	if(zjhm.length==15){		  	
			   zjhm=change15to18(zjhm);
			}
		  }		  
		//证件号码就用用户自己填写的，如15位的不在去转换为18位
		$("#a_jlrsfzh").val(zjhm.toUpperCase());
	});
	
	//奖惩明细类别为行政拘留时显示行政拘留填写内容
	var jlFlage = '0';//行政拘留必填项判断标志
	function jcmxlbdmOnchange(){
		var jcmxlbdm = $("#a_jcmxlbdm").val();
		if (jcmxlbdm == '10'){
			showOrHideJLTr('jl_', 'block');
			showOrHideJLTr('dhnr_', 'block');
			jlFlage = '1';
		} else {
			showOrHideJLTr('jl_', 'none');
			showOrHideJLTr('dhnr_', 'none');
			$("#a_jlrxm").attr("value", "");
			$("#a_jlrsfzh").attr("value", "");
			$("#a_dhnr").attr("value", "");
			jlFlage = '0';
		}
	} 
	
	function cflbbmOnchange(){
		var cflbbm = $("#a_cflbbm").val();
		if (cflbbm == '0'){
			showOrHideJLTr('jl_', 'none');
			showOrHideJLTr('dhnr_', 'none');
			$("#a_jlrxm").attr("value", "");
			$("#a_jlrsfzh").attr("value", "");
			$("#a_dhnr").attr("value", "");
			jlFlage = '0';
		}
		var hylb=$("#a_hylbdm").val();
		if(hylb=='T'){
			if(cflbbm == '0'){
				$('#pzjg_add').text("作出表彰奖励决定的公安机关");
				$('#pzrbm_add').text("作出表彰奖励决定的其他单位");
				$('#pzrq_add').text("表彰奖励日期");
				$('#yjly_add').text("表彰奖励原因");
				$('#qkms_add').text("表彰奖励内容");
			}else {
				$('#pzjg_add').text("作出处罚决定的公安机关");
				$('#pzrbm_add').text("作出处罚决定的其他单位");
				$('#pzrq_add').text("处罚日期");
				$('#yjly_add').text("处罚原因");
				$('#qkms_add').text("处罚内容");
			}
		}
	}
</script>
<input type="hidden" id="dqrq" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyjcxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="add">
	<tr height="20">
		<td class="distd">行业类别</td>
		<td class="detailtd"><select id="a_hylbdm" onchange="hylbOnchangeAdd();"></select>
		<input type="hidden"class="inputstyle" id="a_hylb" value=""></td>
		<td class="red"></td>
		<td class="detailtd"></td>
	</tr>
	<tr height="20">
		<td class="red" width="18%" id="qymc_add">企业名称</td>
		<td class="detailtd" width="29%"><input type="text" class="inputstyle" id="a_qymc" value="" readonly="readonly"></td>
		<td class="distd" width="24%" id="qybm_add">企业编码</td>
		<td class="detailtd" width="31%"><input type="text" readonly class="readonly" id="a_qybm" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd" id="jcdjxh_add">奖惩登记序号</td>
		<td class="detailtd"><input type="text"class="readonly" id="a_cfdjxh" value=""></td>
		<td class="distd" id="xzjcpwh_add">行政奖惩决定书文号</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_xzcfpzwh"
			onkeyup="htjdOnkeyupVal('a_xzcfpzwh','pwh');" onblur="htjdOnBlurNotOnlyZfVal('a_xzcfpzwh','pwh');"/></td>
	</tr>
	<tr height="20">
		<td class="distd" id="jclb_add">奖惩类别</td>
		<td class="detailtd"><select id="a_cflbbm" onchange="cflbbmOnchange();"></select>
		<input type="hidden"class="inputstyle" id="a_cflb" value=""></td>
		<td class="distd" id="jcmclb_add">奖惩明细类别</td>
		<td class="detailtd"><select id="a_jcmxlbdm" onchange="jcmxlbdmOnchange();"></select>
		<input type="hidden"class="inputstyle" id="a_jcmxlb" value=""></td>
	</tr>
	<tr height="20" id="jl_tr">
		<td class="red">拘留人姓名</td>
		<td class="detailtd">
			<input type="text"class="inputstyle" id="a_jlrxm"
			onkeyup="htjdOnkeyupVal('a_jlrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('a_jlrxm','xingming');">
        </td>
		<td class="red">拘留人身份证号</td>
		<td class="detailtd">
		<input type="text" class="inputstyle" id="a_jlrsfzh" value=""></td>
	</tr>
	<tr height="20" id="dhnr_tr">
		<td class="red">电话内容</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="a_dhnr" cols="56" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd" id="pzjg_add">批准机构</td>
		<td class="detailtd">
		<input type="text"class="inputstyle" id="a_pzjg" value="" readonly="readonly">
		<input type="hidden" id="a_pzjgdm"></td>
		<td class="distd" id="pzrbm_add">批准人编号</td>
		<td class="detailtd"><input type="text" class="inputstyle" id="a_pzrbh"
			onkeyup="htjdOnkeyupVal('a_pzrbh','shuzi');" onblur="htjdOnBlurNotOnlyZfVal('a_pzrbh','shuzi');"></td>
	</tr>
	<tr height="20">
		<td class="distd">批准人姓名</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_pzrxm"
			onkeyup="htjdOnkeyupVal('a_pzrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('a_pzrxm','xingming');"></td>
		<td class="distd" id="pzrq_add">批准日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_pzrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">执行人编号</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_zxrbh"
			onkeyup="htjdOnkeyupVal('a_zxrbh','shuzi');" onblur="htjdOnBlurNotOnlyZfVal('a_zxrbh','shuzi');"></td>
		<td class="distd">执行人姓名</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_zxrxm"
			onkeyup="htjdOnkeyupVal('a_zxrxm','xingming');" onblur="htjdOnBlurNotOnlyZfVal('a_zxrxm','xingming');"></td>
	</tr>
	<tr height="20">
		<td class="distd">执行日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_zxrq" value=""></td>
		<td class="red" id="jcfd_add">奖惩幅度</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_jcfd" value=""></td>
	</tr>
	<tr height="20">
		<td class="distd">被奖惩人</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_bjcr"
			onkeyup="htjdOnkeyupVal('a_bjcr','xingming');" onblur="htjdOnBlurNotOnlyZfVal('a_bjcr','xingming');"></td>
		<td class="red" id="qyjcrq_add">企业奖惩日期</td>
		<td class="detailtd"><input type="text"class="inputstyle" id="a_qyjcrq" value=""></td>
	</tr>
	<tr height="20">
		<td class="red" id="qkms_add">情况描述</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="a_qkms" cols="56" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd" id="yjly_add">依据理由</td>
		<td colspan="5" class="detailtd"><textarea name="textarea" id="a_yjly" cols="56" rows="4"></textarea></td>
	</tr>
	<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setAddqyjc();'>保存</a></td></tr>
</table>