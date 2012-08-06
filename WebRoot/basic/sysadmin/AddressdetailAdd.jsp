<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>
<script type="text/javascript">
var acc=false;
	$(document).ready(function() {
		addUrl="<%=request.getContextPath()%>/sysadmin/insert_addressdetail.action";
		$("#ins_addressid").val(parent.parent.parent.dzAddressid);
		$("#ins_jlxid").val(parent.parent.parent.dzJlxid);
	}); 
	function addVerify(){
		if (!checkControlValue("ins_dzxzdm","String",1,20,null,0,"地址详址代码"))
			return false;
		if (!checkControlValue("ins_dzxzmc","String",1,100,null,1,"地址详址名称"))
			return false;
		if(acc!=true){
			return false;
		}
		return true;
	}
	
	function add(){
		if(addVerify()){
			setParams("ins_");
			jQuery.ajax({
				type: 'POST',
				url: addUrl,
				data: params,
				async: true,
				dataType: 'json',
				success: function(flag){
					alert(flag.result);
					parent.parent.parent.dz_setPageList(1);
					if(parent.sfbchjxxzz==1){
						location.reload();
						parent.jQuery('#iframe_addbutton').attr("disabled","");
					}else{
						parent.parent.parent.GB_hide();
					}
				}
			});
		}
	}
	
	function valadateDzxzdm(){ //验证地址祥址代码
		if($("#ins_dzxzdm").val()!=''){
			setParams("ins_");
			var sUrl="<%=request.getContextPath() %>/sysadmin/valadateDzxzdm_addressdetail.action";
			jQuery.ajax({
				type: 'POST',
				url: sUrl,
				data: params,
				async: false,
				dataType: 'json',
				success: function(result){						
					var rows  = eval(result);
					valadateDzxzdmBack(rows);
				}
			});
		}
	}

	function valadateDzxzdmBack(json){
		if(json.tabledata=="1"){
			alert('此地址详址代码已存在!');
			$("#ins_dzxzdm").attr("value","");
		}else{
			acc = true;
		}
	}
</script>

<input type="hidden" id="ins_addressid"/>
<input type="hidden" id="ins_jlxid"/>
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr height="20">
		<td class="wdtd_ordinary">地址详址代码</td>
		<td class="wdtd_input"><input type="text" id="ins_dzxzdm" class="inputstyle"  onblur="valadateDzxzdm();"/></td>
	</tr>
	<tr height="20">
		<td class="wdtd_must">地址详址名称</td>
		<td class="wdtd_input"><input type="text" id="ins_dzxzmc" class="inputstyle"/></td>
	</tr>
</table>