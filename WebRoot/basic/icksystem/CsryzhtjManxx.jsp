<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="../../public/publicGADTJ.jsp" flush="true"></jsp:include>
<html>
<head>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.TableConfig.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.MappingTable.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/excel.js" charset="utf-8"></script>
<script type="text/javascript">
var optionItemConfig_x;
var tableConfigs_x;

var dataStore_x = new Ext.data.JsonStore({	
	id: 'dataStore',
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>icksystem/querylistCsryzhtjxx_csryzhtj.action'}),
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
		
dataStore_x.on('load', function(store, records, options ) {
});

$(document).ready(function() {
	daggleDiv("csryzhtj_detail_x");
    // 初期化关联管辖单位控件
	$("#tabledata_x").height(pageHeight-212); 
	loadData_x();
}); 
function csryzhtjSetParams_x(){
    createXML('x_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_x.baseParams = dataStore_x.baseParams || {};
	Ext.apply(dataStore_x.baseParams, params);
}
function loadData_x() {
    if(true){
        // 设定查询参数
	    csryzhtjSetParams_x();
	    // 清空上次结果
	    if(dataStore_x.getCount()>0){
	        $("#datatable_x").find('tr').each(function(i){
	            removeOneRow_x($(this));
	        });
	    }
	    $("#l_dsjgmc_x").remove();
	    $("#l_fxjgmc_x").remove();
	    $("#l_gxdwmc_x").remove();
	    $("#l_gatmc_x").remove();
	    $("#dsjgmc_x").remove();
	    $("#fxjmc_x").remove();
	    $("#gxdwmc_x").remove();
	    $("#gatmc_x").remove();
	     //传递查询参数用于明细
	    $("#z_hylbdm").attr("value", $("#x_hylbdm").attr("value"));
		$("#z_qsrq").attr("value", $("#x_qsrq").attr("value"));
		$("#z_jzrq").attr("value", $("#x_jzrq").attr("value"));
		$("#z_sfcxqb").attr("value", $("#x_sfcxqb").attr("value"));
		$("#z_dsjgbz").attr("value", $("#x_dsjgbz").attr("value"));
		$("#z_fxjbz").attr("value", $("#x_fxjbz").attr("value"));
		$("#z_gxdwbz").attr("value", $("#x_gxdwbz").attr("value"));
	    if($("#x_dsjgbz").attr("value")=="1"){
	        $("#l_csxxtj_x").before("<td width='81' id='l_dsjgmc_x' rowspan='2' class='grid-header-bg1'>市局</td>");
	        $("#css_x").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_x' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#x_fxjbz").attr("value")=="1"){
	        $("#l_csxxtj_x").before("<td width='107' id='l_fxjgmc_x' rowspan='2' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#css_x").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_x' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#x_gxdwbz").attr("value")=="1"){
	        $("#l_csxxtj_x").before("<td width='87' id='l_gxdwmc_x' rowspan='2' class='grid-header-bg1'>派出所</td>");
	        $("#css_x").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_x' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#x_dsjgbz").attr("value")=="0"){
	        $("#l_csxxtj_x").before("<td width='81' id='l_gatmc_x' rowspan='2' class='grid-header-bg1'>省厅</td>");
	        $("#css_x").before("<td class='grid-header-hbbg' valign='top' id='gatmc_x' property='gatmc' groupid='gatmc'>"+departName+"</td>");
	    }
	    
        // 取得表的配置信息
	    tableConfigs_x = $.parseConfig($("#datatable_x"));    
	    // 取得远程数据到JsonStore
	    dataStore_x.load({
	        callback :function(r,options,success){   
                if(success){
                    // 绑定数据到table 
                    loadDataToTable_x();
                }else{
                    alert("加载数据失败，无对应数据或者系统出现异常！"); 
                }
            }   
	    });
    }
}
function loadDataToTable_x(){
    $("#datatable_x").loadData(dataStore_x, tableConfigs_x, {
	    mode: 'row',
	    entityclass: 'temp'
	});
}
function removeOneRow_x(obj) {
    $("#datatable_x").removeRow(obj, tableConfigs_x, {
	    entityclass: 'temp'
	});
}

function setXxQueryxx(id){
		 if($("#x_gxdwbz").attr("value")=="1"){
			$("#z_gxdwdm").val(id);
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val("");
		 } else if($("#x_fxjbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val(id);
			$("#z_dsjgdm").val("");
			$("#z_gxdwbz").attr("value","1");
		 } else if($("#x_dsjgbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val(id);
			$("#z_fxjbz").attr("value","1");
		 }
	 	detailid="csryzhtj_detail_x";
     	setWidth(detailid,"950");
     	$('#'+detailid).css('left','25').css('top','40');
	 	setUrl(detailid,"basic/icksystem/CsryzhtjManxxa.jsp");
}
</script>
</head>
<body>
<input type="hidden" id="z_dsjgbz" value="0">
<input type="hidden" id="z_dsjgdm">
<input type="hidden" id="z_fxjbz" value="0">
<input type="hidden" id="z_fxjdm">
<input type="hidden" id="z_gxdwbz" value="0">
<input type="hidden" id="z_gxdwdm">
<input type="hidden" id="z_hylbdm">
<input type="hidden" id="z_qsrq">
<input type="hidden" id="z_jzrq">
<input type="hidden" id="z_sfcxqb">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所人员综合统计详细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#csryzhtj_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_x" class="scrollbarface"    style="overflow:scroll;width:945;height:500; border:1px #d8dbec solid;border-right:0px;position:relative;">
	<table width="2000"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_x" >
	  <thead>
         <tr class="grid-header-tr">
         <td width="81"  id='l_dsjgmc_x' rowspan="2" class="grid-header-bg1">市局</td>
         <td width="107" id='l_fxjgmc_x' rowspan="2" class="grid-header-bg1">分县局公安机关</td>
         <td width="87"  id='l_gxdwmc_x' rowspan="2" class="grid-header-bg1">派出所</td>
         <td id='l_csxxtj_x'  colspan="12" class="grid-header-bg1">场所信息统计</td>
         <td id='l_ryxxtj_x'  colspan="9" class="grid-header-bg1">人员信息统计</td>
        </tr>
	    <tr  class="grid-header-tr">
		<td  class="grid-header-bg1" id='l_css_x'>场所数</td>
		<td  class="grid-header-bg1" id='l_zjcss_x'>装机数</td>
		<td  class="grid-header-bg1" id='l_xzcss_x'>周期内新增<br>场所数</td>
		<td  class="grid-header-bg1" id='l_xzzjcss_x'>周期内新增<br>场所装机数</td>
		<td  class="grid-header-bg1"  id='l_xzzjl_x'>周期内新增<br>场所装机率(%)</td>
		<td  class="grid-header-bg1" id='l_sccss_x'>周期内<br>上传场所数</td>
		<td  class="grid-header-bg1" id='l_csskscl_x'>周期内场所<br>刷卡上传率(%)</td>
		<td  class="grid-header-bg1" id='l_rcjccs_x'>周期内<br>日常检查</td>
		<td  class="grid-header-bg1" id='l_yyrzsccss_x'>上传<br>营业日志</td>
		<td  class="grid-header-bg1" id='l_cfcss_x'>处罚场所</td>
        <td  class="grid-header-bg1" id='l_jlcss_x'>奖励场所</td>
		<td  class="grid-header-bg1" id='l_facss_x'>场所发案</td>
		<td  class="grid-header-bg1" id='l_cyrys_x'>从业<br>人员数</td>
		<td  class="grid-header-bg1" id='l_xzrys_x'>新增<br>人员数</td>
		<td  class="grid-header-bg1" id='l_zxrys_x'>注销<br>人员数</td>
		<td  class="grid-header-bg1" id='l_skrs_x'>刷卡人数</td>
		<td  class="grid-header-bg1" id='l_ryskscl_x'>人员刷卡<br>上传率(%)</td>
		<td  class="grid-header-bg1" id='l_cfrs_x'>处罚人员</td>
		<td  class="grid-header-bg1" id='l_jlrs_x'>奖励人员</td>
		<td  class="grid-header-bg1" id='l_bjhfl_x'>报警回复<br>率(%)</td>
		<td  class="grid-header-bg1" id='l_zhztrs_x'>抓获<br>在逃人数</td>
	    </tr>
	  </thead>
	  <tr entityclass="temp" edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_x" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_x" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_x" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="css_x" property="css"></td>
        <td class="grid-header-hbbg" id="zjcss_x" property="zjcss"></td>
        <td class="grid-header-hbbg" id="xzcss_x" property="xzcss"></td>
        <td class="grid-header-hbbg" id="xzzjcss_x" property="xzzjcss"></td>
        <td class="grid-header-hbbg" id="xzzjl_x" property="xzzjl"></td>
        <td class="grid-header-hbbg" id="sccss_x" property="sccss"></td>
        <td class="grid-header-hbbg" id="csskscl_x" property="csskscl"></td>
        <td class="grid-header-hbbg" id="rcjccs_x" property="rcjccs"></td>
        <td class="grid-header-hbbg" id="yyrzsccss_x" property="yyrzsccss"></td>
        <td class="grid-header-hbbg" id="cfcss_x" property="cfcss"></td>
        <td class="grid-header-hbbg" id="jlcss_x" property="jlcss"></td>
        <td class="grid-header-hbbg" id="facss_x" property="facss"></td>
        <td class="grid-header-hbbg" id="cyrys_x" property="cyrys"></td>
        <td class="grid-header-hbbg" id="xzrys_x" property="xzrys"></td>
        <td class="grid-header-hbbg" id="zxrys_x" property="zxrys"></td>
        <td class="grid-header-hbbg" id="skrs_x" property="skrs"></td>
        <td class="grid-header-hbbg" id="ryskscl_x" property="ryskscl"></td>
        <td class="grid-header-hbbg" id="cfrs_x" property="cfrs"></td>
        <td class="grid-header-hbbg" id="jlrs_x" property="jlrs"></td>
        <td class="grid-header-hbbg" id="bjhfl_x" property="bjhfl"></td>
        <td class="grid-header-hbbg" id="zhztrs_x" property="zhztrs"></td>
      </tr>
	</table>
</div>
<div id="csryzhtj_detail_x" class="page-layout" src="#" style="top:20px; left:160px; width:950px; display:none;"></div>
</body>
</html>