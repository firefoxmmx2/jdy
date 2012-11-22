<%@ page language="java" pageEncoding="UTF-8"%>

<%@include file="/public/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
$(document).ready(function() {
	dzAddressid = "";
	dzJlxid = "";
	dzxzid = "";
	dz_pageUrl="sysadmin/querylist_addressdetail.action";
	dz_divnid="AddressdetailData";
	dz_tableid="AddressdetailTable";
	addUrl="sysadmin/insert_addressdetail.action";
	addHtml="business/sysadmin/AddressdetailAdd.jsp";
	delUrl="sysadmin/delete_addressdetail.action";
	modHtml="business/sysadmin/AddressdetailModify.jsp";
	modUrl="sysadmin/modify_addressdetail.action";
	detailHtml="business/sysadmin/AddressdetailDetail.jsp";
	detailid="addressdetail_detail";
	detailUrl="sysadmin/query_addressdetail.action";
	dztree = new dhtmlXTreeObject("dzAddress", "100%", "100%", 0);
	dztree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	dztree.setOnClickHandler(dzdoOnClick);
	dztree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadmin/nextAddress_tree.action");
	dztree.loadXML("<%=request.getContextPath()%>/sysadmin/addressTree_tree.action");
	dz_loadPage(dz_divnid);
	
	$("a#link_jlx").fancybox({
		'width'			: 400,
		'height'		: 255,
		'overlayShow'	: false,
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic',
		'type'			: 'iframe'
	});
	$("#dz_jlxmc").bind("click",function(){
		if(addressid == ""){
			alert("请先选择行政区划!");
			return false;
		}
		$("#link_jlx").click();
		return false;
	});
}); 

function dzdoOnClick(itemId){//点击事件
	$("#dz_addressid").val(itemId);
	dzAddressid = itemId;
}

function dz_loadPage(divpageid){
	dz_tables=$("#"+divpageid).html();
	dz_setPageList(1,"#");
}

function dz_setList(pageno,url){
	$("#"+dz_divnid).html(dz_tables);
	createXML("dz_");
	if (url==null || url=="undefined"){
		url=dz_pageUrl;
	}
	return url;
}

function dz_query(){
	if (!checkControlValue("dz_jlxmc","String",1,100,null,1,"街路巷名称"))
		return false;
	dz_setPageList(1);
}

function dz_setPageList(pageno,url){	
	if (dz_manVerify()){
		url=dz_setList(pageno,url);
		setParams("dz_");
		var mygrid1 = $("#"+dz_tableid).ingrid({ 
										url: url,	
										height: ingrid2,
                                        ingridPageParams:sXML,
										pageNumber: pageno,
										isPlayResultNull:false,//查询结果为空时不提示
										onRowSelect: function(tr, selected){},
										colWidths: ["30%","50%","20%"]									
									});				
		}
}	
	function dz_manVerify(){
		if (!checkControlValue("dz_dzxzmc","String",1,100,null,0,"地址名称"))
			return false;
		return true;
	}
	
function dz_add(){
	if (!checkControlValue("dz_jlxmc","String",1,100,null,1,"街路巷名称"))
		return false;
	dzJlxid = $("#dz_jlxid").val();
	pt="add";
	iframeheight="120";
	url="<%=request.getContextPath() %>/basic/sysadmin/AddressdetailAdd.jsp";
	return GB_showCenter("地址信息添加","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",160,580);
}

function dz_modify(dzid){
	dzxzid = dzid;
	pt="modzx";
	iframeheight="120";
	url="<%=request.getContextPath() %>/basic/sysadmin/AddressdetailModify.jsp";
	return GB_showCenter("地址信息修改","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",160,580);
}

function dz_delete(dzid){
	if(confirm("您确定要删除该数据么？")){
		$("#del_dzxzid").val(dzid);
		setParams("del_");
		$.ajax({
			type: 'POST',
			url: "<%=request.getContextPath()%>/sysadmin/delete_addressdetail.action",
			data: params,
			async: false,
			dataType: 'json',
			success: function(fhz){
				if(fhz.result=="success"){
					dz_setPageList(1);
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
	
<input type="hidden" id="dz_jlxid"/>
<input type="hidden" id="dz_addressid"/>
<input type="hidden" id="del_dzxzid"/>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
<td width="20%" height="100%" valign="top">
<div id="dzAddress"  style="width:100%;height:100%;background-color:#f5f5f5;border :1px solid Silver;  overflow:auto;float:left;">
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
					<td width="10%" class="red">街路巷名称</td>
					<td width="23%" class="pagetd"><input type="text" id="dz_jlxmc" class="inputstyle" readonly="readonly" onclick="">
					<a id="link_jlx" style='display: none;' href="<%=request.getContextPath()%>/basic/sysadmin/JlxList.jsp"></a></td>
					<td width="10%" class="pagedistd">地址代码</td>
					<td width="23%" class="pagetd"><input type="text" id="dz_dzxzdm" class="inputstyle"></td>
					<td width="10%" class="pagedistd">地址名称</td>
					<td width="23%" class="pagetd"><input type="text" id="dz_dzxzmc" class="inputstyle"></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td width="50%" ><a href="#" class="searchbutton" id="querys" onclick="dz_query();">查询</a></td>
    		    	  <td width="50%" ><a href="#" class="addbutton" onclick="dz_add()">添加</a></td>
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
<div id="AddressdetailData" style="width:100%;">
	<table id="AddressdetailTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_dzdm">地址代码</th>
	     	<th name="l_dzmc">地址名称</th>
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