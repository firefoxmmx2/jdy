<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/public/includeScript.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		oldjlxdm = "";
		oldjlxmc = "";
		$("#m_jlxid").attr("value",parent.parent.parent.dataid);
		jlx_detailUrl = "<%=request.getContextPath()%>/sysadmin/query_jlxxx.action";
		jlx_modUrl="<%=request.getContextPath()%>/sysadmin/modify_jlxxx.action";
		jlx_setDetail();
	}); 
	
	function jlx_setDetail(){
		setParams("m_");
		jQuery.post(jlx_detailUrl,params,jlx_Detail,"json");
	}
	
	function jlx_Detail (json) { 
		$("#m_jlxid").attr("value",setNull(json.LJlxxx[0].jlxid));
		$("#m_jlxdm").attr("value",setNull(json.LJlxxx[0].jlxdm));
		$("#m_jlxmc").attr("value",setNull(json.LJlxxx[0].jlxmc));
		oldjlxdm = setNull(json.LJlxxx[0].jlxdm);
		oldjlxmc = setNull(json.LJlxxx[0].jlxmc);
	}	
	function jlx_modifyVerify(){
		if (!checkControlValue("m_jlxdm","String",1,20,null,0,"街路巷代码"))
			return false;
		if (!checkControlValue("m_jlxmc","String",1,100,null,1,"街路巷名称"))
			return false;
		return true;
	}
	
	function add(){
		if(oldjlxdm == $("#m_jlxdm").val() && oldjlxmc == $("#m_jlxmc").val()){
			alert("没有任何修改!");
			return false;
		}else if(oldjlxdm != $("#m_jlxdm").val()){
			if($("#m_jlxdm").val()!=''){
				setParams("m_");
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
		}else if(jlx_modifyVerify()){
			setParams("m_");
			jQuery.ajax({
				type: 'POST',
				url: jlx_modUrl,
				data: params,
				async: true,
				dataType: 'json',
				success: function(flag){
					alert(flag.result);
						parent.parent.parent.jlx_setPageList(1);
						parent.parent.parent.GB_hide();
				}
			});
		}
	}
	
	function valadateJlxdmBack(json){
		if(json.tabledata=="1"){
			alert('此街路巷代码已存在!');
			$("#m_jlxdm").attr("value","");
		}else{
			setParams("m_");
			jQuery.ajax({
				type: 'POST',
				url: jlx_modUrl,
				data: params,
				async: true,
				dataType: 'json',
				success: function(flag){
					alert(flag.result);
						parent.parent.parent.jlx_setPageList(1);
						parent.parent.parent.GB_hide();
				}
			});
		}
	}
</script>
<input type="hidden" id="m_jlxid"/>
<table border="0" align="center" cellpadding="2" cellspacing="0" class="wdtable" >
	<tr height="20">
		<td class="wdtd_ordinary">街路巷代码</td>
		<td class="wdtd_input"><input type="text" id="m_jlxdm" class="inputstyle"/></td>
	</tr>
	<tr height="20">
		<td class="wdtd_must">街路巷名称</td>
		<td class="wdtd_input"><input type="text" id="m_jlxmc" class="inputstyle"/></td>
	</tr>
</table>
