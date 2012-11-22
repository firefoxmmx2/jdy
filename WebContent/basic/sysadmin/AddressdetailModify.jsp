<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		olddzxzdm = "";
		olddzxzmc = "";
		$("#m_dzxzid").attr("value",parent.parent.parent.dzxzid);
		dz_detailUrl = "<%=request.getContextPath()%>/sysadmin/query_addressdetail.action";
		dz_modUrl="<%=request.getContextPath()%>/sysadmin/modify_addressdetail.action";
		dz_setDetail();
	}); 
	
	function dz_setDetail(){
		setParams("m_");
		jQuery.post(dz_detailUrl,params,dz_Detail,"json");
	}
	
	function dz_Detail (json) { 
		$("#m_dzxzdm").attr("value",setNull(json.LAddressdetail[0].dzxzdm));
		$("#m_dzxzmc").attr("value",setNull(json.LAddressdetail[0].dzxzmc));
		olddzxzdm = setNull(json.LAddressdetail[0].dzxzdm);
		olddzxzmc = setNull(json.LAddressdetail[0].dzxzmc);
	}	
	function dz_modifyVerify(){
		if (!checkControlValue("m_dzxzmc","String",1,100,null,0,"地址详址名称"))
			return false;
		return true;
	}
	
	function add(){
		if(olddzxzdm == $("#m_dzxzdm").val() && olddzxzmc == $("#m_dzxzmc").val()){
			alert("没有任何修改!");
			return false;
		}else if(olddzxzdm != $("#m_dzxzdm").val()){
			if($("#m_dzxzdm").val()!=''){
				setParams("m_");
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
		}else if(dz_modifyVerify()){
			setParams("m_");
			jQuery.ajax({
				type: 'POST',
				url: dz_modUrl,
				data: params,
				async: true,
				dataType: 'json',
				success: function(flag){
					alert(flag.result);
						parent.parent.parent.dz_setPageList(1);
						parent.parent.parent.GB_hide();
				}
			});
		}
	}
	
	function valadateDzxzdmBack(json){
		if(json.tabledata=="1"){
			alert('此地址详址代码已存在!');
			$("#m_dzxzdm").attr("value","");
		}else{
			setParams("m_");
			jQuery.ajax({
				type: 'POST',
				url: dz_modUrl,
				data: params,
				async: true,
				dataType: 'json',
				success: function(flag){
					alert(flag.result);
						parent.parent.parent.dz_setPageList(1);
						parent.parent.parent.GB_hide();
				}
			});
		}
	}
</script>
<input type="hidden" id="m_dzxzid"/>
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr height="20">
		<td class="wdtd_ordinary">地址祥址代码</td>
		<td class="wdtd_input"><input type="text" id="m_dzxzdm" class="inputstyle"/></td>
	</tr>
	<tr height="20">
		<td class="wdtd_must">地址祥址名称</td>
		<td class="wdtd_input"><input type="text" id="m_dzxzmc" class="inputstyle"/></td>
	</tr>
</table>
