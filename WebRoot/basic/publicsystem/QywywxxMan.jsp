<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	daggleDiv(detailid);
	//tabletitle = "";
	//searchLongUrl="publicsystem/querylistgad_qywywxx.action";
	//excelUrl="publicsystem/exportExcel_qywywxx.action";
	pageUrl="publicsystem/querylist_qywywxx.action";
	divnid="QywywxxData";
	tableid="QywywxxTable";
	verifyUrl="publicsystem/query_qywywxx.action";
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
	loadPage(divnid);
		$("#p_ksyysj").attr("readonly","true");
		$("#p_ksyysj").datepicker(true);
		$("#p_jsyysj").attr("readonly","true");
		$("#p_jsyysj").datepicker(true);
		$("#p_djrq").attr("readonly","true");
		$("#p_djrq").datepicker(true);
	
}); 
	
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({ 
										url: url,	
										height: pageHeight-209,
                                        ingridPageParams:sXML,
										pageNumber: pageno,
										noSortColIndex:[6],
										colWidths: ["15%","15%","15%","15%","15%","10%","15%"]									
									});				
		}
}	
	function manVerify(){
		if (!checkControlValue("p_ksyysj","String",1,30,null,0,"营业时间"))
			return false;
		if (!checkControlValue("p_jsyysj","String",1,30,null,0,"至"))
			return false;
		if (!checkControlValue("p_zafzrxm","String",1,30,null,0,"治安负责人"))
			return false;
		return true;
	}
</script>
<body>
	
<input type="hidden" id="d_qyid" value="">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">无业务信息上报</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="5%" class="pagedistd">营业时间</td>
					<td width="30%" class="pagetd"><input type="text" id="p_ksyysj" class="inputstyle" value="">至<input type="text" id="p_jsyysj" class="inputstyle" value=""></td>				
					<td width="5%" class="pagedistd">治安负责人</td>
					<td width="15%" class="pagetd"><input type="text" id="p_zafzrxm" class="inputstyle" value=""></td>
    		        <td width="23%" class="pagetd">
    		  	     <table border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	 <tr>
    		    	  <td width="62" ><a href="#" class="searchbutton" id="querys" onclick="setPageList(1);">查询</a></td>
    		    	  <td width="62" ><a href="#" class="submitbutton" onclick='setAddPage()'>添加</a></td>
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
	     	<th name="l_djrq">登记日期</th>
	     	<th name="l_ksyysj">营业开始时间</th>
	     	<th name="l_jsyysj">营业结束时间</th>
	     	<th name="l_csfe">单位负责人</th>
	     	<th name="l_sffsaj">治安、刑事或事故</th>
	     	<th name="l_sfglbmjc">管理部门检查</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>

</body>
</html>