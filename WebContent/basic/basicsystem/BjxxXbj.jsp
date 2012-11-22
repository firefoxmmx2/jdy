<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants"%>

<%
	User user = (User) session.getAttribute(Constants.userKey);
%>
<script type="text/javascript">

   var ywbm = "";   //////报警信息 业务表名
   var sfyx = "";

	$(document).ready(function() {
	
	// 读取报警信息数据
	setParams("m_");
	jQuery.post("basicsystem/query_bjxxb.action",params,bjxxDetaildiv,"json"); // 提交到BjxxbAction中,调用其中的query方法
		
	$("#m_sfyxbjdm").selectBox({code:"dm_bez"}); // 是否有效选择框
	$("#m_wxyydm").selectBox({code:"dm_wxyy"}); // 无效原因选择框
	
	$("#m_cjbm").attr("readonly","true");
	$("#m_cjbm").click(function(){//getGxdwTree("m_cjbm","m_cjbmbm","0");
			getGxdwTree("m_cjbm","m_cjbmbm",null,null,null,null,null,null);});
	
	$("#m_sfyxbjdm").change(function(){ // 是否有效为“是”时，清空无效原因，为“否”时，清空处警部门
			$("#m_cjbm").unbind("click");
		if($("#m_sfyxbjdm").attr("value")==1){ // 有效
			$("#m_cjbm").click(function(){//getGxdwTree("m_cjbm","m_cjbmbm","0");
			getGxdwTree("m_cjbm","m_cjbmbm",null,null,null,null,null,null);});
			
			$("#m_sfyxbj").attr("value","是"); // 是否有效标记设为“是”
			
			$("#m_wxyydm").setValue("");
			$("#m_wxyy").attr("value","");
			
			$("#m_wxyydm").setAttr("readonly",true);
			//$("#m_cjbm").attr("readonly","false");
		}else{ // 无效		
			
			$("#m_sfyxbj").attr("value","否"); // 是否有效标记设为“否”
			
			$("#m_cjbmbm").attr("value","");
			$("#m_cjbm").attr("value","");
			
			//$("#m_cjbm").attr("readonly","true");
			$("#m_wxyydm").setAttr("readonly",false);
			$("#m_wxyydm").setAttr("readonly",false);
		}
		
	});
	
	// 从Session中获取登录用户相关信息
	$("#m_pjbmmc").val("<%=user.getDepartment().getDepartname()%>");
	$("#m_pjbmbm").val("<%=user.getDepartment().getDepartcode()%>");
	$("#m_pjr").val("<%=user.getUsername()%>");

	});
	
function bjxxDetaildiv (json) {                         
	$("#bjxxDetail_ywbzj").val(setNull(json.LBjxxb[0].ywbzj));
	$("#bjxxDetail_hylbdm").val(setNull(json.LBjxxb[0].hylbdm));
	$("#m_tag").val(setNull(json.LBjxxb[0].jqztdm));
	ywbm = setNull(json.LBjxxb[0].ywbm);   ///////业务表名
	sfyx = setNull(json.LBjxxb[0].sfyx);
	showOtherJsp();
}
function trimLR(str){ //删除左右两端的空格
　　 return str.replace(/(^\s*)|(\s*$)/g, "");
}	
function showOtherJsp(){
	// 读取本地布控或者全国在逃人员数据
	$("#div_bdxx").empty();
	var str=$("#current_recordBjlx").attr("value").trim();
	if(str=="全国在逃报警"){
		$("#div_bdxx").load("basic/basicsystem/BjxxDetailQgztjyxxKz.jsp");
	}else if(str=="本地布控报警"){
		$("#div_bdxx").load("basic/basicsystem/BjxxDetailBdbkryxxKz.jsp");
	}
	$("#div_bdxx").show("slow");
	
	dataid = $("#bjxxDetail_ywbzj").attr("value");
	var hylbdm = $("#bjxxDetail_hylbdm").attr("value");
	//alert(hylbdm);
	// 读取国内旅客历史信息或从业人员历史信息
	$("#div_ywxx").empty();
	if(hylbdm=="A"){
		$("#div_ywxx").load("business/Lgyzagl/Gnlk_lsxxDetail.jsp");
	}else if(hylbdm=="J"){
		$("#div_ywxx").load("business/Ylfwzagl/Cyryxx_lsxxDetailKz.jsp");
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
	}else if(hylbdm=="B"){  //印章业
	     if(ywbm=="t_yzzzcyrxx"){ // 印章业  参与人员报警
	     
	         $("#div_ywxx").load("business/yzyzagl/YzzzcyrxxDetail.jsp");
	      }else if(ywbm=="t_yzzzdwcyryxx"){  ///印章业  从业人员报警
	      
	         $("#div_ywxx").load("business/yzyzagl/YzzzdwcyrylsxxDetail.jsp");
	      }
	}else if(hylbdm=="E01"){
	    if(ywbm=="t_escjyxx"){ //二手车交易信息
	       $("#div_ywxx").load("business/esczagl/EscjyxxDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_qyryxx"){  //二手车从业人员信息
	       $("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
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
	    if(ywbm=="t_esjtwryxx"){ //二手机摊位人员信息
	       $("#div_ywxx").load("business/esjzagl/EsjtwrylsxxDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_qyryxx"){  //二手机从业人员信息
	       $("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
	    }else if(ywbm=="t_esjjy"){  //二手机交易信息
	       $("#div_ywxx").load("business/esjzagl/EsjjyDetail.jsp",function(){$("#tablehead").hide();});
	    }else if(ywbm=="t_tyzlxx"){  //二手机摊主信息
	       $("#div_ywxx").load("business/esjzagl/TwzllsxxDetail.jsp");
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
		  }else if(ywbm=="F02_T_QCZLCLJBXX_LS_CZ"){  		  
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
	}else if(hylbdm=="RK"){//流动人口
		if(sfyx=="110"){//就业人员
			$("#div_ywxx").load("business/ldrksystem/jydjxx_bjbd.jsp");
		}else if(sfyx=="111"){//租住人员
			$("#div_ywxx").load("business/ldrksystem/zzdjxx_bjbd.jsp");
		}else if(sfyx=="112"){//工地人员
			$("#div_ywxx").load("business/ldrksystem/gdygdjxx_bjbd.jsp");
		}
	}else if(hylbdm=="D"){ //印刷业
	  if(ywbm=="t_cjyspjbxx1"){  //委托方经办人信息
		$("#div_ywxx").load("business/ysyzagl/YsWtjbrxx_bj.jsp");
	  }else if(ywbm=="t_cjyspjbxx2"){///送印人
	  
	     $("#div_ywxx").load("business/ysyzagl/YsSyrxx_bj.jsp");
	  }else if(ywbm=="t_cjyspjbxx3"){///取印人
	  
	     $("#div_ywxx").load("business/ysyzagl/YsQyrxx_bj.jsp");
	  }
	}else if(hylbdm=="E07"){ //委托寄卖
			if(ywbm=="t_qyryxx"){  //从业人员
				$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
			}else if(ywbm=="E07_T_WTJMXX_SYR"){
				  $("#div_ywxx").load("business/wtjmzagl/WtjmxxSyrBjDetail.jsp");
			}else if(ywbm=="E07_T_WTJMXX_WTR"){
				  $("#div_ywxx").load("business/wtjmzagl/WtjmxxWtrBjDetail.jsp");
			}else if(ywbm=="E07_T_HWQX_RY"){
				  $("#div_ywxx").load("business/wtjmzagl/WtjmhwqxlxrxxDetail.jsp");
			}
	}else if(hylbdm=="C01"){ //机动车拆解
		  if(ywbm=="t_qyryxx"){  //从业人员
				$("#div_ywxx").load("basic/publicsystem/Qyryxx_lsxxDetail.jsp");
			}else if(ywbm=="C01_T_CLJBXX_CZ"){
				$("#div_ywxx").load("business/jdccjzagl/Cljbxx_Bjls_cz.jsp");
			}else if(ywbm=="C01_T_HSCLJBXX_SCR"){
				$("#div_ywxx").load("business/jdccjzagl/Hscljbxx_Bjls_scr.jsp");
			}
	}
	
	$("#div_ywxx").show("slow");
}

function printpage(myDiv){ 
   	var content = document.all.item(myDiv).innerHTML;
	var title = "新报警";
	params={con:content,titlecon:title};
	jQuery.post("basicsystem/printCon_publicPrint.action",params,printback,"json");
    return false; 
} 

var printConxbj;
function printback(json){
	printConxbj = json.con;
	//$("#print_detaildisplay").html(json.con);
	var url = window.location.href;
   	var len = url.lastIndexOf('/');
   	url = url.substring(0, len)+"/public/printXbj.jsp";
   	window.open(url,"打印");
 /*
 $("#print_detail").empty();
	$("#print_detail").load("public/printHtml.jsp");
	$("#print_detail").show("slow"); */
}

/**
function printback(){
	var url = window.location.href;
   	var len = url.lastIndexOf('/');
   	url = url.substring(0, len)+"/public/printHtml.jsp";
   	window.open(url);
} **/

function modifyVerify(){
	if (!checkControlValue("m_sfyxbjdm","Select",1,100,null,1,"警情是否有效")){
		return false;
	} else {
		if($("#m_sfyxbjdm").attr("value")=="1"){ // 有效
			if (!checkControlValue("m_cjbm","String",1,100,null,1,"此报警处警单位"))
				return false;
		}else{
			if (!checkControlValue("m_wxyydm","Select",1,100,null,1,"无效原因"))
				return false;
		}
		$("#m_sfyxbj").val($("#m_sfyxbjdm").attr("title"));
		$("#m_wxyy").val($("#m_wxyydm").attr("title"));
	}
	
	return true;
}

function xbjUpdate(){
	if (modifyVerify()){
		if($("#m_sfyxbjdm").attr("value")==1){
			$("#m_jqzt").attr("value","未回复报警");
			$("#m_jqztdm").attr("value","1");
			// 管辖单位等于处警部门

		}else{
			$("#m_jqzt").attr("value","");
			$("#m_jqztdm").attr("value","");

		}
		
		setParams("m_");
		jQuery.post("basicsystem/xbjUpdate_bjxxb.action",params,xbjupdateback,"json"); 
	}else{
		return modifyVerify();
	}		
}

  function xbjupdateback(json){
	if  (json.result=="success"){
		jAlert("派警成功",'保存信息');
		setPageList($("#pageNo").attr("value"));
		$("#"+detailid).hideAndRemove("slow"); 
	}else{
		jAlert(json.result,'错误信息');
	}		
  }
</script>

<input type="hidden" id="bjxxDetail_ywbzj">
<input type="hidden" id="bjxxDetail_hylbdm">

<input type="hidden" id="m_jqzt"/>
<input type="hidden" id="m_jqztdm"/>
<input type="hidden" id="m_pjbmmc"/>
<input type="hidden" id="m_pjbmbm"/>
<input type="hidden" id="m_pjr"/>

<input type="hidden" id="m_tag" />
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	align="center">
	<tr>
		<td align="left" class="title1">
			新报警
		</td>
		<td align="right" class="title1">
			<a href="#" id="closeDiv" onclick='divclear($("#bjxxb_detail"));'class="close"></a>
		</td>
	</tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<div id="printDiv" class="scrollbarface" style="overflow-y:auto;overflow-x:hidden;height:400">
<table width="98%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="6">
			<div style="width: 100%" id="div_bdxx"></div>
		</td>
	</tr>
	<tr>
		<td colspan="6">
			<div style="width: 100%" id="div_ywxx"></div>
		</td>
	</tr>
</table>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="tableborder">
	<tr>
		<td colspan="6" class="queryfont">
			警情派警		</td>
	</tr>
	<tr>
	  <td colspan="6"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="detail">
        <tr>
		<td class="distd1">
			警情是否有效		</td>
		<td class="detailtd2">
			<input type="hidden" id="m_sfyxbj" />
			<select type="select" id="m_sfyxbjdm">
				<option></option>
			</select>		</td>
		<td class="distd1">
			无效原因		</td>
		<td class="detailtd2">
			<input type="hidden" id="m_wxyy" />
			<select type="select" id="m_wxyydm">
				<option></option>
			</select>		</td>
		<td class="distd1">
			此报警处警单位		</td>
		<td class="detailtd2">
			<input type="hidden" id="m_cjbmbm" />
			<input type="text" class="inputstyle"  id="m_cjbm" value="" />		</td>
	</tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="3"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
	<tr align="center">
		<td><a href="#" id="addbutton2" hidefocus="true" class="submitbutton" title="保存" onclick='xbjUpdate();'>保存</a>
		<a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="打印" onclick='printpage("printDiv");'>打印</a></td>
	</tr>
</table>