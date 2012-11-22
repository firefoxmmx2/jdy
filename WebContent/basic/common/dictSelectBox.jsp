<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
var detailidTopOffset,detailidLeftOffset;
var ylcsjbxx_detailidOffset = $("#divs_" + gmcId).offset();		
detailidTopOffset=ylcsjbxx_detailidOffset.top;
detailidLeftOffset=ylcsjbxx_detailidOffset.left;

pageUrld="<%=request.getContextPath() %>/sysadmin/queryForDict_dict_item.action";
tabled=$("#dictTableData").html();

$(document).ready(function() {
	setDictPageList(1,pageUrld);
}); 

var mygrid1d;
function setDictPageList(pageno,url){
        $("#dictTableData").html(tabled);
		$("#t_dict_code").val(gdictCode);
		createXML("t_");
		mygrid1d = $("#dictTable").ingrid({ 
										ingridPageParams:sXML, 
										tableid:"dictItemTable",
										prefix:"t_",
										ingridPageWidth:150,
										barTopOffset:-(detailidTopOffset),
										barLeftOffset:-(detailidLeftOffset),
										url:url,	
										height: 150,
										sorting: false,
										paging: false,
										pageNumber: pageno,
										ingridPageRows:100,
										isPlayResultNull:false,//查询结果为空时不提示
										changeHref:function(table){
										    var row  = table.find('tr:first');
										    row.before('<TR><TD></TD><TD></TD><TD></TD><TD></TD></TR>');
										},
										onRowSelect:function(tr){
											xuanzhongzhi(tr);
											$("#divs_" + mcId).remove();
										},
										hideColIndex:[1,2,3],
										colWidths: ["100%","0%","0%","0%"]
									});		
}	

//选中值
function xuanzhongzhi(tr){
	mcId = gmcId;
	dmId = gdmId;
	mcva=$(tr).find("td").eq(0).text();
	dmva=$(tr).find("td").eq(3).text();
	$("#" + dmId).attr("value",dmva);
	$("#" + mcId).attr("value",mcva);
}
</script>
</head>
<body>
<div id="dictTableData" style="width:100%;">
	<table id="dictTable" width="100%" border="0">	
	</table>	
</div>
</body>
</html>
