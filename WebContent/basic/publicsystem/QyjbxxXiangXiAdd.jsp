<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML> 
<script type="text/javascript" src="javascript/jsconfig/icksystem/QyjbxxXiangXiAdd_HN.js"></script>
<BODY>
<!-- 页面的页签及加载状态 新加业-->
<select id="yqAndZt" style="DISPLAY:none">
<option value='qyxx'>0</option>
<option value='yl_qt'>0</option>
<option value='yl_baxx'>0</option>
<option value='yl_qtxx'>0</option>
</select>

<input type="hidden" id="a_hylbdm"/>
<input type="hidden" id="a_hylb"/>
<input type="hidden" id="a_frdbzjlb"/>
<input type="hidden" id="a_yyztdm"/>
<input type="hidden" id="a_yyztmc"/>
<input type="hidden" id="a_zjztdm"/>
<input type="hidden" id="a_zjztmc"/>
<input type="hidden" id="a_zabdm"/>
<input type="hidden" id="a_zajbmc"/>
<input type="hidden" id="a_jjlxbm"/>
<input type="hidden" id="a_qyfflbm"/>
<!--  <input type="text" id="a_qyfflmc"/>-->
<input type="hidden" id="a_gxdwbm"/>
<input type="hidden" id="a_qyzflbm"/>
<!--  <input type="hidden" id="a_qyzflmc"/>-->
<input type="hidden" id="qyfflid"/><!-- 企业副分类ID -->

	<table width="100%"  cellspacing="0" cellpadding="0" class="line" >
	<tr>
	<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="1">
			<tr>
		      	<td width="11%" class="red">行业类别</td>
		        <td width="14%" class="pagetd1"><select name="select" id="bq_hylb" onChange="hylbOnchange();"></select></td>
		        <td width="11%" class="red">治安管理机构</td>
		        <td class="pagetd1"><input style="width:370px" type="text" class="inputstyle3" id="a_gxdwmc"  readonly/></td>
			</tr>
			<tr id="hqZhuFuType">
		        <td class="red">场所分类(主)</td>
		        <td class="pagetd1">
		        <select name="select" id="bq_ylcsfl" onChange="csflOnchange();">
		        <option value=""></option></select>
		         <input  type="text" class="inputstyle" id="a_qyzflmc" readonly  value=''  />
		        </td>
		        <td class="pagedistd1" id="yly_csffl_title" style="display:none">场所分类(副)</td>
		        <td class="pagetd1" id="yly_csffl_content" style="display:none"><select name="select" id="bq_csffl"></select>
		        <input style="width:370px" type="text" class="inputstyle3" id="a_qyfflmc" readonly/>
		        </td>
			</tr>
		</table>
		<div id='context_jbxx'>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td class="queryfont">&nbsp;场所基本信息</td>
		  </tr>
		  <tr>
		    <td valign="top"  class="tdbg"><table width="100%" border="0" cellspacing="0" cellpadding="1" id="tableid">
		      <tr id="qyjbxxTr1">
		        <td class="red">场所备案编号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" id="a_qybm" readonly class="readonly"/></td>
		        <td class="red">娱乐场所名称</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_qymc"/></td>
		        <td class="red">娱乐场所简称</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_qyjc"/></td>
		        <td class="pagedistd1">组织机构代码</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_qyzzjgdm" maxlength="9"
		        		onkeyup="htjdOnkeyupVal('a_qyzzjgdm','jyxk');" onBlur="htjdOnBlurNotOnlyZfVal('a_qyzzjgdm','jyxk','0','‘组织机构编码’','1','0');"/></td>
		      </tr>
		      <tr id="qyjbxxTr2">
		        <td width="11%" class="red">联系电话</td>
		        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_lxdh"/></td>
		        <td id="yzbm_title" width="11%" class="pagedistd1">邮政编码</td>
		        <td id="yzbm_conte" width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_yzbm" maxlength="6" onKeyUp="value=value.replace(/[^\d]/g,'')"/></td>
		        <td width="11%" class="pagedistd1">传真</td>
		        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_chzh"/></td>
		        <td id="jjlx_title" width="11%" class="red">经济类型</td>
		        <td id="jjlx_conte" width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jjlxmc" readonly/></td>
		      </tr>
		      <tr id="qyjbxxTr3">
		      	<td class="pagedistd1">注册资金(万元)</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_zczj"/></td>
		        <td class="red">经营范围(主营)</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jyfwzy"/></td>
		        <td id="jyfwjy_title" class="pagedistd1">经营范围(兼营)</td>
		        <td id="jyfwjy_conte" class="pagetd1" colspan="3"><input style="width:370px" type="text" class="inputstyle3" id="a_jyfwjy"/></td>
		      </tr>
		      <tr id="qyjbxxTr4">
		        <td id="jymj_title" class="red">经营面积(平米)</td>
		        <td id="jymj_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jymj"/></td>
		        <td id="yyzt_title" class="red">娱乐服务场所状态</td>
		        <td id="yyzt_conte" class="pagetd1"><select name="select3" id="bq_yyzt" onChange="yyztOnchange();"></select></td>
		        <td id="jydz_title" class="red">经营地址</td>
		        <td id="jydz_conte" class="pagetd1" colspan="3"><input style="width:370px" type="text" class="inputstyle3" id="a_jydz"/></td>
		      </tr>
		      <tr id="qyjbxxTr5">
		        <td class="red">法定代表人姓名</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_frdb"
		        	onkeyup="htjdOnkeyupVal('a_frdb','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('a_frdb','xingming','0','‘法定代表人’','1','0');"/></td>
		        <td class="red">法人证件类型</td>
		        <td class="pagetd1"><select name="select4" id="bq_frdbzj" onChange="frdbzjOnchange();"></select></td>
		        <td class="red">法人证件号码</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_frdbzjhm" onblur="frzjhmBlurVali();"/></td>
		        <td id="frlxfs_title" class="red">法人联系方式</td>
		        <td id="frlxfs_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_frdblxfs"/></td>
		      </tr>
		      <tr id="qyjbxxTr6">
		        <td class="red">开业日期</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_kyrq"/></td>
		        <td id="yysj_title" class="pagedistd1">营业时间</td>
		        <td id="yysj_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_yysj"/></td>
		        <td class="red">单位负责人</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_dwfzr"
		        	onkeyup="htjdOnkeyupVal('a_dwfzr','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('a_dwfzr','xingming','0','‘单位负责人’','1','0');"/></td>
		        <td class="red">单位负责人联系方式</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_dwfzrlxfs"/></td>
                </tr>
		      <tr id="qyjbxxTr7">
		        <td class="red">单位负责人<br>身份证号</td>
		        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_dwfzrzjhm" onblur="dwfzrzjhmBlurVali();"/></td>
		        <td id="zadj_title" class="red">娱乐服务场所<br>治安级别</td>
		        <td id="zadj_conte" class="pagetd1"><select name="select2" id="bq_zajb" onChange="zajbOnchange();"></select></td>
		        <td class="pagedistd1">营业执照编号</td>
		        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="a_yyzzZjbh"/></td>
                <td class="pagedistd1">营业执照发证机关</td>
		        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="a_yyzzFzjg"
		        	onkeyup="htjdOnkeyupVal('a_yyzzFzjg','zhongwen');"/></td>
                </tr>
		      <tr id="qyjbxxTr8">
		        <td id="yyzzqsrq_title" class="pagedistd1">营业执照起始日期</td>
		        <td id="yyzzqsrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_yyzzQsrq"/></td>
		        <td id="yyzzjzrq_title" class="pagedistd1">营业执照截止日期</td>
		        <td id="yyzzjzrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_yyzzJzrq"/></td>
                <td class="pagedistd1" id="djrq_title" valign="top">营业执照登记日期</td>
		        <td class="pagetd1" id="djrq_content" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="a_djrq"/></td> 
		        <td id="jyxk_bh_" class="red">娱乐经营许可证号</td>
		        <td id="jyxk_bhConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jyxkZjbh"/></td>
		      </tr>
		      <tr>
		      	<td id="jyxk_fzjg_" class="red">娱乐经营许可证<br>发证机关</td>
		        <td id="jyxk_fzjgConte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jyxkFzjg"
		        	onkeyup="htjdOnkeyupVal('a_jyxkFzjg','zhongwen');"/></td>
		        <td id="jyxk_qsrq" class="pagedistd1">娱乐经营许可证<br>起始日期</td>
		        <td id="jyxk_qsrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jyxkQsrq"/></td>
		        <td id="jyxk_jzrq" class="pagedistd1">娱乐经营许可证<br>截止日期</td>
		        <td id="jyxk_jzrq_conte" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_jyxkJzrq"/></td>
		      </tr>
			  <tr>
				<td class="pagedistd1">股东信息</td>
				<td colspan="3" class="pagetd1"><textarea name="textarea" id="a_gdxx" cols="44" rows="2"></textarea></td>
				<td class="red" valign="top">娱乐项目内容</td>
				<td colspan="3" class="pagetd1"><textarea name="textarea" id="a_bz" cols="44" rows="2"></textarea></td>
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
			    <table width="100%" border="0" cellspacing="0" cellpadding="1" id="tableid1">
			      <tr id="ryxxTr1">
			      	<td width="11%" class="red">消防合格证号</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_xfhgzh"/></td>
		        	<td width="11%" class="red">消防审核单位</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_xfshdw"
		        		onkeyup="htjdOnkeyupVal('a_xfshdw','zhongwen');"/></td>
		        	<td width="11%" class="pagedistd1">经纬度坐标</td>
		        	<td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3"  id="a_jwdzb"/></td>
		        	<td width="11%" class="pagedistd1">核定消费者数量(人)</td>
			        <td width="14%" class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_hdrs"/></td>
				  </tr>
				  <tr>
			        <td class="red" id="cksl_title">安全出口数量(个)</td>
			        <td class="pagetd1" id="cksl_content"><input style="width:120px" type="text" class="inputstyle3" id="a_cksl"/></td>
			        <td class="red" id="bxbjsl_title">包厢包间数量(间)</td>
			        <td class="pagetd1" id="bxbjsl_content"><input style="width:120px" type="text" class="inputstyle3" id="a_bxbjsl"/></td>
			        <td class="pagedistd1">总人数(人)</td>
			        <td class="pagetd1"><input tabindex="1000" style="width:120px" type="text" id="a_zrs" value="" readonly class="readonly"/></td>
			        <td class="red">治安负责人</td>
			        <td class="pagetd1"><input style="width:120px" type="text" class="inputstyle3" id="a_bafzrxm"
			        	onkeyup="htjdOnkeyupVal('a_bafzrxm','xingming');" onBlur="htjdOnBlurNotOnlyZfVal('a_bafzrxm','xingming','0','‘治安负责人’','1','0');"/></td>
				  </tr>	
			      <tr>
			        <td class="pagedistd1"><label id="bars_title">保安人数(人)</label></td>
			        <td class="pagetd1" valign="top"><label id="bars_content"><input style="width:120px" type="text" class="inputstyle3" id="a_bars"/></label></td>
			        <td class="pagedistd1">经岗位培训人数(人)</td>
			        <td class="pagetd1" valign="top"><input style="width:120px" type="text" class="inputstyle3" id="a_jgpxrs"/></td>
			      </tr>
			      <tr>
			        <td class="pagedistd1">保安公司意见</td>
			        <td colspan="7" class="pagetd1"><textarea name="textarea" id="a_bagsyj" cols="106" rows="2"></textarea></td>
			      </tr>
			    </table>
		    </td>
		  </tr>
		</table>
		</div>
	</tr>
	</table>

</BODY>
</HTML>