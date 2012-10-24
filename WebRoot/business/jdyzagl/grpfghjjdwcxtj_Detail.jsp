<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
var daochuNumdal = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
tabletitledal = "";
$(document).ready(function() {
	//清空所有要传递的值
	$("#rdrjbxx_xm").val("");
	$("#cd_kssj").val("");
	$("#cd_jssj").val("");
	$("#cd_gxdwbm").val("");
	$("#rdrjbxx_xm").val(dataid);//姓名
	$("#cd_kssj").val($("#rdrjbxx_pjtbsjf1").val());//开始时间
	$("#cd_jssj").val($("#rdrjbxx_pjtbsjt1").val());//结束时间
	$("#cd_gxdwbm").val($("#rdrjbxx_gxdwbm").val());//管辖单位编码
	divnidhmdczrz="QczlhmdczrzData";
	tableidhmd="QczlhmdczrzTable";
	pagehmdUrl="jdy/grpfghdwcxdal_rdrjbxx.action";
	tableshmd=$("#"+divnidhmdczrz).html();
	//导出用到参数
	grpfghdwxqdc="jdy/querycxdalForExport_rdrjbxx.action";
	excelUrldal="jdy/exportExceldal_rdrjbxx.action";
	//解决div
	var theadHtml = $("#QczlhmdczrzData").find("table:first").find("thead:first");
	theadHtml.find("td").remove();
	tabletitledal=theadHtml.html();
	
	//根据姓名关联查询详细信息
	setPageListhmdczrz(1);
	
	daggleDiv(detailid);
}); 
function setPageListhmdczrz(pageno,url){	
		params =getSubmitParams("#grpfghdwcxgad_detail [name*=rdrjbxx.]");
		if (url==null || url=="undefined"){
			url=pagehmdUrl;
		}
		var mygrid1 = $("#"+tableidhmd).ingrid({ 
										onRowSelect:null,
										ingridPageWidth: 900,
										url: url,	
										height: pageHeight-235,
										pageNumber: pageno,
										ingridPageParams: sXML,
										ingridExtraParams:params,
										hideColIndex:[0],
										changeHref:function(table){
											if($(table).find("tr").length==0){
											    daochuNumdal = 0;
											}else{
											    daochuNumdal = 1;
											}	
										},
										colWidths: ["7%","15%","15%","15%","15%","15%","15%","15%","32%"]									
									});				
}	
//导出Excel
function setExportExceldal(){	
  	if(daochuNumdal==1){
  	  params =getSubmitParams("#grpfghdwcxgad_detail [name*=rdrjbxx.]");
  	  jQuery.post(grpfghdwxqdc,params,searchLongBackdal,"json");
  	}else{
  		jAlert("无查询结果不能导出！",'验证信息',null,null);
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBackdal(json){  
    //报表标题
	var bbmcdal="频繁更换单位详情";
	//报表请求
	var surldal=excelUrldal+"?tabletitledal="+tabletitledal+"&bbmcdal="+bbmcdal;
	surldal=encodeURI(surldal);
	location.href = surldal;
}
</script>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">个人寄件时频繁更换单位详情</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#grpfghdwcx").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%">
	<tr height="10">
	<td></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="grpfghdwcxgad_detail">
    <input type="hidden" id="rdrjbxx_xm" name="rdrjbxx.xm" value=""><!--主页面传递过来的姓名 -->
    <input type="hidden" id="cd_kssj" name="rdrjbxx.kssj" value=""><!--主页面传递过来的开始时间 -->
    <input type="hidden" id="cd_jssj" name="rdrjbxx.jssj" value=""><!--主页面传递过来的结束时间 -->
    <input type="hidden" id="cd_gxdwbm" name="rdrjbxx.gxdwbm" value=""><!--主页面传递过来的管辖单位编码-->
	<tr>
		<td height="10"></td>
	</tr>
</table>
<div id="QczlhmdczrzData" style="width:100%;">
	<table id="QczlhmdczrzTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="">登记序号</th>
	     	<th name="l_xh" datatype="string" sumflag="0">序号</th>
	    	<th name="l_jjrxm" datatype="string" sumflag="0">寄件人</th>
	    	<th name="l_jjsj" datatype="string" sumflag="0">寄件时间</th>
	    	<th name="l_cjqy" datatype="string" sumflag="0">承寄企业</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
	    	<th name="l_sjrxm" datatype="string" sumflag="0">收件人</th>
	    	<th name="l_sjrdh" datatype="string" sumflag="0">收件人电话</th>
	    	<th name="l_sjrxxdz" datatype="string" sumflag="0">收件人详细地址</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
<table  border="0" align="center"  cellpadding="2"  cellspacing="0">
 	<tr>
 	  <td ><a href="#" class="addbutton" id="fpghjjdwdal" onclick='setExportExceldal()'>导出</a></td>
 	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick='$("#grpfghdwcx").hideAndRemove("show");'>返回</a></td>
 	</tr>
</table>


</body>