<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
	var qyjbxx_tables = "";
	$(document).ready(function() {
		daggleDiv("qyjbxx_detail");
		qyjbxx_loadPage("QyjbxxData");
		qyjbxx_setPageList(1);
	});
	function qyjbxx_loadPage(divpageid){
		qyjbxx_tables=$("#QyjbxxData").html();
		//$("#QyjbxxData").hide();
		qyjbxx_setPageList(1,'#');
		
	}
	function qyjbxx_setList(pageno,url){	
		$("#QyjbxxData").html(qyjbxx_tables);
		createXML("x_");
		if (url==null || url=="undefined"){
			url="publicsystem/querySkwscmxList_wscqy.action";
		}
		return url;
	}
	function qyjbxx_setPageList(pageno,url){
		url=qyjbxx_setList(pageno,url);
		var mygrid1 = $("#QyjbxxTable").ingrid({
				url: url,
				ingridPageParams:sXML,
				height: 300,
				ingridPageWidth: 1000,
				pageNumber: pageno,
				onRowSelect: null,
				colWidths: ["8%","32%","13%","8%","8%","14%","8%","10%"]									
		});
	}
	// 导出Excel
	function setExportExcel_skwsc(){ 
	    if(manVerify()){
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_tjrqString' datatype='String'>日期</th>";
		    result += "<th name='l_qymc' datatype='String'>场所名称</th>";
		    result += "<th name='l_qybm' datatype='String'>场所备案编号</th>";
		    result += "<th name='l_zrs' datatype='Integer'>总人数</th>";
		    result += "<th name='l_lxdh' datatype='String'>联系电话</th>";
	     	result += "<th name='l_qyzflmc' datatype='Integer'>场所类别</th>";
	     	result += "<th name='l_yyztmc' datatype='Integer'>场所状态</th>";
	     	result += "<th name='l_zajbmc' datatype='Integer'>场所治安级别</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_skwsc();
		}
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_skwsc(){
		setParams("x_");
		jQuery.post("publicsystem/querySkwscmxListExcelTemp_wscqy.action",params,searchLongBack_skwsc,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_skwsc(json){  
		//报表标题
		var bbmc="刷卡统计未上传场所";
		//报表请求
		setExcelLong_skwsc("skwscExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_skwsc(excelid,bbmc){
		var surl="publicsystem/querySkwscmxListExcel_wscqy.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
</script>

</head>
<body>
<div id="QyxxClose"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">刷卡统计未上传场所信息</td>
      <td align="right" class="title1"><a href="#" onclick="$('#QyxxClose').parent().hideAndRemove(&quot;show&quot;);" class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="qyjbxx_detail" class="page-layout" src="#" style="z-index:2000; top:-50px; left:0px; display:none;"></div>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="skwscExcel" onClick="setExportExcel_skwsc();">导出</a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="QyjbxxData" style="width:100%;">
	<table id="QyjbxxTable" width="100%">
	  <thead>
	    <tr>
	    	<th>日期</th>
	    	<th>场所名称</th>
	     	<th>场所备案编号</th>
	     	<th>总人数</th>
	     	<th>联系电话</th>
	     	<th>场所类别</th>
	     	<th>场所状态</th>
	     	<th>场所治安级别</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>