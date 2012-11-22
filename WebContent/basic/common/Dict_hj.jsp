<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.aisino2.sysadmin.domain.User" %>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.common.DepartmentUtil"%>
<%@ include file="../../public/common.jsp"%>
<%
String path = request.getContextPath();
String dm = request.getParameter("dm");
String mc = request.getParameter("mc");
String code = "";
User user = new User();
user = (User) session.getAttribute(Constants.userKey);
if(user != null){
    String departcode = user.getDepartment().getDepartcode();
    code = departcode.substring(0,2);
}	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="../../public/includeScript.jsp"%>
<html>
<script type="text/javascript">
$().ready(function() {
	$("#hj_fact_value").val("<%=code%>");
	size = parent.$("#"+<%=mc%>);
	dm = <%=dm%>;
	mc = <%=mc%>;
	pageWidth = "100";
	hj_pageUrld="<%=request.getContextPath() %>/sysadmin/queryHj_dict_item.action";
	$("#t_query_simplepin").focus();
	divnidd="tabledatt";
	hj_table = "dictTable";
	hj_tables = "";
	hj_loadPage(divnidd);
	put = "";
	$("#t_query_simplepin").keypress(function(e){
		if(e.which == 13){
			put = $("#t_query_simplepin").val();
			vald(put);
			hj_setPageList(1);
		}
	});
	$("#b_clear").click(function(){
		$("#t_query_simplepin").attr("value","");
		parent.$("#"+dm).attr("value","");
		parent.$("#"+mc).attr("value","");
	});
	parent.$("body").one("click",function(){
		parent.$.fancybox.close();
		$("#link_"+mc).remove();
		return false;
	});
});
function hj_loadPage(divpageid){
	hj_tables=$("#"+divpageid).html();
	hj_setPageList(1);
}

function hj_setList(pageno,url){	
	$("#"+divnidd).html(hj_tables);	
	//createXML("p_");
	if (url==null || url=="undefined"){
		url=hj_pageUrld;
	}
	return url;
}

function hj_setPageList(pageno,url){
	url=hj_setList(pageno,url);
	setParams("hj_");
	var mygrid1 = $("#"+hj_table).ingrid({
		url: url,
		tableid:"dictItemHj",
		height: 180,
		barTopOffset:-(size.offset().top),
		barLeftOffset:-(size.offset().left),
		sorting: false,
        ingridPageParams:sXML,
		pageNumber: pageno,
		isPlayResultNull:false,//查询结果为空时不提示
		onRowSelect: function(tr, selected){
			parent.$("#"+dm).attr("value",$(tr).find("td").eq(1).text());
			parent.$("#"+mc).attr("value",$(tr).find("td").eq(0).text());
			parent.$.fancybox.close();
			$("#link_"+mc).remove();
		},
		colWidths: ["50%","50%"]									
	});	
}

function vald(str){
	var regu =/^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
	if(regu.test(str)){
		$("#hj_fact_value").attr("value","");
		$("#hj_display_name").attr("value",str);
	}else{
		$("#hj_display_name").attr("value","");
		$("#hj_fact_value").attr("value",str);
	}
}
</script>
  <body>
<div id="mybody_dictItemDrop">
<input id='hj_display_name' type='hidden' />
<input id='hj_fact_value' type='hidden' />
<table width="100%" border="0" cellpadding="0" cellspacing="0"  background="<%=path %>/images/toolbar.gif">
    <tr>
    	<td width="85%"  style="text-align:left"><input id='t_query_simplepin' class="inputstyle3" type='text' style="width: 100%"/></td>
    	<td width="15%" style="text-align:center"><img src="<%=path %>/images/clear.gif" width="16" height="16" /><a href="#" id='b_clear' class="fontbutton1">[清除]</a></td>
   	</tr>
</table> 
<div id="tabledatt" style="width:99%;" class="grid_div">
	<table id="dictTable" width="100%" border="1">
	  <thead>
	    <tr>       
	     	<th name="">名称</th>
	     	<th name="">代码</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
</div>
  </body>
</html>
