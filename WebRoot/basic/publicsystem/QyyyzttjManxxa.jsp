<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#csyyzttj_detail_z").hide();
		daggleDiv("csyyzttj_detail_z");
		startTjcx_z();
	});
	//查询
	function startTjcx_z(){ 
		createDataTable_z();
	    setPageList_z(1);
	}
	// 建立数据列表
    function createDataTable_z(){
		var ganjCol = "<th>省厅</th>";
        if($("#z_gxdwbz").attr("value")=="1"){
			ganjCol = "<th>科所队</th>";
		}else if($("#z_fxjbz").attr("value")=="1"){
			ganjCol = "<th>分县局公安机关</th>";
		}else if($("#z_dsjgbz").attr("value")=="1"){
			ganjCol = "<th>市级公安机关</th>";
		}
		var result = "<table id='table_csyyzttj_z' width='100%'><thead><tr>";
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
			$("#tabledata_csyyzttj_z").html(result);
			//loadPage("tabledata_csyyzttj_z");
    }
	function setPageList_z(pageno,url){
		createXML("z_");
		var mygrid1 = $("#table_csyyzttj_z").ingrid({
				ingridPageParams:sXML,
				url: pageUrl,
				height: pageHeight-260,
				ingridPageWidth : 800,
				pageNumber: pageno,
				colWidths: ["20%","10%","10%","10%","10%","10%","10%","10%","10%"],
				onRowSelect: null,
				paging: false,
				sorting: false
		});
	}
	
</script>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所营业状态统计</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#detail_csyyzttj_x").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="csyyzttj_detail_z" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_csyyzttj_z" style="width:100%;">
	<table id="table_csyyzttj_z" width="100%">
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