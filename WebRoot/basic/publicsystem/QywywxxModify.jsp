<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#q_qywywxxid").attr("value",dataid);
		
		$("#m_ksyysj").attr("readonly","true");
		$("#m_ksyysj").datepicker(true);
		$("#m_jsyysj").attr("readonly","true");
		$("#m_jsyysj").datepicker(true);
		$("#m_sffsaj").selectBox({code:"dm_bez"});
		$("#m_sfglbmjc").selectBox({code:"dm_bez"});
		setDetail();	
		daggleDiv("qywywxx_detail");
		
	}); 
	function updatediv (json) { 
	    $("#m_qyid").attr("value",setNull(json.LQywywxx[0].qyid));
	    $("#m_qywywxxid").attr("value",setNull(json.LQywywxx[0].qywywxxid));
	    $("#m_csfe").attr("value",setNull(json.LQywywxx[0].csfe));
		$("#m_zafzrxm").attr("value",setNull(json.LQywywxx[0].zafzrxm));
		$("#m_ksyysj").attr("value",setNull(json.LQywywxx[0].ksyysj));
		$("#m_jsyysj").attr("value",setNull(json.LQywywxx[0].jsyysj));
		$("#m_sffsaj").setValue(setNull(json.LQywywxx[0].sffsaj));
		$("#m_sfglbmjc").setValue(setNull(json.LQywywxx[0].sfglbmjc));
		$("#m_djrq").attr("value",setNull(json.LQywywxx[0].djrq));
		$("#m_txrxm").attr("value",setNull(json.LQywywxx[0].txrxm));
		$("#m_drwywqksm").attr("value",setNull(json.LQywywxx[0].drwywqksm));
		//alert($("#m_djrq").val());
		
	}	
	function modifyVerify(){
		if (!checkControlValue("m_ksyysj","String",1,30,null,1,"营业开始时间"))
			return false;
		if (!checkControlValue("m_jsyysj","String",1,30,null,1,"营业结束时间"))
			return false;
		
		var ksyysj = $("#m_ksyysj").attr("value");
		var jsyysj = $("#m_jsyysj").attr("value");
		ksyysj = new Date(ksyysj.replace(/-/g, "/")); 
		jsyysj = new Date(jsyysj.replace(/-/g, "/")); 
		
		var djrq = new Date($("#m_djrq").attr("value").replace(/-/g, "/"));
		var date1 = djrq.getDate();
		var date2 = ksyysj.getDate();
		var month1 = djrq.getMonth()+1;
		var month2 = ksyysj.getMonth()+1;
		var year1 = djrq.getFullYear();
		var year2 = ksyysj.getFullYear();
		var temp = new Date(year1,month1-1,0);
		
		//开始营业时间不能大于登记时间
		
		if(Date.parse(ksyysj)-Date.parse(djrq)<0){
		   if (Date.parse(ksyysj) - Date.parse(jsyysj)<0) {  //如果开始时间大于结束时间
			     if(ksyysj.getDate()!=jsyysj.getDate()){
				      jAlert("营业开始时间和营业结束时间必须是同一天!","提示信息");
				      return false;
			      }
			      if(date1!=1&&year1==year2){
			            if((month1==month2&&date1-date2>1)||(month1!=month2)){
			               jAlert("营业开始时间只能是登记日期当天或者前一天!","提示信息");
			               return false;
			            }
			      }
			      else if(date1!=1&&year1!=year2){
			            jAlert("营业开始时间只能是登记日期当天或者前一天!","提示信息");
			            return false;
			      }else if(date1==1&&month1!=1){
			            if(year1!=year2||(year1==year2&&date2!=temp.getDate())){
			                jAlert("营业开始时间只能是登记日期当天或者前一天!","提示信息");
			                return false;
			            }
			      }else if(date1==1&&month1==1){
			           if(year2!=year1-1||month1!=12||date1!=31){
			              jAlert("营业开始时间只能是登记日期当天或者前一天!","提示信息");
			              return false;
			           }
			      }
		    }else {
			      jAlert("营业开始时间不能大于结束时间!","提示信息");
			      return false;
		    } 
		}else{
		    jAlert("营业开始时间不能大于登记时间!","提示信息");
			return false;
		}
		
		
		if (!checkControlValue("m_sffsaj","String",1,1,null,1,"是否有治安、刑事案件或事故发生"))
			return false;
		if (!checkControlValue("m_sfglbmjc","String",1,1,null,1,"是否有管理部门检查"))
			return false;
		if (!checkControlValue("m_drwywqksm","String",1,2000,null,1,"当日无业务情况说明"))
			return false;
		return true;
	}
</script>
<input type="hidden" id="q_qywywxxid">
<input type="hidden" id="m_qywywxxid">
<input type="hidden" id="m_qyid">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">无业务信息上报修改</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qywywxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" id="modify">
   <tr height="20">
		<td class="distd">单位负责人</td>
		<td class="detailtd"><input type="text" id="m_csfe" class="readonly" readonly="readonly"></td>
		<td class="distd">治安负责人</td>
		<td class="detailtd"><input type="text" id="m_zafzrxm" class="readonly" readonly="readonly"></td>
	</tr>
	<tr height="20">
		<td class="red">营业开始时间</td>
		<td class="detailtd"><input type="text" id="m_ksyysj" class="inputstyle" value=""></td>
		<td class="red">营业结束时间</td>
		<td class="detailtd"><input type="text" id="m_jsyysj" class="inputstyle" value=""></td>
	</tr>
	
	<tr height="20">
		<td class="red">是否有治安、刑事案件或事故发生</td>
		<td class="detailtd"><select id="m_sffsaj" class="select"><option value=""></option></select></td>
		<td class="red">是否有管理部门检查</td>
		<td class="detailtd"><select id="m_sfglbmjc" class="select"><option value=""></option></select></td>
	</tr>
	<tr height="20">
		<td class="distd">登记日期</td>
		<td class="detailtd"><input type="text" id="m_djrq" class="readonly" value="readonly"></td>
		<td class="distd">填写人</td>
		<td class="detailtd"><input type="text" id="m_txrxm" class="readonly" value="readonly"></td>
	</tr>
	<tr height="20">
		<td class="red">当日无业务情况说明</td>
		<td colspan="3" class="detailtd"><textarea name="textarea" id="m_drwywqksm" cols="61" rows="5"></textarea></td>
	</tr>
<tr height="25" align="center"><td  colspan="4"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setUpdate();'>保存</a></td></tr>
</table>
