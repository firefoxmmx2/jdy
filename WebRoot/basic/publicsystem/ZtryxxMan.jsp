<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<html>
<script type="text/javascript">
detailWidth=800;
var exportState = 0;
var tableszt;
$(document).ready(function() {
	$("#cyryxxzt_detail").hide();
	pageUrlzt="publicsystem/querylistZt_qysctj.action";
	divnidzt="ztxx_Data";
	tableidzt="ztxx_Table";
	loadPagezt("ztxx_Data");
	daggleDiv("cyryxxzt_detail");
	
}); 

function loadPagezt(divpageid){
	    tableszt=$("#"+divpageid).html();
	    setPageListzt(1);
    }	
	
	
	

	
function setListzt(pageno,url){	
	$("#"+divnidzt).html(tableszt);	
	createXML("x_");
	if (url==null || url=="undefined"){
		url=pageUrlzt;
	}
	return url;
}	
	
	
	
function setPageListzt(pageno,url){	
	
		url=setListzt(pageno,url);
		setParams("x_"); //传参
		var mygrid1 = $("#"+tableidzt).ingrid({ 
		                                ingridPageParams:sXML, 
										ingridPageWidth: 900,
										url: url,	
										height: pageHeight-230,
											onTdSelect: function(tr){
												   var cyrybh = $(tr).find("td").eq(2);
												   var cyryldbm = $(tr).find("td").eq(7);
												   var ryid = $(tr).find("td").eq(8);
													cyrybh.html("<a href='#' class='hyperlink' onClick=setRyDetail('"+ryid.text()+"','"+cyryldbm.text()+"');>"+cyrybh.text()+"</a>");
												
											},
										onRowSelect:null,
										pageNumber: pageno,
										sorting: false,
										hideColIndex:[7,8],	
										colWidths: ["14%","12%","20%","7%","13%","15%","14%","0%","0%"]									
									});				
		
}	
	
function setRyDetail(ryid,cyrylbdm){
    tj_tcryxx=null;
    if(cyrylbdm=='0'){
		detailHtml="business/Ylfwzagl/CyryxxDetail-cjd.jsp";
		detailUrl="publicsystem/query_qyryxx.action";
	}else{
	    detailHtml="business/Ylfwzagl/CyryxxDetail-wg-cjd.jsp";
		detailUrl="publicsystem/query_publicwgcyryxx.action";
	}
	
	detailid="cyryxxzt_detail";
	dataid=ryid;
	setWidth(detailid,800);
	$('#'+detailid).css('left','30').css('top','50');
	setUrl(detailid,detailHtml);
	bindDocument(detailid);
}

 function closeAndRemoves(){
 if(sktjfalg=='yes'){
		$("#ztxx_detail").children().remove();
		$("#ztxx_detail").hideAndRemove("show");
	}else if(sktjfalg=='no'){
	   $("#ztxxxx_detail").children().remove();
		$("#ztxxxx_detail").hideAndRemove("show");
	}
}

	// 导出Excel
	function setExportExcel_ztryxx(){ 
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_qymc' datatype='String'>刷卡场所</th>";
		    result += "<th name='l_sksj' datatype='String'>刷卡时间</th>";
		    result += "<th name='l_cyrybh' datatype='String'>从业人员编号</th>";
		    result += "<th name='l_xm' datatype='String'>姓名</th>";
		    result += "<th name='l_zjhm' datatype='Integer'>证件号码</th>";
	     	result += "<th name='l_ssqymc' datatype='String'>所属场所</th>";
	     	result += "<th name='l_gxdwmc' datatype='String'>管辖单位</th>"
	     	
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_ztryxx();
		    //setPageList(1);
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_ztryxx(){
		setParams("x_");
		jQuery.post("publicsystem/querylistztryxxExcelTemp_qysctj.action",params,searchLongBack_ztryxx,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_ztryxx(json){  
		//报表标题
		var bbmc="未刷卡人员明细";
		//报表请求
		setExcelLong_ztryxx("ztryxxExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_ztryxx(excelid,bbmc){
		var surl="publicsystem/querylistztryxxExcel_qysctj.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
</script>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">走台人员详细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='closeAndRemoves();' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="ztryxxExcel" onClick="setExportExcel_ztryxx();">导出</a></td>
    </tr>
</table>
<div id="cyryxxzt_detail"  class="page-layout" src="#" style="top:20px; left:160px; width:800px;">
</div>	
<div id="ztxx_Data" style="width:100%;">
	<table id="ztxx_Table" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_qymc">刷卡场所</th>
	     	<th name="l_sksj">刷卡时间</th>
	     	<th name="l_cyrybh">从业人员编号</th>
	    	<th name="l_xm">姓名</th>
	        <th name="l_zjhm">证件号码</th>
	        <th name="l_ssqymc">所属场所</th>
	        <th name="l_gxdwmc">管辖单位</th>
	        <th name="l_cyrylbdm">从业类别</th>
	        <th name="l_ryid">从业类别</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>



</body>
</html>