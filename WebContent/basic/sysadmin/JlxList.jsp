<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>
<html>
<script type="text/javascript">
$().ready(function() {
	$("#t_query_jlx").focus();
	jlx_pageUrld="<%=request.getContextPath() %>/sysadmin/queryJlxList_jlxxx.action";
	$("#jlx_addressid").val(parent.dzAddressid);
	divnidd="tabledatt";
	jlx_table = "dictTable";
	put = "";
	jlx_loadPage(divnidd);
	$("#t_query_jlx").keypress(function(e){
		if(e.which == 13){
			put = $("#t_query_jlx").val();
			vald(put);
			jlx_setPageList(1);
		}
	});
	$("#b_clear").click(function(){
		$("#t_query_jlx").attr("value","");
		parent.$("#dz_jlxid").attr("value","");
		parent.$("#dz_jlxmc").attr("value","");
	});
	parent.$("body").one("click",function(){
		parent.$.fancybox.close();
		return false;
	});
});

function vald(str){
	var reg=/^\d+$/;
	if(!reg.test(str)){
		$("#jlx_jlxdm").attr("value","");
		$("#jlx_jlxmc").attr("value",str);
	}else{
		$("#jlx_jlxmc").attr("value","");
		$("#jlx_jlxdm").attr("value",str);
	}
}

function jlx_loadPage(divpageid){
	jlx_tables=$("#"+divpageid).html();
	jlx_setPageList(1);
}

function jlx_setList(pageno,url){	
	$("#"+divnidd).html(jlx_tables);	
	createXML("jlx_");
	if (url==null || url=="undefined"){
		url=jlx_pageUrld;
	}
	return url;
}

function jlx_setPageList(pageno,url){
	url=jlx_setList(pageno,url);
	var mygrid1 = $("#"+jlx_table).ingrid({
		url: url,
		tableid:"dictItemMj",
		height: 180,
		ingridPageWidth:400,
		sorting: false,
        ingridPageParams:sXML,
		pageNumber: pageno,
		hideColIndex:[0],
		isPlayResultNull:false,//查询结果为空时不提示
		onRowSelect: function(tr, selected){
			parent.$("#dz_jlxid").attr("value",$(tr).find("td").eq(0).text());
			parent.$("#dz_jlxmc").attr("value",$(tr).find("td").eq(2).text());
			parent.$("body").click();
		},
		colWidths: ["","60%","40%"]									
	});	
}
</script>

  <body>
<input id='jlx_jlxdm' type='hidden' />
  <input id='jlx_jlxmc' type='hidden' />
<input id='jlx_addressid' type='hidden' />
<table width="100%" border="0" cellpadding="0" cellspacing="0"  background="<%=request.getContextPath()%>/images/toolbar.gif">
    <tr>
    	<td width="85%"  style="text-align:left"><input id='t_query_jlx' class="inputstyle3" type='text' style="width: 100%"/></td>
    	<td width="15%" style="text-align:center"><img src="<%=request.getContextPath()%>/images/clear.gif" width="16" height="16" /><a href="#" id='b_clear' class="fontbutton1">[清除]</a></td>
   	</tr>
</table> 
<div id="tabledatt" style="width:99%;" class="grid_div">
	<table id="dictTable" width="100%" border="1">
	  <thead>
	    <tr> 
	    	<th name="jlxid">ID</th> 
	     	<th name="jlxdm">街路巷代码</th>
	     	<th name="jlxmc">街路巷名称</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
  </body>
</html>
