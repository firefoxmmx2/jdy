<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript">
$(document).ready(function() {	
	$('#jdpxx_id').val(dataid);
	//@fixed 添加的禁寄物品类型
	//禁寄物品类型
	$('#jdpxx_jjwplx').selectBox({code:'dm_jdyjjwplx'});
	$('#jdpxx_jjwplx').addClass('readonly').setAttr('readonly',true);
	//可疑物品类别
	$('#jdpxx_kywplb').selectBox({code:'dm_kywplb'});
	$('#jdpxx_kywplb').change(function(){
		$('#jdpxx_jjwplx').setValue('');
		if($(this).val()=='2'){
			if($('#jdpxx_jjwplx').hasClass('readonly'))
				$('#jdpxx_jjwplx').removeClass('readonly').setAttr('readonly',false);
		}
		else{
			if(!$('#jdpxx_jjwplx').hasClass('readonly'))
				$('#jdpxx_jjwplx').addClass('readonly').setAttr('readonly',true);
		}
			
	});
	//报告时间
	$("#jdpxx_basj").val('<%=dateNow%>').attr("readOnly",true).datepicker();
	//揽件人
	$('#jdpxx_bgrxm').attr('readOnly',true).click(function(){
		dataid=null;
		getTyRY_item('jdpxx_bgrxm','kyjdwpxx_cyrybh',null,null,'<%=qybm%>');
	});
	kyjdwpback();
}); 
//查询揽件信息并赋值函数
function kyjdwpback(json){
	//alert(json.jdpxx.id);
	//$("#kyjdwpxx_qyd [id=lj_jdpxxid]").val(json.jdpxx.id);//登记序号
	var params = getSubmitParams("#kyjdwpxx_qyd [id=jdpxx_id]");
	$.post("jdy/djpxxquery_jdpxx.action",params,function(data){
		if(data.jdpxx){
			$("#kyjdwpxx_jdpxx_id").val(data.jdpxx.id);//插入时需要将寄递品信息ID插入可疑寄递物品信息表中
			//alert("登记序号="+data.jdpxx.ljjbxx.djxh);
			$("#kyjdwpxx_ljjbxx_djxh_add").val(data.jdpxx.ljjbxx.djxh);//需要将登记序号打入可疑寄递物品信息表中
			//初始化数据
			$('#kyjdwpxx_qyd [name*=jdpxx.]').each(function(idx){
				$this = $(this);
				if($this.attr("tagName").toLowerCase() == 'select'){
					try{
						$this.setValue(eval("data." + $this.attr("name")));
					}catch (e) {
						//alert($this.attr("name"));
						//alert(eval("data." + $this.attr("name")))
						//return;
					}
					
				}
				else{
					try{
						$this.val(eval("data." + $this.attr("name")));
					}catch (e) {
						//alert($this.attr("name"));
						//alert(eval("data." + $this.attr("name")))
						//return;
					}
				}
			});
		}
		else{
			jAlert('该派件信息已经不存在','提示');
		}
		
	}, 'json');
	
}
//验证方法 
function yangzhengff(){
	if (!checkControlValue("jdpxx_kywplb","Select",1,8,null,1,"可疑物品类型"))
		return false;
	if (!checkControlValue("jdpxx_bgrxm","Select",1,14,null,1,"报告人"))
		return false;
	if (!checkControlValue("jdpxx_basj","Date",null,null,null,1,"报告日期"))
		return false;
	if($('#jdpxx_kywplb').val()=='2' && !checkControlValue("jdpxx_jjwplx","Select",1,8,null,1,"禁寄物品种类"))
		return false;
	return true;
}
//可疑物品insert方法
function kywpxxadd(){
	if(yangzhengff()){
		var params = getSubmitParams("#kyjdwpxx_qyd [name*=kyjdwpxx.]");
		jQuery.post("jdy/insert_kyjdwp.action",params,kywpaddaddback,"json");
	}
	
}
//可疑物品添加回调函数
function kywpaddaddback(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		$("#ljjbxxadd_detail").hideAndRemove("show");
		setPageListlj(1);
		setPageListKyjdwpxx(1);
	}else{
		jAlert(json.result,'错误信息');
	}		
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">可疑物品新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="kyjdwpxx_qyd">
<input type="hidden" id="jdpxx_id" name="jdpxx.id" value="">
<input type="hidden" id="kyjdwpxx_jdpxx_id" name="kyjdwpxx.jdpxx.id" value="">
<input type="hidden" id="kyjdwpxx_qyjbxx" name="kyjdwpxx.ljjbxx.qyjbxx.qybm" value="<%=qybm %>">
<input type="hidden" id="kyjdwpxx_cyrybh" name="kyjdwpxx.bgr.cyrybh" value="">
<input type="hidden" id="kyjdwpxx_ljjbxx_djxh_add" name="kyjdwpxx.ljjbxx.djxh" value=""><!-- 业务登记序号 -->
	<tr>
		<td class="distd">业务登记序号</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_djxh" name="jdpxx.ljjbxx.djxh" class="readonly" value="" /></td>
		<td class="distd">快递单号</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_wldh" name="jdpxx.ljjbxx.wldh"  value="" class="readonly" /></td>
	</tr>
	<tr>
		<td class="distd">发件人</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_jjr_xm"  name="jdpxx.ljjbxx.jjr.xm" class="readonly" value="" /></td>
		<td class="distd">发件人证件类型</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_jjr_zjlx" name="jdpxx.ljjbxx.jjr.zjlx" class="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="distd">发件人证件号码</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_jjr_zjhm" name="jdpxx.ljjbxx.jjr.zjhm" class="readonly" value="" /></td>
		<td class="distd">收件人</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_sjr_xm" name="jdpxx.ljjbxx.sjr.xm" class="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="distd">收件人证件类型</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_sjr_zjlx" name="jdpxx.ljjbxx.sjr.zjlx" class="readonly" value="" /></td>
		<td class="distd">收件人证件号码</td>
		<td class="detailtd"><input type="text" id="jdpxx_ljjbxx_sjr_zjhm" name="jdpxx.ljjbxx.sjr.zjhm" class="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="distd">代收人</td>
		<td class="detailtd"><input type="text" id="jdpxx_pjjbxx_dsr_xm" name="jdpxx.pjjbxx.dsr.xm" class="readonly" value="" /></td>
		<td class="distd">代收人证件类型</td>
		<td class="detailtd"><input type="text" id="jdpxx_pjjbxx_dsr_zjlx" name="jdpxx.pjjbxx.dsr.zjlx" class="readonly" value="" /></td>
	</tr>
	<tr>
		<td class="distd">代收人证件号码</td>
		<td class="detailtd"><input type="text" id="jdpxx_pjjbxx_dsr_zjhm"  name="jdpxx.pjjbxx.dsr.zjhm" class="readonly" value="" /></td>
		<td class="red">可疑物品类别</td>
		<td class="pagetd"><select class="select1" id="jdpxx_kywplb" name="kyjdwpxx.kywplb" ><option></option></select></td>
	</tr>
	<tr>
		<td class="distd"></td>
		<td class="detailtd"></td>
		<td>禁寄物品种类</td>
		<td class="pagetd"><select class="select1" id="jdpxx_jjwplx" name="kyjdwpxx.jjwplx" ><option></option></select></td>
	</tr>
	<tr>
 		<td class="distd" style="padding-left: 1px;">可疑物品描述</td>
		<td class="detailtd" colspan="3"><textarea  id="jdpxx_kywpms" name="kyjdwpxx.kywpms" style="width:90%;"></textarea></td>
	</tr>
	<tr height="20">
		<td class="red">报告人</td>
		<td class="detailtd"><input type="text" id="jdpxx_bgrxm" class="inputstyle" value=""></td>
		<td class="red">报告时间</td>
		<td class="detailtd"><input type="text" id="jdpxx_basj" name="kyjdwpxx.bgsj" class="inputstyle date"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='kywpxxadd();'>保存</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="取消" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>取消</a></td>
</tr>
</table>

