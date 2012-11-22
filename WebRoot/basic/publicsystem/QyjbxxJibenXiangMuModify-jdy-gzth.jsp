<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
<script type="text/javascript">
	$(document).ready(function() {
		
		if(qyjbxx_requestType=="hecha" && $('#m_bgyy').length){
			$('#m_bgyy').parents('tr').eq(0).remove();
		}
		$("#m_kyrq").attr("readonly","true").datepicker();
// 		$("#m_nsrq").attr("readonly","true").datepicker();
		
		$("#bq_frdbzj").selectBox({code:"dm_frdbzjlb(ylcs)",width:"118px"});
		
// 		$("#m_thbajg").click(function(){ //特行备案机构
// 			getGxdw("m_thbajg","m_thbajgdm");
// 		});
		$("#m_jjlxmc").click(function(){ //经济类型筛选
			getDict_item("m_jjlxmc","m_jjlxbm","dm_jjlx");
		});
		
		$('#m_jjlxbm').bind('propertychange',function(){
			if($(this).val() == '330'){
				if(!$('#m_wstzqypzzsh').attr('isValiate')){
					$('#m_wstzqypzzsh').parent('td').prev()
						.removeClass('pagedistd1')
						.addClass('red');
					$('#m_wstzqypzzsh').attr('isValiate',true)
				}
				
			}
			else{
				if($('#m_wstzqypzzsh').attr('isValiate')){
					$('#m_wstzqypzzsh').parent('td').prev()
					.removeClass('red')
					.addClass('pagedistd1');
					$('#m_wstzqypzzsh').attr('isValiate',false);
				}
				
			}
			
		})
	});
	
	function qyjbxx_modifyVerify(){ //验证
		if (!checkControlValue("m_gxdwmc","String",1,120,null,1,"管辖单位"))
			return false;
		if (!checkControlValue("m_qymc","String",1,120,null,1,"企业名称"))
			return false;
		if (!checkControlValue("m_jydz","String",1,200,null,1,"企业地址"))
			return false;
		if (!checkControlValue("m_jyfwzy","String",1,200,null,1,"经营范围"))
			return false;
		if (!checkControlValue("m_lxdh","String",1,30,null,1,"联系电话"))
			return false;
		if (!checkControlValue("m_chzh","String",1,30,null,0,"传真"))
			return false;
		if (!checkControlValue("m_yzbm","String",1,6,null,0,"邮政编码")) //4.27 罗波提 所有非必填
			return false;
		if (!checkControlValue("m_kyrq","Date",null,null,null,1,"开业日期"))
			return false;
		if (!checkControlValue("m_jjlxmc","String",1,100,null,1,"经济类型"))
			return false;
// 		if (!checkControlValue("m_jymj","Float",-99999999.99,99999999.99,2,1,"占地面积(平米)"))
// 			return false;
		if (!checkControlValue("m_zczj","Float",-99999999.99,99999999.99,2,1,"注册资金(万元)"))
			return false;
		if (!checkControlValue("m_frdb","String",1,30,null,1,"法定代表人"))
			return false;
		if (!htjdOnBlurNotOnlyZfVal('m_qyzzjgdm','jyxk','1','‘组织机构代码’','1','0')){
			return false;
		}
		if($("#m_frdbzjlb").attr("value")=='居民身份证'||$("#m_frdbzjlb").attr("value")=='临时居民身份证'){
			if(!valSfzCardIsRight("m_frdbzjhm","请正确填写法人证件号码!"))
				return false;
		}
		if (!checkControlValue("m_frdbzjhm","String",1,30,null,1,"法人证件号码"))
			return false;
		if (!checkControlValue("m_frdblxfs","String",1,30,null,1,"法人联系方式"))
			return false;
// 		if (!checkControlValue("m_babh","String",1,30,null,1,"特行许可证号"))
// 			return false;
// 		if (!checkControlValue("m_thbajg","String",1,60,null,1,"特行许可证发证机关"))
// 			return false;
		if (!checkControlValue("m_kdjyxkzbh","String",1,30,null,1,"快递经营许可证号"))
			return false;
		if($('#m_wstzqypzzsh').attr('isValiate'))
			if (!checkControlValue("m_wstzqypzzsh","String",1,30,null,1,"外商投资企业批准证书号"))
				return false;
// 		if (!checkControlValue("m_wstzqypzzsh","String",1,30,null,1,"外商投资企业批准证书号"))
// 			return false;
		if (!checkControlValue("m_yyzzZjbh","String",1,60,null,0,"营业执照编号"))
			return false;
		if (!checkControlValue("m_yyzzFzjg","String",1,60,null,0,"营业执照发证机构名称"))
			return false;
		if (!checkControlValue("m_swdjZjbh","String",1,60,null,0,"税务登记证编号"))
			return false
		if (!checkControlValue("m_swdjFzjg","String",1,60,null,0,"税务登记证发证机构名称"))
			return false;
// 		if (!checkControlValue("m_jyxkZjbh","String",1,60,null,1,"经营许可证号"))
// 			return false;
// 		if (!checkControlValue("m_jyxkFzjg","String",1,60,null,1,"经营许可证发证机关"))
// 			return false;
		if (!checkControlValue("m_dwfzr","String",1,30,null,1,"单位负责人"))
			return false;
		if(!valSfzCardIsRight("m_dwfzrzjhm","请正确填写单位负责人身份证号!"))
			return false;
		if (!checkControlValue("m_dwfzrzjhm","String",1,30,null,1,"单位负责人身份证号"))
			return false;
		if (!checkControlValue("m_dwfzrlxfs","String",1,30,null,1,"负责人联系方式"))
			return false;
		if (!checkControlValue("m_bafzrxm","String",1,30,null,1,"治安负责人"))
			return false;
		
		if (!checkControlValue("m_bafzrgmsfhm","String",1,30,null,1,"治安负责人身份证号"))
			return false;
		if(!valSfzCardIsRight("m_bafzrgmsfhm","请正确填写治安负责人身份证号!"))
			return false;
		if (!checkControlValue("m_bafzrdh","String",1,30,null,1,"治安负责人联系方式"))
			return false;
// 		if (!checkControlValue("m_nsrq","Date",null,null,null,1,"年审日期"))
// 			return false;
		if (!checkControlValue("m_bz","String",1,2000,null,0,"备注"))
			return false;
		//变更原因验证
		if($('#m_bgyy').length){
			if (!checkControlValue("m_bgyy","String",1,2000,null,1,"变更原因"))
				return false;
		}
		valadateYyzz();
		if(!canCommit)
			return false;
		return true;
	}
	function valadateYyzz(){ //营业执照编号
		var yyzzZjbh = $("#m_yyzzZjbh").attr("value");
		//if(yyzzZjbh==''){//liufeng modify 20100828
		//	canCommit=false;
		//	jAlert('请正确输入营业执照编号!','验证信息',null,'m_yyzzZjbh');
		//	return;
		//}
		setParams("m_");
		var sUrl="publicsystem/valadateYyzz_qyjbxx.action";
		jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){						
				var rows  = eval(result);
				valadateYyzzBack(rows);
			}
		});
	}
	function valadateYyzzBack(json){
		if(json.result=="success"){
			if(json.valiResult=="1"){
				jAlert('此营业执照编号已存在!','验证信息',null,'m_yyzzZjbh');
				canCommit=false;
			}else{
				canCommit=true;
			}
		}else{
			jAlert('error!','提示信息');
			canCommit=false;
		}
	}
	var canCommit = true;
	
	function frdbzjOnchange(){ //法人证件类型
		var frdbzjlbkey = $("#bq_frdbzj").attr("value");
		var frdbzjlbval = $("#bq_frdbzj").attr("title");
		$("#m_frdbzjlb").attr("value",frdbzjlbval);
	}
	
	function frzjhmBlurVali(){ //法人身份证 失去焦点验证
		if($("#m_frdbzjlb").attr("value")=='居民身份证'||$("#m_frdbzjlb").attr("value")=='临时居民身份证'){
			if($("#m_frdbzjhm").attr("value")!=''){
				if(!valSfzCardIsRight("m_frdbzjhm","请正确填写法人证件号码!",0))
					return false;
			}
		}
	}
	function dwfzrzjhmBlurVali(){ //负责人身份证 失去焦点验证
		if($("#m_dwfzrzjhm").attr("value")!=''){
			if(!valSfzCardIsRight("m_dwfzrzjhm","请正确填写单位负责人身份证号!",0))
				return false;
		}
	}
	function bafzrzjhmBlurVali(){ //治安负责人身份证 失去焦点验证
		if($("#m_bafzrgmsfhm").attr("value")!=''){
			if(!valSfzCardIsRight("m_bafzrgmsfhm","请正确填写治安负责人身份证号!",0))
				return false;
		}
	}
	
	function qyjbxxXiangxi_updatediv(){
		$('[id*=m_]').each(function(){
			var $me = $(this);
			var value = eval('jsonResultMes.LQyjbxx[0].'+$me.attr('id').split("m_")[1]);
			if(value)
				$($me).val(setNull(value));
		});
		
		$('[id*=m_]').each(function(){
			var $me = $(this);
			var value = eval('jsonResultMes.LQyjbxx[1].'+$me.attr('id').split("m_")[1]);
			if(value)
				$($me).val(setNull(value));
		});
		$("#bq_hylb").setValue(setNull(jsonResultMes.LQyjbxx[0].hylbdm),115); //value：根据代码赋下拉框值 text：是根据内容赋下拉框值
		$("#bq_ylcsfl").setValue(setNull(jsonResultMes.LQyjbxx[0].qyzflbm),115);
		$("#bq_zajb").setValue(setNull(jsonResultMes.LQyjbxx[0].zabdm),115);
		$("#bq_frdbzj").setText(setNull(jsonResultMes.LQyjbxx[0].frdbzjlb),115);
		$("#bq_yyzt").setValue(setNull(jsonResultMes.LQyjbxx[0].yyztdm),115);
		$("#bq_hylb").setAttr("readonly","true"); //除了添加都需锁定行业类别
		$("#bq_zjzt").setValue(setNull(jsonResultMes.LQyjbxx[0].zjztdm),115);
		
		$("#m_sfazsxt").setValue(setNull(jsonResultMes.LQyjbxx[0].sfazsxt),115);
	}
</script>
<BODY>

<input type="hidden" id="m_frdbzjlb"/>
<input type="hidden" id="m_zabdm"/>
<input type="hidden" id="m_jjlxbm"/>

	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr><td class="queryfont">企业基本信息</td></tr>
		<tr>
		<td valign="top" class="tdbg">
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr height="25">
		        <td class="red">企业名称</td>
		        <td class="pagetd1" colspan="3"><input style="width:490px" type="text" class="inputstyle1" id="m_qymc"/></td>
		        <td class="pagedistd1">企业代码</td>
				<td class="pagetd1"><input style="width:120px" type="text" class="readonly" id="m_qybm" readonly/></td>
			</tr>
			<tr height="25">
		        <td class="red">企业地址</td>
		        <td class="pagetd1" colspan="3"><input style="width:490px" type="text" class="inputstyle1" id="m_jydz"/></td>
		        <td class="pagedistd1">组织机构代码</td>
		        <td class="pagetd1"  ><input style="width:120px" type="text" class="inputstyle1" id="m_qyzzjgdm" maxlength="9"
					onkeyup="htjdOnkeyupVal('m_qyzzjgdm','jyxk');" onBlur="htjdOnBlurNotOnlyZfVal('m_qyzzjgdm','jyxk','0','‘组织机构代码’','1','0');"/></td>
			</tr>
			<tr height="25">
		        <td class="red">经营范围</td>
		        <td class="pagetd1" colspan="3"><input style="width:490px" type="text" class="inputstyle1" id="m_jyfwzy"/></td>
				<td class="red">联系电话</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_lxdh"/></td>
			</tr>
			<tr height="25">
		        <td class="pagedistd1" width="12%">传真</td>
			  <td class="pagetd1" width="14%"><input style="width:120px" type="text" class="inputstyle1" id="m_chzh"/></td>
		        <td class="pagedistd1" width="20%">邮政编码</td>
	          <td class="pagetd1" width="20%"><input style="width:120px" type="text" class="inputstyle1" id="m_yzbm" maxlength="6" onKeyUp="value=value.replace(/[^\d]/g,'')"/></td>
		        <td class="red" width="11%">开业日期</td>
	          <td class="pagetd1" width="15%"><input style="width:120px" type="text" class="inputstyle1" id="m_kyrq"/></td>
			</tr>
			<tr height="25">
            	<td class="red" >经济类型</td>
	          <td class="pagetd1" ><input style="width:120px" type="text" class="inputstyle1" id="m_jjlxmc" readonly/></td>
	          <td class="pagedistd1">占地面积（平米）</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_jymj"/></td>
		        <td class="red">注册资金（万元）</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_zczj"/></td>
			</tr>
			<tr height="25">
            	<td class="red">法定代表人</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_frdb"
		        onkeyup="htjdOnkeyupVal('m_frdb','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_frdb','xingming','0','‘法定代表人’','1','0');"/></td>
				<td class="red">法人证件类型</td>
		        <td class="pagetd1"><select name="select4" id="bq_frdbzj" onChange="frdbzjOnchange();"></select></td>
		        <td class="red">法人证件号码</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_frdbzjhm" onBlur="frzjhmBlurVali();"/></td>
			</tr>
			<tr height="25">
            	<td class="red">法人联系方式</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_frdblxfs"/></td>
				<td class="red">快递经营许可证号</td><%--add --%>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_kdjyxkzbh"/></td>
<!-- 		        <td class="red">特行许可证发证机关</td> -->
<!-- 				<td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_thbajg" readonly/><input type="hidden" id="m_thbajgdm"/></td> -->
				<td class="pagedistd1">外商投资企业批准证书号</td>
				<td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_wstzqypzzsh" /></td>
			</tr>
            	<tr height="25">
				<td class="pagedistd1">营业执照编号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_yyzzZjbh"/></td>
		        <td class="pagedistd1">营业执照发证机关</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_yyzzFzjg"
		        	onkeyup="htjdOnkeyupVal('m_yyzzFzjg','zhongwen');"/></td>
				<td class="pagedistd1">税务登记证编号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_swdjZjbh"/></td>
			</tr>
			<tr height="25" >
            	 <td class="pagedistd1">税务登记证发证机关</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_swdjFzjg"
		        	onkeyup="htjdOnkeyupVal('m_swdjFzjg','zhongwen');"/></td>
<!-- 				<td class="red">经营许可证号</td> -->
<!-- 		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_jyxkZjbh"/></td> -->
<!-- 		        <td class="red" nowrap>经营许可证发证机关</td> -->
<!-- 		        <td id="jyxk_fzjgConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_jyxkFzjg" -->
<!-- 		        	onkeyup="htjdOnkeyupVal('m_jyxkFzjg','zhongwen');"/></td> -->
		        <td class="pagedistd1">行业许可证号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_jyxkZjbh"/></td>
		        <td class="pagedistd1" nowrap>行业许可证发证机关</td>
		        <td id="jyxk_fzjgConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_jyxkFzjg"
		        	onkeyup="htjdOnkeyupVal('m_jyxkFzjg','zhongwen');"/></td>
			</tr>
			<tr height="25">
            	<td class="red">单位负责人</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_dwfzr"
		        onkeyup="htjdOnkeyupVal('m_dwfzr','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_dwfzr','xingming','0','‘单位负责人’','1','0');"/></td>
		        <td class="red" nowrap>单位负责人身份证号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_dwfzrzjhm" onBlur="dwfzrzjhmBlurVali();"/></td>
		        <td class="red">单位负责人联系方式</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_dwfzrlxfs"/></td>
			</tr>
            <tr height="25">
          		<td class="red">治安负责人</td>
				<td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_bafzrxm"
				onkeyup="htjdOnkeyupVal('m_bafzrxm','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_bafzrxm','xingming','0','‘治安负责人’','1','0');"/></td>
				<td class="red" nowrap>治安负责人身份证号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_bafzrgmsfhm" onBlur="bafzrzjhmBlurVali();"/></td>
				<td class="red">治安负责人联系方式</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle1" id="m_bafzrdh"/></td>
			</tr>
			<tr>
				<td id="bz_title" class="pagedistd1">备注</td>
				<td id="bz_conte" colspan="7" class="pagetd1"><textarea name="textarea" id="m_bz" cols="102" rows="2"></textarea></td>
			</tr>
			</table>
		</td>
		</tr>
	</table>	

</BODY>
</HTML>