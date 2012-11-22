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
var detailids="";
var dataStore_x = new Ext.data.JsonStore({	
	id: 'dataStore',
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>publicsystem/querylistx_rylbtj.action'}),
	reader: new Ext.data.JsonReader(), 
	root: 'LRylbtj',
	totalProperty: 'totalrows',
	successProperty: 'success',
	fields: [{name: 'dsjgmc', type: 'String'}, 
			 {name: 'fxjmc', type: 'String'},
			 {name: 'gxdwmc', type: 'String'},
			 {name: 'qymc', type: 'String'},
			 {name: 'hjT', type: 'int'}, 
			 {name: 'glryT', type: 'int'},
			 {name: 'fwryT', type: 'int'},
             {name: 'baryT', type: 'int'},
             {name: 'aqjcryT', type: 'int'}, 
             {name: 'qtT', type: 'int'}, 
             {name: 'hj', type: 'int'}, 
             {name: 'glry', type: 'int'}, 
             {name: 'fwry', type: 'int'}, 
             {name: 'bary', type: 'int'}, 
             {name: 'aqjcry', type: 'int'},
             {name: 'qt', type: 'int'}]}
);
		
dataStore_x.on('load', function(store, records, options ) {
});

$(document).ready(function() {
		daggleDiv("rylbtj_detail_x");
		//设定表格高度
	    $("#tabledata_x").height(pageHeight-214); 
	    loadData_x() ;
	});

function rylbtjSetParams_x(){
    createXML('x_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_x.baseParams = dataStore_x.baseParams || {};
	Ext.apply(dataStore_x.baseParams, params);
}
function loadData_x() {
    if(true){
        // 设定查询参数
	    rylbtjSetParams_x();
	    // 清空上次结果
	    if(dataStore_x.getCount()>0){
	        $("#datatable_x").find('tr').each(function(i){
	            removeOneRow_x($(this));
	        });
	    }
	    $("#l_dsjgmc_x").remove();
	    $("#l_fxjgmc_x").remove();
	    $("#l_gxdwmc_x").remove();
	    $("#l_qymc_x").remove();
	    $("#l_gatmc_x").remove();
	    $("#dsjgmc_x").remove();
	    $("#fxjmc_x").remove();
	    $("#gxdwmc_x").remove();
	    $("#qymc_x").remove();
	    $("#gatmc_x").remove();
	    
	    $("#z_hylbdm").attr("value", $("#x_hylbdm").attr("value"));
		$("#z_qsrq").attr("value", $("#x_qsrq").attr("value"));
		$("#z_jzrq").attr("value", $("#x_jzrq").attr("value"));
		$("#z_dsjgbz").attr("value", $("#x_dsjgbz").attr("value"));
		$("#z_fxjbz").attr("value", $("#x_fxjbz").attr("value"));
		$("#z_gxdwbz").attr("value", $("#x_gxdwbz").attr("value"));
		
	    if($("#x_dsjgbz").attr("value")=="1"){
	        $("#l_zqnxz_x").before("<td width='81' id='l_dsjgmc_x' rowspan='2' class='grid-header-bg1'>市局</td>");
	        $("#hj_x").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_x' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#x_fxjbz").attr("value")=="1"){
	        $("#l_zqnxz_x").before("<td width='157' id='l_fxjgmc_x' rowspan='2' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#hj_x").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_x' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#x_gxdwbz").attr("value")=="1"){
	        $("#l_zqnxz_x").before("<td width='87' id='l_gxdwmc_x' rowspan='2' class='grid-header-bg1'>派出所</td>");
	        $("#hj_x").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_x' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#x_csbz").attr("value")=="1"){
	        $("#l_zqnxz_x").before("<td width='90' id='l_qymc_x' rowspan='2' class='grid-header-bg1'>场所</td>");
	        $("#hj_x").before("<td class='grid-header-hbbg' valign='top' id='qymc_x' property='qymc' groupid='qy'  mergeblank='true'></td>");
	    }
	     if($("#x_dsjgbz").attr("value")=="0"){
	        $("#l_zqnxz_x").before("<td width='81' id='l_gatmc_x' rowspan='2' class='grid-header-bg1'>省厅</td>");
	        $("#hj_x").before("<td class='grid-header-hbbg' valign='top' id='gatmc_x' property='gatmc' groupid='gatmc'>"+departName+"</td>");
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
	function setDsQueryx(id){
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
	 	detailids="rylbtj_detail_x";
     	setWidth(detailids,"965");
     	$('#'+detailids).css('left','15').css('top','40');
	 	setUrl(detailids,"basic/publicsystem/RylbtjManxx.jsp");
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
<input type="hidden" id="z_csbz" value="0">
<input type="hidden" id="z_csbm">
<input type="hidden" id="z_hylbdm">
<input type="hidden" id="z_qsrq">
<input type="hidden" id="z_jzrq">

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td align="left" class="title1">人员信息分县局统计查询</td>
    <td align="right"><a href="#" id="closeDiv" onclick='$("#rylbtj_detail").hideAndRemove("show");' class="close"></a></td>
  </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_x" class="scrollbarface"    style="overflow-y:scroll;width:945;height:500; border:1px #d8dbec solid;border-right:0px;">
	<table width="100%" cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_x" >
        <tr>
         <td width="81"  id='l_dsjgmc_x' rowspan="2" class="grid-header-bg1"  >市局</td>
         <td width="157" id='l_fxjgmc_x' rowspan="2" class="grid-header-bg1"   >分县局公安机关</td>
         <td width="87" id='l_gxdwmc_x' rowspan="2" class="grid-header-bg1"   >派出所</td>
         <td width="90" id="l_qymc_x" rowspan="2" class="grid-header-bg1" >场所</td>
         <td width="230" id="l_zqnxz_x" colspan="6"   class="grid-header-bg1" >周期内新增</td>
         <td width="230" id="l_zjzrq_x" colspan="6"  class="grid-header-bg1" >至截止日期</td>
        </tr>
	    <tr>
	        <td   id="l_hj_x" class="grid-header-bg1" >人员总数</td>
	     	<td id="l_glry_x" class="grid-header-bg1" >管理人员</td>
	     	<td  id="l_fwry_x" class="grid-header-bg1" >服务人员</td>
	     	<td id="l_bary_x" class="grid-header-bg1" >保安人员</td>
	     	<td  id="l_aqjcry_x" class="grid-header-bg1" >安检人员</td>
	     	<td   id="l_qt_x" class="grid-header-bg1" >其他人员</td>
	     	<td  id="l_hjT_x" class="grid-header-bg1" >人员总数</td>
	     	<td  id="l_glryT_x" class="grid-header-bg1" >管理人员</td>
	     	<td id="l_fwryT_x" class="grid-header-bg1" >服务人员</td>
	     	<td id="l_baryT_x" class="grid-header-bg1" >保安人员</td>
	     	<td  id="l_aqjcryT_x" class="grid-header-bg1" >安检人员</td>
	     	<td id="l_qtT_x" class="grid-header-bg1" >其他人员</td>
	    </tr>
	  <tr entityclass="temp"  edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_x" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_x" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_x" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="qymc_x" property="qymc" groupid="qy" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="hj_x"  property="hj"></td>
        <td class="grid-header-hbbg" id="glry_x"  property="glry"></td>
        <td class="grid-header-hbbg" id="fwry_x"  property="fwry"></td>
        <td class="grid-header-hbbg" id="bary_x"  property="bary"></td>
        <td class="grid-header-hbbg" id="aqjcry_x"  property="aqjcry"></td>
        <td class="grid-header-hbbg" id="qt_x"  property="qt"></td>
        <td class="grid-header-hbbg" id="hjT_x" property="hjT"></td>
        <td class="grid-header-hbbg" id="glryT_x" property="glryT"></td>
        <td class="grid-header-hbbg" id="fwryT_x"  property="fwryT"></td>
        <td class="grid-header-hbbg" id="baryT_x"  property="baryT"></td>
        <td class="grid-header-hbbg" id="aqjcryT_x"  property="aqjcryT"></td>
        <td class="grid-header-hbbg" id="qtT_x"  property="qtT"></td>
      </tr>
	</table>
</div>

<div id="rylbtj_detail_x" class="page-layout" src="#" style="top:20px; left:160px; width:950px; display:none;"></div>
</body>
</html>