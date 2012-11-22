<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../../public/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		
<script type="text/javascript">
$().ready(function() {
	aid = "";
	parentid = "";
	parentName = "";
	level = "";
	isleaf = "";
	adr_divnid="adr_tabledata";
	adr_tableid="adr_table1";
	adr_tables="";
	adr_pageUrl="sysadmin/querylist_address.action";
	adrtree = new dhtmlXTreeObject("adr", "100%", "100%", 0);
	adrtree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	adrtree.setOnClickHandler(adrdoOnClick);
	adrtree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadmin/nextAddress_tree.action");
	adrtree.loadXML("<%=request.getContextPath()%>/sysadmin/addressTree_tree.action");
	adr_loadPage(adr_divnid);
});


function adr_loadPage(divpageid){
	adr_tables=$("#"+divpageid).html();
	adr_setPageList(1,"#");
}

function adr_setList(pageno,url){
	$("#"+adr_divnid).html(adr_tables);
	createXML("adr_");
	if (url==null || url=="undefined"){
		url=adr_pageUrl;
	}
	return url;
}

function adr_setPageList(pageno,url){
	url=adr_setList(pageno,url);
	setParams("adr_");
	var mygrid1 = $("#"+adr_tableid).ingrid({
		url: url,
		height: ingrid1+10,
        ingridPageParams:sXML,
		pageNumber: pageno,
		isPlayResultNull:false,//查询结果为空时不提示
		onRowSelect: function(tr, selected){},
		colWidths: ["30%","30%","40%"]									
	});	
}
function adrdoOnClick(itemId){//点击事件
	parentid = itemId;
	$("#adr_addressid").val(itemId);
	level = adrtree.getUserData(itemId,"levle");
	isleaf = adrtree.getUserData(itemId,"isleaf");
}

function nextItem(itemId,mode){//查找下级节点
	if(mode<1){
		departid = itemId;
		adrtree.deleteChildItems(itemId);
		ajaxQuery(departid);
	}
		
}
/**
function ajaxQuery(departid){
	parentid = '<Params><Param name="parentdepartid">'+departid+'</Param></Params>';
	$.ajax({
		type: 'POST',
		url: "<%=request.getContextPath()%>/sysadmin/nextTree_ldrk_tree.action",
		data: {dataxml:parentid},
		async: true,
		dataType: 'json',
		success: function(result){
			//eval(result.tempTree);
			var rjson = result.list;
			//alert(rjson.length);
            if(rjson.length>0){
                for (var i = 0; i < rjson.length; i++) {
                   var obj= rjson[i];  
				   //alert(obj.parentdepartid);
                   tree.insertNewChild(obj.parentdepartid,obj.departid,obj.departname,0,0,0,0);
                   if(obj.isleaf == 'N'){
                	   tree.insertNewChild(obj.departid,77777777+i,0,0,0,0);
                   	   childImage(obj.departid,1);
                   }else{
                	   childImage(obj.departid,0);
                   	   closeItem(obj.departid);
                   }
                }
            }
		}
	});
}
**/
function childImage(id,flag){
	if(flag == 1)
		adrtree.setItemImage(id, 'books_close.gif', 'books_open.gif', 'books_close.gif');
	else
		adrtree.setItemImage(id, 'book.gif', 'book.gif', 'book.gif');
}

function detail(id){
	aid = id;
	return GB_showCenter("地址信息详细","<%=request.getContextPath() %>/basic/sysadmin/AddressDetail_xtgl.jsp",160,280);
}

function modify(id){
	aid = id;
	if(aid == 1){
		alert("顶级节点不允许修改!");
		return false;
	}
	parentid = $("#adr_addressid").val();
	pt='modzx';
	iframeheight="180";
	url="<%=request.getContextPath() %>/basic/sysadmin/AddressModify.jsp";
	return GB_showCenter("地址信息修改","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",220,580); 
}

function del(id){
	var leaf = adrtree.getUserData(id,"isleaf");
	if(leaf == "N"){
		jAlert("该节点有下级信息，不能删除！");
	}else if(confirm("您确定要删除该数据么？")){
		addressid = '<Params><Param name="addressid">'+id+'</Param></Params>';
		$.ajax({
			type: 'POST',
			url: "<%=request.getContextPath()%>/sysadmin/delete_address.action",
			data: {dataxml:addressid},
			async: false,
			dataType: 'json',
			success: function(fhz){
				if(fhz.result=="success"){
					adr_setPageList(1);
					leftTree();
					alert("删除成功");
				}else if(fhz.result=="fail"){
					alert("无法删除根节点");
				}
			}
		});
	}
}

function addNext(){
	if(level > 11){
		jAlert("该地址无法添加下级！","提示信息");
		return false;
	}
	parentid = $("#adr_addressid").val();
	parentName = adrtree.getSelectedItemText();
	pt='add';
	iframeheight="180";
	url="<%=request.getContextPath() %>/basic/sysadmin/AddressAdd.jsp";
	return GB_showCenter("地址信息添加","<%=request.getContextPath() %>/business/ldrksystem/common/iframe.jsp",220,580);
}

function leftTree(){
	adrtree.refreshItem(parentid);
}
</script>

<html>
  <body>
<input type="hidden" id="adr_addressid">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
<td width="20%" height="100%" valign="top">
<div id="adr"  style="width:100%;height:100%;background-color:#f5f5f5;border :1px solid Silver;  overflow:auto;float:left;">
</div>
</td>
<td width="1%" height="100%"></td>
<td width="79%" height="100%" valign="top">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
		<tr>
            <td class="queryfont">地址管理</td>
        </tr>
          <tr>
            <td class="tdbg"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="10%" class="pagedistd">地址代码</td>
                  <td width="16%" class="pagetd"><input type="text" class="inputstyle"  id="adr_addresscode"></td>
                  <td width="10%" class="pagedistd">地址名称</td>
                  <td width="16%" class="pagetd"><input type="text" class="inputstyle"  id="adr_addressname"></td>
                  <td>
                  <table width="46%" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="45%" ><a href="#" class="searchbutton" id="querys" onClick="adr_setPageList(1);">查询</a></td>
                  <td width="55%" id="button"><a href="#" class="fivefontbutton"  onclick='addNext();'>添加下一级</a></td>
                </tr>
              </table>
                  </td>
              </tr>
            </table></td>
        </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<div id="adr_tabledata" width="100%" class="grid_div">
	<table id="adr_table1" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_addresscode">地址代码</th>
            <th name="l_addressname">地址名称</th>
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
