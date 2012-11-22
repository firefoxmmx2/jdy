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
				colWidths: ["20%","30%","15%","15%","20%"],
				onRowSelect:null,
				changeHref:function(table){
				if($(table).find("tr:last").length>0){
				$(table).find("tr:last").find("td:eq(0)").text("总计");
				}
				$(table).find("tr").each(function(){
				
						var temprq=$(this).find("td:nth(0)").text();
						var temp=$(this).find("td:nth(1)").text();
						$(this).find("td:nth(1)").html("<a href='#' class='fontbutton' onclick=setSkcstj_zjsQuery('"+temprq+"')>"+temp+"</a>");
						var temprq=$(this).find("td:nth(0)").text();
						var temp=$(this).find("td:nth(2)").text();
						$(this).find("td:nth(2)").html("<a href='#' class='fontbutton' onclick=setSkcstj_scqyQuery('"+temprq+"')>"+temp+"</a>");
						var temprq=$(this).find("td:nth(0)").text();
						var temp=$(this).find("td:nth(4)").text();
						$(this).find("td:nth(4)").html("<a href='#' class='fontbutton' onclick=setSkcstj_wscqyQuery('"+temprq+"')>"+temp+"</a>");
						
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
			url="publicsystem/querySkcstjList_Newmx_wscqy.action";
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
	function setSkcstj_qyzsQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/Skcstj_QyzsMan.jsp");
	}
	function setSkcstj_zjsQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/Skcstj_ZjsMan.jsp");
	}
	function setSkcstj_scqyQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/Skcstj_ScqyMan.jsp");
	}
	function setSkcstj_wscqyQuery(tjrqString){
		$("#x_tjrqString").attr("value", tjrqString);
	    setWidth("qyyyrztjxx_detail","900");
	    $("#qyyyrztjxx_detail").css('top','70');
		setUrl("qyyyrztjxx_detail","basic/publicsystem/Skcstj_WscqyMan.jsp");
	}
	// 导出Excel
	function setExportExcel(){ 
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_tjrqString' datatype='String'>日期</th>";
		    result += "<th name='l_zjs' datatype='Integer'>装机企业数</th>";
		    result += "<th name='l_scqys' datatype='Integer'>上传场所数</th>";
		    result += "<th name='l_scl' datatype='Float'>上传率(%)</th>";
		    result += "<th name='l_wscqys' datatype='Integer'>未上传场所数</th>";

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
		jQuery.post("publicsystem/querySkcstjListNewmxExcelTemp_wscqy.action",params,searchLongBack,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack(json){  
		//报表标题
		var bbmc="场所刷卡统计企业总数明细";
		//报表请求
		setExcelLong("csxxExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong(excelid,bbmc){
		var surl="publicsystem/querySkcstjListNewmxExcel_wscqy.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}

</script>
<body>
<input type="hidden" id="x_tjrqString">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所刷卡统计明细</td>
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

       		<th name="l_zjs" datatype="Integer" sumflag="0">装机企业数</th>
       		<th name="l_scqys" datatype="Integer" sumflag="0">上传场所数</th>
       		<th name="l_scl" datatype="Integer" sumflag="0">上传率(%)</th>
       		<th name="l_wscqys" datatype="Integer" sumflag="0">未上传企业数</th>

	    </tr>
	  </thead>
	</table>
</div>
</body>