<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#detail_csyyzttj_x").hide();
		daggleDiv("detail_csyyzttj_x");
		startTjcx_x();
	});
	//查询
	function startTjcx_x(){ 
		createDataTable_x();
	    setPageList_x(1);
	}
	// 建立数据列表
    function createDataTable_x(){
        $("#z_sfcxqb").attr("value", $("#x_sfcxqb").attr("value"));
		$("#z_qsrq").attr("value", $("#x_qsrq").attr("value"));
		$("#z_jzrq").attr("value", $("#x_jzrq").attr("value"));
		$("#z_dsjgbz").attr("value", $("#x_dsjgbz").attr("value"));
		$("#z_dsjgdm").attr("value", $("#x_dsjgdm").attr("value"));
		$("#z_fxjbz").attr("value",  $("#x_fxjbz").attr("value"));
		$("#z_fxjdm").attr("value",  $("#x_fxjdm").attr("value"));
		$("#z_gxdwbz").attr("value", $("#x_gxdwbz").attr("value"));
		$("#z_gxdwdm").attr("value", $("#x_gxdwdm").attr("value"));
		var ganjCol = "<th>省厅</th>";
        if($("#x_gxdwbz").attr("value")=="1"){
			ganjCol = "<th>科所队</th>";
		}else if($("#x_fxjbz").attr("value")=="1"){
			ganjCol = "<th>分县局公安机关</th>";
		}else if($("#x_dsjgbz").attr("value")=="1"){
			ganjCol = "<th>市级公安机关</th>";
		}
		var result = "<table id='table_csyyzttj_x' width='100%'><thead><tr>";
			result += ganjCol;
	     	result += "<th>企业总数</th>";
	     	result += "<th>营业场所数</th>";
	     	result += "<th>装机数</th>";
	     	result += "<th>自主停业数</th>";
	     	result += "<th>勒令停业数</th>";
	        result += "<th>歇业场所数</th>";
	     	result += "<th>注销场所数</th>";
	        result += "<th>其他状态场所数</th>";
			result += "</tr></thead><tbody></tbody></table>";
			$("#tabledata_csyyzttj_x").html(result);
			//loadPage("tabledata_csyyzttj_x");
    }
	function setPageList_x(pageno,url){
		createXML("x_");
		var mygrid1 = $("#table_csyyzttj_x").ingrid({
				ingridPageParams:sXML,
				url: pageUrl,
				height: pageHeight-260,
				ingridPageWidth : 800,
				pageNumber: pageno,
				colWidths: ["20%","10%","10%","10%","10%","10%","10%","10%","10%"],
				//hideColIndex: theHideCols,
				changeHref:function(table){
					$(table).find("tr").each(function(){
						if ($(this).find("td:nth(0)").text()=="合计"||$("#x_gxdwbz").attr("value")=="1"){
						}else{
							var temp1=$(this).attr('id');
							var temp=$(this).find("td:nth(0)").text();
							$(this).find("td:nth(0)").html("<a href='#' class='fontbutton' onClick=setXxQuery_x('"+temp1+"');>"+temp+"</a>");
						}
					});
				},
				onRowSelect: null,
				paging: false,
				sorting: false
		});
	}
	
	function setXxQuery_x(id){
		 if($("#x_gxdwbz").attr("value")=="1"){
			$("#z_gxdwdm").val(id);
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val("");
		 } else if($("#x_fxjbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val(id);
			$("#z_dsjgdm").val("");
			$("#z_gxdwbz").attr("value","1");
		 } else if($("#t_dsjgbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val(id);
			$("#z_fxjbz").attr("value","1");
		 }
	 	detailid="detail_csyyzttj_x";
     	setWidth(detailid,"800");
     	$('#'+detailid).css('left','25').css('top','40');
	 	setUrl(detailid,"basic/publicsystem/QyyyzttjManxxa.jsp");
	}
	
</script>

<body>
<input type="hidden" id="z_dsjgbz" value="0">
<input type="hidden" id="z_dsjgdm">
<input type="hidden" id="z_fxjbz" value="0">
<input type="hidden" id="z_fxjdm">
<input type="hidden" id="z_gxdwbz" value="0">
<input type="hidden" id="z_gxdwdm">
<input type="hidden" id="z_hylbdm">
<input type="hidden" id="z_qsrq">
<input type="hidden" id="z_jzrq">
<input type="hidden" id="z_sfcxqb">

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所营业状态统计</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#detail_csyyzttj").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="detail_csyyzttj_x" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_csyyzttj_x" style="width:100%;">
	<table id="table_csyyzttj_x" width="100%">
	  <thead>
	    <tr>
	    	<th>管辖单位</th>
	     	<th>企业总数</th>
	     	<th>营业场所数</th>
	     	<th>装机数</th>
	     	<th>自主停业数</th>
	     	<th>勒令停业数</th>
	     	<th>歇业场所数</th>
	     	<th>注销场所数</th>
	     	<th>其他状态场所数</th>
	    </tr>
	  </thead>
	</table>
</div>
</body>