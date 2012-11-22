<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
	var skjl_tables="";
	var skjl_pageUrl="icksystem/querylistCsrzSkjl_qyryskjl.action";
	var skjl_divnid="tabledata";
	var skjl_tableid="table1";
	var skjl_detailHtml="basic/publicsystem/QyryskjlDetail.jsp";
	var skjl_detailid="csryskjl_detail";
	var skjl_detailUrl="icksystem/query_qyryskjl.action";
	var skjl_detailWidth="300";
	
	$(document).ready(function(){
		
		var temp=qyjbxx_dataid.split("__");
		$("#s_qybm").val(temp[0]);
		$("#s_sksjf").val(temp[1]);
		$("#s_sksjt").val(temp[1]);
		
		if($("#p_hylbdm").val()!="J"){
			$('body').find('div [@id=qy]').each(function(){
				$(this).show();
			});
			$('body').find('div [@id=cs]').each(function(){
				$(this).hide();
			});
		}
		
		skjl_loadPage("tabledata");
		skjl_setPageList(1);
	});
	
	function skjl_setPageList(pageno,url){	
		url=skjl_setList(pageno,url);
		var mygrid1 = $("#"+skjl_tableid).ingrid({ 
							url: url,
							ingridPageParams:sXML,
							ingridPageWidth: 990,
							height: 250,
							pageNumber: pageno,
							onRowSelect: function(tr, selected){  },
							hideColIndex: [3],
							colWidths: ["20%","20%","20%","0%","20%","20%"]
					});				
	}
	function skjl_loadPage(divpageid){
		skjl_tables=$("#"+divpageid).html();
		$("#"+skjl_detailid).hide(); 	
		skjl_setPageList(1,'#');
	}
	function skjl_setList(pageno,url){	
		$("#"+skjl_divnid).html(skjl_tables);
		setParams("s_");
		if (url==null || url=="undefined"){
			url=skjl_pageUrl;
		}
		return url;
	}
	function meclose(){
		$("#ylcsjbxx_detail").hideAndRemove("show");
		$("#ylcsjbxx_detail").empty();
	}
	
	// 导出Excel
	function setExportExcel_skjl(){ 
	    if(manVerify()){
		    //excel表头与skcstj_table不一致，手动生成
		    var result = "<tr>";
		    result += "<th name='l_xmzc' datatype='String'>注册人员</th>";
		    result += "<th name='l_xmfzc' datatype='String'>非注册人员</th>";
		    result += "<th name='l_cyrybh' datatype='String'>从业人员编号</th>";
		    result += "<th name='l_sksj' datatype='Date'>刷卡时间</th>";
		    result += "<th name='l_scsj' datatype='Date'>入库时间</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong_skjl();
		}
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong_skjl(){
		setParams("s_");
		jQuery.post("icksystem/querylistCsrzSkjlExcelTemp_qyryskjl.action",params,searchLongBack_skjl,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数

	function searchLongBack_skjl(json){  
		//报表标题
		var bbmc="刷卡统计未上传场所";
		//报表请求
		setExcelLong_skjl("skjlExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong_skjl(excelid,bbmc){
		var surl="icksystem/querylistCsrzSkjlExcel_qyryskjl.action"+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
</script>
</head>
<body>
<input type="hidden" id="s_qybm">
<input type="hidden" id="s_sksjf">
<input type="hidden" id="s_sksjt">
<input type="hidden" id="d_skxxtjmxid">
<div id="qyxxClose"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" id="isHaveClose">
    <tr>
      <td align="left" class="title1" id="cs">场所刷卡记录</td>
      <td align="left" class="title1" id="qy" style="display:none">企业刷卡记录</td>
      <td align="right" class="title1"><a href="#" onclick="$('#qyxxClose').parent().hideAndRemove(&quot;show&quot;);" class="close"></a></td>
    </tr>
    <tr>
      <td>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
	</table>
      </td>
    </tr>
</table>

<div id="csryskjl_detail"  class="page-layout" src="#"
		style="top:180px; left:160px; width:500px;">
</div>
<table  width="90%"  border="0" cellpadding="0"  cellspacing="0">
    <tr>
      <td align="right" ><a href="#" class="exceldcbutton" id="skjlExcel" onClick="setExportExcel_skjl();">导出</a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>
	     	<th name="l_xmzc">注册人员</th>
	     	<th name="l_xmfzc">非注册人员</th>
	     	<th name="l_scyrybh">从业人员编号</th>
	     	<th name="l_lxdh">联系电话</th>
	     	<th name="l_sksj">刷卡时间</th>
	     	<th name="l_scsj">入库时间</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>