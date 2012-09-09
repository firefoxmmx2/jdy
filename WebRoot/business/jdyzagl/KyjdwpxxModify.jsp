<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript">
$(document).ready(function() {	
	$('#jdpxx_id_mod').val(dataid);
	//可疑物品类别
	$('#jdpxx_kywplb_mod').selectBox({code:'dm_kywplb'});
	//报告时间
	$("#jdpxx_basj").attr("readOnly",true).datepicker();
	//揽件人
	$('#jdpxx_bgrxm').attr('readOnly',true).click(function(){
		dataid=null;
		getTyRY_item('jdpxx_bgrxm','kyjdwpxx_bgrbm',null,null,'<%=qybm%>');
	});
	kyjdwpback_mod();
}); 
//查询揽件信息并赋值函数
function kyjdwpback_mod(json){
	var params = getSubmitParams("#kyjdwpxx_mod_qyd [id=jdpxx_id_mod]");
	$.post("jdy/djpxxquery_jdpxx.action",params,function(data){
		if(data.jdpxx){
			$("#kyjdwpxx_jdpxx_id").val(data.jdpxx.id);//可疑寄递品物品ID-修改是需要
			$("#jdpxx_kyjdwpxx_kyywdjxh").val(data.jdpxx.kyjdwpxx.kyywdjxh);//可疑业务登记序号，修改时要用到
			$("#jdpxx_kywpms").val(data.jdpxx.kyjdwpxx.kywpms);//可疑寄递物品描述
			//$("#jdpxx_kywplb_mod").val(setNull(data.jdpxx.kyjdwpxx.kywplb));//可疑物品类别
			$("#jdpxx_bgrxm").val(data.jdpxx.kyjdwpxx.bgr.xm);//报告人姓名
			$("#kyjdwpxx_bgrbm").val(data.jdpxx.kyjdwpxx.bgr.cyrybh);//报告人编码 
			$("#jdpxx_basj").val(setNull(data.jdpxx.kyjdwpxx.bgsj));//报告时间 
			//初始化数据
			$('#kyjdwpxx_mod_qyd [name*=jdpxx.]').each(function(idx){
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
	if (!checkControlValue("jdpxx_kywplb_mod","Select",1,8,null,1,"可疑物品类型"))
		return false;
	if (!checkControlValue("jdpxx_bgrxm","Select",1,14,null,1,"报告人"))
		return false;
	if (!checkControlValue("jdpxx_basj","Date",null,null,null,1,"报告日期"))
		return false;
	return true;
}
//可疑寄递物品修改方法
function kywpxxmod(){
	if(yangzhengff()){
		$("#kyjdwpxx_kywplb_mod").val($("#jdpxx_kywplb_mod").val());
		alert($("#kyjdwpxx_kywplb_mod").val());
		params = getSubmitParams("#kyjdwpxx_mod_qyd [name*=kyjdwpxx.]",params);
		jQuery.post("jdy/update_kyjdwp.action",params,kywpaddmodback,"json");
	}
}
//可疑物品修改回调函数
function kywpaddmodback(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		$("#"+detailid).hideAndRemove("show");
		//setPageListLjxx(1);
	}else{
		jAlert(json.result,'错误信息');
	}		
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">可疑物品新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#"+detailid).hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="kyjdwpxx_mod_qyd">
<input type="hidden" id="jdpxx_id_mod" name="jdpxx.id" value="">
<input type="hidden" id="kyjdwpxx_jdpxx_id" name="kyjdwpxx.jdpxx.id" value="">
<input type="hidden" id="kyjdwpxx_bgrbm" name="kyjdwpxx.bgr.cyrybh" value=""><!-- 修改提交时要保持的报告人编码 -->
<input type="hidden" id="jdpxx_kyjdwpxx_kyywdjxh" name="kyjdwpxx.kyywdjxh" value=""><!-- 修改时需要可疑业务登记需要 来进行修改 -->
<input type="hidden" id="kyjdwpxx_kywplb_mod" name="kyjdwpxx.kywplb" value=""><!-- 修改操作时提交的可以物品类别 -->
	<tr>
		<td class="distd">寄递品ID</td>
		<td class="detailtd"><input type="text" id="jdpxxid" name="jdpxx.id" class="readonly" value="" /></td>
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
		<td class="distd">代收人证件号码</td>
		<td class="detailtd"><input type="text" id="jdpxx_pjjbxx_dsr_zjhm"  name="jdpxx.pjjbxx.dsr.zjhm" class="readonly" value="" /></td>
		<td class="red">可疑物品类别</td>
		<td class="pagetd"><select class="select1" id="jdpxx_kywplb_mod" name="jdpxx.kyjdwpxx.kywplb" value=""><option></option></select></td>
	</tr>
	<tr>
 		<td class="distd" style="padding-left: 1px;">可疑物品描述</td>
		<td class="detailtd"><textarea  id="jdpxx_kywpms" name="kyjdwpxx.kywpms" value=""></textarea></td>
	</tr>
	<tr height="20">
		<td class="red">报告人</td>
		<td class="detailtd"><input type="text" id="jdpxx_bgrxm"  name="kyjdwpxx.bgr.xm" class="inputstyle" value=""></td>
		<td class="red">报告时间</td>
		<td class="detailtd"><input type="text" id="jdpxx_basj" name="kyjdwpxx.bgsj" class="inputstyle date" value=""></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='kywpxxmod();'>保存</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="取消" onclick='$("#"+detailid).hideAndRemove("show");'>取消</a></td>
</tr>
</table>

