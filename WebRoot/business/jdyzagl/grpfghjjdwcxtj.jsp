<%@ page language="java" pageEncoding="UTF-8" 
import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
$(document).ready(function() {
	pageUrl="jdy/grpfghdwcx_rdrjbxx.action";
	//详情信息的DIV
	detailid="grpfghdwcx";
	$("#"+detailid).hide();
	//定义gird数据信息
	divnid="grpfghdwcxdiv";
	tableid="grpfghdwcxTable";
	tables=$("#"+divnid).html();
	//导出用到参数
	searchLongUrl="jdy/querycxForExport_rdrjbxx.action";
	excelUrl="jdy/exportExcel_rdrjbxx.action";
	tabletitle = "";
	geteExcelHead("grpfghdwcxdiv");
	//setPageList(1,'#');
	//时间设置
	$('.datef').attr("readOnly",true).datepicker(true,'0');
	$('.datet').attr("readOnly",true).datepicker(true,'1');
	// 治安管理机构
	$("#rdrjbxx_gxdwmc").click(function(){
		getGxdwTree("rdrjbxx_gxdwmc","rdrjbxx_gxdwbm",null,"jdytjxx_departlevel");
	});
	//户籍省市县--寄件人
	$("#rdrjbxx_ssxmc").click( function() {
		getDict_item("rdrjbxx_ssxmc", "rdrjbxx_ssx", "dm_xzqh");
	});
	$("#"+tableid).ingrid({ 
							url: "#",	
							height: pageHeight-260,
							pageNumber: 0,
							colWidths: ["15%","20%","18%","20%","18%","7%"]																		
						});
	daggleDiv(detailid);
})
//页面gird加载方法
function setPageList(pageno,url){	
	if($("#rdrjbxx_gxdwbm").val()==null || $("#rdrjbxx_gxdwbm").val()==""){
		$("#rdrjbxx_gxdwbm").val(<%=gxdwbm%>);
	}
	if (true){//manVerify_grpfghdwcx()
	    $("#"+divnid).html(tables);
		params =getSubmitParams("#grpfghdwcx_gad [name*=rdrjbxx.]");
		if (url==null || url=="undefined"){
			url=pageUrl;
		}
		var mygrid1 = $("#grpfghdwcxTable").ingrid({ 
										url: url,	
										height: pageHeight-260,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
										pageNumber: pageno,
										//colIndex: [0],
										noSortColIndex:[7],	
										//noSortColIndex:[11],
										onRowSelect:null,
										hideColIndex:[7,8,9],
										changeHref:function(table){
											if($(table).find("tr").length==0){
											    daochuNum = 0;
											}else{
											    daochuNum = 1;
											}	
										},
										colWidths: ["15%","20%","18%","20%","18%","7%"]									
									});				
		}
}
//验证方法 
function manVerify_grpfghdwcx(){
	if (!checkControlValue("rdrjbxx_pjtbsjf1","String",1,30,null,1,"开始时间"))
		return false;
	if (!checkControlValue("rdrjbxx_pjtbsjt1","String",1,30,null,1,"结束时间"))
		return false;
	if (!checkControlValue("rdrjbxx_ghjjdwcs","Select",1,8,null,1,"更换寄件单位次数超过"))
		return false;
	if (!checkControlValue("rdrjbxx_gxdwmc","String",1,70,null,1,"治安管理机构"))
		return false;
	return true;
}
//点击详情执行的方法
function grpfghdwcxDetail(id){
	$("#grpfghdwcx").empty();
	dataid = id;
	setWidth("grpfghdwcx",900);
	setUrl("grpfghdwcx","business/jdyzagl/grpfghjjdwcxtj_Detail.jsp");
	bindDocument("grpfghdwcx");
}
//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
  		params =getSubmitParams("#grpfghdwcx_gad [name*=rdrjbxx.]");
  	  jQuery.post(searchLongUrl,params,searchLongBack,"json");
  	  //setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		jAlert("无查询结果不能导出！",'验证信息',null,null);
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="频繁更换单位信息";
	//报表请求
	setExcelLong("fpghjjdw",bbmc);	
}
</script>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="grpfghdwcx_gad">
   <input type="hidden" id="rdrjbxx_gxdwbm" name="rdrjbxx.gxdwbm" value="<%=gxdwbm%>"><!-- 管辖单位编码 -->
   <input type="hidden" id="jdytjxx_departlevel" value="<%=departlevel %>"><!-- 级别 -->
   <input type="hidden" id="rdrjbxx_ssx" name="rdrjbxx.ssx" value=""><!-- 省市县代码 -->
  <tr>
    <td class="queryfont">个人寄件时频繁更换单位统计</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
    			<tr>
				  <td width="7%" class="red">开始时间</td>
				  <td width="41%" class="pagetd"><input type="text" id="rdrjbxx_pjtbsjf1" name="rdrjbxx.kssj" class="inputstyle datef" value="" />
			      	   <span class="red">结束时间<input  type="text" id="rdrjbxx_pjtbsjt1" name="rdrjbxx.jssj" class="inputstyle datet" value="" /></span>
				  </td>
				  <td width="7%" class="red">更换寄件单位次数超过</td>
				  <td width="41%" class="pagetd"><input type="text" class="inputstyle" id="rdrjbxx_ghjjdwcs" name="rdrjbxx.ghjjdwcs" value="" />
			      	<span class="red">次</span>
				  </td>
				</tr>
    			<tr>
					<td width="10%" class="red">治安管理机构</td>
					<td width="23%" class="pagetd"><input type="text" id="rdrjbxx_gxdwmc" name="rdrjbxx.gxdwmc"  class="inputstyle" value=""  readonly /></td>
					<td width="30%" class="pagedistd">寄件目的地（省市县/区）</td>
					<td width="23%" class="detailtd"><input type="text" id="rdrjbxx_ssxmc"  name="rdrjbxx.ssxmc"  class="inputstyle" value="" readonly /></td>
				</tr>
	    		<tr>
	    		  <td colspan="6">
	    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
	    		    	<tr>
	    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageList(1);">查询</a></td>
	    		    	  <td ><a href="#" class="addbutton" id="fpghjjdw" onclick='setExportExcel()'>导出</a></td>
	    		    	</tr>
	    		  	</table>
	    		  </td>
	    		</tr>
    	</table> 
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="grpfghdwcx" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

<div id="grpfghdwcxdiv" style="width:100%;">
	<table id="grpfghdwcxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	    	<th name="l_kssj" datatype="string" sumflag="0">寄件起始时间</th>
	    	<th name="l_jssj" datatype="string" sumflag="0">寄件结束时间</th>
	    	<th name="l_gxdwmc" datatype="string" sumflag="0">所属辖区</th>
	    	<th name="l_ghjjdwcs" datatype="string" sumflag="0">寄递次数</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
