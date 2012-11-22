<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#detail_csfltj_x").hide();
		daggleDiv("detail_csfltj_x");
		startTjcx_x();
	});
	//查询
	function startTjcx_x(){
			createDataTable_x();
		    setPageList_x(1,pageUrl);
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
        if($("#x_gxdwbz").attr("value")=="1"){
        	$("#l_gxdw_x").text('科所队');
		}else if($("#x_fxjbz").attr("value")=="1"){
			$("#l_gxdw_x").text('分县局公安机关');
		}else if($("#x_dsjgbz").attr("value")=="1"){
			$("#l_gxdw_x").text('市级公安机关');
		}
    }
	function setPageList_x(pageno,url){
		createXML("x_");
		var mygrid1 = $("#table_csfltj_x").ingrid({
				ingridPageWidth : 800,
				ingridPageParams:sXML,
				url: url,
				height: pageHeight-260,
				pageNumber: pageno,
				colWidths: ["20%","8%","8%","8%","8%","8%","8%","8%","8%","8%","8%"],
				onRowSelect: null,
				changeHref:function(table){
					$(table).find("tr").each(function(){
						if ($(this).find("td:nth(0)").text()=="合计"||jb=='st'||$("#x_gxdwbz").attr("value")=="1"){
						}else{
							var temp1=$(this).attr('id');
							var temp=$(this).find("td:nth(0)").text();
							$(this).find("td:nth(0)").html("<a href='#' class='fontbutton' onClick=setXxQuery_x('"+temp1+"');>"+temp+"</a>");
						}
					});
				},
				paging: false,
				sorting: false
		});
		$("#l_gxdw_x").attr('style',"text-align:center;");
		$("#l_zqnxz_x").attr('style',"text-align:center;");
		$("#tr1_x").addClass("grid-header-tr");
		$("#tr2_x").addClass("grid-header-tr");
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
		 } else if($("#x_dsjgbz").attr("value")=="1"){
			$("#z_gxdwdm").val("");
			$("#z_fxjdm").val("");
			$("#z_dsjgdm").val(id);
			$("#z_fxjbz").attr("value","1");
		 }
	 	detailid="detail_csfltj_x";
     	setWidth(detailid,"800");
     	$('#'+detailid).css('left','80').css('top','40');
	 	setUrl(detailid,"basic/publicsystem/Csfltjxxa.jsp");
	}
</script>

<body>

<input type="hidden" id="z_dsjgbz" value="0">
<input type="hidden" id="z_dsjgdm">
<input type="hidden" id="z_fxjbz" value="0">
<input type="hidden" id="z_fxjdm">
<input type="hidden" id="z_gxdwbz" value="0">
<input type="hidden" id="z_gxdwdm">

<input type="hidden" id="z_qsrq">
<input type="hidden" id="z_jzrq">
<input type="hidden" id="z_sfcxqb">

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所信息统计</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#detail_csfltj").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="detail_csfltj_x" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_csfltj_x" style="width:100%;">
	<table id="table_csfltj_x" width="100%">
	  <thead>
        <tr id="tr1_x">
	         <td id="l_gxdw_x" width="20%" rowspan="2" class="grid-header-bg1">管辖单位</td>
	         <td id="l_zqnxz_x"  width="81%" colspan="10" class="grid-header-bg1">周期内新增</td>
        </tr>
	    <tr id="tr2_x">
			<td  class="grid-header-bg1" >场所数</td>
			<td  class="grid-header-bg1" >装机数</td>
			<td  class="grid-header-bg1" >装机率</td>
		    <td  class="grid-header-bg1" >歌舞娱乐</td>
	     	<td  class="grid-header-bg1" >游艺场所</td>
	     	<td  class="grid-header-bg1" >其他娱乐场所</td>
	     	<td  class="grid-header-bg1" >桑拿洗浴按摩</td>
	     	<td  class="grid-header-bg1" >美容美发足浴</td>
	     	<td  class="grid-header-bg1" >其他服务场所</td>
	     	<td  class="grid-header-bg1" >公共场所</td>	
	    </tr>
	  </thead>
	</table>
</div>
</body>