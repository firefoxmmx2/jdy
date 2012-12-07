<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>

<script type="text/javascript">
var isExistUrl="jdy/queryIsExist_wpyjsz.action";
$(function() {	
	//寄递物品联动下拉列表
	selectboxlink_new("yj_jdpdlxadd","yj_jdplxadd","dm_jdwpdl");
	
});

//验证方法 
function manVerify_yjwp(){
	if (!checkControlValue("yj_jdpdlxadd","String",1,30,null,1,"寄递品大类"))
		return false;
	if (!checkControlValue("yj_jdplxadd","String",1,30,null,1,"寄递品小类"))
		return false;
	
	return true;
}
function addYjwp(){
	//if(!$("#jdwpyjxx").length){$(document).find('body').eq(0).append('<div id="jdwpyjxx" class="page-layout" src="#" style="top:10px; left:160px; display: none;"></div>');}
	//detailDialog("jdwpyjxx", 800, "business/jdyzagl/Jdwplbyjcl.jsp");
	if(manVerify_yjwp()){
		var itemId=$("#yj_jdplxadd").val();
		$.ajax({
	 		   type: "POST",
	 		   url: isExistUrl,
	 		   data: "itemId="+itemId,
	 		   dataType:"json",
	 		   success: function(msg){
	 			var returnResult=eval(msg);
	 			if(returnResult.result=="failed"){
	 				jQuery.post(addYjwpUrl, {"itemId":itemId}, function(){
	 					setPageListWplbbkys(1);
	 					$("#yjaddjdpxx").hideAndRemove("show");
	 				}, "") 
	 			}else{
	 				jAlert("该类型已经存在",'提示');
	 			}
	 		   }
	 		});
	}
	
}

</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">预警物品类别新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#yjaddjdpxx").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="kyjdwpxx_qyd">
	 <tr>
					<td width="10%" class="red">寄递品大类</td>
					<td width="23%" class="pagetd">
					  <select id="yj_jdpdlxadd" >
						<option></option>
					  </select>
					</td>
					<td width="10%" class="red">寄递品小类</td>
					<td width="23%" class="pagetd">
						 <select id="yj_jdplxadd">
							<option></option>
						 </select>
					</td>
		 </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='addYjwp();'>保存</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="取消" onclick='$("#yjaddjdpxx").hideAndRemove("show");'>取消</a></td>
</tr>
</table>
