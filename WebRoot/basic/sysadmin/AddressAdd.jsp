<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>

<script type="text/javascript">
var acc=false;
$().ready(function() {
	dhxLayout = new dhtmlXLayoutObject("addressAdd", "2U");
	dhxLayout.cells("a").hideHeader();
	dhxLayout.cells("b").hideHeader();
	dhxLayout.cells("a").setWidth("200");
	dhxLayout.cells("a").fixSize(true,true);
	dhxTree = dhxLayout.cells("a").attachTree();
	dhxTree.setImagePath("<%=request.getContextPath()%>/images/tree/");
	dhxTree.setXMLAutoLoading("<%=request.getContextPath()%>/sysadminDefault/deptTree_tree.action");
	dhxTree.loadXML("<%=request.getContextPath()%>/sysadminDefault/deptTree_tree.action");
	dhxTree.enableDragAndDrop(1);
	dhxTree.setOnClickHandler(addressdoOnClick);
	dhxLayout.cells("b").attachObject("objId");
	$("#ins_parentaddressname").val(parent.parent.parent.parentName);
	$("#ins_parentaddressid").val(parent.parent.parent.parentid);
	$("#ins_isleaf").val(parent.parent.parent.isleaf);
	$("#ins_addresslevel").val(parseInt(parent.parent.parent.level)+1);
	addr_insertUrl="<%=request.getContextPath()%>/sysadmin/insert_address.action";
});

function addressdoOnClick(itemId){//点击事件
	$("#ins_departid").val(itemId);
	$("#ins_departname").val(dhxTree.getSelectedItemText());
}

function add(){
	if(address_addVerify()){
		setParams("ins_");
		parent.jQuery('#iframe_addbutton').attr("disabled","true");
		jQuery.post(addr_insertUrl,params,addr_addback,'json');
	}
}

function addr_addback(json){
	if  (json.result=="success"){
		alert("添加成功！");
		parent.parent.parent.leftTree();
		parent.parent.parent.adr_setPageList(1);
		if(parent.sfbchjxxzz==1){
			location.reload();
			parent.jQuery('#iframe_addbutton').attr("disabled","");
		}else{
			parent.parent.parent.GB_hide();
		}
	}else{
		alert("添加失败！");
	}
}

function address_addVerify(){
	if (!checkControlValue("ins_addressname","String",1,100,null,1,"地址名称"))
		return false;
	if (!checkControlValue("ins_addresscode","String",1,40,null,0,"地址代码"))
		return false;
	if (!checkControlValue("ins_departid","Integer",-999999999,999999999,null,1,"所属机构"))
		return false;
	if(acc!=true){
		return false;
	}
	return true;
}

function valadateAddresscode(){ //验证地址代码
	if($("#ins_addresscode").val()!=''){
		setParams("ins_");
		var sUrl="<%=request.getContextPath() %>/sysadmin/validateCode_address.action";
		jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){						
				var rows  = eval(result);
				valadateAddresscodeBack(rows);
			}
		});
	}
}

function valadateAddresscodeBack(json){
	if(json.tabledata=="1"){
		alert('此地址代码已存在!');
		$("#ins_addresscode").attr("value","");
	}else{
		acc = true;
	}
}
</script>
<html>
  <body>
<input type="hidden" id="ins_parentaddressid"/>
<input type="hidden" id="ins_isleaf"/>
<input type="hidden" id="ins_departid"/>

<div id="addressAdd" style="position: relative;width: 91%; height: 100%; overflow: auto; aborder: #B5CDE4 1px solid;"></div>
<div id="objId" style="width: 100%; height: 100%; display: none;">
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr>
    <td width="45%" class="wdtd_ordinary">地址代码</td>
    <td width="55%" class="wdtd_input">
    <input type="text" class="inputstyle"  id="ins_addresscode" onblur="valadateAddresscode();"/></td>
  </tr>
   <tr>
    <td class="wdtd_must">地址名称</td>
    <td class="wdtd_input"><input type="text" class="inputstyle"  id="ins_addressname"/></td>
  </tr>
	<tr>
    <td class="wdtd_ordinary">地址层次</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="ins_addresslevel" readonly="readonly"/></td>
  </tr>
	<tr>
    <td class="wdtd_ordinary">上级地址</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="ins_parentaddressname" readonly="readonly"/></td>
  </tr>
	<tr>
    <td class="wdtd_must">所属机构</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="ins_departname" readonly="readonly"/></td>
  </tr>
</table>
</div>
  </body>
</html>
