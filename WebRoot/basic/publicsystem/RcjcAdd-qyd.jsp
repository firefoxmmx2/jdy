<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.common.DateToString"%>
<%@ page import="java.util.Date"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%
	//获取内外网值nwwbz
	String nwwbz=(String)session.getAttribute("nwwbz");
	String currDate = DateToString.getDateTimeEn(new Date());
%>
 
<script type="text/javascript">
	var currDate = "<%=currDate%>";
	var nwwbz_jcfs = "<%=nwwbz%>";
	$(document).ready(function() {
	  	bc_bottonMoveRight(19,"添加"); 
		kjinit();
		setGaUserData();
		setHyxx_add();
		
	}); 
	
	function setGaUserData(){
		$('#a_qybm').val(qybm);
		$('#a_qymc').val(qymc);
		$("#a_jcrxm").val($("#u_jcrxm").val());
		$("#a_jcrq").val(currDate);
		$("#a_lsdw").val($("#u_jcjgmc").val());
		$("#a_jcjgdm").val($("#u_jcjgdm").val());
		$("#a_jcjgmc").val($("#u_jcjgmc").val());
		$("#q_qybm").val(qybm);
		setParams("q_");
		jQuery.post("<%=request.getContextPath()%>/publicsystem/queryQyjbxx_qyjbxx.action",params,queryqyxxback,"json");
	}
	
	function queryqyxxback(json){
		if (json.result=="success"){
			$("#a_csfzr").attr("value",setNull(json.LQyjbxx[0].dwfzr));
			$("#a_csfzrbh").attr("value",setNull(json.LQyjbxx[0].dwfzrcyrybh));
			if(setNull(json.LQyjbxx[0].dwfzrcyrybh)==""){
				$("#a_csfzrbh").val("00000000000000000000");
				$("#tsd_ts1").show();
			}
		} else {
			jAlert('程序异常,请重试','提示信息');
		}
	}
	
	//设定行业信息表示
    function setHyxx_add(){
        var hylb=$("#a_hylbdm").attr("value");
		if(hylb=='J'||hylb=='K'){
			$('#atd_qymc').text('场所名称');
			$('#atd_qybm').text('场所备案编号');
			$('#atd_csfzr').text('场所负责人');
			$('#atd_csfzrbh').text('场所负责人编号');
		}else{
		    $('#atd_qymc').text('企业名称');
		    $('#atd_qybm').text('企业编号');
		    $('#atd_csfzr').text('企业负责人');
			$('#atd_csfzrbh').text('企业负责人编号');
		}
    }
    
    function kjinit(){
		var a=0;
		$('input[@name="sfzdjcjg"]').click(function(){
			a=$(this).val();
			$("#a_sfzdjcjg").val(a);
		});
		
		$("#a_jcrzw").click(function(){
	    	getrylbTree("a_jcrzw","a_zwdm","dm_zw(rcjc)");
	    });
	    
	    if(nwwbz_jcfs=='1'){
			if(sfkzrcjcfs=='0'){
				$("#a_jcfs").selectBox({code:"dm_jcfs"});
			}else{
				$("#a_jcfs").selectBox({code:"dm_jcfs_qydadd"});
			}
		}else{
			if(sfkzrcjcfs=='0'){
				$("#a_jcfs").selectBox({code:"dm_jcfs"});
			}else{
				$("#a_jcfs").selectBox({code:"dm_jcfs_gadadd"});
			}
		}
		
		$("#a_nwwbz").val("<%=nwwbz%>");
		$("#a_hylbdm").selectBoxhylb();//行业类别
	}
	
	
	function addVerify(){
		if (!checkControlValue("a_hylbdm","Select",1,100,null,1,"行业类别"))
			return false;
		if (!checkControlValue("a_qymc","String",1,100,null,1,"企业名称"))
			return false;
		if (!checkControlValue("a_jcfs","Select",1,20,null,1,"检查方式"))
			return false;
		if (!checkControlValue("a_jcrxm","String",1,30,null,1,"检查人员姓名"))
			return false;
		if (!checkControlValue("a_jcrybh","String",1,20,null,1,"检查人警号"))
			return false;
		if (!checkControlValue("a_jcrzw","String",1,100,null,0,"检查人职务"))
			return false;
		if (!checkControlValue("a_mjjczbh","String",1,16,null,0,"民警检查证编号"))
			return false;
		if (!checkControlValue("a_jcsx","String",1,300,null,0,"检查事项"))
			return false;	
		if (!checkControlValue("a_fxwt","String",1,300,null,1,"发现问题"))
			return false;
		if (!checkControlValue("a_cljg","String",1,2000,null,0,"处理结果"))
			return false;
		if (!checkControlValue("a_bz","String",1,2000,null,0,"备注"))
			return false;
		return true;
	}
	
</script>
<input type="hidden" id="a_sfzdjcjg" value="否"/>
<input type="hidden" id="a_jcjgdm" />
<input type="hidden" id="a_jcjgmc" />
<input type="hidden" id="a_zwdm" />
<input type="hidden" id="a_nwwbz"/><!-- 内外网标志 -->

<input type="hidden" id="q_qybm" />

<div align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" class="title1">日常检查新增</td>
      <td><a href="#" id="closeDiv" onclick='$("#rcjc_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
     <tr>
      <td align="left"></td>
      <td></td>
    </tr>
</table>
</div>
<table width="100%" id="add">
	<tr height="20" style="display:none;">
			<td class="distd" width="15%" >行业类别</td>
			<td class="detailtd" width="85%" colspan="3"><input type="hidden" id="a_hylb" /><select id="a_hylbdm"></select></td>
	</tr>
	<tr height="20">
		<td width="15%" class="distd" id="atd_qymc">企业名称</td>
		<td width="30%" class="detailtd"  ><input type="text" class="readonly" id="a_qymc"  readonly /></td>
		<td width="21%"  class="distd" width="17%" id="atd_qybm">企业编号</td>
		<td width="34%"  class="detailtd"  width="25%"><input type="text" class="readonly" id="a_qybm" readonly /></td>
	</tr>
	<tr height="20">
		<td class="distd" id="atd_csfzr">企业负责人</td>
		<td class="detailtd" ><input type="text" class="readonly" id="a_csfzr" readonly="readonly"/></td>
		<td class="distd" id="atd_csfzrbh">企业负责人编号</td>
		<td class="detailtd" ><input type="text" class="readonly" id="a_csfzrbh" readonly="readonly"/></td>
	</tr>
	<tr height="20">
		<td class="red">检查方式</td>
		<td class="detailtd"><select id="a_jcfs"><option></option></select></td>
		<td class="distd">检查日期</td>
		<td class="detailtd"><input type="text" class="readonly" id="a_jcrq" readonly /></td>
	</tr>
	<tr height="20">
		<td class="red">检查人员姓名</td>
		<td class="detailtd"><input type="text" class="inputstyle" id="a_jcrxm" /></td>
		<td class="red">检查人警号</td>
		<td class="detailtd"><input type="text" class="inputstyle" id="a_jcrybh" /></td>
	</tr>
	<tr height="20">
		<td class="distd">检查人职务</td>
		<td class="detailtd"><input type="text" class="inputstyle" id="a_jcrzw" readonly /></td>
		<td class="distd">检查机构</td>
		<td class="detailtd" ><input type="text"  class="readonly" readonly id="a_lsdw" /></td>
	</tr>
	<tr height="20">
		<td class="distd">是否知道<br>检查结果</td>
		<td class="detailtd"><input type="radio" name="sfzdjcjg" value="是" />是   <input type="radio" name="sfzdjcjg" value="否" checked="true"/>否</td>
		<td class="distd">检查证编号</td>
		<td class="detailtd"><input type="text" class="inputstyle" id="a_mjjczbh"/></td>
	</tr>
	<tr height="20">
		<td class="distd">检查事项</td>
		<td class="detailtd" colspan="3"><textarea id="a_jcsx" style="width:429" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="red" valign="top">发现问题</td>
		<td class="detailtd" colspan="3"><textarea id="a_fxwt" style="width:429" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd" valign="top">处理结果</td>
		<td class="detailtd" colspan="3"><textarea id="a_cljg" style="width:429" rows="4"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd" valign="top">备注</td>
		<td class="detailtd" colspan="3"><textarea id="a_bz" style="width:429" rows="4"></textarea></td>
	</tr>
	<tr height="20" id="tsd_ts1" style="display:none;">
	 	<td class="distd"></td>
		<td class="detailtd" colspan="5" style="color:#FF0000;">提示：本场所企业负责人信息未采集，请及时到受理点采集信息补办从业人员信息卡</td>
	</tr>
	<tr height="25" align="center"><td colspan="4"><a href="#" class="addbutton"  onclick='setAdd();' >添加</a></td></tr>
</table>
