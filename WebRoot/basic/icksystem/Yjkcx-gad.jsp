<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User" %>
<%@ page import="com.aisino2.sysadmin.Constants" %>
<%
	User user= (User)session.getAttribute(Constants.userKey);
	String deptCode = user.getDepartment().getDepartcode();
	String deptName = user.getDepartment().getDepartname();
	String usertype = user.getUsertype();
	String b="";
	if(-1!=usertype.indexOf("14,")&&-1!=usertype.indexOf("144")){
		b="1";
	}else if(-1!=usertype.indexOf("144")){
		b="2";
	}else if(-1!=usertype.indexOf("14")){
		b="3";
	}
	
 %>
<script type="text/javascript">
var dbid;
var ryid;
var a ="<%=b%>";
$(document).ready(function() {
	pageUrl="icksystem/querylistYjk_qyryskjl.action";
	divnid="tabledata";
	tableid="table";
	detailHtml="basic/mjjczsystem/MjjczslDetail.jsp";
	detailid="cyryxx_detail";
	detailUrl="mjjczsystem/query_mjjczsl.action";
	detailWidth="800";
	loadPage(divnid);
	
	$("#p_sksjf").attr("readonly","true");
	$("#p_sksjf").datepicker();
	$("#p_sksjt").attr("readonly","true");
	$("#p_sksjt").datepicker();
	daggleDiv("cyryxx_detail");
});
function loadPage(divpageid){
	tables=$("#"+divpageid).html();
	$("#"+detailid).hide(); 	
	setPageList(1,'#');
}	

function setPageList(pageno,url){
	if (manVerify()){
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({
										ingridPageParams:sXML,
										ingridPageWidth: pageWidth,
										url: url,	
										height: pageHeight-280,
										pageNumber: pageno,
										onRowSelect: null,
										onTdSelect:function(tr){
											var hcid =  $(tr).attr("id");
											var ryid = $(tr).find("td").eq(0).text();
											var garkktbsjid = $(tr).find("td").eq(1).text();
											var qybm = $(tr).find("td").eq(2).text();
											var hylbdm = $(tr).find("td").eq(3).text();
											var obj = $(tr).find("td").eq(5); //企业名称
											obj.html("<a href='#' class='hyperlink' onClick=setCyryXq('"+hcid+"','"+ryid+"','"+garkktbsjid+"');>"+obj.text()+"</a>");
											var obj = $(tr).find("td").eq(7); //企业名称
											obj.html("<a href='#' class='hyperlink' onClick=qyjbxx_qyxx('"+hylbdm+"','"+qybm+"');>"+obj.text()+"</a>");
										},
										hideColIndex:[0,1,2,3],
										colWidths: ["0%","0%","0%","0%","12%","20%","20%","28%","20%"]
									});			
	}

}	

//服务场所筛选框
$("#p_qymc").click(function(){
	dataid=$('#p_hylbdm').val();
	getTy_item("p_qymc","p_qybm");
});

//治安管理机构所筛选框
$("#p_gxdwmc").click(function(){
	getGxdwTree("p_gxdwmc","p_gxdwbm",'1');
});
 	
 	if(a=="1"){
		var str="<option value='J'>营业性娱乐场所</option><option value='K'>其他公共场所</option>"
		$(str).appendTo($("#p_hylbdm"));
		$("#p_hylbdm").selectBox({state:"temp"});
	}else if(a=="2"){
		$("#p_hylbdm").selectBoxhylb({code:"J"});
	}else if(a=="3"){
		$("#p_hylbdm").selectBoxhylb({code:"J"});
	}
	
	
 //从业人员核查详情
function setCyryXq(hcid,ryid,garkktbsjid){
	detailUrl="ylfwzagl/queryHc_cyryxx.action";
	dataid=hcid;
	dbid = garkktbsjid;
	this.ryid = ryid;
	setWidth(detailid,detailWidth);
	setUrl(detailid,"business/Ylfwzagl/CyryxxDhcDetail.jsp");
	bindDocument(detailid);
}

	var qyjbxx_dataid;
	var qyjbxx_qymc;
	var qyjbxx_requestType;
	var qyjbxx_detailWidth="1000";
	function qyjbxx_qyxx(hylbdm,qybm){ //企业基本信息
	    qyjbxx_requestType="detail";
		qyjbxx_dataid="qybm_"+qybm;
		setWidth(detailid,qyjbxx_detailWidth);
		if(hylbdm=='J'||hylbdm=='K'){
			setUrl(detailid,"business/Ylfwzagl/YlcsjbxxDetail.jsp");
			daggleDiv(detailid);
		}else if(hylbdm=='A'){
			dataid='';
			lvguanbianm=qybm;
			setWidth(detailid,"800");
			setUrl(detailid,"business/Lgyzagl/LvguanDetail.jsp");
			daggleDiv(detailid);
		}else{
			setUrl(detailid,"basic/publicsystem/QyjbxxDetail-gzth.jsp");
			daggleDiv(detailid);
		}
		bindDocument(detailid);
	}

function manVerify(){
	if(!compare_twoTime($("#p_sksjf").val(),$("#p_sksjt").val(),"DATETIME")){
		jAlert("刷卡开始时间不能大于结束时间！","提示信息");
		return false;
	}
	return true;
}

</script>

<body>
<input type="hidden" id="d_ryid" value="">
<input type="hidden" id="d_qyid" value="">
<input type="hidden" id="d_hcid" value="">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">预警卡查询</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
				  <td width="10%" class="pagedistd">行业类别</td>
			      <td width="23%" class="pagetd"><select class="inputstyle" id="p_hylbdm" ></select></td>
			      <td width="10%" class="pagedistd">企业名称</td>
				  <td width="23%" class="detailtd"><input type="hidden" id="p_qybm"/>
	  				<input type="text" class="inputstyle" id="p_qymc" readonly="readonly"/></td>
	  			  <td width="10%" class="pagedistd">管辖单位</td>
		          <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_gxdwmc" value="<%=deptName %>" readonly><input type="hidden" id="p_gxdwbm" value="<%=deptCode %>"></td>
		  </tr>
				<tr>
				  <td width="10%" class="pagedistd">人员姓名</td>
			      <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_xm" /></td>
			      <td width="10%" class="pagedistd">证件号码</td>
				  <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_zjhm" /></td>
	  				<td width="10%" class="pagedistd">从业人员编号</td>
				  <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_cyrybh" /></td>
		  </tr>
				<tr>
				  <td class="pagedistd">刷卡时间</td>
			      <td class="detailtd"><input type="text" class="inputstyle" id="p_sksjf"></td>
		          <td class="pagedistd">至</td>
				  <td class="pagetd"><input type="text" class="inputstyle" id="p_sksjt"></td>
		  </tr>
		  <tr>
		    <td width="20%" class="pagetd" colspan="6">
		    <table border="0" align="right" cellpadding="2" cellspacing="0">
        		<tr>
                      <td width="62"><a href="#" class="searchbutton" id="querys" onClick="setPageList(1);">查询</a></td>
                    </tr>
                  </table></td>
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
<div id="cyryxx_detail"  class="page-layout" src="#"
		style="top:20px; left:160px; width:500px;">
</div>	
<div id="icksl_detail"  class="page-layout" src="#"
		style="display:none;top:20px; left:160px; width:500px;">
</div>	
<div id="tabledata" style="width:100%;">
	<table id="table" width="100%">
	  <thead>
	    <tr>  
	    	<th name="l_ryid">人员id</th>
	    	<th name="l_garkktbsjid">公安人口库同步数据ID</th>  
	    	<th name="l_qybm">企业编码</th>   
	    	<th name="l_hylbdm">行业类别代码</th>
	     	<th name="l_xm">姓名</th>
	     	<th name="l_cyrybh">从业人员编号</th>
	     	<th name="l_sksj">刷卡时间</th>
	     	<th name="l_qymc">刷卡场所</th>
	     	<th name="l_gxgwmc">管辖单位</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>