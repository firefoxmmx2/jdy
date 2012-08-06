<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>

<script type="text/javascript">
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
	addressid = "";
	oldAddressCode = "";
	oldAddressName = "";
	oldDepartid = "";
	mod_levle = "";
	$("#mod_addressid").val(parent.parent.parent.aid);
	addr_detailUrl="<%=request.getContextPath()%>/sysadmin/query_address.action";
	addr_modifyUrl="<%=request.getContextPath()%>/sysadmin/modify_address.action";
	addr_setDetail();
});

function addr_setDetail(){
	setParams("mod_");
	jQuery.post(addr_detailUrl,params,addr_Detail,"json");
}

function addr_Detail(json){
	$("#mod_addresscode").attr("value",setNull(json.LAddress[0].addresscode));
	$("#mod_oldAddressCode").attr("value",setNull(json.LAddress[0].addresscode));
	$("#mod_addressname").attr("value",setNull(json.LAddress[0].addressname));
	$("#mod_addresslevel").attr("value",setNull(json.LAddress[0].addresslevel));
	$("#mod_parentaddressname").attr("value",setNull(json.LAddress[0].parentaddressname));
	$("#mod_departname").attr("value",setNull(json.LAddress[0].departname));
	$("#mod_departid").attr("value",setNull(json.LAddress[0].departid));
	oldAddressCode = setNull(json.LAddress[0].addresscode);
	oldAddressName = setNull(json.LAddress[0].addressname);
	oldDepartid = setNull(json.LAddress[0].departid);
	mod_levle = setNull(json.LAddress[0].addresslevel);
}

function add(){
	if(oldAddressCode == $("#mod_addresscode").val() && oldAddressName == $("#mod_addressname").val() && oldDepartid == $("#mod_departid").val()){
		alert("没有任何修改!");
		return false;
	}else if(oldAddressCode != $("#mod_addresscode").val()){
		if($("#mod_addresscode").val()!=''){
			setParams("mod_");
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
	}else if(address_modVerify()){
		setParams("mod_");
		jQuery.ajax({
			type: 'POST',
			url: addr_modifyUrl,
			data: params,
			async: true,
			dataType: 'json',
			success: function(flag){
				if(flag.result=="success"){
					alert("修改成功!");
					parent.parent.parent.leftTree();
					parent.parent.parent.adr_setPageList(1);
					parent.parent.parent.GB_hide();
				}
			}
		});
	}
	return false;
}

function valadateAddresscodeBack(json){
	if(json.tabledata=="1"){
		alert('此地址代码已存在!');
		$("#mod_addresscode").attr("value","");
	}else{
		setParams("mod_");
		jQuery.ajax({
			type: 'POST',
			url: addr_modifyUrl,
			data: params,
			async: true,
			dataType: 'json',
			success: function(flag){
				if(flag.result=="success"){
					alert("修改成功!");
					parent.parent.parent.leftTree();
					parent.parent.parent.adr_setPageList(1);
					parent.parent.parent.GB_hide();
				}
			}
		});
	}
}

function address_modVerify(){
	if (!checkControlValue("mod_addressname","String",1,100,null,1,"地址名称"))
		return false;
	if (!checkControlValue("mod_addresscode","String",1,40,null,0,"地址代码"))
		return false;
	if (!checkControlValue("mod_departid","Integer",-999999999,999999999,null,1,"所属机构"))
		return false;
	return true;
}

function addressdoOnClick(itemId){//点击事件
	$("#mod_departid").val(itemId);
	$("#mod_departname").val(dhxTree.getSelectedItemText());
}
</script>
<html>
  <body>
<input type="hidden" id="mod_addressid"/>
<input type="hidden" id="mod_oldAddressCode"/>
<input type="hidden" id="mod_departid"/>

<div id="addressAdd" style="position: relative;width: 91%; height: 100%; overflow: auto; aborder: #B5CDE4 1px solid;"></div>
<div id="objId" style="width: 100%; height: 100%; display: none;">
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr>
		<td width="55%" class="wdtd_ordinary">地址代码</td>
        <td width="45%" class="wdtd_input"><input type="text" class="inputstyle"  id="mod_addresscode" /></td>
	</tr>
	<tr>
        <td class="wdtd_must">地址名称</td>
        <td class="wdtd_input"><input type="text" class="inputstyle"  id="mod_addressname" /></td>
	</tr>
	<tr>
    <td class="wdtd_ordinary">地址层次</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="mod_addresslevel" readonly="readonly"/></td>
  </tr>
	<tr>
    <td class="wdtd_ordinary">上级地址</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="mod_parentaddressname" readonly="readonly"/></td>
  </tr>
	<tr>
    <td class="wdtd_must">所属机构</td>
    <td class="wdtd_input"><input type="text" class="readonly"  id="mod_departname" readonly="readonly"/></td>
  </tr>
</table>
</div>
  </body>
</html>
