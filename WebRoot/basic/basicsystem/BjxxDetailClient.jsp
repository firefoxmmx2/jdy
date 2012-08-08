<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants"%>
<%
	User user = (User) session.getAttribute(Constants.userKey);
%>
<script type="text/javascript">
	$(document).ready(function() {
	
		// 读取报警信息数据
		setParams("m_");
		jQuery.post("basicsystem/query_bjxxb.action",params,bjxxDetaildiv,"json"); // 提交到BjxxbAction中,调用其中的query方法
	
	}); 
	function bjxxDetaildiv (json) {                         
		$("#bjxxDetail_show_sfqrbj").append(setNull(json.LBjxxb[0].show_sfqrbj));
		$("#bjxxDetail_show_sfcj").append(setNull(json.LBjxxb[0].show_sfcj));
		$("#bjxxDetail_bjgzid").append(setNull(json.LBjxxb[0].bjgzid));
		$("#bjxxDetail_bjxxid").append(setNull(json.LBjxxb[0].bjxxid));
		$("#bjxxDetail_ssqymc").append(setNull(json.LBjxxb[0].ssqymc));
		$("#bjxxDetail_ssqydz").append(setNull(json.LBjxxb[0].ssqydz));
		$("#bjxxDetail_gxdwbm").append(setNull(json.LBjxxb[0].gxdwbm));
		$("#bjxxDetail_gxdwmc").append(setNull(json.LBjxxb[0].gxdwmc));
		$("#bjxxDetail_bjlx").append(setNull(json.LBjxxb[0].bjlx));
		$("#bjxxDetail_bjsj").append(setNull(json.LBjxxb[0].bjsj));
		$("#bjxxDetail_bdbm").append(setNull(json.LBjxxb[0].bdbm));
		$("#bjxxDetail_ywbm").append(setNull(json.LBjxxb[0].ywbm));
	    ywbm = setNull(json.LBjxxb[0].ywbm);   ///////业务表名
		
		$("#bjxxDetail_hylb").append(setNull(json.LBjxxb[0].hylb));
		$("#bjxxDetail_xm").append(setNull(json.LBjxxb[0].xm));
		$("#bjxxDetail_gmsfhm").append(setNull(json.LBjxxb[0].gmsfhm));
		$("#bjxxDetail_jyaq").append(setNull(json.LBjxxb[0].jyaq));
		$("#bjxxDetail_ladwbm").append(setNull(json.LBjxxb[0].ladwbm));
		$("#bjxxDetail_ladwmc").append(setNull(json.LBjxxb[0].ladwmc));
		$("#bjxxDetail_gxbbh").append(setNull(json.LBjxxb[0].gxbbh));
		$("#bjxxDetail_ywlb").append(setNull(json.LBjxxb[0].ywlb));
		$("#bjxxDetail_pjbmdm").append(setNull(json.LBjxxb[0].pjbmdm));
		$("#bjxxDetail_pjbmmc").append(setNull(json.LBjxxb[0].pjbmmc));
		$("#bjxxDetail_pjr").append(setNull(json.LBjxxb[0].pjr));
		$("#bjxxDetail_pjsj").append(setNull(json.LBjxxb[0].pjsj));
		$("#bjxxDetail_jqzt").append(setNull(json.LBjxxb[0].jqzt));
		$("#bjxxDetail_cjbm").append(setNull(json.LBjxxb[0].cjbm));
		$("#bjxxDetail_cjbmdm").append(setNull(json.LBjxxb[0].cjbmdm));
		$("#bjxxDetail_chjsj").append(setNull(json.LBjxxb[0].chjsj));
		$("#bjxxDetail_cjfzr").append(setNull(json.LBjxxb[0].cjfzr));
		$("#bjxxDetail_lxdh").append(setNull(json.LBjxxb[0].lxdh));
		$("#bjxxDetail_cjfklb").append(setNull(json.LBjxxb[0].cjfklb));
		$("#bjxxDetail_cjfkbz").append(setNull(json.LBjxxb[0].cjfkbz));
		$("#bjxxDetail_fkdw").append(setNull(json.LBjxxb[0].fkdw));
		$("#bjxxDetail_fkdwbm").append(setNull(json.LBjxxb[0].fkdwbm));
		$("#bjxxDetail_fkrq").append(setNull(json.LBjxxb[0].fkrq));
		$("#bjxxDetail_fkr").append(setNull(json.LBjxxb[0].fkr));
		$("#bjxxDetail_cjjg").append(setNull(json.LBjxxb[0].cjjg));
		$("#bjxxDetail_chjjg").append(setNull(json.LBjxxb[0].chjjg));
		$("#bjxxDetail_zhsj").append(setNull(json.LBjxxb[0].zhsj));
		$("#bjxxDetail_wxyy").append(setNull(json.LBjxxb[0].wxyy));
		$("#bjxxDetail_sfyxbj").append(setNull(json.LBjxxb[0].sfyxbj));
		$("#bjxxDetail_ywbzj").val(setNull(json.LBjxxb[0].ywbzj));
		$("#bjxxDetail_hylbdm").val(setNull(json.LBjxxb[0].hylbdm));
		showOtherJsp();
	}	
	
function showOtherJsp(){
	// 读取本地布控或者全国在逃人员数据

	$("#div_bdxx").empty();
	if($("#current_recordBjlx").attr("value")=="全国在逃报警"){
		$("#div_bdxx").load("basic/basicsystem/BjxxDetailQgztjyxxKz.jsp");
	}else if($("#current_recordBjlx").attr("value")=="本地布控报警"){
		$("#div_bdxx").load("basic/basicsystem/BjxxDetailBdbkryxxKz.jsp");
	}
	$("#div_bdxx").show("slow");
	
	dataid = $("#bjxxDetail_ywbzj").attr("value");
	var hylbdm = $("#bjxxDetail_hylbdm").attr("value");
	// 读取国内旅客历史信息或从业人员历史信息

	$("#div_ywxx").empty();
	if(hylbdm=="A"){
		//$("#div_ywxx").load("business/Lgyzagl/Gnlk_lsxxDetail.jsp");
		// - 20120328 安徽需求 新增访客报警详情页面 - 陈勇荣
		if(ywbm=="visitor"){
			$("#div_ywxx").load("business/Lgyzagl/FkglDetailOfBaojing.jsp");
		}else{
			$("#div_ywxx").load("business/Lgyzagl/Gnlk_lsxxDetail.jsp");
		}
	}else if(hylbdm=="J"){
		$("#div_ywxx").load("business/Ylfwzagl/Cyryxx_lsxxDetailKz.jsp");
	}else if(hylbdm=="C01"){	////机动车拆解送车人信息
	    if(ywbm=="t_qyryxx"){ //从业人员
	       	$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="C01_T_CLJBXX_CZ"){
			$("#div_ywxx").load("business/jdccjzagl/Cljbxx_Bjls_cz.jsp");
		}else if(ywbm=="C01_T_HSCLJBXX_SCR"){
			$("#div_ywxx").load("business/jdccjzagl/Hscljbxx_Bjls_scr.jsp");
		}
	}else if(hylbdm=="E03"){
	    if(ywbm=="t_qyryxx"){  //从业人员
			$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
		}else if(ywbm=="E03_T_DDXX_LS_DH"){  ///典当业当户信息        
	      	$("#div_ywxx").load("business/Ddhyzagl/DdxxBjDetail.jsp");
	    }else if(ywbm=="E03_T_DDXX_LS_WTR"){  ///典当业委托人信息
	      	$("#div_ywxx").load("business/Ddhyzagl/WtrxxBjDetail.jsp");
	    }else if(ywbm=="E03_T_DDWPCL_LS_CL"){  ///典当业车辆信息
	      	$("#div_ywxx").load("business/Ddhyzagl/wpclxxBjDetail.jsp");
	    }else if(ywbm=="E03_T_DDWPSJ_LS_SJ"){  ///典当业手机信息
	     	$("#div_ywxx").load("business/Ddhyzagl/wpsjxxBjDetail.jsp");
	    }else if(ywbm=="E03_T_SDXX_LS_SDR"){  ///典当业赎当人信息
	      	$("#div_ywxx").load("business/Ddhyzagl/SdxxBjDetail.jsp");
	    }
	}else if(hylbdm=="C"){
	    if(ywbm=="t_qyryxx"){  //从业人员
			$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	   	}else if(ywbm=="C_T_JXCLJBXX_LS_CZ"){  //车主
	      	$("#div_ywxx").load("business/jxyzagl/JxcljbxxCzBjDetail.jsp");
	    }else if(ywbm=="C_T_JXCLJBXX_LS_SCR"){  //送车人
	      	$("#div_ywxx").load("business/jxyzagl/JxcljbxxScrBjDetail.jsp");
	    }else if(ywbm=="C_T_JXCLJBXX_LS_QCR"){  ///取车人
	      	$("#div_ywxx").load("business/jxyzagl/JxcljbxxQcrBjDetail.jsp");
	   	}else if(ywbm=="C_T_JXCLJBXX_LS_WX"){  //维修      
	      	$("#div_ywxx").load("business/jxyzagl/CljxclwxBjDetail.jsp");         
	    }else if(ywbm=="C_T_JXCLJBXX_LS_CLXX"){  ///车辆
	      	$("#div_ywxx").load("business/jxyzagl/JxcljbxxBjDetail.jsp");
	    }
	}else if(hylbdm=="E07"){
		if(ywbm=="t_qyryxx"){  //从业人员
			$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
		}else if(ywbm=="E07_T_WTJMXX_SYR"){
			$("#div_ywxx").load("business/wtjmzagl/WtjmxxSyrBjDetail.jsp");
		}else if(ywbm=="E07_T_WTJMXX_WTR"){
			$("#div_ywxx").load("business/wtjmzagl/WtjmxxWtrBjDetail.jsp");
		}else if(ywbm=="E07_T_HWQX_RY"){
			$("#div_ywxx").load("business/wtjmzagl/WtjmhwqxlxrxxDetail.jsp");
		}
	}else if(hylbdm=="B"){
	    if(ywbm=="t_yzzzcyrxx"){ // 印章业  参与人员报警
	        $("#div_ywxx").load("business/yzyzagl/YzzzcyrxxDetail.jsp");
	    }else if(ywbm=="t_yzzzdwcyryxx"){  ///印章业  从业人员报警
	        $("#div_ywxx").load("business/yzyzagl/YzzzdwcyrylsxxDetail.jsp"); 
	   	}else if(ywbm=="t_qyryxx"){  //印章业  从业人员报警 - 张浩明20120324新增页面 - 印章报警功能更新 - 陈勇荣上传
	      	$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	   	}else if(ywbm=="t_yzxxwtr"){//印章委托人 
	      	$("#div_ywxx").load("business/yzyzagl/ZzdwYzxxWtrDetail.jsp");
	    }else if(ywbm=="t_yzxxjbr"){//印章经办人
	      	$("#div_ywxx").load("business/yzyzagl/YzsqdJbrDetail.jsp");
	    }else if(ywbm=="t_yzxxqzr"){//印章取章人
	      	$("#div_ywxx").load("business/yzyzagl/YzsqdJbrDetail.jsp");
	    }
	}else if(hylbdm=="E01"){
	    /*if(ywbm=="t_escjyxx"){ //二手车交易信息
	       $("#div_ywxx").load("business/esczagl/EscjyxxDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_qyryxx"){  //二手车从业人员信息
	       $("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="t_cljbxx"){  //二手车车主信息
	       $("#div_ywxx").load("basic/publicsystem/CzjbxxDetail.jsp");
	    }*/ //- 与报警详情页面同步方法 - 陈勇荣
	    if(ywbm=="t_escjyxx"){ 
			if(bjgzsfyx=="51"){ //二手车主委托人信息
		    	$("#div_ywxx").load("business/esczagl/EscczwtrDetail.jsp");
		    }else if(bjgzsfyx=="52"){//二手车购买人信息
		      	$("#div_ywxx").load("business/esczagl/EscgmrDetail.jsp");
		    }else if(bjgzsfyx=="53"){//二手车卖车人信息
		      	$("#div_ywxx").load("business/esczagl/EscesmcrDetail.jsp");
		    }else if(bjgzsfyx=="54"){//二手车卖车委托人信息
		      	$("#div_ywxx").load("business/esczagl/EscmcwtrDetail.jsp");
		    }else if(bjgzsfyx=="55"){//二手车卖车被委托人信息
		      	$("#div_ywxx").load("business/esczagl/EscmcbwtrDetail.jsp");
		    }else{ //二手车交易明细信息
		      	$("#div_ywxx").load("business/esczagl/EscjyxxDetail.jsp",function(){$("#tablehead").hide();});
		    }
	    }else if(ywbm=="t_qyryxx"){  //二手车从业人员信息
	       	$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="t_cljbxx"){  //二手车车主信息
	    	$("#div_ywxx").load("basic/publicsystem/CljbxxczDetail.jsp");
	      	// $("#div_ywxx").load("basic/publicsystem/CzjbxxDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_CZR"){  //二手车车主信息
	       $("#div_ywxx").load("business/esczagl/EscBjCzDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_GMR"){  //二手车购买人信息
	       $("#div_ywxx").load("business/esczagl/EscBjGmrDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_MCR"){  //二手车卖车人信息
	       $("#div_ywxx").load("business/esczagl/EscBjMcrDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_WTR"){  //二手车委托人信息
	       $("#div_ywxx").load("business/esczagl/EscBjWtrDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_MCWTR"){  //二手车卖车委托人信息
	       $("#div_ywxx").load("business/esczagl/EscBjMcwtrDetail.jsp");
	    }else if(ywbm=="E01_T_ESCJYXX_LSXX_MCBWTR"){  //二手车卖车被委托人信息
	       $("#div_ywxx").load("business/esczagl/EscBjMcbwtrDetail.jsp");
	    }
	}else if(hylbdm=="E02"){
	    /*if(ywbm=="t_esjtwryxx"){ //二手机摊位人员信息
	       $("#div_ywxx").load("business/esjzagl/EsjtwrylsxxDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_qyryxx"){  //二手机从业人员信息
	       $("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="t_esjjy"){  //二手机交易信息
	       $("#div_ywxx").load("business/esjzagl/EsjjyDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_tyzlxx"){  //二手机摊主信息
	       $("#div_ywxx").load("business/esjzagl/TwzllsxxDetail.jsp");
	    }*/ //- 与报警详情页面同步方法 - 陈勇荣
	    if(ywbm=="t_esjtwryxx"){ //二手机摊位人员信息
	       $("#div_ywxx").load("business/esjzagl/EsjtwryxxDetailOfBaojing.jsp");
	    }else if(ywbm=="t_qyryxx"){  //二手机从业人员信息
	       $("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="t_esjjy"){ 
	     	if(bjgzsfyx=="71"){ //二手机出售人信息
	     		$("#div_ywxx").load("business/esjzagl/EsjcsrDetail.jsp");
	     	}else{  //二手机交易信息
				$("#div_ywxx").load("business/esjzagl/EsjjyDetail.jsp",function(){$("#tablehead").hide();});
	       	}
	    }else if(ywbm=="t_tyzlxx"){  //二手机摊主信息
	       	$("#div_ywxx").load("business/esjzagl/TwzlxxDetailOfBaojing.jsp");//二手机报警详情页面修改 - 20120324二手机报警功能升级 - 陈勇荣
	    }else if(ywbm=="E02_T_ESJJY_LSXX_CSR"){
	    	$("#div_ywxx").load("business/esjzagl/EsjBjCsrDetail.jsp");
	    }
	}else if(hylbdm=="Z"){ //出租房屋类型
		$("#div_ywxx").load("business/czfwzagl/Chengzuren_lsxxDetail.jsp");
		
	}else if(hylbdm=="F01"){ //出租汽车
	   	if(ywbm=="t_czcjsyxx"){ //出租车驾驶员
		 	$("#div_ywxx").load("business/czczagl/CzcjsyxxDetail.jsp", function(){
		 		$("#czcJsytableHead").find("td:first").removeClass("title1").addClass("queryfont");
		 		$("#czcJsytableHead").find("td:last").remove();
		 	});
	   	}else if(ywbm=="t_qyryxx"){ //从业人员
	     	$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	   	}else if(ywbm=="F01_T_CZCJSYXX_LSXX_JSY"){  //出租车驾驶员
	       $("#div_ywxx").load("business/czczagl/CzcBjJsyDetail.jsp");
	   	}else if(ywbm=="F01_T_CZCCLJBXX_LSXX_CZR"){  //出租车车主
	       $("#div_ywxx").load("business/czczagl/CzcBjCzDetail.jsp");
	   	}
	}else if(hylbdm=="F02"){ //汽车租赁
		if(ywbm=="t_qyryxx"){  //从业人员
			$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
		}else if(ywbm=="F02_T_QCZLCLJBXX_LS_CZ"){  //车主
	     	$("#div_ywxx").load("business/qczlzagl/QczlCzBjDetail.jsp");
		}else if(ywbm=="F02_T_QCZLKHXXB_LS_KHXX"){ //客户信息
   			$("#div_ywxx").load("business/qczlzagl/QczlKhBjDetail.jsp");
		}else if(ywbm=="F02_T_QCZLCLJBXX_LS_CLXX"){ //车辆信息
   			$("#div_ywxx").load("business/qczlzagl/QczlClBjDetail.jsp");
		}
	}else if(hylbdm=="E04"){ //废旧金属
	  	if(ywbm=="t_qyryxx"){  //从业人员  
			$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	  	}else if(ywbm=="E04_T_FJJSSGXX_JBR"){
		    $("#div_ywxx").load("business/fjjssgyzagl/FjjssgxxJbrBjDetail.jsp");
	  	}else if(ywbm=="E04_T_FJJSSGXX_FR"){
			$("#div_ywxx").load("business/fjjssgyzagl/FjjssgxxFrBjDetail.jsp");
		}
	}else if(hylbdm=="N"){ //内保单位
		ywlbdm = ywlbdm.slice(3);	//提取后两位
		if(ywlbdm == "01"){ //保卫力量
			$("#div_ywxx").load("business/Nbdwzagl/Bwry_bj.jsp");
		}else if(ywlbdm=="02"){	//临时用工信息
			$("#div_ywxx").load("business/Nbdwzagl/lsyg_bj.jsp");
		}else if(ywlbdm=="03"){ //重点岗位从业人员信息
			$("#div_ywxx").load("business/Nbdwzagl/Zdgwcyry_bj.jsp");
		}else if(ywlbdm=="04"){ //重点人员信息
			$("#div_ywxx").load("business/Nbdwzagl/Zdry_bj.jsp");
		}else if(ywlbdm=="05"){ //访客信息
	  		$("#div_ywxx").load("business/Nbdwzagl/fkjbxx_bj.jsp");
		}
	}
	$("#div_ywxx").show("slow");
}

function printpage(myDiv){ 
   	var content = document.all.item(myDiv).innerHTML;
   	content = $("#"+myDiv).html();
	var title = "报警详细信息";
	params={con:content,titlecon:title};
	jQuery.post("basicsystem/printCon_publicPrint.action",params,printback,"json");
    return false; 
} 
var printCon;
function printback(json){
	printCon = json.con;
	$("#print_detaildisplay").html(json.con);
	var url = window.location.href;
   	var len = url.lastIndexOf('/');
   	url = url.substring(0, len)+"/public/printHtmlClient.jsp";
   	window.open(url,"打印");
 /*
 $("#print_detail").empty();
	$("#print_detail").load("public/printHtml.jsp");
	$("#print_detail").show("slow"); */
}

</script>
<div id="print_detaildisplay" style="display: none">
</div>
<input type="hidden" id="bjxxDetail_ywbzj">
<input type="hidden" id="bjxxDetail_hylbdm">
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	align="center">
	<tr>
		<td align="left" class="title1">
			报警信息详细信息
		</td>
		<td align="right" class="title1">
			<a href="#" id="closeDiv" onclick='divclear($("#bjxxb_detail"));'
				class="close"></a>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5"></td>
	</tr>
</table>
<div id="printDiv" class="scrollbarface"
	style="overflow-y: auto; overflow-x: hidden; height: 500">
	<table width="98%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="28%" colspan="6">
				<div style="width: 100%" id="div_bdxx"></div>
			</td>
		</tr>
	</table>
	<table width="98%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="5"></td>
		</tr>
	</table>
	<table width="98%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="28%" colspan="6">
				<div style="width: 100%" id="div_ywxx"></div>
			</td>
		</tr>
	</table>

	<table width="98%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
	</table>
	<table width="98%" cellpadding="0" cellspacing="0" class="tableborder">
		<tr>
			<td colspan="6" height="8" class="queryfont">
				接处警基本情况
			</td>
		</tr>
		<tr>
			<td colspan="6" class="tdbg">
				<table width="100%" cellpadding="4" cellspacing="0" class="detail"
					id="detail2">
					<tr>
						<td width="13%" class="distd1">
							是否确认报警
						</td>
						<td width="20%" class="detailtd2">
							<span id="bjxxDetail_show_sfqrbj" /></span>
						</td>
						<td width="13%" class="distd1">
							是否有效报警
						</td>
						<td width="20%" class="detailtd2">
							<span id="bjxxDetail_sfyxbj" /></span>
						</td>
						<td width="13%" class="distd1">
							是否处警
						</td>
						<td width="20%" class="detailtd2">
							<span id="bjxxDetail_show_sfcj" /></span>
						</td>
					</tr>
					<tr>
						<td class="distd1">
							处警时间
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_chjsj" /></span>
						</td>
						<td class="distd1">
							处警部门
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_cjbm" /></span>
						</td>
						<td class="distd1">
							是否抓获
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_chjjg" /></span>
						</td>
					</tr>
					<tr>
						<td class="distd1">
							处警反馈情况
						</td>
						<td colspan="5" class="detailtd2">
							<span id="bjxxDetail_cjfkbz" /></span>
						</td>
					</tr>
					<tr>
						<td class="distd1">
							登记单位
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_fkdw" /></span>
						</td>
						<td class="distd1">
							登记人员
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_fkr" /></span>
						</td>
						<td class="distd1">
							登记时间
						</td>
						<td class="detailtd2">
							<span id="bjxxDetail_fkrq" /></span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<table>
	<tr align="center">
		<td colspan="6">
			<a href="#" id="addbutton" hidefocus="true" class="submitbutton"
				title="打印" onclick='printpage("printDiv");'>打印</a>
		</td>
	</tr>
</table>
<div id="print_detail" class="page-layout" src="#"
	style="top: 40px; left: 160px; width: 700px; height: 500; display: none; overflow-y: auto">
</div>