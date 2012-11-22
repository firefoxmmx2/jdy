<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#detail_csfltj_z").hide();
		daggleDiv("detail_csfltj_z");
		startTjcx_z();
	});
	//查询
	function startTjcx_z(){
			createDataTable_z();
		    setPageList_z(1,pageUrl);
	}
	// 建立数据列表
    function createDataTable_z(){
        if($("#z_gxdwbz").attr("value")=="1"){
        	$("#l_gxdw_z").text('科所队');
		}else if($("#z_fxjbz").attr("value")=="1"){
			$("#l_gxdw_z").text('分县局公安机关');
		}else if($("#z_dsjgbz").attr("value")=="1"){
			$("#l_gxdw_z").text('市级公安机关');
		}
    }
	function setPageList_z(pageno,url){
		createXML("z_");
		var mygrid1 = $("#table_csfltj_z").ingrid({
				ingridPageWidth : 800,
				ingridPageParams:sXML,
				url: url,
				height: pageHeight-260,
				pageNumber: pageno,
				colWidths: ["20%","8%","8%","8%","8%","8%","8%","8%","8%","8%","8%"],
				onRowSelect: null,
				paging: false,
				sorting: false
		});
		$("#l_gxdw_z").attr('style',"text-align:center;");
		$("#l_zqnxz_z").attr('style',"text-align:center;");
		$("#tr1_z").addClass("grid-header-tr");
		$("#tr2_z").addClass("grid-header-tr");
	}
	
</script>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">场所信息统计</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#detail_csfltj_x").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="detail_csfltj_z" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_csfltj_z" style="width:100%;">
	<table id="table_csfltj_z" width="100%">
	  <thead>
        <tr id="tr1_z">
	         <td id="l_gxdw_z" width="20%" rowspan="2" class="grid-header-bg1">管辖单位</td>
	         <td id="l_zqnxz_z"  width="81%" colspan="10" class="grid-header-bg1">周期内新增</td>
        </tr>
	    <tr id="tr2_z">
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