<%@ page language="java" pageEncoding="UTF-8" import="java.text.*,java.util.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%@page import="com.aisino2.cache.CacheManager" %>
<%
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String da=sdf.format(new Date());
String basePath = QjblUtil.queryQjblVal("ylyurl");
		String version_prjWebControl_skone = "";
		String device_urlHnOrJs_skone = "";
		Globalpar glo_skone = new Globalpar();
		Globalpar temp_skone = null;
		List globList_skone = null;
		
		glo_skone.setGlobalparcode("prjweb-bbh-new"); //prj 版本号
		globList_skone = CacheManager.getCacheGlobalpar(glo_skone);
		if(globList_skone!=null&&globList_skone.size()>0){
			temp_skone = (Globalpar)globList_skone.get(0);
			version_prjWebControl_skone = temp_skone.getGlobalparvalue();	
		}
		
		glo_skone.setGlobalparcode("kjvalidater-bbh"); //验证文件
		globList_skone = CacheManager.getCacheGlobalpar(glo_skone);
		if(globList_skone!=null&&globList_skone.size()>0){
			temp_skone = (Globalpar)globList_skone.get(0);
			device_urlHnOrJs_skone = temp_skone.getGlobalparvalue();	
		}
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
	
		if(json.qyryxx!=null){
		$("#w_cyrybh").append(setNull(json.qyryxx.cyrybh));
		$("#w_xm").append(setNull(json.qyryxx.xm));
		$("#w_zjhm").append(setNull(json.qyryxx.zjhm));
		$("#a_bm").val(setNull(json.qyryxx.bm));
		$("#w_xb").append(setNull(json.qyryxx.xb));
		$("#w_csrq").append(setNull(json.qyryxx.csrq));
		$("#w_minzu").append(setNull(json.qyryxx.minzu));
		$("#a_hyzkdm").setValue(setNull(json.qyryxx.hyzkdm));
		$("#w_hjdxzqh").append(setNull(json.qyryxx.hjdxzqh));
		$("#w_hjdxz").append(setNull(json.qyryxx.hjdxz));
		$("#a_rzrq").val(setNull(json.qyryxx.rzrq));
		$("#w_cylb").val(setNull(json.qyryxx.cylb));
		$("#a_shouji").val(setNull(json.qyryxx.shouji));
		$("#a_qymc").val(setNull(json.qyryxx.qymc));
		$("#a_jjlxrdh").val(setNull(json.qyryxx.jjlxrdh));
		$("#a_shengao").val(setNull(json.qyryxx.shengao));
		$("#a_zhiwu").val(setNull(json.qyryxx.zhiwu));
		$("#a_tizh").val(setNull(json.qyryxx.tizh));
		$("#a_zzzhm").val(setNull(json.qyryxx.zzzhm));
		$("#a_zzdz").val(setNull(json.qyryxx.zzdz));
		$("#a_bz").append(setNull(json.qyryxx.bz));
		$("#ryImage").attr("src","publicsystem/queryTp_qyryxx.action?ryId="+setNull(json.qyryxx.ryid));
		$("#oldickyyxq").append(setNull(json.icksl.yxqhzrq));
		$("#yxqhzrq").append(setNull(json.icksl.xyxqhzrq));
		$("#a_yxqhzrq").val(setNull(json.icksl.xyxqhzrq));
		$("#a_yxsksrq").val(setNull(json.icksl.yxsksrq));
		//隐藏域
		$("#a_zkztbs").val(setNull(json.icksl.zkztbs));
		$("#a_ryid").val(setNull(json.qyryxx.ryid));
		$("#a_qybm").val(setNull(json.qyryxx.qybm));
		$("#a_qyid").val(setNull(json.qyryxx.qyid));
		$("#a_hyzk").val(setNull(json.qyryxx.hyzk));
		$("#a_cyrybh").val(setNull(json.qyryxx.cyrybh));
		$("#c_cyrybh").val(setNull(json.qyryxx.cyrybh));
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

//更新卡内信息
function gxickslnr(){
	startDxrIckBon();
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
<input type="hidden" id="i_cyrylbdm" value="0">
<input type="hidden" id="a_ickslid"/>
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
<div style ="display :none ">
		<OBJECT ID="ctlICCard" CLASSID="CLSID:BF802FFD-DDC6-45CD-BC87-50C21696497E" CODEBASE="active/prjWebControl.CAB#version=<%=version_prjWebControl_skone %>"> </OBJECT>
		<OBJECT ID="device" CLASSID="CLSID:030B433D-7746-41FB-8CA1-3DAD1249D865" CODEBASE="<%=device_urlHnOrJs_skone %>"></OBJECT>
</div>
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
          <td width="13%" class="distd">姓名</td>
          <td width="21%" class="detailtd"><span id="w_xm"></span></td>
          <td width="28%" rowspan="11" align="center" valign="top" class="detailtd"><table width="35%" border="0" align="center" cellpadding="8" cellspacing="0">
        <tr><td><img id="ryImage" width="150" height="180" /></td></tr>
      </table></td>
        </tr>
        <tr height="20">
          <td class="distd">公民身份号码</td>
          <td class="detailtd"><span id="w_zjhm" ></span></td>
          <td class="distd">别名</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_bm" ></input></td>
          </tr>
        <tr height="20">
          <td class="distd">性别</td>
          <td class="detailtd"><span id="w_xb"></span></td>
          <td class="distd">出生日期</td>
          <td class="detailtd"><span id="w_csrq"></span></td>
          </tr>
        <tr>
          <td class="distd">民族</td>
          <td class="detailtd"><span id="w_minzu"></span></td>
          <td class="distd">婚姻状况</td>
          <td class="detailtd"><select id="a_hyzkdm" onchange="hyzk();"></select></td>
          </tr>
        <tr height="20">
          <td class="distd">户籍省县</td>
          <td class="detailtd"><span id="w_hjdxzqh"></span></td>
          <td class="red">入职日期</td>
          <td class="detailtd"><input type="text" class="inputstyle" id="a_rzrq"></input></td>
          </tr>
        <tr height="20">
          <td  class="distd">户籍地详址</td>
          <td colspan="3" class="detailtd"><span id="w_hjdxz"></span></td>
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