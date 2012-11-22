<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript">
	daggleDiv(detailid);
	var qyjbxxlsit_tables='';
	var qyjbxxlist_divnid='QyjbxxListData';
	var qyjbxxlist_detailid ="qyjbxx_detail" ;
	var qyjbxxlist_tableid ='QyjbxxListTable';
	var qyjbxxlist_pageUrl ="publicsystem/qyjbxxlist_qyzajbtj.action";
	$(document).ready(function() {
		$("#q_gxdwdm").attr("value",qgxdwbm);
		$("#q_zabdm").attr("value",qgzajbmc);
		$("#q_hylbdm").attr("value",qhylbdm);
		$("#q_qssj").attr("value",qssj);
		$("#q_jzsj").attr("value",jzsj);
		if(qhylbdm=="J"||qhylbdm=="K"){
			$("#qybm").text("场所编码");
			$("#qymc").text("场所名称");
		}else{
			$("#qybm").text("企业编码");
			$("#qymc").text("企业名称");
		}
		$("#q_qybm").attr("value",qqybm);
		qyjbxxlist_loadPage(qyjbxxlist_divnid);
	});
	
	function qyjbxxlist_loadPage(divpageid){
		qyjbxxlsit_tables=$("#"+divpageid).html();
		$("#"+qyjbxxlist_detailid).hide();
		qyjbxxlist_setPageList(1);
	}
	function qyjbxxlist_setList(pageno,url){	
		$("#"+qyjbxxlist_divnid).html(qyjbxxlsit_tables);	
		createXML("q_");
		if (url==null || url=="undefined"){
			url=qyjbxxlist_pageUrl;
		}
		return url;
	}
	function qyjbxxlist_setPageList(pageno,url){	
			url=qyjbxxlist_setList(pageno,url);
			var mygrid1 = $("#"+qyjbxxlist_tableid).ingrid({
										url: url,
										ingridPageParams:sXML,
										height: pageHeight-275,
										pageNumber: pageno,
										ingridPageWidth:800,
										sorting: false,
										onRowSelect: function(tr, selected){
										},
										colWidths: ["30%","35%","35%"]									
									});				
	}

</script>

</head>
<body>
<input type="hidden" id="q_zabdm"/>
<input type="hidden" id="q_gxdwdm"/>
<input type="hidden" id="q_hylbdm"/>
<input type="hidden" id="q_qybm"/>
<input type="hidden" id="q_qssj"/>
<input type="hidden" id="q_jzsj">
<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
	    <td align="left" class="title1">详细信息</td>
	    <td align="right"><a href="#" id="closeDiv" onclick='$("#qyjbxxlist_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="qyjbxx_detail" class="page-layout" src="#" style="z-index:2000;  top:10px; left:0px;">
</div>
<div id="QyjbxxListData" style="width:100%;">
	<table id="QyjbxxListTable" width="100%" border="0" cellspacing="0" cellpadding="0">
	  <thead>
	    <tr>
	     	<th name="l_qybm" id="qybm">场所编码</th>
	     	<th name="l_qymc" id="qymc">场所名称</th>
	     	<th name="l_zrs">归属管理机构</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>