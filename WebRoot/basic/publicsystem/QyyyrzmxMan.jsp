<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<html>
<script type="text/javascript">
$(document).ready(function() {
	daggleDiv("qyyyrz_detail");
	loadPageqyyyrzmx("qyyyrzmx_Data");
}); 
function loadPageqyyyrzmx(divpageid){
	    tablesqyyyrzmx=$("#"+divpageid).html();
	    setPageListqyyyrzmx(1);
    }	
function setListqyyyrzmx(pageno,url){	
	$("#qyyyrzmx_Data").html(tablesqyyyrzmx);	
	createXML("x_");
	if (url==null || url=="undefined"){
		url="publicsystem/querylistrzmx_qyyyrztj.action";
	}
	return url;
}	
function setPageListqyyyrzmx(pageno,url){	
		url=setListqyyyrzmx(pageno,url);
		setParams("x_"); //传参
		var mygrid1 = $("#qyyyrzmx_Table").ingrid({ 
		                                ingridPageParams:sXML, 
										ingridPageWidth: 900,
										url: url,	
										height: pageHeight-230,
										onRowSelect:function(tr, selected){
											var str = selected ? 'SELECTED' : 'UNSELECTED';
											if(sFlag=="true"){
												if ($(tr).attr('_selected')=="true"&&$(tr).attr("id")!=""){
													setQuery_yyrz($(tr).attr("id")); 	
												}
											}else{
												sFlag="true";
											}
											rowselect=$(tr).attr('rowindex');
										},
										changeHref:function(table){
										if($(table).find("tr:last").length>0){
										$(table).find("tr:last").find("td:eq(0)").text("总计");
										}
										},
										pageNumber: pageno,
										ingridPageRows:10000,
										paging:false,
										sorting: false,
										colWidths: ["14%","10%","12%","12%","12%","8%","8%","8%","4%","4%","4%","4%"]									
									});				
		
}	
function setQuery_yyrz(yyrzid){
    $("#qyyyrz_detail").empty();
	dataid=yyrzid;
	setWidth("qyyyrz_detail",380);
	$("#qyyyrz_detail").css('left','200').css('top','-40px');
	setUrl("qyyyrz_detail","basic/publicsystem/QyyyrzDetail.jsp");
	bindDocument("qyyyrzmx_detail");
}

	// 导出Excel
	function setExportExcel_rzsc(){ 
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_tjrqString' datatype='String'>日期</th>";
		    result += "<th name='l_qybm' datatype='String'>场所备案编号</th>";
		    result += "<th name='l_qymc' datatype='String'>场所名称</th>";
		    result += "<th name='l_ksyysj' datatype='Date'>营业开始时间</th>";
		    result += "<th name='l_jsyysj' datatype='Date'>营业结束时间</th>";
	     	result += "<th name='l_csfe' datatype='String'>场所负责人</th>";
	     	result += "<th name='l_sffsaj' datatype='String'>治安刑事或事故</th>";
	     	result += "<th name='l_sfglbmjc' datatype='String'>管理部门检查</th>";
	     	result += "<th name='l_cyryzs' datatype='Integer'>从业人员数</th>";
	     	result += "<th name='l_dtsbrs' datatype='Integer'>上班人数</th>";
	     	result += "<th name='l_dtxzrys' datatype='Integer'>新增人员数</th>";
	     	result += "<th name='l_dtlzrs' datatype='Integer'>离职人员数</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_rzsc();
		    //setPageList(1);
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_rzsc(){
		setParams("x_");
		jQuery.post("publicsystem/querylistrzmxExcelTemp_qyyyrztj.action",params,searchLongBack_rzsc,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_rzsc(json){  
		//报表标题
		var bbmc="营业日志人员信息明细";
		//报表请求
		setExcelLong_rzsc("rzsccsExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_rzsc(excelid,bbmc){
		var surl="publicsystem/querylistrzmxExcel_qyyyrztj.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}

</script>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">营业日志人员信息明细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyyyrztjxx_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="qyyyrz_detail"  class="page-layout" src="#" style="top:20px; left:160px; width:800px; display:none;"></div>	
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="rzsccsExcel" onClick="setExportExcel_rzsc();">导出</a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="qyyyrzmx_Data" style="width:100%;">
	<table id="qyyyrzmx_Table" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_tjrq">日期</th>
	     	<th name="l_qybm">场所备案编号</th>
	     	<th name="l_qymc">场所名称</th>
	    	<th name="l_riqif">营业开始时间</th>
	        <th name="l_riqit">营业结束时间</th>
	        <th name="l_csfe">场所负责人</th>
	        <th name="l_sffsaj">治安刑事或事故</th>
	        <th name="l_sfglbmjc">管理部门检查</th>
	        <th name="l_cyryzs">从业人员数</th>
	        <th name="l_dtsbrs">上班人数</th>
	        <th name="l_dtxzrys">新增人员数</th>
	        <th name="l_dtlzrs">离职人数</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>



</body>
</html>