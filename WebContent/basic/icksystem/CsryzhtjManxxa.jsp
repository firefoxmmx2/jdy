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
var optionItemConfig_z;
var tableConfigs_z;

var dataStore_z = new Ext.data.JsonStore({	
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
		
dataStore_z.on('load', function(store, records, options ) {
});

$(document).ready(function() {
	daggleDiv("csryzhtj_detail_z");
    // 初期化关联管辖单位控件
	$("#tabledata_z").height(pageHeight-212); 
	loadData_z();
}); 
function csryzhtjSetParams_z(){
    createXML('z_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_z.baseParams = dataStore_z.baseParams || {};
	Ext.apply(dataStore_z.baseParams, params);
}
function loadData_z() {
    if(true){
        // 设定查询参数
	    csryzhtjSetParams_z();
	    // 清空上次结果
	    if(dataStore_z.getCount()>0){
	        $("#datatable_z").find('tr').each(function(i){
	            removeOneRow_z($(this));
	        });
	    }
	    $("#l_dsjgmc_z").remove();
	    $("#l_fxjgmc_z").remove();
	    $("#l_gxdwmc_z").remove();
	    $("#l_gatmc_z").remove();
	    $("#dsjgmc_z").remove();
	    $("#fxjmc_z").remove();
	    $("#gxdwmc_z").remove();
	    $("#gatmc_z").remove();
	     //传递查询参数用于明细
	     
	    if($("#z_dsjgbz").attr("value")=="1"){
	        $("#l_csxxtj_z").before("<td width='81' id='l_dsjgmc_z' rowspan='2' class='grid-header-bg1'>市局</td>");
	        $("#css_z").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_z' property='dsjgmc' groupid='dsjg' mergeblank='true'></td>");
	    }
	    if($("#z_fxjbz").attr("value")=="1"){
	        $("#l_csxxtj_z").before("<td width='107' id='l_fxjgmc_z' rowspan='2' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#css_z").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_z' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#z_gxdwbz").attr("value")=="1"){
	        $("#l_csxxtj_z").before("<td width='87' id='l_gxdwmc_z' rowspan='2' class='grid-header-bg1'>派出所</td>");
	        $("#css_z").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_z' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#z_dsjgbz").attr("value")=="0"){
	        $("#l_csxxtj_z").before("<td width='81' id='l_gatmc_z' rowspan='2' class='grid-header-bg1'>省厅</td>");
	        $("#css_z").before("<td class='grid-header-hbbg' valign='top' id='gatmc_z' property='gatmc' groupid='gatmc'>"+departName+"</td>");
	    }
	    
        // 取得表的配置信息
	    tableConfigs_z = $.parseConfig($("#datatable_z"));    
	    // 取得远程数据到JsonStore
	    dataStore_z.load({
	        callback :function(r,options,success){   
                if(success){
                    // 绑定数据到table 
                    loadDataToTable_z();
                }else{
                    alert("加载数据失败，无对应数据或者系统出现异常！"); 
                }
            }   
	    });
    }
}
function loadDataToTable_z(){
    $("#datatable_z").loadData(dataStore_z, tableConfigs_z, {
	    mode: 'row',
	    entityclass: 'temp'
	});
}
function removeOneRow_z(obj) {
    $("#datatable_z").removeRow(obj, tableConfigs_z, {
	    entityclass: 'temp'
	});
}

</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所人员综合统计详细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#csryzhtj_detail_x").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_z" class="scrollbarface"    style="overflow:scroll;width:945;height:500; border:1px #d8dbec solid;border-right:0px;position:relative;">
	<table width="2200"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_z" >
	  <thead>
         <tr class="grid-header-tr">
         <td width="81"  id='l_dsjgmc_z' rowspan="2" class="grid-header-bg1">市局</td>
         <td width="107" id='l_fxjgmc_z' rowspan="2" class="grid-header-bg1">分县局公安机关</td>
         <td width="87"  id='l_gxdwmc_z' rowspan="2" class="grid-header-bg1">派出所</td>
         <td width="364" id='l_csxxtj_z'  colspan="12" class="grid-header-bg1">场所信息统计</td>
         <td width="363" id='l_ryxxtj_z'  colspan="9" class="grid-header-bg1">人员信息统计</td>
        </tr>
	    <tr  class="grid-header-tr">
		<td  class="grid-header-bg1" id='l_css_z'>场所数</td>
		<td  class="grid-header-bg1" id='l_zjcss_z'>装机数</td>
		<td  class="grid-header-bg1" id='l_xzcss_z'>周期内新增<br>场所数</td>
		<td  class="grid-header-bg1" id='l_xzzjcss_z'>周期内新增<br>场所装机数</td>
		<td  class="grid-header-bg1"  id='l_xzzjl_z'>周期内新增<br>场所装机率(%)</td>
		<td  class="grid-header-bg1" id='l_sccss_z'>周期内<br>上传场所数</td>
		<td  class="grid-header-bg1" id='l_csskscl_z'>周期内场所<br>刷卡上传率(%)</td>
		<td  class="grid-header-bg1" id='l_rcjccs_z'>周期内<br>日常检查</td>
		<td  class="grid-header-bg1" id='l_yyrzsccss_z'>上传<br>营业日志</td>
		<td  class="grid-header-bg1" id='l_cfcss_z'>处罚场所</td>
        <td  class="grid-header-bg1" id='l_jlcss_z'>奖励场所</td>
		<td  class="grid-header-bg1" id='l_facss_z'>场所发案</td>
		<td  class="grid-header-bg1" id='l_cyrys_z'>从业<br>人员数</td>
		<td  class="grid-header-bg1" id='l_xzrys_z'>新增<br>人员数</td>
		<td  class="grid-header-bg1" id='l_zxrys_z'>注销<br>人员数</td>
		<td  class="grid-header-bg1" id='l_skrs_z'>刷卡人数</td>
		<td  class="grid-header-bg1" id='l_ryskscl_z'>人员刷卡<br>上传率(%)</td>
		<td  class="grid-header-bg1" id='l_cfrs_z'>处罚人员</td>
		<td  class="grid-header-bg1" id='l_jlrs_z'>奖励人员</td>
		<td  class="grid-header-bg1" id='l_bjhfl_z'>报警回复<br>率(%)</td>
		<td  class="grid-header-bg1" id='l_zhztrs_z'>抓获<br>在逃人数</td>
	    </tr>
	  </thead>
	  <tr entityclass="temp" edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_z" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_z" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_z" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="css_z" property="css"></td>
        <td class="grid-header-hbbg" id="zjcss_z" property="zjcss"></td>
        <td class="grid-header-hbbg" id="xzcss_z" property="xzcss"></td>
        <td class="grid-header-hbbg" id="xzzjcss_z" property="xzzjcss"></td>
        <td class="grid-header-hbbg" id="xzzjl_z" property="xzzjl"></td>
        <td class="grid-header-hbbg" id="sccss_z" property="sccss"></td>
        <td class="grid-header-hbbg" id="csskscl_z" property="csskscl"></td>
        <td class="grid-header-hbbg" id="rcjccs_z" property="rcjccs"></td>
        <td class="grid-header-hbbg" id="yyrzsccss_z" property="yyrzsccss"></td>
        <td class="grid-header-hbbg" id="cfcss_z" property="cfcss"></td>
        <td class="grid-header-hbbg" id="jlcss_z" property="jlcss"></td>
        <td class="grid-header-hbbg" id="facss_z" property="facss"></td>
        <td class="grid-header-hbbg" id="cyrys_z" property="cyrys"></td>
        <td class="grid-header-hbbg" id="xzrys_z" property="xzrys"></td>
        <td class="grid-header-hbbg" id="zxrys_z" property="zxrys"></td>
        <td class="grid-header-hbbg" id="skrs_z" property="skrs"></td>
        <td class="grid-header-hbbg" id="ryskscl_z" property="ryskscl"></td>
        <td class="grid-header-hbbg" id="cfrs_z" property="cfrs"></td>
        <td class="grid-header-hbbg" id="jlrs_z" property="jlrs"></td>
        <td class="grid-header-hbbg" id="bjhfl_z" property="bjhfl"></td>
        <td class="grid-header-hbbg" id="zhztrs_z" property="zhztrs"></td>
      </tr>
	</table>
</div>
<div id="csryzhtj_detail_z" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
</body>
</html>