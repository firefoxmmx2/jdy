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
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>publicsystem/querylistps_qyyyrztj.action'}),
	reader: new Ext.data.JsonReader(), 
	root: 'LQyyyrztj',
	totalProperty: 'totalrows',
	successProperty: 'success',
	fields: [{name: 'dsjgmc', type: 'String'}, 
			 {name: 'fxjmc', type: 'String'},
			 {name: 'gxdwmc', type: 'String'},
			 {name: 'qyzs', type: 'int'}, 
			 {name: 'sccss', type: 'int'},
			 {name: 'scl', type: 'Float'},
			 {name: 'wsccss', type: 'int'},
             {name: 'cyrys', type: 'int'},
             {name: 'sbrs', type: 'int'}, 
             {name: 'xzrys', type: 'int'},
             {name: 'lzrys', type: 'int'}  ]}  
);
dataStore_z.on('load', function(store, records, options ) {
});

$(document).ready(function() {
		daggleDiv("qyyyrztj_detail_z");
		//设定表格高度
	    $("#tabledata_z").height(pageHeight-212); 
	    loadData_z();
});
		
function qyryjctjYMSSetParams_z(){
    createXML('z_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_z.baseParams = dataStore_z.baseParams || {};
	Ext.apply(dataStore_z.baseParams, params);
}
function loadData_z() {
    if(manVerify()){
        // 设定查询参数
	    qyryjctjYMSSetParams_z();
	    // 清空上次结果
	    if(dataStore_z.getCount()>0){
	        $("#datatable_z").find('tr').each(function(i){
	            removeOneRow_xx($(this));
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
	    
	    if($("#z_dsjgbz").attr("value")=="1"){
	        $("#l_qyzs_z").before("<td width='111' id='l_dsjgmc_z' class='grid-header-bg1'>市局</td>");
	        $("#qyzs_z").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_z' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#z_fxjbz").attr("value")=="1"){
	        $("#l_qyzs_z").before("<td width='116' id='l_fxjgmc_z' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#qyzs_z").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_z' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#z_gxdwbz").attr("value")=="1"){
	        $("#l_qyzs_z").before("<td width='117' id='l_gxdwmc_z'  class='grid-header-bg1'>派出所</td>");
	        $("#qyzs_z").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_z' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#z_dsjgbz").attr("value")=="0"){
	        $("#l_qyzs_z").before("<td width='111' id='l_gatmc_z' class='grid-header-bg1'>省厅</td>");
	        $("#qyzs_z").before("<td class='grid-header-hbbg' valign='top' id='gatmc_z' property='gatmc' groupid='gatmc'>"+departName+"</td>");
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
      <td align="left" class="title1">企业营业日志统计详细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyyyrztjds_detail_x").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_z" class="scrollbarface" style="overflow-y:scroll;height:500;width:945; border:1px #d8dbec solid;border-right:0px;position:relative;">
<table width="950"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_z" >
   	  <thead>
   	  <tr class="grid-header-tr">
        <td width="111" class="grid-header-bg1"  id="l_dsjgmc_z"  >市局</td>
        <td width="116" class="grid-header-bg1" id="l_fxjgmc_z"   >分县局公安机关</td>
        <td width="117" class="grid-header-bg1" id="l_gxdwmc_z"   >派出所</td>
        <td width="74" class="grid-header-bg1" id="l_qyzs_z">企业总数</td>
        <td width="74" class="grid-header-bg1" id="l_sccss_z">上传场所数</td>
        <td width="74" class="grid-header-bg1" id="l_scl_z">上传率(%)</td>
        <td width="74" class="grid-header-bg1" id="l_wsccss_z">未上传场所数</td>
        <td width="74" class="grid-header-bg1" id="l_cyrys_z">从业人员数</td>
        <td width="74" class="grid-header-bg1" id="l_sbrs_z">上班人数</td>
        <td width="74" class="grid-header-bg1" id="l_xzrys_z">新增人员数</td>
        <td width="74" class="grid-header-bg1" id="l_lzrys_z">离职人员数</td>
<!--        <td width="74" class="grid-header-bg1" id="l_mxlj_z">操作</td>-->
      </tr>
      </thead>
      <tr entityclass="temp"  edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_z" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_z" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_z" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="qyzs_z"  property="qyzs"></td>
        <td class="grid-header-hbbg" id="sccss_z"  property="sccss"></td>
        <td class="grid-header-hbbg" id="sccss_z"  property="scl"></td>
        <td class="grid-header-hbbg" id="wsccss_z"  property="wsccss"></td>
        <td class="grid-header-hbbg" id="cyrys_z"  property="cyrys"></td>
        <td class="grid-header-hbbg" id="sbrs_z"  property="sbrs"></td>
        <td class="grid-header-hbbg" id="xzrys_z"  property="xzrys"></td>
        <td class="grid-header-hbbg" id="lzrys_z"  property="lzrys"></td>
<!--        <td class="grid-header-hbbg" id="mxlj_z"  property="mxlj"></td>-->
      </tr>
	</table>	
</div>
<div id="qyyyrztj_detail_z" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
</body>
</html>