<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ include file="/public/user-info.jsp" %>
<script type="text/javascript">
var daochuNumdaldd = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
tabletitledalyj = "";
$(document).ready(function() {
	//清空所有要传递的值
	divnidhmdczrzyjcl="GrpfghjjdwyjData";
	tableidhmdyjcl="GrpfghjjdwyjTable";
	pagehmdUrlyj="jdy/grpfghdwcxdal_rdrjbxx.action";
	tableshmd=$("#"+divnidhmdczrzyjcl).html();
	//导出用到参数
	grpfghdwxqdcyj="jdy/querycxdalForExport_rdrjbxx.action";
	excelUrldalyj="jdy/exportExceldalyj_rdrjbxx.action";
	//解决div
	var theadHtmlyj = $("#GrpfghjjdwyjData").find("table:first").find("thead:first");
	theadHtmlyj.find("td").remove();
	tabletitledalyj=theadHtmlyj.html();
	
	//根据姓名关联查询详细信息
	setPageListpfyj(1);
	
	daggleDiv(detailid);
}); 
function setPageListpfyj(pageno,url){	
	    $("#"+divnidhmdczrzyjcl).html(tableshmd);
		params =getSubmitParams("#grpfghdw_yjcl [name*=rdrjbxx.]");
		if (url==null || url=="undefined"){
			url=pagehmdUrlyj;
		}
		var mygrid1 = $("#"+tableidhmdyjcl).ingrid({ 
										onRowSelect:null,
										ingridPageWidth: 900,
										url: url,	
										height: pageHeight-235,
										pageNumber: pageno,
										ingridPageParams: sXML,
										ingridExtraParams:params,
										hideColIndex:[0],
										isPlayResultNull:null,
										changeHref:function(table){
											if($(table).find("tr").length==0){
												$("#fpghjjdwdalyj").hide();//隐藏导出按钮
												daochuNumdaldd = 0;
											}else{
												daochuNumdaldd = 1;
											}	
										},
										colWidths: ["7%","15%","15%","15%","15%","15%","15%","15%","32%","10%"]									
									});				
}	
//处理方法
function grpfghdwyjcl(id){
	sFlag="false";
	jConfirm('确认处理？', '提示信息', function(r) {
    	if(r==true){
    		$.post("jdy/grpfghdwclcz_rdrjbxx.action",{'rdrjbxx.id':id},function(json){ if(json.result == 'success') { setPageListpfyj(1); } },'json');
		}
		else{
		   return false;
		}
	});
}
//导出Excel
function setExportExcelyj(){	
  	if(daochuNumdaldd==1){
  	  params =getSubmitParams("#grpfghdw_yjcl [name*=rdrjbxx.]");
  	  jQuery.post(grpfghdwxqdcyj,params,searchLongBackyj,"json");
  	}else{
  		jAlert("无查询结果不能导出！",'验证信息',null,null);
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBackyj(json){  
    //报表标题
	var bbmcdal="频繁更换单位详情";
	//报表请求
	var surldal=excelUrldalyj+"?tabletitledalyj="+tabletitledalyj+"&bbmcdal="+bbmcdal;
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="grpfghdw_yjcl">
    <input type="hidden" id="cd_gxdwbm" name="rdrjbxx.gxdwbm" value="<%=gxdwbm%>"><!--管辖单位编码-->
    <input type="hidden" id="cd_yjhywlcqbbz" name="rdrjbxx.yjhywlcqbbz" value="YJ"><!--预警、业务流程区别标志-->
	<tr>
		<td height="10"></td>
	</tr>
</table>
<div id="GrpfghjjdwyjData" style="width:100%;">
	<table id="GrpfghjjdwyjTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="">登记序号</th>
	     	<th name="l_xh" datatype="string" sumflag="0">序号</th>
	    	<th name="l_jjr" datatype="string" sumflag="0">寄件人</th>
	    	<th name="l_jjsj" datatype="string" sumflag="0">寄件时间</th>
	    	<th name="l_qymc" datatype="string" sumflag="0">承寄企业</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
	    	<th name="l_sjr" datatype="string" sumflag="0">收件人</th>
	    	<th name="l_sjrdh" datatype="string" sumflag="0">收件人电话</th>
	    	<th name="l_sjrxxdz" datatype="string" sumflag="0">收件人详细地址</th>
	    	<th name="">操作列</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
<table  border="0" align="center"  cellpadding="2"  cellspacing="0">
 	<tr>
 	  <td ><a href="#" class="addbutton" id="fpghjjdwdalyj" onclick='setExportExcelyj()'>导出</a></td>
 	  <td ><a href="#" class="searchbutton" id="qu_erysyj" onclick='$("#grpfghdwcx").hideAndRemove("show");'>返回</a></td>
 	</tr>
</table>


</body>