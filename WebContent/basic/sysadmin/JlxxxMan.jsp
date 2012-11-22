<%@ page language="java" pageEncoding="UTF-8"%>

<%@include file="/public/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
$(document).ready(function() {
	jlxAddressid = "";
	jlx_divnid="JlxxxData";
	jlx_tableid="JlxxxTable";
	jlx_pageUrl="sysadmin/querylist_jlxxx.action";
	delUrl="sysadmin/delete_jlxxx.action";
	modHtml="business/sysadmin/JlxxxModify.jsp";
	modUrl="sysadmin/modify_jlxxx.action";
	detailHtml="business/sysadmin/JlxxxDetail.jsp";
	detailUrl="sysadmin/query_jlxxx.action";
	jlxtree = new dhtmlXTreeObject("jlxAddress", "100%", "100%", 0);
	jlxtree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	jlxtree.setOnClickHandler(jlxdoOnClick);
	jlxtree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadmin/nextAddress_tree.action");
	jlxtree.loadXML("<%=request.getContextPath()%>/sysadmin/addressTree_tree.action");
	jlx_loadPage(jlx_divnid);
}); 

function jlx_loadPage(divpageid){
	jlx_tables=$("#"+divpageid).html();
	jlx_setPageList(1,"#");
}

function jlxdoOnClick(itemId){//点击事件
	$("#jlx_addressid").val(itemId);
	jlxAddressid = itemId;
}

function jlx_setList(pageno,url){
	$("#"+jlx_divnid).html(jlx_tables);
	createXML("jlx_");
	if (url==null || url=="undefined"){
		url=jlx_pageUrl;
	}
	return url;
}
	
function jlx_setPageList(pageno,url){	
		url=jlx_setList(pageno,url);
		setParams("jlx_");
		var mygrid1 = $("#"+jlx_tableid).ingrid({ 
										url: url,	
										height: ingrid2,
                                        ingridPageParams:sXML,
										pageNumber: pageno,
										isPlayResultNull:false,//查询结果为空时不提示
										onRowSelect: function(tr, selected){},
										colWidths: ["25%","25%","50%"]									
									});				
}

function jlx_add(){
	if(jlxAddressid == ""){
		alert("请选择行政区划地址！");
		return false;
	}
	pt="add";
	iframeheight="120";
	url="<%=request.getContextPath() %>/basic/sysadmin/JlxxxAdd.jsp";
	return GB_showCenter("街路巷信息添加","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",160,580);
}

function jlx_modify(jlxid){
	dataid = jlxid;
	pt="modzx";
	iframeheight="120";
	url="<%=request.getContextPath() %>/basic/sysadmin/JlxxxModify.jsp";
	return GB_showCenter("街路巷信息修改","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",160,580);
}

function jlx_delete(jlxid){
	if(confirm("您确定要删除该数据么？")){
		$("#del_jlxid").val(jlxid);
		setParams("del_");
		$.ajax({
			type: 'POST',
			url: "<%=request.getContextPath()%>/sysadmin/delete_jlxxx.action",
			data: params,
			async: false,
			dataType: 'json',
			success: function(fhz){
				if(fhz.result=="success"){
					jlx_setPageList(1);
					alert("删除成功!");
				}else{
					alert("删除失败!");
				}
			}
		});
	}
}
</script>

<body>
<input type="hidden" id="jlx_addressid"/>
<input type="hidden" id="del_jlxid"/>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
<td width="20%" height="100%" valign="top">
<div id="jlxAddress"  style="width:100%;height:100%;background-color:#f5f5f5;border :1px solid Silver;  overflow:auto;float:left;">
</div>
</td>
<td width="1%" height="100%"></td>
<td width="79%" height="100%" valign="top">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">查询选项</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="10%" class="pagedistd">街路巷代码</td>
					<td width="23%" class="pagetd"><input type="text" id="jlx_jlxdm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">街路巷名称</td>
					<td width="23%" class="pagetd"><input type="text" id="jlx_jlxmc" class="inputstyle" value=""></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td width="50%" ><a href="#" class="searchbutton" id="querys" onclick="jlx_setPageList(1);">查询</a></td>
    		    	  <td width="50%" ><a href="#" class="addbutton" onclick='jlx_add()'>添加</a></td>
    		    	</tr>
    		  	</table>
    		  </td>
    		</tr>
    	</table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="JlxxxData" style="width:100%;" class="grid_div">
	<table id="JlxxxTable" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_jlxdm">街路巷代码</th>
	     	<th name="l_jlxmc">街路巷名称</th>
				<th name="">操作</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
</td>
</tr>
</table>
</body>
</html>