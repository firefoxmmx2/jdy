<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
	var dcskCyrx_tables = "";
	var dcskCyrx_pageUrl="publicsystem/querylistDcsk_qysctj.action";
	var dcskCyrx_divnid="dcskCyrxListData";
	var dcskCyrx_tableid="ycskCyryxx";
	var dcskCyrx_detailHtml="basic/publicsystem/QyryxxDetail.jsp";
	var dcskCyrx_detailid="cyryxx_detail";
	var dcskCyrx_detailUrl="publicsystem/query_qyryxx.action";
	var dcskCyrx_detailWidth="800";
	
	$(document).ready(function() {
		dcskCyrx_loadPage(dcskCyrx_divnid);
		dcskCyrx_setPageList(1);
		daggleDiv("cyryxx_detail");
	});

	function dcskCyrx_setPageList(pageno,url){
		url=dcskCyrx_setList(pageno,url);
		var mygrid1 = $("#"+dcskCyrx_tableid).ingrid({ 
										url: url,
										ingridPageWidth: 800,
										height: 400,
										pageNumber: pageno,
										onRowSelect: function(tr, selected){
											var str = selected ? 'SELECTED' : 'UNSELECTED';
											if(sFlag=="true"){
												if ($(tr).attr('_selected')=="true"){
													ycsk_setQuery($(tr).attr("id")); 	
												}
											}else{
												sFlag="true";
											}
											rowselect=$(tr).attr('rowindex');
										},
										ingridPageParams:sXML,
										sorting: false,
										colWidths: ["8%","20%","18%","20%","20%","10%","4%"]
									});			
	}
	function dcskCyrx_loadPage(divpageid){
		dcskCyrx_tables=$("#"+divpageid).html();
		$("#"+dcskCyrx_detailid).hide();
		dcskCyrx_setPageList(1,'#');
	}
	function dcskCyrx_setList(pageno,url){
		$("#"+dcskCyrx_divnid).html(dcskCyrx_tables);
		setParams("x_");
		if (url==null || url=="undefined"){
			url=dcskCyrx_pageUrl;
		}
		return url;
	}
	
	//人员信息
	function ycsk_setQuery(id){ 
		$("#"+dcskCyrx_detailid).empty();
		dataid=id;
		cyrysetWidth(dcskCyrx_detailid,dcskCyrx_detailWidth);
		setUrl(dcskCyrx_detailid,dcskCyrx_detailHtml);
		bindDocument(dcskCyrx_detailid);
	}
	function cyrysetWidth(divid,sWidth){
		$("#"+divid).css("width",sWidth+"px");
		$("#"+divid).css("left","50px");
	}
	var detailUrl="publicsystem/query_qyryxx.action";
	function Qyryxx_setDetail(){
		var child=new Array(dcskCyrx_detailid);
		setParams("q_",child);
		jQuery.post(detailUrl,params,updatediv,"json");
	}
	
		// 导出Excel
	function setExportExcel_dcsk(){ 
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_xm' datatype='String'>姓名</th>";
		    result += "<th name='l_cyrybh' datatype='String'>从业人员编号</th>";
		    result += "<th name='l_zjhm' datatype='Integer'>证件号码</th>";
	     	result += "<th name='l_ssqymc' datatype='String'>所属场所</th>";
	     	result += "<th name='l_qymc' datatype='String'>刷卡场所</th>"
	     	result += "<th name='l_sksjString' datatype='String'>刷卡日期</th>"
	     	result += "<th name='l_skcs' datatype='Integer'>刷卡次数</th>"
	     	
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_dcsk();
		    //setPageList(1);
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_dcsk(){
		setParams("x_");
		jQuery.post("publicsystem/querylistdcskExcelTemp_qysctj.action",params,searchLongBack_dcsk,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_dcsk(json){  
		//报表标题
		var bbmc="未刷卡人员明细";
		//报表请求
		setExcelLong_dcsk("dcskExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_dcsk(excelid,bbmc){
		var surl="publicsystem/querylistdcskExcel_qysctj.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
</script>

</head>
<body>
<input type="hidden" id="d_ryid" value="">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">多次刷卡从业人员</td>
      <td align="right" class="title1"><a href="#" id="closeDiv" onclick='$("#d_ryid").parent().hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="dcskExcel" onClick="setExportExcel_dcsk();">导出</a></td>
    </tr>
</table>
<div id="cyryxx_detail" class="page-layout" src="#" style="z-index:2000; top:45px; left:0px;"></div>
<div id="dcskCyrxListData" style="width:100%;">
			<table id="ycskCyryxx" width="100%">
			  <thead>
			    <tr>
			     	<th name="l_xm">姓名</th>
			     	<th name="l_cyrybh">从业人员编号</th>
			     	<th name="l_zjhm">证件号码</th>
			     	<th name="l_ssqymc">所属场所</th>
			     	<th name="l_qymc">刷卡场所</th>
			     	<th name="l_sksjString">刷卡日期</th>
			     	<th name="l_skcs">刷卡次数</th>
			    </tr>
			  </thead>
			</table>
</div>
</body>
</html>