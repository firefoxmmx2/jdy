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
var optionItemConfig;
var tableConfigs;
var qzajbmc,qhylbdm,qgxdwbm,qqybm;
var qssj='';
var jzsj='';

var dataStore = new Ext.data.JsonStore({
	id: 'dataStore',
	proxy: new Ext.data.HttpProxy({url:'<%=basePath%>publicsystem/querylist_qyzajbtj.action'}),
	reader: new Ext.data.JsonReader(), 
	root: 'LQyzajbtj',
	totalProperty: 'totalrows',
	successProperty: 'success',
	fields: [{name: 'dsjgmc', type: 'String'}, 
			 {name: 'fxjmc', type: 'String'},
			 {name: 'gxdwmc', type: 'String'},
			 {name: 'qymc', type: 'String'},
			 {name: 'ajc', type: 'String'}, 
			 {name: 'bjc', type: 'String'},
			 {name: 'cjc', type: 'String'},
             {name: 'qtc', type: 'String'}]}
);
		
dataStore.on('load', function(store, records, options ) {
});

	$(document).ready(function() {
		csxxtjInit();
		//initTJDate();
		$("#t_qssj").attr("readonly","true").datepicker();
		$("#t_jzsj").attr("readonly","true").datepicker();
		$("#p_csmc").click(function(){
			//if(changsuoCanPlay&&$("#ch_csbm").attr("checked")){
			if($("#ch_csbm").attr("checked")){
			    dataid=$("#t_hylbdm").val();
			    var gxdw='';
	            if($("#t_gxdwdm").attr("value")!=''){
	                gxdw=$("#t_gxdwdm").attr("value");
	            }else if($("#t_fxjdm").attr("value")!=''){
	                gxdw=$("#t_fxjdm").attr("value");
	            }else if($("#t_dsjgdm").attr("value")!=''){
	                gxdw=$("#t_dsjgdm").attr("value");
	            }
			    getTy_item_super("p_csmc","t_csbm","","",gxdw,"","");
				//getQY_item("p_csmc","t_csbm","1",$("#t_gxdwdm").attr("value"));
			}
		});
		$("#t_hylbdm").selectBoxhylb({code:"dm_hylb"});// 行业类别选择框
		//设定表格高度
	    $("#tabledata").height(pageHeight-220); 
	});

function csfatjSetParams(){
    createXML('t_');
	params={dataxml:sXML,pagerow:10000,pagesize:1};
	dataStore.baseParams = dataStore.baseParams || {};
	Ext.apply(dataStore.baseParams, params);
}
function loadData() {
    if(manVerify()){
        // 设定查询参数
	    csfatjSetParams();
	    //设置时间
	    shezhisj();
	    // 清空上次结果
	    if(dataStore.getCount()>0){
	        $("#datatable").find('tr').each(function(i){
	            removeOneRow($(this));
	        });
	    }
	    $("#l_dsjgmc").remove();
	    $("#l_fxjgmc").remove();
	    $("#l_gxdwmc").remove();
	    $("#l_qymc").remove();
	    $("#l_gatmc").remove();
	    $("#dsjgmc").remove();
	    $("#fxjmc").remove();
	    $("#gxdwmc").remove();
	    $("#qymc").remove();
	    $("#gatmc").remove();
	    
	    if($("#t_dsjgbz").attr("value")=="1"){
	        $("#l_ajc").before("<td width='150' id='l_dsjgmc'  class='grid-header-bg1'>市局</td>");
	        $("#ajc").before("<td class='grid-header-hbbg' valign='top' id='dsjgmc' property='dsjgmc' groupid='dsjg'></td>");
	    }
	    if($("#t_fxjbz").attr("value")=="1"){
	        $("#l_ajc").before("<td width='150' id='l_fxjgmc' class='grid-header-bg1'>分县局公安机关</td>");
	        $("#ajc").before("<td class='grid-header-hbbg' valign='top' id='fxjmc' property='fxjmc' groupid='fxj' mergeblank='true'></td>");
	    }
	    if($("#t_gxdwbz").attr("value")=="1"){
	        $("#l_ajc").before("<td width='150' id='l_gxdwmc' class='grid-header-bg1'>派出所</td>");
	        $("#ajc").before("<td class='grid-header-hbbg' valign='top' id='gxdwmc' property='gxdwmc' groupid='gxdw' mergeblank='true'></td>");
	    }
	    if($("#t_csbz").attr("value")=="1"){
	        $("#l_ajc").before("<td id='l_qymc' class='grid-header-bg1'>场所</td>");
	        $("#ajc").before("<td class='grid-header-hbbg' valign='top' id='qymc' property='qymc' groupid='qy' mergeblank='true'></td>");
	    }
	    if($("#t_dsjgbz").attr("value")=="0"){
	        $("#l_ajc").before("<td width='150' id='l_gatmc'  class='grid-header-bg1'>省厅</td>");
	        $("#ajc").before("<td class='grid-header-hbbg' valign='top' id='gatmc' property='gatmc' groupid='gatmc'>"+departName+"</td>");
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
    if (!checkControlValue("t_qssj","Date",null,null,null,0,"起始日期"))
		return false;
	if (!checkControlValue("t_jzsj","Date",null,null,null,0,"截止日期"))
		return false;
	var p_qssj = $("#t_qssj").attr("value");
	var p_jzsj = $("#t_jzsj").attr("value");
	if(p_qssj!=''&&p_jzsj!=''&&formatDate(p_qssj)-formatDate(p_jzsj)>0){
		jAlert("请正确选择起始和截至日期!","提示信息");
		return false;
	}
	return true;
}
function formatDate(strDate){ //转换成日期格式
    var riqi = strDate.split("-");
    return new Date(riqi[0],(riqi[1]-1),riqi[2]);
}	

function query_qyjbxxlist(zajbmc,hylbdm,gxdwbm,qybm){
	this.qgxdwbm = gxdwbm;
	this.qgzajbmc= zajbmc;
	this.qhylbdm = hylbdm;
	this.qqybm = qybm;
	detailid="qyjbxxlist_detail";
	setWidth(detailid,"800");
	setUrl(detailid,"basic/publicsystem/Qyzajbtj_qyjbxxList.jsp");
}
function shezhisj(){
	qssj = "";
	jzsj = "";
	qssj = $("#t_qssj").val();
	jzsj = $("#t_jzsj").val();
}
$("#t_hylbdm").change(function (){
	if($("#t_hylbdm").val()=='J'||$("#t_hylbdm").val()=='K'){
		$("#qybm").html("场所");
	}else{
		$("#qybm").html("企业");
	}
})
</script>
</head>
<body>
<input type="hidden" id="k_deptCode">

<input type="hidden" id="t_dsjgbz" value="0">
<input type="hidden" id="t_dsjgdm">
<input type="hidden" id="t_fxjbz" value="0">
<input type="hidden" id="t_fxjdm">
<input type="hidden" id="t_gxdwbz" value="0">
<input type="hidden" id="t_gxdwdm">
<input type="hidden" id="t_csbz" value="0">
<input type="hidden" id="t_csbm">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">治安级别情况统计</td>
  </tr>
  <tr id="gajgAll">
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td width="10%" class="pagedistd">
			<input dataKey="dsjgdm" type="checkbox" id="ch_dsjgdm" onClick="gajgSelect(this);"/>地市公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_dsjgdm" onChange="dsjgdmOnchange();"><option>全部</option></select>
			</td>
			<td width="10%" class="pagedistd">
			<input dataKey="fxjdm" type="checkbox" id="ch_fxjdm" onClick="gajgSelect(this);">分县局公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_fxjdm" onChange="fxjdmOnchange();"><option>全部</option></select></td>
			<td width="10%" class="pagedistd">
			<input dataKey="gxdwdm" type="checkbox" id="ch_gxdwdm" onClick="gajgSelect(this);">科所队</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_gxdwdm" onChange="gxdwdmOnchange();"><option>全部</option></select></td>	
		</tr>
		<tr>
			<td class="pagedistd">
			<input dataKey="csbm" type="checkbox" id="ch_csbm" onClick="gajgSelect(this);"><span id="qybm">场所</span></td>
			<td class="pagetd"><input type="text" id="p_csmc" class="inputstyle" readonly="readonly"></td>
			<td class="pagedistd">起始时间</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_qssj"></td>
			<td class="pagedistd">截止时间</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_jzsj"></td>
			
		</tr>
		<tr>
			<td class="pagedistd">行业类别</td>
			<td class="pagetd"><select type="select" id="t_hylbdm"></select></td>
			<td width="23%" class="pagetd" colspan="4">
				<table width="124px" border="0" align="right" cellpadding="2" cellspacing="0">
				<tr>
				<td><a href="#" class="searchbutton" id="querys2" onClick="loadData();">查询</a></td>
				<td><a href="#" class="exceldcbutton" onClick="expExcel('datatable',8,1);" id="csxxExcel">导出</a></td>
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
<div id="tabledata" class="scrollbarface"  style="overflow-y:scroll;height:500; border:1px #d8dbec solid;border-right:0px;position:relative;">
	<table width="1002"  cellpadding="3" style="border-collapse:collapse;" cellspacing="0"  id="datatable" >
       <tr class="grid-header-tr">
         <td width="150"  class="grid-header-bg1"  id="l_dsjgmc">市局</td>
         <td width="150"  class="grid-header-bg1" id="l_fxjgmc">分县局公安机关</td>
         <td width="150"  class="grid-header-bg1" id="l_gxdwmc">派出所</td>
         <td width="150"  class="grid-header-bg1" id="l_qymc">场所</td>
         <td width="100"   class="grid-header-bg1"  id='l_ajc'>A级</td>
         <td width="100"    class="grid-header-bg1"  id='l_bjc'>B级</td>
         <td width="100"    class="grid-header-bg1"  id='l_cjc'>C级</td>
         <td width="100"    class="grid-header-bg1"  id='l_qtc'>其他</td>
      </tr>
      <tr entityclass="temp"  edittype="singletext">
	    <td class="grid-header-hbbg"  valign="top" id="dsjgmc"  property="dsjgmc" groupid="dsjg"></td>
        <td class="grid-header-hbbg"  valign="top" id="fxjmc"  property="fxjmc" groupid="fxj" mergeblank="true"></td>
        <td class="grid-header-hbbg" valign="top"  id="gxdwmc" property="gxdwmc" groupid="gxdw" mergeblank="true"></td>
        <td class="grid-header-hbbg"  id="qymc" property="qymc" groupid="qy" mergeblank="true"></td>
        <td class="grid-header-hbbg"  id="ajc" property="ajc"></td>
        <td class="grid-header-hbbg"  id="bjc" property="bjc"></td>
        <td class="grid-header-hbbg"  id="cjc" property="cjc"></td>
        <td class="grid-header-hbbg"  id="qtc" property="qtc"></td>
      </tr>
	</table>
</div>
<div id="qyjbxxlist_detail" class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>
</body>
</html>
