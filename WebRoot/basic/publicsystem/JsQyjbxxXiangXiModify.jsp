<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#m_zdskb").attr("value",zdskb); //最低刷卡比
		//$("#bq_hylb").selectBoxhylb({code:"dm_hylb",width:"115px"});
		$("#bq_frdbzj").selectBox({code:"dm_frdbzjlb(ylcs)",width:"118px"});
		$("#bq_frdbzj").setValue("111",118);//默认赋值
		$("#bq_frdbzj").setText("居民身份证",118);//默认赋值
		//$("#bq_zjzt").selectBox({code:"dm_yyzt",width:"115px"});
		//$("#bq_ylcsfl").selectBox({state:"1",width:"115px"}); //动态
		$("#bq_yyzt").selectBox({code:"dm_yyzt(bzhylcs)",width:"118px"});
		$("#bq_zajb").selectBox({code:"dm_zajb(bzhylcs)",width:"118px"});
		$("#m_thbajg").click(function(){ //特行备案机构
			getGxdw("m_thbajg","m_thbajgdm");
		});
		$("#m_jjlxmc").click(function(){ //经济类型筛选
			getDict_item("m_jjlxmc","m_jjlxbm","dm_jjlx");
		});
		$("#m_kyrq").attr("readonly","true").datepicker();
		$("#m_barq").attr("readonly","true");
		$("#m_yyzzQsrq").attr("readonly","true").datepicker();
		$("#m_yyzzJzrq").attr("readonly","true").datepicker();
		$("#m_jyxkQsrq").attr("readonly","true").datepicker();
		$("#m_jyxkJzrq").attr("readonly","true").datepicker();
		$("#m_thxkQsrq").attr("readonly","true").datepicker();
		$("#m_thxkJzrq").attr("readonly","true").datepicker();
		$("#m_swdjQsrq").attr("readonly","true").datepicker();
		$("#m_swdjJzrq").attr("readonly","true").datepicker();
		$("#m_tyrq").attr("readonly","true").datepicker();
		$("#m_djrq").attr("readonly","true").datepicker();
		qyjbxxXiangxi_updatediv();
	});
		function qyjbxxXiangxi_updatediv(){
		$("#m_qyzflbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzflbm));
		$("#m_qyzflmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzflmc));
		$("#m_zabdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].zabdm));
		$("#m_zajbmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].zajbmc));
		$("#m_yyztdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].yyztdm));
		$("#m_yyztmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].yyztmc));
		$("#m_frdbzjlb").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdbzjlb));
		
		$("#m_qyfflbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyfflbm));
		$("#m_qyfflmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyfflmc));
		
		$("#m_qyid").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyid));
		$("#m_qybm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qybm));
		$("#m_qymc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qymc));
		$("#m_qyjc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyjc));
		$("#m_gxdwmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].gxdwmc));
		$("#m_gxdwbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].gxdwbm));
		$("#m_qyzzjgdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzzjgdm));
		$("#m_lxdh").attr("value",setNull(jsonResultMes.LQyjbxx[0].lxdh));
		$("#m_yzbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].yzbm));
		$("#m_chzh").attr("value",setNull(jsonResultMes.LQyjbxx[0].chzh));
		$("#m_jwdzb").attr("value",setNull(jsonResultMes.LQyjbxx[0].jwdzb));
		$("#m_jjlxmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].jjlxmc));
		$("#m_jjlxbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].jjlxbm));
		$("#m_jyfwzy").attr("value",setNull(jsonResultMes.LQyjbxx[0].jyfwzy));
		$("#m_zczj").attr("value",setNull(jsonResultMes.LQyjbxx[0].zczj));
		$("#m_jymj").attr("value",setNull(jsonResultMes.LQyjbxx[0].jymj));
		$("#m_jyfwjy").attr("value",setNull(jsonResultMes.LQyjbxx[0].jyfwjy));
		$("#m_frdb").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdb));
		$("#m_frdbzjhm").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdbzjhm));
		$("#m_frdblxfs").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdblxfs));
		$("#m_kyrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].kyrq));
		$("#m_yysj").attr("value",setNull(jsonResultMes.LQyjbxx[0].yysj));
		$("#m_babh").attr("value",setNull(jsonResultMes.LQyjbxx[0].babh));
		$("#m_barq").attr("value",setNull(jsonResultMes.LQyjbxx[0].barq));
		$("#m_jydz").attr("value",setNull(jsonResultMes.LQyjbxx[0].jydz));
		$("#m_dwfzrzjhm").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzrzjhm));
		$("#m_dwfzr").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzr));
		$("#m_dwfzrlxfs").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzrlxfs));
		$("#m_xfshdw").attr("value",setNull(jsonResultMes.LQyjbxx[0].xfshdw));
		$("#m_xfhgzh").attr("value",setNull(jsonResultMes.LQyjbxx[0].xfhgzh));
		$("#m_gdxx").attr("value",setNull(jsonResultMes.LQyjbxx[0].gdxx));
		$("#m_zdskb").attr("value",setNull(jsonResultMes.LQyjbxx[0].zdskb));
		
		$("#m_jqbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].jqbm));
		$("#m_tyrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].tyrq));
		$("#m_djrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].djrq));
		
		var zt = setNull(jsonResultMes.LQyjbxx[0].zt);
		$("#s_zt").attr("value",zt);
		if(zt=='11'){ //显示 未通过原因 按钮
			$("#but").attr("width",124);
			document.getElementById('wtgyy').style.display='block';
		}
		
		$("#m_bwbmdh").attr("value",setNull(jsonResultMes.LQyjbxx[0].bwbmdh));
		$("#m_thbajgdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].thbajgdm));
		$("#m_thbajg").attr("value",setNull(jsonResultMes.LQyjbxx[0].thbajg));
		$("#m_azsxtsl").attr("value",setNull(jsonResultMes.LQyjbxx[0].azsxtsl));
		$("#m_sfazsxt").setValue(setNull(jsonResultMes.LQyjbxx[0].sfazsxt),115);
		$("#m_jyxkFzjgdm").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkFzjgdm));
		
		//营业执照、经营许可证
		$("#m_yyzzZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzZjbh));
		$("#m_yyzzFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzFzjg));
		$("#m_yyzzQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzQsrq));
		$("#m_yyzzJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzJzrq));
		
		$("#m_jyxkZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkZjbh));
		$("#m_jyxkFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkFzjg));
		$("#m_jyxkQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkQsrq));
		$("#m_jyxkJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkJzrq));
		
		$("#m_thxkZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkZjbh));
		$("#m_thxkFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkFzjg));
		$("#m_thxkQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkQsrq));
		$("#m_thxkJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkJzrq));
		
		$("#m_swdjZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjZjbh));
		$("#m_swdjFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjFzjg));
		$("#m_swdjQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjQsrq));
		$("#m_swdjJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjJzrq));
		
		//人员信息
		$("#m_zrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].zrs));
		$("#m_hdrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].hdrs));
		$("#m_bafzrxm").attr("value",setNull(jsonResultMes.LQyjbxx[0].bafzrxm));
		$("#m_bars").attr("value",setNull(jsonResultMes.LQyjbxx[0].bars));
		$("#m_jgpxrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].jgpxrs));
		$("#m_cksl").attr("value",setNull(jsonResultMes.LQyjbxx[0].cksl));
		$("#m_bxbjsl").attr("value",setNull(jsonResultMes.LQyjbxx[0].bxbjsl));
		$("#m_bagsyj").attr("value",setNull(jsonResultMes.LQyjbxx[0].bagsyj));
		$("#m_bz").attr("value",setNull(jsonResultMes.LQyjbxx[0].bz));
		//默认赋值
		$("#bq_hylb").setValue(setNull(jsonResultMes.LQyjbxx[0].hylbdm),115); //value：根据代码赋下拉框值 text：是根据内容赋下拉框值
		//$("#bq_ylcsfl").setValue(setNull(jsonResultMes.LQyjbxx[0].qyzflbm),115);
		$("#bq_zajb").setValue(setNull(jsonResultMes.LQyjbxx[0].zabdm),115);
		$("#bq_frdbzj").setText(setNull(jsonResultMes.LQyjbxx[0].frdbzjlb),115);
		$("#bq_yyzt").setValue(setNull(jsonResultMes.LQyjbxx[0].yyztdm),115);
		$("#bq_hylb").setAttr("readonly","true"); //除了添加都需锁定行业类别
	}
</script>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td class="queryfont">&nbsp;场所基本信息</td>
		  </tr>
		  <tr>
		    <td valign="top"  class="tdbg"><table width="100%" border="0" cellspacing="0" cellpadding="1">
		      <tr id="qyjbxxTr1">
		        <td class="red">场所备案编号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" id="m_qybm" readonly class="readonly"/></td>
		        <td class="red">场所名称</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_qymc"/></td>
		        <td class="red">场所简称</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_qyjc"/></td>
		        <td class="pagedistd1">组织机构代码</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_qyzzjgdm" maxlength="9"
		        		onkeyup="htjdOnkeyupVal('m_qyzzjgdm','jyxk');" onBlur="htjdOnBlurNotOnlyZfVal('m_qyzzjgdm','jyxk','0','‘组织机构编码’','1','0');"/></td>
		      </tr>
		      <tr id="qyjbxxTr2">
		        <td width="11%" class="red">联系电话</td>
		        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_lxdh"/></td>
		        <td id="yzbm_title" width="11%" class="pagedistd1">邮政编码</td>
		        <td id="yzbm_conte" width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_yzbm" maxlength="6" onKeyUp="value=value.replace(/[^\d]/g,'')"/></td>
		        <td width="11%" class="pagedistd1">传真</td>
		        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_chzh"/></td>
		        <td id="jjlx_title" width="11%" class="red">经济类型</td>
		        <td id="jjlx_conte" width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jjlxmc" readonly/></td>
		      </tr>
		      <tr id="qyjbxxTr3">
		      	<td class="pagedistd1">注册资金(万元)</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_zczj"/></td>
		        <td class="red">经营范围(主营)</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jyfwzy"/></td>
		        <td id="jyfwjy_title" class="pagedistd1">经营范围(兼营)</td>
		        <td id="jyfwjy_conte" class="pagetd1" colspan="3"><input style="width:370px" type="text" class="inputstyle3" id="m_jyfwjy"/></td>
		      </tr>
		      <tr id="qyjbxxTr4">
		        <td id="jymj_title" class="red">经营面积(平米)</td>
		        <td id="jymj_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jymj"/></td>
		        <td id="yyzt_title" class="red">场所状态</td>
		        <td id="yyzt_conte" class="pagetd1"><select name="select3" id="bq_yyzt" onChange="yyztOnchange();"></select></td>
		        <td id="jydz_title" class="red">经营地址</td>
		        <td id="jydz_conte" class="pagetd1" colspan="3"><input style="width:370px" type="text" class="inputstyle3" id="m_jydz"/></td>
		      </tr>
		      <tr id="qyjbxxTr5">
		        <td class="red">法定代表人姓名</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_frdb"
		        	onkeyup="htjdOnkeyupVal('m_frdb','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_frdb','xingming','0','‘法定代表人’','1','0');"/></td>
		        <td class="red">法人证件类型</td>
		        <td class="pagetd1"><select name="select4" id="bq_frdbzj" onChange="frdbzjOnchange();"></select></td>
		        <td class="red">法人证件号码</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_frdbzjhm" onblur="frzjhmBlurVali();"/></td>
		        <td id="frlxfs_title" class="red">法人联系方式</td>
		        <td id="frlxfs_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_frdblxfs"/></td>
		      </tr>
		      <tr id="qyjbxxTr6">
		        <td class="red">开业日期</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_kyrq"/></td>
		        <td id="yysj_title" class="pagedistd1">营业时间</td>
		        <td id="yysj_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_yysj"/></td>
		        <td class="red">单位负责人</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_dwfzr"
		        	onkeyup="htjdOnkeyupVal('m_dwfzr','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_dwfzr','xingming','0','‘单位负责人’','1','0');"/></td>
		        <td class="red">单位负责人联系方式</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_dwfzrlxfs"/></td>
                </tr>
		      <tr id="qyjbxxTr7">
		        <td class="red">单位负责人<br>身份证号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_dwfzrzjhm" onblur="dwfzrzjhmBlurVali();"/></td>
		        <td id="zadj_title" class="red">场所治安级别</td>
		        <td id="zadj_conte" class="pagetd1"><select name="select2" id="bq_zajb" onChange="zajbOnchange();"></select></td>
		        <td class="pagedistd1">营业执照编号</td>
		        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="m_yyzzZjbh"/></td>
                <td class="pagedistd1">营业执照发证机关</td>
		        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="m_yyzzFzjg"
		        	onkeyup="htjdOnkeyupVal('m_yyzzFzjg','zhongwen');"/></td>
                </tr>
		      <tr id="qyjbxxTr8">
		        <td id="yyzzqsrq_title" class="pagedistd1">营业执照起始日期</td>
		        <td id="yyzzqsrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_yyzzQsrq"/></td>
		        <td id="yyzzjzrq_title" class="pagedistd1">营业执照截止日期</td>
		        <td id="yyzzjzrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_yyzzJzrq"/></td>
                <td class="pagedistd1" id="djrq_title" valign="top">营业执照登记日期</td>
		        <td class="pagetd1" id="djrq_content" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="m_djrq"/></td> 
		        <td id="jyxk_bh_" class="red">经营许可证号</td>
		        <td id="jyxk_bhConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jyxkZjbh"/></td>
		      </tr>
		      <tr>
		      	<td id="jyxk_fzjg_" class="red">经营许可证<br>发证机关</td>
		        <td id="jyxk_fzjgConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jyxkFzjg"
		        	onkeyup="htjdOnkeyupVal('m_jyxkFzjg','zhongwen');"/></td>
		        <td id="jyxk_qsrq" class="pagedistd1">经营许可证<br>起始日期</td>
		        <td id="jyxk_qsrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jyxkQsrq"/></td>
		        <td id="jyxk_jzrq" class="pagedistd1">经营许可证<br>截止日期</td>
		        <td id="jyxk_jzrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_jyxkJzrq"/></td>
		      </tr>
			  <tr>
				<td class="pagedistd1">股东信息</td>
				<td colspan="3" class="pagetd1"><textarea name="textarea" id="m_gdxx" cols="44" rows="2"></textarea></td>
				<td class="red" valign="top">项目内容</td>
				<td colspan="3" class="pagetd1"><textarea name="textarea" id="m_bz" cols="44" rows="2"></textarea></td>
			  </tr>
		    </table></td>
		  </tr>
		</table>	
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td id="ryjqt_title" class="queryfont">&nbsp;场地设备及人员情况</td>
		  </tr>
		  <tr>
		    <td class="tdbg">
			    <table width="100%" border="0" cellspacing="0" cellpadding="1">
			      <tr id="ryxxTr1">
			      	<td width="11%" class="red">消防合格证号</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_xfhgzh"/></td>
		        	<td width="11%" class="red">消防审核单位</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_xfshdw"
		        		onkeyup="htjdOnkeyupVal('m_xfshdw','zhongwen');"/></td>
		        	<td width="11%" class="pagedistd1">经纬度坐标</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3"  id="m_jwdzb"/></td>
		        	<td width="11%" class="pagedistd1">核定消费者数量(人)</td>
			        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_hdrs"/></td>
				  </tr>
				  <tr>
			        <td class="red" id="cksl_title">安全出口数量(个)</td>
			        <td class="pagetd1" id="cksl_content"><input style="width:120px" type="text" class="inputstyle3" id="m_cksl"/></td>
			        <td class="red" id="bxbjsl_title">包厢包间数量(间)</td>
			        <td class="pagetd1" id="bxbjsl_content"><input style="width:120px" type="text" class="inputstyle3" id="m_bxbjsl"/></td>
			        <td class="pagedistd1">总人数(人)</td>
			        <td class="pagetd1"><input tabindex="1000" style="width:120px" type="text" id="m_zrs" value="" readonly class="readonly"/></td>
			        <td class="red">治安负责人</td>
			        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="m_bafzrxm"
			        	onkeyup="htjdOnkeyupVal('m_bafzrxm','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('m_bafzrxm','xingming','0','‘治安负责人’','1','0');"/></td>
				  </tr>	
			      <tr>
			        <td class="pagedistd1"><label id="bars_title">保安人数(人)</label></td>
			        <td class="pagetd1" valign="top"><label id="bars_content"><input style="width:120px" type="text" class="inputstyle3" id="m_bars"/></label></td>
			        <td class="pagedistd1">经岗位培训人数(人)</td>
			        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="m_jgpxrs"/></td>
			      </tr>
			      <tr>
			        <td class="pagedistd1">保安公司意见</td>
			        <td colspan="7" class="pagetd1"><textarea name="textarea" id="m_bagsyj" cols="106" rows="2"></textarea></td>
			      </tr>
			    </table>
		    </td>
		  </tr>
		</table>