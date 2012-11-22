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
			url="icksystem/querylistcsmx_icktjrb.action";
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
				colWidths: ["10%","20%","7%","15%","8%","9%","9%","11%","11%"]									
		});
	}
	// 导出Excel
	function setExportExcel_csmx(){ 
	    if(manVerify()){
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_qybm' datatype='String'>场所编码</th>";
		    result += "<th name='l_qymc' datatype='String'>场所名称</th>";
		    result += "<th name='l_zjztmc' datatype='String'>装机状态</th>";
		    result += "<th name='l_gxdwmc' datatype='String'>管辖单位名称</th>";
		    result += "<th name='l_lrcyrys' datatype='String'>从业人数</th>";
			result += "<th name='l_slicks' datatype='String'>IC卡受理张数</th>";
			result += "<th name='l_fficks' datatype='String'>IC卡发放张数</th>";
			result += "<th name='l_skicks' datatype='String'>IC卡累计使用量</th>";
			result += "<th name='l_drskicks' datatype='String'>IC卡当日使用量</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_csmx();
		}
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_csmx(){
		setParams("x_");
		jQuery.post("icksystem/querylistcsmxExcelTemp_icktjrb.action",params,searchLongBack_csmx,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_csmx(json){  
		//报表标题
		var bbmc="IC卡统计场所明细";
		//报表请求
		setExcelLong_csmx("csmxExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_csmx(excelid,bbmc){
		var surl="icksystem/querylistcsmxExcel_icktjrb.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
</script>

</head>
<body>
<div id="QyxxClose"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">IC卡统计场所明细</td>
      <td align="right" class="title1"><a href="#" onclick="$('#QyxxClose').parent().hideAndRemove(&quot;show&quot;);" class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="qyjbxx_detail" class="page-layout" src="#" style="z-index:2000; top:-50px; left:0px; display:none;"></div>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="csmxExcel" onClick="setExportExcel_csmx();">导出</a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="QyjbxxData" style="width:100%;">
	<table id="QyjbxxTable" width="100%">
	  <thead>
	    <tr>
	    	<th>场所编码</th>
	     	<th>场所名称</th>
	     	<th>装机状态</th>
	     	<th>管辖单位名称</th>
	     	<th>从业人员数</th>
	     	<th>IC卡受理张数</th>
	     	<th>IC卡发放张数</th>
	     	<th>IC卡累计使用量</th>
	     	<th>IC卡当日使用量</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>