<%@ page language="java" pageEncoding="UTF-8" import="java.text.*,java.util.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String da=sdf.format(new Date());
String basePath = QjblUtil.queryQjblVal("ylyurl");;
 %>
<jsp:include page="../../public/prjWebControl-Card.jsp">
	<jsp:param name="objid" value="ctlICCard" />
</jsp:include>
<jsp:include page="../../public/device.jsp">
	<jsp:param name="objid" value="device" />
</jsp:include>
<script type="text/javascript">
//var dxr_backWriteIckhUrl = "icksystem/updateIckslByNj_icksl.action";
	var knCyrybh="NJ";
	var allRight = true;
	$(document).ready(function() {
		$("#i_ickslid").attr("value",dataid);//初始化查询用
		$("#a_ickslid").attr("value",dataid);//修改时用
		$("#a_hyzkdm").selectBox({code:"dm_hyzk"});
		$("#a_rzrq").attr("readonly","true");
		$("#a_rzrq").datepicker();
		setDetail_icknj();
	}); 
function setDetail_icknj(){
	setParams("i_");
	jQuery.post(detailUrl,params,updatediv,"json");
}
function updatediv(json) { 
	
		if(json.wgcyryxx!=null){
		$("#w_cyrybh").append(setNull(json.wgcyryxx.cyrybh));
		$("#w_xm").append(setNull(json.wgcyryxx.xm));
		$("#w_ywx").append(setNull(json.wgcyryxx.ywx));
		$("#w_ywm").append(setNull(json.wgcyryxx.ywm));
		$("#w_xb").append(setNull(json.wgcyryxx.xb));
		$("#w_csrq").append(setNull(json.wgcyryxx.csrq));
		$("#w_gj").append(setNull(json.wgcyryxx.gj));
		$("#a_hyzkdm").setValue(setNull(json.wgcyryxx.hyzkdm));
		$("#w_wgrjyxkz").append(setNull(json.wgcyryxx.wgrjyxkz));
		$("#w_qzzldm").append(setNull(json.wgcyryxx.qzzldm));
		$("#w_zjhm").append(setNull(json.wgcyryxx.zjhm));
		$("#a_rzrq").val(setNull(json.wgcyryxx.rzrq));
		$("#w_cylb").val(setNull(json.wgcyryxx.cylb));
		$("#a_shouji").val(setNull(json.wgcyryxx.shouji));
		$("#a_qymc").val(setNull(json.wgcyryxx.qymc));
		$("#a_jjlxrdh").val(setNull(json.wgcyryxx.jjlxrdh));
		$("#a_shengao").val(setNull(json.wgcyryxx.shengao));
		$("#a_zhiwu").val(setNull(json.wgcyryxx.zhiwu));
		$("#a_tizh").val(setNull(json.wgcyryxx.tizh));
		$("#a_zzzhm").val(setNull(json.wgcyryxx.zzzhm));
		$("#a_zzdz").val(setNull(json.wgcyryxx.zzdz));
		$("#a_bz").append(setNull(json.wgcyryxx.bz));
		$("#ryImage").attr("src","publicsystem/queryTp_qyryxx.action?ryId="+setNull(json.wgcyryxx.ryid));
		$("#oldickyyxq").append(setNull(json.icksl.yxqhzrq));
		$("#a_yxqhzrq").val(setNull(json.icksl.xyxqhzrq));
		$("#yxqhzrq").append(setNull(json.icksl.xyxqhzrq));
		$("#a_yxsksrq").val(setNull(json.icksl.yxsksrq));
		//隐藏
		$("#a_zkztbs").val(setNull(json.icksl.zkztbs));
		$("#a_ryid").val(setNull(json.wgcyryxx.ryid));
		$("#a_qyid").val(setNull(json.wgcyryxx.qyid));
		$("#a_qybm").val(setNull(json.wgcyryxx.qybm));
		$("#a_hyzk").val(setNull(json.wgcyryxx.hyzk));
		$("#a_cyrybh").val(setNull(json.wgcyryxx.cyrybh));
		$("#c_cyrybh").val(setNull(json.wgcyryxx.cyrybh));
		}else{
			jAlert("该从业人员不存在","提示信息");
		}
	}	
	
function addVerify(){
	if (!checkControlValue("a_rzrq","String",1,40,null,1,"入职日期"))
		return false;
	if (!checkControlValue("a_shouji","String",1,40,null,1,"联系电话"))
		return false;
	if (!checkControlValue("a_qymc","String",1,20,null,1,"服务单位"))
		return false;
	if (!checkControlValue("a_shengao","Float",-999.99,999.99,2,0,"身高"))
		return false;
	if (!checkControlValue("a_tizh","Float",-999.99,999.99,2,0,"体重"))
		return false;
	return true;
}
function addNj(){
	jAlert("请 刷 卡！","提示信息");
	OpenRead();//读取卡内容
}

function setXmlAddData(){
		//获取卡内信息开始
	    if(knCyrybh!=$("#c_cyrybh").val()){
			jAlert("此卡与人员信息不一致！","错误提示");
			allRight=false;
		}
		if (addVerify()&&allRight){
			setParams("a_");
			jQuery.post("icksystem/updateNj_icksl.action",params,addslback,"json");
		}	
}		


function addslback(json){
	if  (json.result=="success"){
		jConfirm('请 再 次 刷 卡！', '提示', function(r) {
			if(r){
				startDxrIckBon(); //开始电写入
			}else{
				 closeIcknj();
	   			 setPageList($("#pageNo").attr("value"));
			}
		});
	}else{
		jAlert(json.result,'错误信息');
	}		
}

//加载in方式行业类别
$("#dmd_hylbdm").selectBoxinhylb();

// 企业筛选框
$("#a_qymc").click(function(){
    dataid="";
    allhybz=$('#dmd_hylbdm').val();  
 	getTy_item("a_qymc","a_qybm","a_qyid","","",allhybz);
  });	

function closeIcknj(){
	document.getElementById('ctlICCard').CloseWrite();
	$("#ctlICCard").remove();
	$("#icknj_detail").empty();
	$("#icknj_detail").hideAndRemove("show");
}
function hyzk(){
	$("#a_hyzk").val($("#a_hyzkdm").attr('title'));
}
function showMesToPage(){
}
//写入卡内容后的回调函数
	function WriteICCardFinish(backIckh){ //读卡结束回调函数
	   jAlert("年 检 已 成 功!","提示信息");
	    closeIcknj();
	    setPageList($("#pageNo").attr("value"));
	}
</script>
<input type="hidden" id="i_ickslid">
<input type="hidden" id="a_ickslid"/>
<input type="hidden" id="i_cyrylbdm" value="1">
<input type="hidden" id="a_yxqhzrq"/>
<input type="hidden" id="a_yxsksrq"/>
<input type="hidden" id="a_ryid">
<input type="hidden" id="a_zkztbs">
<input type="hidden" id="a_qyid" />
<input type="hidden" id="a_qybm" />
<input type="hidden" id="a_hyzk" />
<input type="hidden" id="a_cyrybh"/>
<input type="hidden" id="c_cyrybh"/>
<input type="hidden" id="projectUrl" value="<%=basePath %>">
<input type="hidden" id="b_ickslid">
<input type="hidden" id="b_ryid">
<input type="hidden" id="b_ickh">
<input type="hidden" id="c_sfbx" value="2"/>
<div style="display:none">
	<select id="dmd_hylbdm"></select>
</div>
<div>
<div align="right">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" class="title1">从业人员IC卡年检</td>
      <td><a href="#" id="closeDiv" onclick='closeIcknj();'class="close"></a></td>
    </tr>
     <tr>
      <td align="left"></td>
      <td></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
</table></div>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="3"></td>
    </tr>
</table>  
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr height="20">
      <td class="tdbg"><table width="100%"  cellpadding="4" cellspacing="0" class="detail" id="detail" >
        <tr>
          <td width="14%" class="distd">人员编号</td>
          <td width="24%"  class="detailtd"><span id="w_cyrybh"></span></td>
          <td width="13%" class="distd">中文姓名</td>
          <td width="21%" class="detailtd"><span id="w_xm"></span></td>
          <td width="28%" rowspan="11" align="center" valign="top" class="detailtd"><table width="35%" border="0" align="center" cellpadding="8" cellspacing="0">
        <tr><td><img id="ryImage" width="150" height="180" /></td></tr>
      </table></td>
        </tr>
        <tr height="20">
          <td class="distd">英文姓</td>
          <td class="detailtd"><span id="w_ywx" ></span></td>
          <td class="distd">英文名</td>
          <td class="detailtd"><span id="w_ywm" ></span></td>
          </tr>
        <tr height="20">
          <td class="distd">性别</td>
          <td class="detailtd"><span id="w_xb"></span></td>
          <td class="distd">出生日期</td>
          <td class="detailtd"><span id="w_csrq"></span></td>
          </tr>
        <tr>
          <td class="distd">国籍</td>
          <td class="detailtd"><span id="w_gj"></span></td>
          <td class="distd">婚姻状况</td>
          <td class="detailtd"><select id="a_hyzkdm" onchange="hyzk();"></select></td>
          </tr>
        <tr height="20">
          <td class="distd">就业许可证号</td>
          <td class="detailtd"><span id="w_wgrjyxkz"></span></td>
          <td class="red">入职日期</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_rzrq"></input></td>
          </tr>
        <tr height="20">
          <td class="distd">证件类型</td>
          <td class="detailtd"><span id="w_qzzldm"></span></td>
          <td class="distd">证件号码</td>
          <td class="detailtd"><span id="w_zjhm"></span></td>
          </tr>
        <tr height="20">
          <td class="distd">人员类别</td>
          <td class="detailtd"><span id="w_cylb"></span></td>
          <td class="red">联系电话</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_shouji"></input></td>
        </tr>
        <tr height="20">
          <td class="red">服务单位</td>
          <td colspan="3" class="detailtd"><input type="text" class="inputstyle" id="a_qymc" style="width:443" readonly></input></td>
        </tr>
        <tr height="20">
          <td class="distd">紧急联系电话</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_jjlxrdh"></input></td>
          <td class="distd">身高（厘米）</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_shengao"></input></td>
        </tr>
        <tr height="20">
          <td class="distd">职务</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_zhiwu"></input></td>
          <td class="distd">体重（公斤）</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_tizh"></input></td>
          </tr>
        <tr height="20">
          <td class="distd">暂住证编号</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_zzzhm"></input></td>
        </tr>
        <tr height="20">
          <td class="distd">暂住地址</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_zzdz"></input></td>
        </tr>
        <tr>
        	<td class="pagedistd">备注</td>
			<td class="pagetd" colspan="5"><textarea id="a_bz" style="width:80%" value=""></textarea></td>
        </tr>
        <tr height="20">
        	<td colspan="5">
        		<table>
        		<td width="12%" class="pagetd">IC卡原有效期:</td>
        		<td width="23%" class="detailtd"><span id="oldickyyxq"></span></td>
        		<td width="12%" class="pagetd">IC卡新有效期:</td>
        		<td width="23%" class="detailtd"><span id="yxqhzrq"></span></td>
        		<td width="12%" class="pagetd">年检时间:</td>
        		<td width="23%" class="detailtd"><span id="njsj"><%=da %></span></td>
        		</table>
        	</td>
        </tr>
        <tr height="25" align="right"><td colspan="5"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='addNj();'>保存</a></td></tr>
      </table>
      </td>
    </tr>
	</table>
	<tr>
	<table>
	</table>
	</tr>
</div>