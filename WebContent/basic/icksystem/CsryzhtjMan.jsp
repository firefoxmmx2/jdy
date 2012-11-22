<%@ page language="java" pageEncoding="UTF-8" 
import="java.util.*,java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
Calendar cal = Calendar.getInstance();
cal.add(Calendar.DATE,-1);
String yesterDate = new SimpleDateFormat( "yyyy-MM-dd").format(cal.getTime());
System.out.println(yesterDate);
%>
<jsp:include page="../../public/publicGADTJ.jsp" flush="true"></jsp:include>
<html>
<head>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.TableConfig.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.MappingTable.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/excel.js" charset="utf-8"></script>
<script type="text/javascript">
var optionItemConfig;
var tableConfigs;

var dataStore = new Ext.data.JsonStore({	
	id: 'dataStore',
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>icksystem/querylistCsryzhtj_csryzhtj.action'}),
	reader: new Ext.data.JsonReader(), 
	root: 'LCsryzhtj',
	totalProperty: 'totalrows',
	successProperty: 'success',
	fields: [{name: 'dsjgmc', type: 'String'}, 
			 {name: 'fxjmc', type: 'String'},
			 {name: 'gxdwmc', type: 'String'},
			 {name: 'css', type: 'int'}, 
			 {name: 'zjcss', type: 'int'}, 
			 {name: 'xzcss', type: 'int'},
			 {name: 'xzzjcss', type: 'int'},
             {name: 'xzzjl', type: 'Float'},
             {name: 'sccss', type: 'int'},
             {name: 'csskscl', type: 'Float'},
             {name: 'rcjccs', type: 'int'}, 
             {name: 'yyrzsccss', type: 'int'}, 
             {name: 'cfcss', type: 'int'}, 
             {name: 'jlcss', type: 'int'}, 
             {name: 'facss', type: 'int'}, 
             {name: 'cyrys', type: 'int'}, 
             {name: 'xzrys', type: 'int'},  
             {name: 'zxrys', type: 'int'},
             {name: 'skrs', type: 'int'},
             {name: 'ryskscl', type: 'Float'}, 
             {name: 'cfrs', type: 'int'},
             {name: 'jlrs', type: 'int'},
             {name: 'bjhfl', type: 'Float'},
             {name: 'zhztrs', type: 'int'}]}
);
		
dataStore.on('load', function(store, records, options ) {
});

$(document).ready(function() {
	daggleDiv("csryzhtj_detail");
    // 初期化关联管辖单位控件
    ksd_csxxtjInit();
    // 初期化日期控件
    initTJDate();
    $("#t_qsrq").attr("readonly","true").datepicker();
	$("#t_jzrq").attr("readonly","true").datepicker();
	$("#t_qsrq").attr("value",tomorrowDate);
	$("#t_jzrq").attr("value","<%=yesterDate%>");
	$("#t_sfcxqb").selectBox({code:"dm_bez"});
	///$("#t_hylbdm").selectBoxhylb({code:"dm_hylb"});// 行业类别选择框
	//设定表格高度
	$("#tabledata").height(pageHeight-212); 
}); 
function csryzhtjSetParams(){
    createXML('t_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore.baseParams = dataStore.baseParams || {};
	Ext.apply(dataStore.baseParams, params);
}
function loadData() {
    if(manVerify()){
        // 设定查询参数
	    csryzhtjSetParams();
	    // 清空上次结果
	    if(dataStore.getCount()>0){
	        $("#datatable").find('tr').each(function(i){
	            removeOneRow($(this));
	        });
	    }
	    $("#l_dsjgmc").remove();
	    $("#l_fxjgmc").remove();
	    $("#l_gxdwmc").remove();
	    $("#l_gatmc").remove();
	    $("#dsjgmc").remove();
	    $("#fxjmc").remove();
	    $("#gxdwmc").remove();
	    $("#gatmc").remove();
	    //传递查询参数用于明细
	    $("#x_hylbdm").attr("value", $("#t_hylbdm").attr("value"));
		$("#x_qsrq").attr("value", $("#t_qsrq").attr("value"));
		$("#x_jzrq").attr("value", $("#t_jzrq").attr("value"));
		$("#x_sfcxqb").attr("value", $("#t_sfcxqb").attr("value"));
		$("#x_dsjgbz").attr("value", $("#t_dsjgbz").attr("value"));
		$("#x_fxjbz").attr("value", $("#t_fxjbz").attr("value"));
		$("#x_gxdwbz").attr("value", $("#t_gxdwbz").attr("value"));
	    
	    
	    if($("#t_dsjgbz").attr("value")=="1"){
	        $("#l_csxxtj").before("<td width='81' id='l_dsjgmc' rowspan='2' class='grid-header-bg1'>市局</td>");
	        $("#css").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#t_fxjbz").attr("value")=="1"){
	        $("#l_csxxtj").before("<td width='107' id='l_fxjgmc' rowspan='2' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#css").before("<td class='grid-header-hbbg' valign='top' id='fxjmc' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#t_gxdwbz").attr("value")=="1"){
	        $("#l_csxxtj").before("<td width='87' id='l_gxdwmc' rowspan='2' class='grid-header-bg1'>派出所</td>");
	        $("#css").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#t_dsjgbz").attr("value")=="0"){
	        $("#l_csxxtj").before("<td width='81' id='l_gatmc' rowspan='2' class='grid-header-bg1'>省厅</td>");
	        $("#css").before("<td class='grid-header-hbbg' valign='top' id='gatmc' property='gatmc' groupid='gatmc'>"+departName+"</td>");
	    }
        // 取得表的配置信息
	    tableConfigs = $.parseConfig($("#datatable"));    
	    // 取得远程数据到JsonStore
	    dataStore.load({
	        callback :function(r,options,success){   
                if(success){
                    // 绑定数据到table 
                    loadDataToTable();
                }else{
                    alert("加载数据失败，无对应数据或者系统出现异常！"); 
                }
            }   
	    });
    }
}
function loadDataToTable(){
    $("#datatable").loadData(dataStore, tableConfigs, {
	    mode: 'row',
	    entityclass: 'temp'
	});
}
function removeOneRow(obj) {
    $("#datatable").removeRow(obj, tableConfigs, {
	    entityclass: 'temp'
	});
}
 // 校验
function manVerify(){
    if (!checkControlValue("t_qsrq","Date",null,null,null,1,"起始日期"))
	    return false;
	if (!checkControlValue("t_jzrq","Date",null,null,null,1,"截止日期"))
		return false;
    var t_qssj = $("#t_qsrq").attr("value");
	var t_jzsj = $("#t_jzrq").attr("value");
	var yesterDate="<%=yesterDate%>";
	if(t_qssj!=''&&t_jzsj!=''&&formatDate(t_qssj)-formatDate(t_jzsj)>0){
		jAlert("请正确选择起始和截止日期!","提示信息");
		return false;
	}
	if(t_jzsj!=''&&formatDate(t_jzsj)-formatDate(yesterDate)>0){
		jAlert("请正确选择截止日期!","提示信息");
		return false;
	}
	return true;
}
	// 转换成日期格式
function formatDate(strDate){ 
	var riqi = strDate.split("-");
	return new Date(riqi[0],(riqi[1]-1),riqi[2]);
}

function setXxQuery(id){
		 if($("#t_gxdwbz").attr("value")=="1"){
			$("#x_gxdwdm").val(id);
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val("");
		 } else if($("#t_fxjbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val(id);
			$("#x_dsjgdm").val("");
			$("#x_gxdwbz").attr("value","1");
		 } else if($("#t_dsjgbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val(id);
			$("#x_fxjbz").attr("value","1");
		 }
	 	detailid="csryzhtj_detail";
     	setWidth(detailid,"950");
     	$('#'+detailid).css('left','25').css('top','40');
	 	setUrl(detailid,"basic/icksystem/CsryzhtjManxx.jsp");
}
</script>
</head>
<body>
<input type="hidden" id="k_deptCode">


<input type="hidden" id="t_dsjgbz" value="">
<input type="hidden" id="t_dsjgdm">
<input type="hidden" id="t_fxjbz" value="">
<input type="hidden" id="t_fxjdm">
<input type="hidden" id="t_gxdwbz" value="">
<input type="hidden" id="t_gxdwdm">

<input type="hidden" id="x_dsjgbz" value="0">
<input type="hidden" id="x_dsjgdm">
<input type="hidden" id="x_fxjbz" value="0">
<input type="hidden" id="x_fxjdm">
<input type="hidden" id="x_gxdwbz" value="0">
<input type="hidden" id="x_gxdwdm">
<input type="hidden" id="x_hylbdm">
<input type="hidden" id="x_qsrq">
<input type="hidden" id="x_jzrq">
<input type="hidden" id="x_sfcxqb">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">场所人员综合统计</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr id="gajgAll">
			<td width="10%" class="pagedistd">
			<input dataKey="dsjgdm" type="checkbox" id="ch_dsjgdm" onClick="ksd_gajgSelect(this);"/>市级公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_dsjgdm" onChange="ksd_dsjgdmOnchange();"><option>全部</option></select>
			</td>
			<td width="10%" class="pagedistd">
			<input dataKey="fxjdm" type="checkbox" id="ch_fxjdm" onClick="ksd_gajgSelect(this);">分县局公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_fxjdm" onChange="ksd_fxjdmOnchange();"><option>全部</option></select></td>
			<td width="10%" class="pagedistd">
			<input dataKey="gxdwdm" type="checkbox" id="ch_gxdwdm" onClick="ksd_gajgSelect(this);">科所队</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_gxdwdm" onChange="ksd_gxdwdmOnchange();"><option>全部</option></select></td>
		</tr>
		<tr id="cszflAll">
			<td class="pagedistd">起始时间</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_qsrq"></td>
			<td class="pagedistd">截止时间</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_jzrq"></td>
			<td class="pagedistd">是否查询全部</td>
			<td class="pagetd"><select type="select" id="t_sfcxqb"><option></option></select></td>
		</tr>
		<tr>
		  <td width="23%" class="pagetd" colspan="6">
				<table border="0" align="right" cellpadding="2" cellspacing="0">
				<tr>
				<td><a href="#" class="searchbutton" onClick="loadData();">查询</a></td>
				<td><a href="#" class="exceldcbutton" onClick="expExcel('datatable',24,3);" id="csxxExcel">导出</a></td>
				</tr>
				</table>
			</td>
		</tr>
    	</table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata" class="scrollbarface"    style="overflow:scroll;width:1019;height:500; border:1px #d8dbec solid;border-right:0px;position:relative;">
	<table width="2000"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable" >
	  <thead>
         <tr class="grid-header-tr">
         <td width="81"  id='l_dsjgmc' rowspan="2" class="grid-header-bg1">市局</td>
         <td width="107" id='l_fxjgmc' rowspan="2" class="grid-header-bg1">分县局公安机关</td>
         <td width="87"  id='l_gxdwmc' rowspan="2" class="grid-header-bg1">派出所</td>
         <td id='l_csxxtj'  colspan="12" class="grid-header-bg1">场所信息统计</td>
         <td id='l_ryxxtj'  colspan="9" class="grid-header-bg1">人员信息统计</td>
        </tr>
	    <tr  class="grid-header-tr">
		<td  class="grid-header-bg1" id='l_css'>场所数</td>
		<td  class="grid-header-bg1" id='l_zjcss'>装机数</td>
		<td  class="grid-header-bg1" id='l_xzcss'>周期内新增<br>场所数</td>
		<td  class="grid-header-bg1" id='l_xzzjcss'>周期内新增<br>场所装机数</td>
		<td  class="grid-header-bg1"  id='l_xzzjl'>周期内新增<br>场所装机率(%)</td>
		<td  class="grid-header-bg1" id='l_sccss'>周期内<br>上传场所数</td>
		<td  class="grid-header-bg1" id='l_csskscl'>周期内场所<br>刷卡上传率(%)</td>
		<td  class="grid-header-bg1" id='l_rcjccs'>周期内<br>日常检查</td>
		<td  class="grid-header-bg1" id='l_yyrzsccss'>上传<br>营业日志</td>
		<td  class="grid-header-bg1" id='l_cfcss'>处罚场所</td>
        <td  class="grid-header-bg1" id='l_jlcss'>奖励场所</td>
		<td  class="grid-header-bg1" id='l_facss'>场所发案</td>
		
		<td  class="grid-header-bg1" id='l_cyrys'>从业<br>人员数</td>
		<td  class="grid-header-bg1" id='l_xzrys'>新增<br>人员数</td>
		<td  class="grid-header-bg1" id='l_zxrys'>注销<br>人员数</td>
		<td  class="grid-header-bg1" id='l_skrs'>刷卡人数</td>
		<td  class="grid-header-bg1" id='l_ryskscl'>人员刷卡<br>上传率(%)</td>
		<td  class="grid-header-bg1" id='l_cfrs'>处罚人员</td>
		<td  class="grid-header-bg1" id='l_jlrs'>奖励人员</td>
		<td  class="grid-header-bg1" id='l_bjhfl'>报警回复<br>率(%)</td>
		<td  class="grid-header-bg1" id='l_zhztrs'>抓获<br>在逃人数</td>
	    </tr>
	  </thead>
	  <tr entityclass="temp" edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="css" property="css"></td>
        <td class="grid-header-hbbg" id="zjcss" property="zjcss"></td>
        <td class="grid-header-hbbg" id="xzcss" property="xzcss"></td>
        <td class="grid-header-hbbg" id="xzzjcss" property="xzzjcss"></td>
        <td class="grid-header-hbbg" id="xzzjl" property="xzzjl"></td>
        <td class="grid-header-hbbg" id="sccss" property="sccss"></td>
        <td class="grid-header-hbbg" id="csskscl" property="csskscl"></td>
        <td class="grid-header-hbbg" id="rcjccs" property="rcjccs"></td>
        <td class="grid-header-hbbg" id="yyrzsccss" property="yyrzsccss"></td>
        <td class="grid-header-hbbg" id="cfcss" property="cfcss"></td>
        <td class="grid-header-hbbg" id="jlcss" property="jlcss"></td>
        <td class="grid-header-hbbg" id="facss" property="facss"></td>
        <td class="grid-header-hbbg" id="cyrys" property="cyrys"></td>
        <td class="grid-header-hbbg" id="xzrys" property="xzrys"></td>
        <td class="grid-header-hbbg" id="zxrys" property="zxrys"></td>
        <td class="grid-header-hbbg" id="skrs" property="skrs"></td>
        <td class="grid-header-hbbg" id="ryskscl" property="ryskscl"></td>
        <td class="grid-header-hbbg" id="cfrs" property="cfrs"></td>
        <td class="grid-header-hbbg" id="jlrs" property="jlrs"></td>
        <td class="grid-header-hbbg" id="bjhfl" property="bjhfl"></td>
        <td class="grid-header-hbbg" id="zhztrs" property="zhztrs"></td>
      </tr>
	</table>
</div>
<div id="csryzhtj_detail" class="page-layout" src="#" style="top:20px; left:160px; width:950px; display:none;"></div>
</body>
</html>