<%@ page language="java" pageEncoding="UTF-8" 
import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%@include file="../../public/common.jsp" %>
<%
   User user= (User)session.getAttribute(Constants.userKey);
   String deptCode = user.getDepartment().getDepartbrevitycode();
 %>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
$(document).ready(function() {  
	divnid="QywywxxData";
	tableid="QywywxxTable";
	pageUrl="publicsystem/querylistgad_qywywxx.action";
	addUrl="publicsystem/insert_qywywxx.action";
	addHtml="basic/publicsystem/QywywxxAdd.jsp";
	addWidth="800";
	delUrl="publicsystem/delete_qywywxx.action";
	delid="d_qyid";
	modHtml="basic/publicsystem/QywywxxModify.jsp";
	modUrl="publicsystem/modify_qywywxx.action";
	modWidth="800";
	detailHtml="basic/publicsystem/QywywxxDetail.jsp";
	detailid="qywywxx_detail";
	detailUrl="publicsystem/query_qywywxx.action";
	detailWidth="800";
	
	tabletitle = "";
	searchLongUrl="publicsystem/querycxForExport_qywywxx.action";
	excelUrl="publicsystem/exportExcel_qywywxx.action";
	geteExcelHead("QywywxxData");
	
	loadPage(divnid);
	
    $("#p_ksyysj").attr("readonly","true");
    $("#p_ksyysj").datepicker(true);
	$("#p_jsyysj").attr("readonly","true");
	$("#p_jsyysj").datepicker(true);
	allhylbLinkQyzfl("p_hylbdm","p_qyzflbm"); // 行业类别与企业主分类联动
	$("#p_gxdwmc").click(function(){  // 管辖单位
		getGxdwTree("p_gxdwmc", null, "p_gxdwbm", null, null, null, null, null);
	});
	daggleDiv("qywywxx_detail");	
	
}); 

$("#p_qymc").click(function(){ //企业名称筛选框
			dataid="";
			getTy_item("p_qymc","p_qybm","","",$("#p_gxdwbm").attr("value"),$('#p_hylbdm').val());
	});

	
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({ 
										url: url,	
										height: pageHeight-250,
                                        ingridPageParams:sXML,
										pageNumber: pageno,
										changeHref:function(table){//若表格无数据，则点击导出不起作用
				                                if($(table).find("tr").length==0){
				                                    daochuNum = 0;
				                                }else{
				                                    daochuNum = 1;
				                                }	
			                            },
										colWidths: ["15%","15%","15%","15%","15%","10%","15%"]									
									});				
		}
}	
function manVerify(){
		return true;
	}
	
//导出
function setExportExcel(){
   if(daochuNum==1){
  	    setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		alert('无查询结果不能导出！');
  	}		 
}
function searchLongBack(json){  
    //报表标题
	var bbmc="无业务信息上报";
	//报表请求
	setExcelLong("qywywxxexcel",bbmc);
}
	
</script>
<body>
<input type="hidden" id="p_qybm">
<input type="hidden" id="p_gxdwbm" value="<%=deptCode %>">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">无业务信息上报查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
    	    <tr>
    	       <td width="11%" class="pagedistd">行业类别</td>
    	       <td width="22%" class="pagetd"><select id="p_hylbdm" ></select></td>
    	       <td width="11%" class="pagedistd">企业分类</td>
    	       <td width="22%" class="pagetd"><select type=="select" id="p_qyzflbm"><option></option></select></td>
    	       <td width="11%" class="pagedistd">管辖单位</td>
    	       <td width="22%" class="pagetd"><input type=="text" id="p_gxdwmc" class="inputstyle" readonly value=""></td>
    	    </tr>
    	    <tr>
    	       <td width="11%" class="pagedistd">企业名称</td>
    	       <td width="22%" class="pagetd"><input type="text" id="p_qymc" class="inputstyle" value=""></td>
    	       <td width="11%" class="pagedistd">营业开始时间</td>
    	       <td width="22%" class="pagetd"><input type="text" id="p_ksyysj" class="inputstyle" value=""></td>
    	       <td width="11%" class="pagedistd">营业结束时间</td>
    	       <td width="22%" class="pagetd"><input type="text" id="p_jsyysj" class="inputstyle" value=""></td>
    	    </tr>
		    <tr>
    		   <td colspan="6">
    		  	  <table border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	 <tr>
    		    	  <td width="62" ><a href="#" class="searchbutton" id="querys" onclick="setPageList(1);">查询</a></td>
    		    	  <td width="62"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="qywywxxexcel">导出</a></td>
    		    	</tr>
    		  	   </table>
    		   </td>
    	    </tr>
    	</table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="qywywxx_detail" class="page-layout" src="#"
		style="top:180px; left:160px;">
</div>	

<div id="QywywxxData" style="width:100%;">
	<table id="QywywxxTable" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_djrq" datatype="string">登记日期</th>
	     	<th name="l_ksyysj" datatype="string">营业开始时间</th>
	     	<th name="l_jsyysj" datatype="string">营业结束时间</th>
	     	<th name="l_gxdwmc" datatype="string">管辖单位</th>
	     	<th name="l_qymc" datatype="string" >企业名称</th>
	     	<th name="l_hylb" datatype="string">行业类别</th>
	     	<th name="l_sffsaj" datatype="string" >治安、刑事或事故</th>
	    </tr>
	  </thead>
	</table>	
</div>

</body>
</html>