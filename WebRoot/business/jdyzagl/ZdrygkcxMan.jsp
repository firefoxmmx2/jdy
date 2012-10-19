<%@ page language="java" pageEncoding="UTF-8"
	import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp"%>
<%@include file="../../public/user-info.jsp"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<!-- 寄递业公共js -->
<script type="text/javascript" src="business/jdyzagl/js/gspicturejdy.js"></script>
<script type="text/javascript">
	var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var isFirst = 0;//是否首次加载
	//默认加载执行内容
	$(document).ready(function() {
		pageUrl = "jdy/queryList_zdry.action";
		detailWidth = "950";
		detailid = "ljjbxxadd_detail";
		daggleDiv(detailid);
		
		//导出用到参数
		searchLongUrl = "jdy/queryForExport_zdry.action";
		excelUrl = "jdy/exportExcel_zdry.action";
		tabletitle = "";
		geteExcelHead("ZdryData");

		//时间设置
		$('.datef').attr("readOnly", true).datepicker(true, '0');
		$('.datet').attr("readOnly", true).datepicker(true, '1');

		// 治安管理机构
		$("#zdry_gxdwmc").click(function(){
			getGxdwTree("zdry_gxdwmc","zdry_gxdwbm",null,"current_departlevel");
		});
		
		//定义gird数据信息
		divnid = "ZdryData";
		tableid = "ZdryTable";
		tables = $("#" + divnid).html();
		setPageList_Zdry(1, '#');
	});
	
	//页面gird加载方法
	function setPageList_Zdry(pageno, url) {
		if (manVerify_zdry()) {
			$("#" + divnid).html(tables);
			params = getSubmitParams("#zdry_man_table  [name*=jdytjxx.]");
			alert($("#zdry_ksrq").val());
			if (url == null || url == "undefined") {
				url = pageUrl;
			}
			var mygrid1 = $("#ZdryTable").ingrid(
					{
						url : url,
						height : pageHeight - 240,
						ingridPageParams : sXML,
						ingridExtraParams : params,
						pageNumber : pageno,
						//colIndex: [0],
						noSortColIndex : [0,1,7],
						//noSortColIndex:[11],
						onRowSelect : null,
						//hideColIndex : [7, 8, 9],
						isHaveMorenPaixuClass: true, //加默认排序样式
						morenPaixuCol: 5, //第一默认排序	
						morenPaixuFangshi:'desc', //默认排序方式 
						//alignCenterColIndex: [1,2,8],
						changeHref : function(table) {
							if ($(table).find("tr").length == 0) {
								daochuNum = 0;
							} else {
								daochuNum = 1;
							}
						},
						colWidths : [ "10%", "8%", "14%", "12%", "18%", "18%", "10%", "10%"]
					});
		}
	}
	//查询提交时验证方法
	function manVerify_zdry() {
		if(isFirst>0){
			var ksrq = $("#zdry_ksrq").val();
			var jsrq = $("#zdry_jsrq").val();
			if (!checkControlValue("zdry_ksrq", "Datetime", null, null, null, 1, "开始日期 "))
				return false;
			if (!checkControlValue("zdry_jsrq", "Datetime", null, null, null, 1, "结束日期"))
				return false;
			if (ksrq != null && ksrq != "" && jsrq != null && jsrq != "") {
				if (ksrq > jsrq) {
					jAlert('开始日期不能大于结束日期', '提示信息')
					return false;
				}
			}
			if (!checkControlValue("zdry_gxdwmc","String",1,60,null,1,"所属管辖单位")){
				return false;
			}
		}
		isFirst++;
		return true;
	}
	
	//详情方法
	function setZdryDetail(id) {
		$("#ljjbxxadd_detail").empty();
		dataid = id;
		setWidth("ljjbxxadd_detail", 950);
		setUrl("ljjbxxadd_detail", "business/jdyzagl/LjxxDetail.jsp");
		bindDocument("ljjbxxadd_detail");
	}

	//导出Excel
	function setExportExcel_Zdry() {
		if (daochuNum == 1) {
			params = null;
			jQuery.post(searchLongUrl, params, searchLongBack, "json");
			//setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
		} else {
			jAlert("无查询结果不能导出！", '验证信息', null, null);
		}
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json) {
		//报表标题
		var bbmc = "揽件信息";
		//报表请求
		setExcelLong("ljxxexcel", bbmc);
	}
	//揽件信息导入方法
	function importLjxx() {
		return;
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0" class="tableborder" id="zdry_man_table">
	<!-- 管辖单位编码，默认为当前登录用户管辖单位编码 -->
	<input type="hidden" id="zdry_gxdwbm" name="jdytjxx.gxdwbm" value="<%=gxdwbm%>">
	<!-- 当前登录用户级别 -->
	<input type="hidden" id="current_departlevel" value="<%=departlevel %>">
	<tr>
		<td class="queryfont">重点管控人员数据查询</td>
	</tr>
	<tr>
		<td class="tdbg" style="padding-top:8px">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="10%" class="pagedistd" style="color: red;">开始日期</td>
					<td width="23%" class="pagetd">
						<input type="text" id="zdry_ksrq" name="jdytjxx.ksrq" class="inputstyle datef" value="" />
					</td>
					<td width="10%" class="pagedistd" style="color: red;">结束日期</td>
					<td width="23%" class="pagetd">
						<input type="text" id="zdry_jsrq" name="jdytjxx.jsrq" class="inputstyle datet" value="" />
					</td>
					<td width="10%" class="pagedistd" style="color: red;">所属管辖单位</td>
					<td width="23%" class="pagetd">
						<input type="text" id="zdry_gxdwmc" name="jdytjxx.gxdwmc" class="inputstyle" value="" />
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table border="0" align="right" cellpadding="2" cellspacing="0">
							<tr>
								<td><a href="#" class="searchbutton" id="qu_erys"
									onclick="setPageList_Zdry(1);">查询</a></td>
								<td width="62"><a href="#" class="exceldcbutton"
									onclick='setExportExcel_Zdry();' id="zdryexcel">导出</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table></td>
	</tr>
</table>
<div id="ljjbxxadd_detail" class="page-layout" src="#"
	style="top: 5px; left: 160px;display:none;"></div>

<div id="ZdryData" style="width: 100%;">
	<table id="ZdryTable" width="100%">
		<thead>
			<tr>
				<th name="l_xm" datatype="string" sumflag="0">姓名</th>
				<th name="l_xb" datatype="string" sumflag="0">性别</th>
				<th name="l_zjhm" datatype="string" sumflag="0">身份证号</th>
				<th name="l_rylx" datatype="string" sumflag="0">人员类型</th>
				<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>
				<th name="l_ywdjsj" datatype="date" sumflag="0">寄递业务日期</th>
				<th name="l_ywlx" datatype="string" sumflag="0">业务类型</th>
				<th name="">业务详情</th>
			</tr>
		</thead>
	</table>
</div>
