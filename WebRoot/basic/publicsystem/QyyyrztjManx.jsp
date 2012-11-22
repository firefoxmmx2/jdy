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
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>publicsystem/querylistx_qyyyrztj.action'}),
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
dataStore_x.on('load', function(store, records, options ) {
});

$(document).ready(function() {
		daggleDiv("qyyyrztj_detail_x");
		daggleDiv("qyyyrztjds_detail_x")
		//设定表格高度
	    $("#tabledata_x").height(pageHeight-212); 
	    loadData_x();
});
		
function qyryjctjYMSSetParams_x(){
    createXML('s_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore_x.baseParams = dataStore_x.baseParams || {};
	Ext.apply(dataStore_x.baseParams, params);
}
function loadData_x() {
    if(manVerify()){
        // 设定查询参数
	    qyryjctjYMSSetParams_x();
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
	    $("#z_hylbdm").attr("value", $("#s_hylbdm").attr("value"));
	    $("#z_qyzflbm").attr("value", $("#s_qyzflbm").attr("value"));
		$("#z_qsrq").attr("value", $("#s_qsrq").attr("value"));
		$("#z_jzrq").attr("value", $("#s_jzrq").attr("value"));
		$("#z_dsjgbz").attr("value", $("#s_dsjgbz").attr("value"));
		$("#z_fxjbz").attr("value", $("#s_fxjbz").attr("value"));
		$("#z_gxdwbz").attr("value", $("#s_gxdwbz").attr("value"));
	    
	    if($("#s_dsjgbz").attr("value")=="1"){
	        $("#l_qyzs_x").before("<td width='111' id='l_dsjgmc_x' class='grid-header-bg1'>市局</td>");
	        $("#qyzs_x").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc_x' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#s_fxjbz").attr("value")=="1"){
	        $("#l_qyzs_x").before("<td width='116' id='l_fxjgmc_x' class='grid-header-bg1'>分县局公安机关</td>");
	       $("#qyzs_x").before("<td class='grid-header-hbbg' valign='top' id='fxjmc_x' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#s_gxdwbz").attr("value")=="1"){
	        $("#l_qyzs_x").before("<td width='117' id='l_gxdwmc_x'  class='grid-header-bg1'>派出所</td>");
	        $("#qyzs_x").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc_x' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#s_dsjgbz").attr("value")=="0"){
	        $("#l_qyzs_x").before("<td width='111' id='l_gatmc_x' class='grid-header-bg1'>省厅</td>");
	        $("#qyzs_x").before("<td class='grid-header-hbbg' valign='top' id='gatmc_x' property='gatmc' groupid='gatmc'>"+departName+"</td>");
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
		 if($("#s_gxdwbz").attr("value")=="1"){
			$("#z_gxdwdm").val(id);
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val("");
		 } else if($("#s_fxjbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val(id);
			$("#z_dsjgdm").val("");
			$("#z_gxdwbz").attr("value","1");
		 } else if($("#s_dsjgbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val(id);
			$("#z_fxjbz").attr("value","1");
		 }
	 	detailid="qyyyrztjds_detail_x";
     	setWidth(detailid,"965");
     	$('#'+detailid).css('left','15').css('top','40');
	 	setUrl(detailid,"basic/publicsystem/QyyyrztjManxx.jsp");
}
</script>
</head>
<body>
<input type="hidden" id="k_deptCode">

<input type="hidden" id="z_dsjgbz" value="0">
<input type="hidden" id="z_dsjgdm">
<input type="hidden" id="z_fxjbz" value="0">
<input type="hidden" id="z_fxjdm">
<input type="hidden" id="z_gxdwbz" value="0">
<input type="hidden" id="z_gxdwdm">
<input type="hidden" id="z_hylbdm">
<input type="hidden" id="z_qyzflbm">
<input type="hidden" id="z_qsrq">
<input type="hidden" id="z_jzrq">

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">企业营业日志分县局统计</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyyyrztjds_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata_x" class="scrollbarface" style="overflow-y:scroll;width:945;height:500; border:1px #d8dbec solid;border-right:0px;position:relative;">
<table width="950"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable_x" >
   	  <thead>
   	  <tr class="grid-header-tr">
        <td width="111" class="grid-header-bg1"  id="l_dsjgmc_x"  >市局</td>
        <td width="116" class="grid-header-bg1" id="l_fxjgmc_x"   >分县局公安机关</td>
        <td width="117" class="grid-header-bg1" id="l_gxdwmc_x"   >派出所</td>
        <td width="74" class="grid-header-bg1" id="l_qyzs_x">企业总数</td>
        <td width="74" class="grid-header-bg1" id="l_sccss_x">上传场所数</td>
        <td width="74" class="grid-header-bg1" id="l_scl_x">上传率(%)</td>
        <td width="74" class="grid-header-bg1" id="l_wsccss_x">未上传场所数</td>
        <td width="74" class="grid-header-bg1" id="l_cyrys_x">从业人员数</td>
        <td width="74" class="grid-header-bg1" id="l_sbrs_x">上班人数</td>
        <td width="74" class="grid-header-bg1" id="l_xzrys_x">新增人员数</td>
        <td width="74" class="grid-header-bg1" id="l_lzrys_x">离职人员数</td>
<!--        <td width="74" class="grid-header-bg1" id="l_mxlj_x">操作</td>-->
      </tr>
      </thead>
      <tr entityclass="temp"  edittype="singletext">
	    <td class="grid-header-hbbg" valign="top" id="dsjgmc_x" property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg" valign="top" id="fxjmc_x" property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top" id="gxdwmc_x" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg" id="qyzs_x"  property="qyzs"></td>
        <td class="grid-header-hbbg" id="sccss_x"  property="sccss"></td>
        <td class="grid-header-hbbg" id="sccss_x"  property="scl"></td>
        <td class="grid-header-hbbg" id="wsccss_x"  property="wsccss"></td>
        <td class="grid-header-hbbg" id="cyrys_x"  property="cyrys"></td>
        <td class="grid-header-hbbg" id="sbrs_x"  property="sbrs"></td>
        <td class="grid-header-hbbg" id="xzrys_x"  property="xzrys"></td>
        <td class="grid-header-hbbg" id="lzrys_x"  property="lzrys"></td>
<!--        <td class="grid-header-hbbg" id="mxlj_x"  property="mxlj"></td>-->
      </tr>
	</table>	
</div>
<div id="qyyyrztj_detail_x" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
<div id="qyyyrztjds_detail_x" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
</body>
</html>