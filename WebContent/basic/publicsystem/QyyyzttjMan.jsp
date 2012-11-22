<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
<jsp:include page="../../public/publicGADTJ.jsp" flush="true"></jsp:include>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.TableConfig.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/jquery/plugs/jquery.MappingTable.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>javascript/excel.js" charset="utf-8"></script>
<script type="text/javascript">
	var jb="st";
	$(document).ready(function() {
		$("#detail_csyyzttj").hide();
		daggleDiv("detail_csyyzttj");
		pageUrl="publicsystem/queryCsyyzttjlist_cxtj.action";
		tableid="table_csyyzttj";
		divnid="tabledata_csyyzttj";
		loadPage(divnid);
		ksd_csxxtjInit();
		initTJDate();
		$("#t_qsrq").attr("readonly","true").attr("value",tomorrowDate).datepicker();
		$("#t_jzrq").attr("readonly","true").attr("value",currentDate).datepicker();
 		$("#t_sfcxqb").selectBox({code:"dm_bez"});
	});
	//查询
	function startTjcx(){ 
		if(manVerify()){
			createDataTable();
		    setPageList(1);
		}
	}
	// 校验
    function manVerify(){
    	if (!checkControlValue("t_qsrq","Date",null,null,null,1,"起始日期"))
			return false;
        if (!checkControlValue("t_jzrq","Date",null,null,null,1,"截止日期"))
			return false;
		var t_qsrq = $("#t_qsrq").attr("value");
		var t_jzrq = $("#t_jzrq").attr("value");
		if(t_qsrq!=''&&t_jzrq!=''&&formatDate(t_qsrq)-formatDate(t_jzrq)>0){
			jAlert("请正确选择起始和截止日期!","提示信息");
			return false;
		}	
		return true;
	}
	function formatDate(strDate){ 
		var riqi = strDate.split("-");
		return new Date(riqi[0],(riqi[1]-1),riqi[2]);
	}
	
	// 建立数据列表
    function createDataTable(){
        $("#x_sfcxqb").attr("value", $("#t_sfcxqb").attr("value"));
		$("#x_qsrq").attr("value", $("#t_qsrq").attr("value"));
		$("#x_jzrq").attr("value", $("#t_jzrq").attr("value"));
		$("#x_dsjgbz").attr("value", $("#t_dsjgbz").attr("value"));
		$("#x_dsjgdm").attr("value", $("#t_dsjgdm").attr("value"));
		$("#x_fxjbz").attr("value",  $("#t_fxjbz").attr("value"));
		$("#x_fxjdm").attr("value",  $("#t_fxjdm").attr("value"));
		$("#x_gxdwbz").attr("value", $("#t_gxdwbz").attr("value"));
		$("#x_gxdwdm").attr("value", $("#t_gxdwdm").attr("value"));
		var ganjCol = "<th>省厅</th>";
		jb="st";
        $("#gajgAll").find("input[type='checkbox']").each(function(){
			if($(this).attr("checked")==true){
				if($(this).attr("dataKey")=='dsjgdm'){
					jb="ds";
					ganjCol = "<th>市级公安机关</th>";
				}
				if($(this).attr("dataKey")=='fxjdm'){
					jb="fxj";
					ganjCol = "<th>分县局公安机关</th>";
				}
				if($(this).attr("dataKey")=='gxdwdm'){
					jb="gxdw";
					ganjCol = "<th>科所队</th>";
				}
			}
		});
		var result = "<table id='"+tableid+"' width='100%'><thead><tr>";
			result += ganjCol;
	     	result += "<th>企业总数</th>";
	     	result += "<th>营业场所数</th>";
	     	result += "<th>装机数</th>";
	     	result += "<th>自主停业数</th>";
	     	result += "<th>勒令停业数</th>";
	        result += "<th>歇业场所数</th>";
	     	result += "<th>注销场所数</th>";
	        result += "<th>其他状态场所数</th>";
			result += "</tr></thead><tbody></tbody></table>";
			$("#tabledata_csyyzttj").html(result);
			loadPage(divnid);
    }
	function setPageList(pageno,url){
		url=setList(pageno,url);
		setParams("t_"); 
		var mygrid1 = $("#table_csyyzttj").ingrid({
				ingridPageParams:sXML,
				url: url,
				tableid:"table_csyyzttj",
				height: pageHeight-235,
				pageNumber: pageno,
				colWidths: ["20%","10%","10%","10%","10%","10%","10%","10%","10%"],
				changeHref:function(table){
					$(table).find("tr").each(function(){
						if ($(this).find("td:nth(0)").text()=="合计"||jb=='st'||$("#t_gxdwbz").attr("value")=="1"){
						}else{
							var temp1=$(this).attr('id');
							var temp=$(this).find("td:nth(0)").text();
							$(this).find("td:nth(0)").html("<a href='#' class='fontbutton' onClick=setXxQuery('"+temp1+"');>"+temp+"</a>");
						}
					});
				},
				onRowSelect: null,
				paging: false,
				sorting: false
		});
	}
	
	//传递详细页面参数
	function setXParmValue(id){
		if(jb!=null&&jb!=''){
					if(jb=='ds'){
						 $("#x_dsjgdm").attr("value", id);
					}
					if(jb=='fxj'){
						 $("#x_fxjdm").attr("value", id);
					}
					if(jb=='gxdw'){
						 $("#x_gxdwdm").attr("value", id);
					}
				}
	}
	
	function setXxQuery(id){
		 if($("#t_gxdwbz").attr("value")=="1"){
			$("#x_gxdwdm").val(id);
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val("");
		 } else if($("#t_fxjbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val(id);
			$("#x_dsjgdm").val("");
			$("#x_gxdwbz").attr("value","1");
		 } else if($("#t_dsjgbz").attr("value")=="1"){
			$("#x_gxdwdm").val("");
			$("#x_fxjdm").val("");
			$("#x_dsjgdm").val(id);
			$("#x_fxjbz").attr("value","1");
		 }
	 	detailid="detail_csyyzttj";
     	setWidth(detailid,"800");
     	$('#'+detailid).css('left','25').css('top','40');
	 	setUrl(detailid,"basic/publicsystem/QyyyzttjManxx.jsp");
	}
	
</script>

<body>
<input type="hidden" id="k_deptCode">
<input type="hidden" id="t_dsjgbz" value="0">
<input type="hidden" id="t_dsjgdm">
<input type="hidden" id="t_fxjbz" value="0">
<input type="hidden" id="t_fxjdm">
<input type="hidden" id="t_gxdwbz" value="0">
<input type="hidden" id="t_gxdwdm">

<input type="hidden" id="x_dsjgbz" value="0">
<input type="hidden" id="x_dsjgdm">
<input type="hidden" id="x_fxjbz" value="0">
<input type="hidden" id="x_fxjdm">
<input type="hidden" id="x_gxdwbz" value="0">
<input type="hidden" id="x_gxdwdm">

<input type="hidden" id="x_qsrq">
<input type="hidden" id="x_jzrq">
<input type="hidden" id="x_sfcxqb">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">场所营业状态统计</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr id="gajgAll">
			<td width="10%" class="pagedistd">
			<input dataKey="dsjgdm" type="checkbox" id="ch_dsjgdm" onClick="ksd_gajgSelect(this);"/>市级公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_dsjgdm" onChange="ksd_dsjgdmOnchange();"><option>全部</option></select>
			</td>
			<td width="10%" class="pagedistd">
			<input dataKey="fxjdm" type="checkbox" id="ch_fxjdm" onClick="ksd_gajgSelect(this);">分县局公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_fxjdm" onChange="ksd_fxjdmOnchange();"><option>全部</option></select></td>
			<td width="10%" class="pagedistd">
			<input dataKey="gxdwdm" type="checkbox" id="ch_gxdwdm" onClick="ksd_gajgSelect(this);">科所队</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_gxdwdm" onChange="ksd_gxdwdmOnchange();"><option>全部</option></select></td>
		</tr>
		<tr id="cszflAll">
			<td class="pagedistd">起始日期</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_qsrq"></td>
			<td class="pagedistd">截止日期</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_jzrq"></td>
			<td class="pagedistd">是否查询全部</td>
			<td class="pagetd"><select type="select" id="t_sfcxqb"><option></option></select></td>
		</tr>
		<tr >
		    <td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td width="23%"  class="pagetd">
				<table width="186px" border="0" align="right" cellpadding="2" cellspacing="0">
				<tr>
				<td><a href="#" class="searchbutton" onClick="startTjcx();">查询</a></td>
				<td><a href="#" class="exceldcbutton" onClick="expExcel('table_csyyzttj',9,1)" id="csyyzttjExcel">导出</a></td>
				</tr>
				</table>
			</td>
		</tr>
    	</table>
    </td>
  </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="detail_csyyzttj" class="page-layout" src="#" style="top:20px; left:160px; width:950px;"></div>
<div id="tabledata_csyyzttj" style="width:100%;">
	<table id="table_csyyzttj" width="100%">
	  <thead>
	    <tr>
	    	<th>市级公安机关</th>
	     	<th>企业总数</th>
	     	<th>营业场所数</th>
	     	<th>装机数</th>
	     	<th>自主停业数</th>
	     	<th>勒令停业数</th>
	     	<th>歇业场所数</th>
	     	<th>注销场所数</th>
	     	<th>其他状态场所数</th>
	    </tr>
	  </thead>
	</table>
</div>
</body>