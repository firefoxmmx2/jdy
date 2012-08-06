<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>

<script type="text/javascript">
	$(document).ready(function() {
		if($("#x_gxdwbz").attr("value")=="1"){
			$("#x_gxdwdm").val(dataid);
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val("");
		} else if($("#x_fxjbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val(dataid);
			$("#x_dsjgdm").val("");
		} else if($("#x_dsjgbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val(dataid);
		}
		loadPagexx("tabledata_qyyyrztjxx");
		daggleDiv("qyyyrztjxx_detail");
	});
	function loadPagexx(divpageid){
	    tablesxx=$("#"+divpageid).html();
	    setPageListxx(1);
    }	
	
	function setPageListxx(pageno,url){
		url=setListxx(pageno,url);
		setParams("x_"); //传参
		var mygrid1 = $("#table_qyyyrztjxx").ingrid({
				ingridPageParams:sXML,
				ingridPageWidth:800,
				url: url,
				height: pageHeight-263,
				pageNumber: pageno,
				ingridPageRows:10000,
				colWidths: ["12.5%","12.5%","12.5%","12.5%","12.5%","12.5%","12.5%","12.5%"],
				onRowSelect:null,
				changeHref:function(table){
				if($(table).find("tr:last").length>0){
				$(table).find("tr:last").find("td:eq(0)").text("总计");
				}
				$(table).find("tr").each(function(){
						var temprq=$(this).find("td:nth(0)").text();
						var temp=$(this).find("td:nth(2)").text();
						$(this).find("td:nth(2)").html("<a href='#' class='fontbutton' onclick=setQyyyrztjmxQuery('"+temprq+"')>"+temp+"</a>");
						var temprq=$(this).find("td:nth(0)").text();
						var temp=$(this).find("td:nth(3)").text();
						$(this).find("td:nth(3)").html("<a href='#' class='fontbutton' onclick=setQyyyrzwscQuery('"+temprq+"')>"+temp+"</a>");
					});
				},
				paging:false,
				sorting: false
		});
	}
	function setListxx(pageno,url){	
		$("#tabledata_qyyyrztjxx").html(tablesxx);	
		createXML("x_");
		if (url==null || url=="undefined"){
			url="publicsystem/querylisttjmx_qyyyrztj.action";
		}
		return url;
	}	
	
	function manVerifyxx(){
		return true;
	}
	function formatDate(strDate){ //转换成日期格式

		var riqi = strDate.split("-");
		return new Date(riqi[0],(riqi[1]-1),riqi[2]);
	}
	function setQyyyrztjmxQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/QyyyrzmxMan.jsp");
	}
	function setQyyyrzwscQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/rzwscCsxxMan.jsp");
	}
	
	// 导出Excel
	function setExportExcel(){ 
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_tjrqString' datatype='String'>日期</th>";
		    result += "<th name='l_qyzs' datatype='Integer'>企业总数</th>";
		    result += "<th name='l_sccss' datatype='Integer'>上传场所数</th>";
		    result += "<th name='l_wsccss' datatype='Integer'>未上传场所数</th>";
		    result += "<th name='l_cyrys' datatype='Integer'>从业人员数</th>";
	     	result += "<th name='l_sbrs' datatype='Integer'>上班人数</th>";
	     	result += "<th name='l_xzrys' datatype='Integer'>新增人员数</th>";
	     	result += "<th name='l_lzrys' datatype='Integer'>离职人员数</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong();
		    //setPageList(1);
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong(){
		setParams("x_");
		jQuery.post("publicsystem/querylisttjmxExcelTemp_qyyyrztj.action",params,searchLongBack,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack(json){  
		//报表标题
		var bbmc="营业日志统计明细";
		//报表请求
		setExcelLong("csxxExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong(excelid,bbmc){
		var surl="publicsystem/querylisttjmxExcel_qyyyrztj.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
</script>
<body>
<input type="hidden" id="x_tjrqString">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">营业日志统计明细</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#qyyyrztj_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="csxxExcel" onClick="setExportExcel();">导出</a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="qyyyrztjxx_detail" class="page-layout" src="#" style="top:235px; left:160px; width:800px; display:none;"></div>
<div id="tabledata_qyyyrztjxx" style="width:100%;">
	<table id="table_qyyyrztjxx" width="100%">
	  <thead>
	    <tr>
	    	<th name="l_tjrqString" datatype="String" sumflag="0">日期</th>
	     	<th name="l_qyzs" datatype="Integer" sumflag="0">企业总数</th>
       		<th name="l_sccss" datatype="Integer" sumflag="0">上传场所数</th>
       		<th name="l_wsccss" datatype="Integer" sumflag="0">未上传场所数</th>
        	<th name="l_cyrys" datatype="Integer" sumflag="0">从业人员数</th>
        	<th name="l_sbrs" datatype="Integer" sumflag="0">上班人数</th>
        	<th name="l_xzrys" datatype="Integer" sumflag="0">新增人员数</th>
        	<th name="l_lzrys" datatype="Integer" sumflag="0">离职人员数</th>
	     	
	    </tr>
	  </thead>
	</table>
</div>
</body>