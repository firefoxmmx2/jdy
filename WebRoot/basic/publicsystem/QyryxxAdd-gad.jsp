<%@ page language="java" pageEncoding="UTF-8" %>
<script type="text/javascript" src="javascript/jsconfig/publicsystem/QyryxxAdd-gad.js">	
</script>
<div id="clearDiv"></div>
<!-- <input type="hidden" id="a_qybm"> -->
<input type="hidden" id="a_zjzt"/>
<input type="hidden" id="a_fileload"/>
<input type="hidden" id="a_xb"/>
<input type="hidden" id="a_hyzk"/>
<input type="hidden" id="a_mzdm"/>
<input type="hidden" id="a_hjdxzqhdm"/>
<input type="hidden" id="a_xx">
<input type="hidden" id="a_whcd"/>
<input type="hidden" id="a_gwmc" />
<input type="hidden" id="a_cylbdm"/>
<input type="hidden" id="a_gzdm" />
<input type="hidden" id="a_gwbh" value="9999"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
      <td align="left" class="title1">从业人员新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#cyryxx_detail").hideAndRemove("show");'class="close"></a></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>

<table width="100%" cellpadding="2" cellspacing="0" id="add">
	<tr id="qyryxxTr1" height="20">
		<td id="hylbdm_title" class="red">行业类别</td>
		<td id="hylbdm_data" class="detailtd"><select type="select" id="a_hylbdm"></select></td>
		<td id="qymc_title" class="red">企业名称</td>
		<td id="qymc_data" class="detailtd"><input type="text" class="inputstyle" id="a_qymc" readonly/></td>
	</tr>
	<tr id="qyryxxTr2" height="20">
		<td id="qybm_title" width="12%" class="red">企业代码</td>
	    <td id="qybm_data" width="22%" class="detailtd"><input type="text" readonly="readonly" id="a_qybm" class="readonly"> </td>
	    <td id="xm_title" width="15%" class="red">姓名</td>
		<td id="xm_data" width="22%" class="detailtd"><input type="text" class="inputstyle" id="a_xm"/></td>
		<td width="27%" rowspan="13" align="center" valign="top">
			<table width="35%" border="0" align="center" cellpadding="8" cellspacing="0">
	        <tr><td><jsp:include page="qyryPicture.jsp?zh=true&mo=2&pic=picControlscr&wi=87&hi=124" flush="true"></jsp:include>
	        </td></tr>
	      	</table></td>
	</tr>
	<tr id="qyryxxTr3" height="20">
	    <td id="xb_title" class="red">性别</td>
		<td id="xb_data" class="detailtd"><select id="a_xbdm"><option></option></select></td>
		<td id="whcd_title" class="red">文化程度</td>
		<td id="whcd_data" class="detailtd"><select id="a_whcddm"><option></option></select></td>
    </tr>
	<tr id="qyryxxTr4" height="20">
		<td id="mz_title" class="red">民族</td>
		<td id="mz_data" class="detailtd"><input type="text" id="a_minzu" class="inputstyle" readonly/></td>
		<td id="cyrybh_title" class="distd">人员编号</td>
		<td id="cyrybh_data" class="detailtd"><input type="text" class="readonly" id="a_cyrybh" readonly/></td>
	</tr>
	<tr id="qyryxxTr5" height="20">
		<td id="hyzk_title" class="distd">婚姻状况</td>
		<td id="hyzk_data" class="detailtd"><select name="select5" id="a_hyzkdm"><option></option></select></td>
    </tr>
	<tr id="qyryxxTr6" height="20">
	    <td id="zjhm_title" class="red">公民身份号码</td>
		<td id="zjhm_data" class="detailtd"><input type="text" class="inputstyle" id="a_zjhm"/></td>
		<td id="csrq_title" class="red">出生日期</td>
		<td id="csrq_data" class="detailtd"><input type="text" class="inputstyle" id="a_csrq"/></td>
    </tr>
    <tr id="qyryxxTr10" height="20">
	    <td id="hjdxzqh_title" class="red">户籍省县</td>
		<td id="hjdxzqh_data" class="detailtd"><input type="text" class="inputstyle" id="a_hjdxzqh" readonly/></td>
		<td id="zzzhm_title" class="distd">暂住证号</td>
		<td id="zzzhm_data"  class="detailtd"><input type="text" class="inputstyle" id="a_zzzhm"/></td>
    </tr>
    <tr id="qyryxxTr7" height="20">
        <td id="hjdxz_title" class="red">户籍地详址</td>
		<td id="hjdxz_data" colspan="3"  class="detailtd"><input type="text" style="width:450" class="inputstyle3" id="a_hjdxz"   /></td>
    </tr>
    <tr id="qyryxxTr15" height="20">
		<td id="zzdz_title" class="red">现住址</td>
		<td id="zzdz_data" colspan="3" class="detailtd"><input type="text" style="width:450" class="inputstyle3" id="a_zzdz"/></td>
	</tr>
	<tr id="qyryxxTr12" height="20">
	   <!-- <td id="rylb_title" class="red">人员类别</td>
		<td id="rylb_data" class="detailtd"><input type="text" id="a_cylb" class="inputstyle" readonly /></td>
	    <td id="gwlb_title" class="red">岗位类别</td>
		<td id="gwlb_data" class="detailtd"><select type="text" id="a_gwbh"><option></option></select></td> --> 
		<td id="sj_title" class="red">手机</td>
		<td id="sj_data" class="detailtd"><input type="text" class="inputstyle" id="a_shouji"/></td>
		<td id="zw_title" class="red">职务</td>
		<td id="zw_data" class="detailtd"><input type="text" class="inputstyle" id="a_zhiwu"/></td>
    </tr>
    <tr id="qyryxxTr14" height="20">
		<td id="gz_title" class="red">工种</td>
		<td id="gz_data" class="detailtd"><input type="text" class="inputstyle" id="a_gz" readonly/></td>
		<td id="blank_title" class="distd">&nbsp;</td>
		<td id="blank_data" class="detailtd">&nbsp;</td>
	</tr>
	<tr id="qyryxxTr11" height="20">
	    <td id="jjlxr_title" class="distd">紧急联系人</td>
		<td id="jjlxr_data" class="detailtd"><input type="text" class="inputstyle" id="a_jjlxr"/></td>
		<td id="jjlxrdh_title" class="distd">紧急联系电话</td>
		<td id="jjlxrdh_data" class="detailtd"><input type="text" class="inputstyle" id="a_jjlxrdh"/></td>
	</tr>
    <tr id="qyryxxTr8" height="20">
        <td id="xx_title" class="red">血型</td>
		<td id="xx_data" class="detailtd"><select id="a_xxdm"><option></option></select></td> 
		<td id="bm_title" class="distd">别名</td>
		<td id="bm_data" class="detailtd"><input type="text" class="inputstyle" id="a_bm"/></td>
    </tr>
	<tr id="qyryxxTr9" height="20">
	    <td id="rzrq_title" class="red">入职日期</td>
		<td id="rzrq_data" class="detailtd"><input type="text" id="a_rzrq" class="inputstyle"/></td>
		<td id="lzrq_title" class="distd">离职日期</td>
		<td id="lzrq_data" class="detailtd"><input type="text" id="a_lzrq" class="inputstyle"/></td>
	</tr>
	
	<tr id="qyryxxTr13" height="20">
		<td id="sg_title" class="distd">身高（厘米）</td>
		<td id="sg_data" class="detailtd"><input type="text" class="inputstyle" id="a_shengao"/></td>
		<td id="tz_title" class="distd">体重(公斤)</td>
		<td id="tz_data" class="detailtd"><input type="text" class="inputstyle" id="a_tizh"/></td>
	</tr>
	<tr id="qyryxxTr16" height="20">
	 <td id="gwzrms_title" width="12%" class="distd" valign="top">岗位责任描述 </td>
     <td id="gwzrms_data" colspan="4" width="88%" class="detailtd"><textarea name="textarea2" id="a_gwzrms" cols="78" rows="3"></textarea></td>
		
	</tr>
	<tr id="qyryxxTr17" height="20">
	   <td id="bz_title" width="12%" class="distd" valign="top">备注 </td>
       <td id="bz_data" colspan="4"  width="88%" class="detailtd"><textarea name="textarea2" id="a_bz" cols="78" rows="3"></textarea></td>		
	</tr>
	<tr height="25" align="center">
		<td colspan="5">
		<a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='setAdd_cyry();'>保存</a>
	</td></tr>
</table>
