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
		
dataStore_z.on('load', function(store, records, options ) {
});

$(document).ready(function() {
		daggleDiv("rylbtj_detail_z");
		//设定表格高度
	    $("#tabledata_z").height(pageHeight-214); 
	    loadData_z() ;
	});

function rylbtjSetParams_z(){
    createXML('z_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_z.baseParams = dataStore_z.baseParams || {};
	Ext.apply(dataStore_z.baseParams, params);
}
function loadData_z() {
    if(true){
        // 设定查询参数
	    rylbtjSetParams_z();
	    // 清空上次结果
	    if(dataStore_z.getCount()>0){
	        $("#datatable_z").find('tr').each(function(i){
	            removeOneRow_z($(this));
	        });
	    }
	    $("#l_dsjgmc_z").remove();
	    $("#l_fxjgmc_z").remove();
	    $("#l_gxdwmc_z").remove();
	    $("#l_qymc_z").remove();
	    $("#l_gatmc_z").remove();
	    $("#dsjgmc_z").remove();
	    $("#fxjmc_z").remove();
	    $("#gxdwmc_z").remove();
	    $("#qymc_z").remove();
	    $("#gatmc_z").remove();
	    
	    if($("#z_dsjgbz").attr("value")=="1"){
	        $("#l_zqnxz_z").before("<td width='81' id='l_dsjgmc_z' rowspan='2' class='grid-header-bg1'>市局</td>");
	        $("#hj_z").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_z' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#z_fxjbz").attr("value")=="1"){
	        $("#l_zqnxz_z").before("<td width='157' id='l_fxjgmc_z' rowspan='2' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#hj_z").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_z' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#z_gxdwbz").attr("value")=="1"){
	        $("#l_zqnxz_z").before("<td width='87' id='l_gxdwmc_z' rowspan='2' class='grid-header-bg1'>派出所</td>");
	        $("#hj_z").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_z' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#z_csbz").attr("value")=="1"){
	        $("#l_zqnxz_z").before("<td width='90' id='l_qymc_z' rowspan='2' class='grid-header-bg1'>场所</td>");
	        $("#hj_z").before("<td class='grid-header-hbbg' valign='top' id='qymc_z' property='qymc' groupid='qy'  mergeblank='true'></td>");
	    }
	     if($("#z_dsjgbz").attr("value")=="0"){
	        $("#l_zqnxz_z").before("<td width='81' id='l_gatmc_x' rowspan='2' class='grid-header-bg1'>省厅</td>");
	        $("#hj_z").before("<td class='grid-header-hbbg' valign='top' id='gatmc_z' property='gatmc' groupid='gatmc'>"+departName+"</td>");
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
    <td align="left" class="title1">人员信息统计详细</td>
    <td align="right"><a href="#" id="closeDiv" onclick='$("#rylbtj_detail_x").hideAndRemove("show");' class="close"></a></td>
  </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_z" class="scrollbarface"    style="overflow-y:scroll;height:500;width:945; border:1px #d8dbec solid;border-right:0px;">
	<table width="100%" cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_z" >
        <tr>
         <td width="81"  id='l_dsjgmc_z' rowspan="2" class="grid-header-bg1"  >市局</td>
         <td width="157" id='l_fxjgmc_z' rowspan="2" class="grid-header-bg1"   >分县局公安机关</td>
         <td width="87" id='l_gxdwmc_z' rowspan="2" class="grid-header-bg1"   >派出所</td>
         <td width="90" id="l_qymc_z" rowspan="2" class="grid-header-bg1" >场所</td>
         <td width="230" id="l_zqnxz_z" colspan="6"   class="grid-header-bg1" >周期内新增</td>
         <td width="230" id="l_zjzrq_z" colspan="6"  class="grid-header-bg1" >至截止日期</td>
        </tr>
	    <tr>
	        <td   id="l_hj_z" class="grid-header-bg1" >人员总数</td>
	     	<td id="l_glry_z" class="grid-header-bg1" >管理人员</td>
	     	<td  id="l_fwry_z" class="grid-header-bg1" >服务人员</td>
	     	<td id="l_bary_z" class="grid-header-bg1" >保安人员</td>
	     	<td  id="l_aqjcry_z" class="grid-header-bg1" >安检人员</td>
	     	<td   id="l_qt_z" class="grid-header-bg1" >其他人员</td>
	     	<td  id="l_hjT_z" class="grid-header-bg1" >人员总数</td>
	     	<td  id="l_glryT_z" class="grid-header-bg1" >管理人员</td>
	     	<td id="l_fwryT_z" class="grid-header-bg1" >服务人员</td>
	     	<td id="l_baryT_z" class="grid-header-bg1" >保安人员</td>
	     	<td  id="l_aqjcryT_z" class="grid-header-bg1" >安检人员</td>
	     	<td id="l_qtT_z" class="grid-header-bg1" >其他人员</td>
	    </tr>
	  <tr entityclass="temp"  edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_z" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_z" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_z" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="qymc_z" property="qymc" groupid="qy" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="hj_z"  property="hj"></td>
        <td class="grid-header-hbbg" id="glry_z"  property="glry"></td>
        <td class="grid-header-hbbg" id="fwry_z"  property="fwry"></td>
        <td class="grid-header-hbbg" id="bary_z"  property="bary"></td>
        <td class="grid-header-hbbg" id="aqjcry_z"  property="aqjcry"></td>
        <td class="grid-header-hbbg" id="qt_z"  property="qt"></td>
        <td class="grid-header-hbbg" id="hjT_z" property="hjT"></td>
        <td class="grid-header-hbbg" id="glryT_z" property="glryT"></td>
        <td class="grid-header-hbbg" id="fwryT_z"  property="fwryT"></td>
        <td class="grid-header-hbbg" id="baryT_z"  property="baryT"></td>
        <td class="grid-header-hbbg" id="aqjcryT_z"  property="aqjcryT"></td>
        <td class="grid-header-hbbg" id="qtT_z"  property="qtT"></td>
      </tr>
	</table>
</div>

<div id="rylbtj_detail_z" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
</body>
</html>