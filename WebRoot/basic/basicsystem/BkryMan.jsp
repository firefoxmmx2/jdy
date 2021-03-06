﻿<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants;"%>
<%
	//登录用户ID，用于获得菜单
	int userid = 0;
	User user = new User();
	//获得登录用户session
	user = (User) session.getAttribute(Constants.userKey);
	if (user == null)
		response.sendRedirect("login.jsp");
	else
		userid = user.getUserid().intValue();
	String deptId = user.getDepartment().getDepartcode().toString();
%>
<html>
	<head>
		<title>布控人员查询</title>
	</head>
	<script type="text/javascript">
var daochuNum = 0;	
$(document).ready(function() {
searchLongUrl="basicsystem/queryForExportCX_bkry.action";
	pageUrl="basicsystem/querylist_bkry.action";
	divnid="BkryData";
	tableid="BkryTable";
	addUrl="basicsystem/insert_bkry.action";
	addHtml="basic/basicsystem/BkryAdd.jsp";
	addWidth="750";
	delUrl="basicsystem/delete_bkry.action";
	delid="d_bkryid";
	modHtml="basic/basicsystem/BkryModify.jsp";
	modUrl="basicsystem/modify_bkry.action";
	modWidth="750";
	detailHtml="basic/basicsystem/BkryDetail.jsp";
	detailid="bkry_detail";
	detailUrl="basicsystem/query_bkry.action";
	detailWidth="750";
	
	tabletitle = "";
	geteExcelHead("BkryData");
	excelUrl = "basicsystem/getExcelCreateCX_bkry.action";
	
	loadPage(divnid);
		$("#p_csrq").attr("readonly","true");
		$("#p_csrq").datepicker();
		$("#p_csrq2").attr("readonly","true");
		$("#p_csrq2").datepicker();
		$("#p_tbsj").attr("readonly","true");
		$("#p_tbsj").datepicker();
		$("#p_bkczsj").attr("readonly","true");
		$("#p_bkczsj2").datepicker();
		$("#p_bkczsj2").attr("readonly","true");
		$("#p_bkczsj").datepicker();
		$("#p_bkdqsj").attr("readonly","true");
		$("#p_bkdqsj").datepicker();
		$("#p_sprq").attr("readonly","true");
		$("#p_sprq").datepicker();
		$("#p_cksj").attr("readonly","true");
		$("#p_cksj").datepicker();
		$("#p_ckczsj").attr("readonly","true");
		$("#p_ckczsj").datepicker();
		$("#p_cksprq").attr("readonly","true");
		$("#p_cksprq").datepicker();
		
		
		 $("#p_xb").selectBox({code:"dm_xb"});
		 $("#p_bkfw").selectBox({code:"dm_bkfw"});
		  $("#p_jg").click(function(){
			getDict_item("p_jg","p_jgdm","dm_xzqh");
			});
	     
	     $("#p_hylbdm").selectBoxhylb();//行业类别
	     
	     $("#p_shsftg").selectBox({code:"dm_bez"});
	    
	
	     
	daggleDiv("bkry_detail");
}); 
	

	
	
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var mygrid1 = $("#"+tableid).ingrid({ 
										url: url,	
										ingridPageParams:sXML,
										height:  pageHeight-280,
										pageNumber: pageno,
										colWidths: ["11%","15%","11%","8%","11%","11%","11%","11%","11%"],
										changeHref:function(table){//若表格无数据，则点击导出不起作用
										//alert($(table).find("tr").length);
											$("#gnlkexcel").unbind("click");
											if($(table).find("tr").length==0){
													daochuNum = 0;
												}else{
													daochuNum = 1;
												}	
										}									
									});				
		}
}	
	function manVerify(){
		$("#m_dqrq").val(TimeObject().fullYear+"-"+TimeObject().month+"-"+TimeObject().date);
	    if (!checkControlValue("p_xm","String",1,100,null,0,"姓名"))
			return false;
		if (!checkControlValue("p_gmsfhm","String",1,20,null,0,"身份证号码"))
			return false;
        if (!checkControlValue("p_csrq","Date",null,null,null,0,"出生日期"))
			return false;
		if (!checkControlValue("p_jg","String",1,100,null,0,"籍贯"))
			return false;
	    if (!checkControlValue("p_xb","String",1,2,null,0,"性别"))
			return false;
		if (!checkControlValue("p_bkczsj","Date",null,null,null,0,"布控操作时间"))
			return false;
		if (!checkControlValue("p_bkfw","String",1,300,null,0,"布控范围"))
			return false;
		if (!checkDateEarlier("p_csrq", "开始出生日期", "m_dqrq", "当前日期", "DATE")) 
            return false;
        if (!checkDateEarlier("p_csrq", "开始出生日期", "p_csrq2", "结束出生日期", "DATE")) 
            return false;
        if (!checkDateEarlier("p_bkczsj", "开始布控操作时间", "m_dqrq", "当前时间", "DATE")) 
            return false;
        if (!checkDateEarlier("p_bkczsj", "开始布控操作时间", "p_bkczsj2", "结束布控操作时间", "DATE")) 
            return false;
		if($("#p_checkbox").attr("checked")){
			$("#p_tyCheck").val("1");
		}else{
			$("#p_tyCheck").val("0");
		}
		
		return true;
	}
	
	$("#p_gmsfhm").blur(function(){
	    var zjhm = $("#p_gmsfhm").attr("value").toUpperCase();
		if(zjhm!=""){
			if(isIdCardNo(zjhm)){
				if(zjhm.length==15){
					valSfzCardIsRight("p_gmsfhm","请正确输入证件号码!");
					zjhm = $("#p_gmsfhm").attr("value").toUpperCase();
				}
			}
			$("#p_gmsfhm").attr("value",zjhm);
		}
	});
	 
	
//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
		if (manVerify()){
  			setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  		}
  	}else{
  		jAlert('无查询结果不能导出！','错误！');
  	}		
}


//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){   
		//报表标题 
			var bbmc="布控人员查询";
		//报表请求
			//setExcel("gnlkexcel",bbmc);	
			setExcelLong("bkrycxExcel",bbmc);	
}
</script>

	<body>

		<input type="hidden" id="d_bkryid" value="">
		<input type="hidden" id="m_dqrq" value="">
		<input type="hidden" id="p_flag" value="query">
		<input type="hidden" id="p_tyCheck">
		<input type="hidden" id="p_fwdwbm" value="<%=deptId%>">
		<table width="100%" cellpadding="0" cellspacing="0"
			class="tableborder">
			<tr>
				<td class="queryfont">
					布控人员查询
				</td>
			</tr>
			<tr>
				<td class="tdbg">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="10%" class="pagedistd">
								姓名
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle"  id="p_xm" value="">
								<label>
									<input name="checkbox" type="checkbox"  id="p_checkbox"
										style="width:20px">
									同音
								</label>
							</td>
							<td width="10%" class="pagedistd">
								公民身份号码
							</td>
							<td width="23%" class="pagetd">
								<input type="text"  class="inputstyle"  id="p_gmsfhm" value="">
							</td>
							<td width="10%" class="pagedistd">
								出生日期
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle1"  id="p_csrq"  value="">
								至
								<input type="text" class="inputstyle1"   id="p_csrq2" value="">
							</td>
						</tr>
						<tr>
							<td width="10%" class="pagedistd">
								籍贯
							</td>
							<td width="23%" class="pagetd">
								<input type="text"   class="inputstyle"  id="p_jg" readonly />
								<input type="hidden" id="p_jgdm" />
							</td>
							<td width="10%" class="pagedistd">
								性别
							</td>
							<td width="23%" class="pagetd">
								<select type="select" id="p_xb" value="">
									<option></option>
								</select>
							</td>
							<td width="10%" class="pagedistd">
								布控操作时间
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle1"  id="p_bkczsj"  value="">
								至
								<input type="text" class="inputstyle1"   id="p_bkczsj2" value="">
							</td>
						</tr>
						<tr>
							<td width="10%" class="pagedistd">
								布控范围
							</td>
							<td class="pagetd">
								<select type="select" id="p_bkfw" value="">
										<option></option>
								</select>
							</td>
							<td class="pagedistd">
								是否已审核
							</td>
							<td class="pagetd">
							 <select type="select" id="p_shsftg" value="">
									<option></option>
								</select>
							</td>
							<td class="pagedistd">
							   行业类别
							</td>
							  <td class="pagetd">
							       <select type="select" id="p_hylbdm" value="">
					               </select>
	                          </td>
			    </tr>
			
                <tr>
							<td colspan="5" class="pagedistd">&nbsp;</td>
							<td class="pagetd">
							<table width="140" border="0" align="right" cellpadding="2"
									cellspacing="0">
					            <tr>
										
										<td width="55%" >
											&nbsp;<!-- <a href="#" class="submitbutton" onclick=''>高级查询</a> -->
										</td>
										<td width="45%" >
											<a href="#" class="searchbutton" id="querys"
												onClick="setPageList(1);">查询</a>
										</td>
										<td width="25%" >
											<a href="#" class="exceldcbutton" id='bkrycxExcel' onclick='setExportExcel();'>导出</a>
										</td>
									</tr>
								</table>
               </td></tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="3"></td>
		  </tr>
		</table>
		<div id="bkry_detail"  class="page-layout" src="#"
				style="top:180px; left:160px; width:500px;">
		</div>
		<div id="BkryData" style="width:100%;">
			<table id="BkryTable" width="100%">
				<thead>
					<tr>
						<th name="l_xm" datatype="string" sumflag="0">
							姓名
						</th>
						<th name="l_gmsfhm" datatype="string" sumflag="0">
							公民身份号码
						</th>
						<th name="l_csrqstr" datatype="string" sumflag="0">
							出生日期
						</th>
						<th name="l_xb" datatype="string" sumflag="0">
							性别
						</th>
						<th name="l_minzu" datatype="string" sumflag="0">
							民族
						</th>
						<th name="l_jg" datatype="string" sumflag="0">
							籍贯
						</th>
						<th name="l_bkfw" datatype="string" sumflag="0">
							布控范围
						</th>
						<th name="l_bkczsjstr" datatype="string" sumflag="0">
							布控操作时间
						</th>
						<th name="l_bkdqsjstr" datatype="string" sumflag="0">
							布控到期时间
						</th>
					</tr>
				</thead>

			</table>
		</div>



	</body>
</html>
