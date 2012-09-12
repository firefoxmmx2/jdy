<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript">
$(document).ready(function() {	
	$('#jdpxx_id_det').val(dataid);
	//可疑物品类别
	$('#jdpxx_kywplb').selectBox({code:'dm_kywplb'});
	$("#jdpxx_kywplb").setAttr("readonly","readonly");//删除class属性
	kyjdwpback_mod();
}); 
//查询揽件信息并赋值函数
function kyjdwpback_mod(json){
	var params = getSubmitParams("#kyjdwpxx_det_qyd [id=jdpxx_id_det]");
	$.post("jdy/djpxxquery_jdpxx.action",params,function(data){
		if(data.jdpxx){
			$("#kyjdwpxx_jdpxx_id").val(data.jdpxx.id);
			//alert(data.jdpxx.kyjdwpxx.kywpms);
			//$("#jdpxx_basj").val(data.jdpxx.kyjdwpxx.bgsj)
			//初始化数据
			$('#kyjdwpxx_det_qyd [name*=jdpxx.]').each(function(idx){
				$this = $(this);
				if($this.attr("tagName").toLowerCase() == 'select'){
					try{
						$this.setValue(setNull(eval("data." + $this.attr("name"))));
					}catch (e) {
						//alert($this.attr("name"));
						//alert(eval("data." + $this.attr("name")))
						//return;
					}
					
				}
				else{
					try{
						$this.val(setNull(eval("data." + $this.attr("name"))));
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
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">可疑物品详情</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#"+detailid).hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="kyjdwpxx_det_qyd">
<input type="hidden" id="jdpxx_id_det" name="jdpxx.id" value="">
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
		<td class="distd">代收人证件号码</td>
		<td class="detailtd"><input type="text" id="jdpxx_pjjbxx_dsr_zjhm"  name="jdpxx.pjjbxx.dsr.zjhm" class="readonly" value="" /></td>
		<td class="distd">可疑物品类别</td>
		<td class="pagetd"><select class="select1" id="jdpxx_kywplb" name="jdpxx.kyjdwpxx.kywplb" value="" ><option></option></select></td>
	</tr>
	<tr>
 		<td class="distd" style="padding-left: 1px;">可疑物品描述</td>
		<td class="detailtd"><textarea style="height: 60px;width: 200px;" id="jdpxx_kywpms" name="jdpxx.kyjdwpxx.kywpms" value="" class="readonly"></textarea></td>
	</tr>
	<tr height="20">
		<td class="distd">报告人</td>
		<td class="detailtd"><input type="text" id="jdpxx_bgrxm"  name="jdpxx.kyjdwpxx.bgr.xm"  value="" class="readonly"></td>
		<td class="distd">报告时间</td>
		<td class="detailtd"><input type="text" id="jdpxx_basj" name="jdpxx.kyjdwpxx.bgsj"  value="" class="readonly"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="9"></td>
	</tr>
</table>
<tr height="25" align="center">
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#"+detailid).hideAndRemove("show");'>返回</a></td>
</tr>
</table>

