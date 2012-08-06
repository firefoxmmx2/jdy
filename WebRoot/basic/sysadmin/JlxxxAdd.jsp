<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>
<script type="text/javascript">
var acc=false;
	$(document).ready(function() {
		addUrl="<%=request.getContextPath()%>/sysadmin/insert_jlxxx.action";
		$("#ins_addressid").val(parent.parent.parent.jlxAddressid);
	}); 
	function addVerify(){
		if (!checkControlValue("ins_jlxdm","String",1,20,null,0,"街路巷代码"))
			return false;
		if (!checkControlValue("ins_jlxmc","String",1,100,null,1,"街路巷名称"))
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
					parent.parent.parent.jlx_setPageList(1);
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
	
	function valadateJlxdm(){ //验证街路巷代码
		if($("#ins_jlxdm").val()!=''){
			setParams("ins_");
			var sUrl="<%=request.getContextPath() %>/sysadmin/validateJlxdm_jlxxx.action";
			jQuery.ajax({
				type: 'POST',
				url: sUrl,
				data: params,
				async: false,
				dataType: 'json',
				success: function(result){						
					var rows  = eval(result);
					valadateJlxdmBack(rows);
				}
			});
		}
	}

	function valadateJlxdmBack(json){
		if(json.tabledata=="1"){
			alert('此街路巷代码已存在!');
			$("#ins_jlxdm").attr("value","");
		}else{
			acc = true;
		}
	}
</script>
<input type="hidden" id="ins_addressid"/>
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr height="20">
		<td class="wdtd_ordinary">街路巷代码</td>
		<td class="wdtd_input"><input type="text" id="ins_jlxdm" class="inputstyle" onblur="valadateJlxdm();"/></td>
	</tr>
	<tr height="20">
		<td class="wdtd_must">街路巷名称</td>
		<td class="wdtd_input"><input type="text" id="ins_jlxmc" class="inputstyle"/></td>
	</tr>
</table>