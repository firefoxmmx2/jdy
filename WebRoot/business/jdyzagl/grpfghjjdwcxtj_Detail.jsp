<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#rdrjbxx_xm").val(dataid);
	daggleDiv(grpfghdwcx);
	divnidhmdczrz="QczlhmdczrzData";
	tableidhmd="QczlhmdczrzTable";
	pagehmdUrl="jdy/grpfghdwcxdal_rdrjbxx.action";
	tableshmd=$("#"+divnidhmdczrz).html();
	$("#grpfghdwcx").hide(); 	
	//根据姓名关联查询详细信息
	setPageListhmdczrz(1);
}); 
function setPageListhmdczrz(pageno,url){	
		params =getSubmitParams("#grpfghdwcxgad_detail [name*=rdrjbxx.]");
		if (url==null || url=="undefined"){
			url=pagehmdUrl;
		}
		var mygrid1 = $("#"+tableidhmd).ingrid({ 
										ingridPageWidth: 900,
										url: url,	
										height: pageHeight-235,
										pageNumber: pageno,
										ingridPageParams: sXML,
										ingridExtraParams:params,
										hideColIndex:[0],
										colWidths: ["7%","15%","15%","15%","15%","15%","15%","15%","32%"]									
									});				
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
	<tr>
		<td height="10"></td>
	</tr>
</table>
<div id="QczlhmdczrzData" style="width:100%;">
	<table id="QczlhmdczrzTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_djxh" datatype="string" sumflag="0">登记序号</th>
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
 	  <td ><a href="#" class="addbutton" id="jdywxx" onclick=''>导出</a></td>
 	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick='$("#grpfghdwcx").hideAndRemove("show");'>返回</a></td>
 	</tr>
</table>


</body>