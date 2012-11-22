<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%@page import="com.aisino2.sysadmin.domain.Globalpar" %>
<%@page import="com.aisino2.cache.CacheManager" %>
<%@page import="com.aisino2.common.QjblUtil"%>
<%			
		String version_prjWebControl_skone = "";
		String device_urlHnOrJs_skone = "";
		Globalpar glo_skone = new Globalpar();
		Globalpar temp_skone = null;
		List globList_skone = null;
		
		glo_skone.setGlobalparcode("prjweb-bbh-new"); //prj 版本号
		globList_skone = CacheManager.getCacheGlobalpar(glo_skone);
		if(globList_skone!=null&&globList_skone.size()>0){
			temp_skone = (Globalpar)globList_skone.get(0);
			version_prjWebControl_skone = temp_skone.getGlobalparvalue();	
		}
		
		glo_skone.setGlobalparcode("kjvalidater-bbh"); //验证文件
		globList_skone = CacheManager.getCacheGlobalpar(glo_skone);
		if(globList_skone!=null&&globList_skone.size()>0){
			temp_skone = (Globalpar)globList_skone.get(0);
			device_urlHnOrJs_skone = temp_skone.getGlobalparvalue();	
		}
		String basePath = QjblUtil.queryQjblVal("ylyurl");
%>
<jsp:include page="../../public/prjWebControl-Card.jsp">
	<jsp:param name="objid" value="ctlICCard" />
</jsp:include>
<jsp:include page="../../public/device.jsp">
	<jsp:param name="objid" value="device" />
</jsp:include>
<script type="text/javascript">
//	var dxr_backWriteIckhUrl = "icksystem/updateIckslByNj_icksl.action";
	var knCyrybh="BX";
	var xmlObj = null;
	var allRight = true;
	var cardInfoVal = new Array();
	var cardInfoArr = new Array();
	cardInfoArr[0]='xingming'; 
	cardInfoArr[1]='cyrybh';
	cardInfoArr[2]='zjhm';
	cardInfoArr[3]='xb';   
	cardInfoArr[4]='minzu';  
	cardInfoArr[5]='zxbz'; //注销标识
	          
	cardInfoArr[6]='csrq'; //出生日期
	cardInfoArr[7]='hjsx'; //户籍省县
	cardInfoArr[8]='hjdxz'; //户籍详细地址
	cardInfoArr[9]='rjrq'; //有效起始日期
	cardInfoArr[10]='zatlq'; //有效截至日期
	cardInfoArr[11]='ywm';
	cardInfoArr[12]='ywx';
	cardInfoArr[13]='gj';
	cardInfoArr[14]='wgrjyxkz'; //外国人就业许可证
	cardInfoArr[15]='ickkh'; //IC卡卡号
	$(document).ready(function() {
		$("#ryImage").attr("src","icksystem/queryCyryzpImage_wldj.action?cyrybh=no");
	}); 
	function ReadRyDetail(){
		//1。读入数据库人员信息
		if (!checkControlValue("s_cyrybm","String",1,50,null,0,"从业人员编号"))
		return false;
		$("#s_cyrybh").attr("value",$("#s_cyrybm").val());
		$("#c_cyrybh").attr("value",$("#s_cyrybm").val());
		jAlert("请刷卡！","提示信息");
		OpenRead();//读取卡内容
	}
	
	function updatediv(json) { 
		$(".red").removeClass("red");
		$('span[@id^="w_"]').html("").end();
		$("#ryImage").attr("src","");
		if (json.result=="success"){
			if(json.icksl!=null){
				$("#w_cyrybh").append(setNull(json.icksl.cyrybh));
				changeRedFont(1,setNull(json.icksl.cyrybh));
				
				$("#w_xm").append(setNull(json.icksl.xm));
				changeRedFont(0,setNull(json.icksl.xm));
				
				$("#w_kh").append(setNull(json.icksl.kh));
				changeRedFont(15,setNull(json.icksl.kh));
				
				$("#w_minzu").append(setNull(json.icksl.minzu));
				changeRedFont(4,setNull(json.icksl.minzu));
				
				$("#w_xb").append(setNull(json.icksl.xb));
				changeRedFont(3,setNull(json.icksl.xb));
		
				$("#w_csrq").append(changeRqiNyr(json.icksl.csrq));
				changeRedFont(6,changeRqiNyr(json.icksl.csrq));
			
				$("#w_zxbz").append(setNull(json.icksl.sfzxmc));
				
				$("#w_hjdxzqh").append(setNull(json.icksl.hjdxzqh));
				changeRedFont(7,setNull(json.icksl.hjdxzqh));
			
				$("#w_hjdxz").append(setNull(json.icksl.hjdxz));
				changeRedFont(8,setNull(json.icksl.hjdxz));
				
				$("#w_zjhm").append(setNull(json.icksl.zjhm));
				changeRedFont(2,setNull(json.icksl.zjhm));
				
				$("#w_ywm").append(setNull(json.icksl.ywm));
				changeRedFont(11,setNull(json.icksl.ywm));
				
				$("#w_ywx").append(setNull(json.icksl.ywx));
				changeRedFont(12,setNull(json.icksl.ywx));
				
				$("#w_gj").append(setNull(json.icksl.gj));
				changeRedFont(13,setNull(json.icksl.gj));
				
				$("#w_wgrjyxkz").append(setNull(json.icksl.wgrjyxkz));
				changeRedFont(14,setNull(json.icksl.wgrjyxkz));
				
				$("#w_yxsksrq").append(changeRqiNyr(json.icksl.yxsksrq));
				changeRedFont(9,changeRqiNyr(json.icksl.yxsksrq));
				$("#w_yxqhzrq").append(changeRqiNyr(json.icksl.yxqhzrq));
				changeRedFont(10,changeRqiNyr(json.icksl.yxqhzrq));
				$("#ryImage").attr("src","icksystem/queryCyryzpImage_wldj.action?cyrybh="+setNull(json.icksl.cyrybh));
			}else{
				jAlert("该从业人员不存在","提示信息");
				$("#ryImage").attr("src","icksystem/queryCyryzpImage_wldj.action?cyrybh=no");
			}
		}else{
			jAlert("该从业人员不存在","提示信息");
			$("#ryImage").attr("src","icksystem/queryCyryzpImage_wldj.action?cyrybh=no");
		}
	}	
//刷卡掉此方法
	function setXmlAddData(xml){
		//获取卡内信息开始
		for(var index=0,max=cardInfoArr.length;index<max;index++){
			var temp0 = '<'+cardInfoArr[index]+'>';
			var temp1 = '</'+cardInfoArr[index]+'>';
			var h0 = temp0.length;
			var h1 = xml.indexOf(temp0);
			var h2 = xml.indexOf(temp1);
			cardInfoVal[index] = xml.substr((h1+h0),(h2-h1-h0));
		}
		///取得ick芯片号，kh和cyrybh
	    var ick_ickh=document.getElementById('ctlICCard').cardno;
	    var ick_kh=cardInfoVal[15];
	    var ick_cyrybh=cardInfoVal[1];
		if($("#s_cyrybh").val()==null||$("#s_cyrybh").val()==""){
			$("#s_cyrybh").attr("value",ick_cyrybh);
			$("#c_cyrybh").attr("value",ick_cyrybh);
		}
		setParams("s_");
		jQuery.post("icksystem/queryNjBx_icksl.action",params,updatediv,"json");
	}
	function changeRqiNyr(obj){ //改变日期格式为年月日
		obj = setNull(obj);
		if(obj!=''){
			obj = obj.replace("-","年");
			obj = obj.replace("-","月");
			obj = obj + '日';
		}
		return obj;
	}
	function changeRedFont(index,val){ //不同时 红色字体
		$("#"+cardInfoArr[index]).removeClass("red");
		$("#w_"+cardInfoArr[index]).removeClass("red");
		$("#pageName_"+cardInfoArr[index]).removeClass("red");
		$("#cardName_"+cardInfoArr[index]).removeClass("red");

		if(cardInfoVal[index]!=val){ 
			$("#"+cardInfoArr[index]).addClass("red");
			$("#w_"+cardInfoArr[index]).addClass("red");
			$("#pageName_"+cardInfoArr[index]).addClass("red");
			$("#cardName_"+cardInfoArr[index]).addClass("red");
			allRight = false;
		}
	}
	//补写
	function bxIckslNj(){
		if($("#c_cyrybh").val()=="")
		$("#c_cyrybh").attr("value",$("#s_cyrybm").val());
		jConfirm('请 刷 卡！', '提示', function(r) {
			if(r)
				startDxrIckBon(); //开始电写入
		});
	}
	function showMesToPage(){
	}
	//写入卡内容后的回调函数
	function WriteICCardFinish(backIckh){ //读卡结束回调函数
	    jAlert("补 写 卡 已 成 功！","提示信息");
	}
</script>
<input type="hidden" id="i_ryid">
<input type="hidden" id="projectUrl" value="<%=basePath %>">
<input type="hidden" id="s_zkztbs" value="6">
<input type="hidden" id="a_ryid">
<input type="hidden" id="b_ickh">
<input type="hidden" id="b_ickslid"/>
<input type="hidden" id="b_ryid"/>
<input type="hidden" id="c_sfbx" value="2"/>
<div>
<div align="right"><table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <tr>
      <td class="queryfont">IC卡补写</td>
    </tr>
     <tr>
      <td align="left"></td>
      <td></td>
    </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
</table>
</div>
  <table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
    <tr>
      <td class="tdbg"><table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td width="10%" class="distd">从业人员编号:</td>
            <td width="23%" class="detailtd">
            	<input name="cyrybm" class="inputstyle" id="s_cyrybm"></input>
            </td>
            <td width="50%" alian="right">
            	<table>
            		<tr>
            			<td width="10%" align="right"  class="pagedistd"><a href="#" class="submitbutton" onclick='ReadRyDetail();' >读取</a><a href="#" class="submitbutton" onclick='bxIckslNj();' >补写</a></td>
            		</tr>
            	</table>
            </td>
           
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="3"></td>
    </tr>
  </table>  
  <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tableborder">
    <tr>
      <td  colspan="5" class="queryfont">IC卡卡内信息</td>
    </tr>
    <tr>
          <td width="11%" id="cardName_xingming" class="distd1">姓名</td>
          <td width="29%" class="detailtd2"><span id="xingming">&nbsp;</span></td>
          <td width="11%" id="cardName_ickkh" class="distd1">IC卡卡号</td>
          <td width="30%" class="detailtd2"><span id="ickkh" >&nbsp;</span></td>
          <td width="18%" rowspan="13" class="detailtd2">&nbsp;</td>
 	</tr>
 
        <tr>
          <td width="14%" id="cardName_cyrybh" class="distd1">人员编号</td>
          <td width="24%"  class="detailtd2"><span id="cyrybh">&nbsp;</span></td>
          <td class="distd1" id="cardName_zjhm">公民身份号码</td>
          <td class="detailtd2"><span id="zjhm" >&nbsp;</span></td>
          
          </tr>
        <tr>
          <td class="distd1" id="cardName_xb">性别</td>
          <td class="detailtd2"><span id="xb">&nbsp;</span></td>
          <td class="distd1" id="cardName_minzu">民族</td>
          <td class="detailtd2"><span id="minzu">&nbsp;</span></td>
          </tr>
        <tr>
          <td class="distd1" id="cardName_csrq">出生日期</td>
          <td class="detailtd2"><span id="csrq">&nbsp;</span></td>
          <td class="distd1" id="cardName_zxbz">是否注销</td>
          <td class="detailtd2"><span id="zxbz">&nbsp;</span></td>
          </tr>
        <tr>
          <td class="distd1" d="cardName_hjsx">户籍省县</td>
          <td colspan="3" class="detailtd2"><span id="hjsx">&nbsp;</span></td>
          </tr>
        <tr>
          <td  class="distd1" id="cardName_hjdxz">户籍地详址</td>
          <td colspan="3" class="detailtd2"><span id="hjdxz">&nbsp;</span></td>
          </tr>
        <tr>
          <td class="distd1" id="cardName_ywm">英文名</td>
          <td class="detailtd2" ><span id="ywm">&nbsp;</span></td>
          <td class="distd1" id="cardName_ywx">英文姓</td>
          <td class="detailtd2" ><span id="ywx">&nbsp;</span></td>
        </tr>
        <tr>
          <td class="distd1" id="cardName_gj">国籍</td>
          <td  class="detailtd2"><span id="gj">&nbsp;</span></td>
          <td class="distd1" id="cardName_wgrjyxkz">就业许可证号</td>
          <td  class="detailtd2"><span id="wgrjyxkz">&nbsp;</span></td>
         </tr>
        <tr>
          <td class="distd1"  id="cardName_rjrq">有效起始日期</td>
          <td class="detailtd2"><span id="rjrq">&nbsp;</span></td>
          <td class="distd1" cardName_zatlq>有效截止日期</td>
          <td class="detailtd2"><span id="zatlq">&nbsp;</span></td>
        </tr>
	</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="3"></td>
    </tr>
  </table>  
  <table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
    <tr>
      <td colspan="5"  class="queryfont">人员、IC申请原信息</td>
    </tr>
     <tr>
          <td width="11%" class="distd1" id="pageName_xingming">姓名</td>
          <td width="30%" class="detailtd2"><span id="w_xm"></span></td>
          <td width="11%" class="distd1" id="pageName_kh">IC卡卡号</td>
          <td width="30%" class="detailtd2"><span id="w_kh" ></span></td>
          <td width="18%" rowspan="11" align="center" valign="top" class="detailtd2"><table width="35%" border="0" align="center" cellpadding="8" cellspacing="0">
        <tr><td><img id="ryImage" width="150" height="180" /></td></tr>
      </table></td>
        </tr>
        <tr>
          <td width="14%" class="distd1" id="pageName_cyrybh">人员编号</td>
          <td width="24%"  class="detailtd2"><span id="w_cyrybh"></span></td>
          <td class="distd1" id="pageName_zjhm">公民身份号码</td>
          <td class="detailtd2"><span id="w_zjhm" ></span></td>
          
          </tr>
        <tr>
          <td class="distd1" id="pageName_xb">性别</td>
          <td class="detailtd2"><span id="w_xb"></span></td>
          <td class="distd1" id="pageName_minzu">民族</td>
          <td class="detailtd2"><span id="w_minzu"></span></td>
          </tr>
        <tr>
          <td class="distd1" id="pageName_csrq">出生日期</td>
          <td class="detailtd2"><span id="w_csrq"></span></td>
          <td class="distd1" id="pageName_zxbz">是否注销</td>
          <td class="detailtd2"><span id="w_zxbz"></span></td>
          </tr>
        <tr>
          <td class="distd1" id="pageName_hjdxzqh">户籍省县</td>
          <td colspan="3" class="detailtd2"><span id="w_hjdxzqh"></span></td>
          </tr>
        <tr>
          <td  class="distd1" id="pageName_hjdxz">户籍地详址</td>
          <td colspan="3" class="detailtd2"><span id="w_hjdxz"></span></td>
          </tr>
        <tr>
          <td class="distd1" id="pageName_ywm">英文名</td>
          <td class="detailtd2" ><span id="w_ywm"></span></td>
          <td class="distd1" id="pageName_ywx">英文姓</td>
          <td class="detailtd2" ><span id="w_ywx"></span></td>
        </tr>
        <tr>
          <td class="distd1" id="pageName_gj">国籍</td>
          <td  class="detailtd2"><span id="w_gj"></span></td>
          <td class="distd1" id="pageName_wgrjyxkz">就业许可证号</td>
          <td  class="detailtd2"><span id="w_wgrjyxkz"></span></td>
         </tr>
        <tr>
          <td class="distd1" id="pageName_yxsksrq">有效起始日期</td>
          <td class="detailtd2" ><span id="w_yxsksrq"></span></td>
          <td class="distd1" id="pageName_yxqhzrq">有效截止日期</td>
          <td class="detailtd2"><span id="w_yxqhzrq"></span></td>
        </tr>
</table>
</div>
<input type="hidden" id="s_cyrybh"/>
<input type="hidden" id="c_cyrybh"/>
