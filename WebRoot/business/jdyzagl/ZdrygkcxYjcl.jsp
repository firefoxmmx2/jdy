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
		ljdetailidyj = "ljjbxxadd_detail";
		daggleDiv(ljdetailidyj);
		//布控人员撤销
		detailid="bkry_detail";
		bkmodWidth="750";
		bkmodHtml="business/jdyzagl/ZdrygkcxYjclxq.jsp";
		daggleDiv(detailid);
		detailUrl="basicsystem/query_bkry.action";
		modUrl="basicsystem/modify_bkry.action";
		
		// 治安管理机构
		$("#zdry_gxdwmc").click(function(){
			getGxdwTree("zdry_gxdwmc","zdry_gxdwbm",null,"current_departlevel");
		});
		
		//定义gird数据信息
		divnid = "ZdryData";
		tableid = "ZdryTable";
		tables = $("#" + divnid).html();
		setPageList(1);
	});
	
	//页面gird加载方法
	function setPageList(pageno, url) {
		if (true) {//manVerify_zdry()
			$("#" + divnid).html(tables);
			params = getSubmitParams("#zdry_yj_table  [name*=jdytjxx.]");
			if (url == null || url == "undefined") {
				url = pageUrl;
			}
			var mygrid1 = $("#ZdryTable").ingrid(
					{
						url : url,
						height : pageHeight - 240,
						ingridPageWidth:900,
						ingridPageParams : sXML,
						ingridExtraParams : params,
						pageNumber : pageno,
						noSortColIndex : [0,1,9],
						onRowSelect : null,
						hideColIndex : [8,9],
						alignCenterColIndex: [3,5,6,7],
						changeHref : function(table) {
							if ($(table).find("tr").length == 0) {
								daochuNum = 0;
							} else {
								daochuNum = 1;
							}
							$('tr',table).each(function(){
								var $tr=$(this);
								//登记序号隐藏   此操作
								//var sfczdjxh=$tr.find('td:nth(8)').html().replace("&nbsp;","","g");
								var sfczdjxh=$tr.find('td:nth(8)').text();
								if(sfczdjxh=="无关联数据"){
									$tr.find('td:last a[title=寄递业务详情]').remove();
								}
							});
						},
						colWidths : [ "8%", "4%", "14%", "10%", "12%", "12%", "7%", "16%","0%","0%","13%"]
					});
		}
	}
	//详情方法
	function setZdryDetail(id) {
		$("#ljjbxxadd_detail").empty();
		dataid = $("#"+id+" td:nth(8)").text();
		setWidth("ljjbxxadd_detail", 950);
		setUrl("ljjbxxadd_detail", "business/jdyzagl/LjxxDetail.jsp");
		bindDocument("ljjbxxadd_detail");
	}
	//处理操作
	function setZdryCl(id){
		dataid=id;
		setWidth(detailid,bkmodWidth);
		setUrl(detailid,bkmodHtml);
		bindDocument(detailid);
	}
	
	//function(){
	//	$(document).find('body').eq(0).append('<div id="zdrygkyjxx" class="page-layout" src="#" style="top:10px; left:160px; display: none;"></div>');
	//	daggleDiv("zdrygkyjxx");
	//	detailDialog("zdrygkyjxx", 900, "business/jdyzagl/ZdrygkcxYjcl.jsp");
	//	}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" id="zdry_yj_table">
	<!-- 管辖单位编码，默认为当前登录用户管辖单位编码 -->
	<input type="hidden" id="zdry_gxdwbm" name="jdytjxx.gxdwbm" value="<%=gxdwbm%>">
	<!-- 当前登录用户级别 -->
	<input type="hidden" id="current_departlevel" value="<%=departlevel %>">
	<!-- 业务和预警区别标志 -->
	<input type="hidden" id="zdry_ywhyjqbbz" name="jdytjxx.ywhyjqbbz" value="YJBZ">
    <tr>
      <td align="left" class="title1">重点管控人员预警数据查询</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#zdrygkyjxx").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<div id="ljjbxxadd_detail" class="page-layout" src="#"
	style="top: 5px; left: 160px;display:none;"></div>
<div id="bkry_detail"  class="page-layout" src="#"
				style="top:100px; left:160px; width:500px;display:none;">
</div>
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
				<th name="">物流单号</th>
				<th name="">登记序号</th>
				<th name="l_bkryid">布控人员ID</th>
				<th name="">业务详情</th>
			</tr>
		</thead>
	</table>
</div>
<table  border="0" align="center"  cellpadding="2"  cellspacing="0">
 	<tr>
 	  <td ><a href="#" class="searchbutton" id="qu_erysyj" onclick='$("#zdrygkyjxx").hideAndRemove("show");'>返回</a></td>
 	</tr>
</table>
