<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.aisino2.sysadmin.domain.User"%>
<%@ page import="com.aisino2.sysadmin.Constants"%>
<%@ page import="java.util.*" %>
<%
	User user = (User) session.getAttribute(Constants.userKey);
	int depLev=user.getDepartment().getDepartlevel().intValue();
	String isleaf=user.getDepartment().getIsleaf().toString();
%>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
$(document).ready(function() {
	pageUrlRY="basicsystem/querylistTZ_bjxxb.action";
	divnidRY="BjxxbData";
	tableidRY="BjxxbTable";
	detailHtmlRY="basic/basicsystem/BjxxDetail.jsp";
	detailidRY="bjxxb_detail";
	detailUrlRY="basicsystem/query_bjxxb.action";
	detailWidthRY="800"; 
	loadPageRY("BjxxbData");
	setPageList_RY(1);
	$("#bjxxb_detail").hideAndRemove("show");
		}
	);

function detailRY(id){
	$("#current_recordBjlx").attr("value",$("#BjxxbData").find("tr[id='"+id+"']").find("td").eq(5).text()); //保存本记录的报警类型
	$("#q_idcard").attr("value",$("#BjxxbData").find("tr[id='"+id+"']").find("td").eq(1).text()); //保存本记录的身份证号码
	$("#m_bjxxid").attr("value",id); // 保存本记录的报警信息id

	sFlag="false";
	setWidth(detailidRY,800);

	$("#bjxxb_detail").empty();
	$("#bjxxb_detail").load("basic/basicsystem/BjxxDetail.jsp");
	$("#bjxxb_detail").show("slow"); 
   
	bindDocument("bjxxb_detail");
}
function loadPageRY(divpageid){
	table=$("#"+divpageid).html();
	setPageList_RY(1,'#');
}
function setList_RY(pageno,url){	
	$("#"+divnidRY).html(table);	
	createXML("p_");
	if (url==null || url=="undefined"){
		url=pageUrlRY;
	}
	return url;
}	
function setPageList_RY(pageno,url){
		url=setList_RY(pageno,url);
		var mygrid1 = $("#"+tableidRY).ingrid({ 
										url: url,	
										ingridPageWidth : 1000,
										height: pageHeight/2-140,
										ingridPageParams:sXML,
										changeHref:function(table){
											var deptLevel = "<%=user.getDepartment().getDepartlevel().intValue()%>";
											if(deptLevel=="5") { // 派出所
												table.find("a").each(function(){
													var aText = $(this).text();
													if(aText=='派警')
														$(this).text("");
												});
											}
										},
										onTdSelect: function(tr){
											$(tr).find("td").click(function(){
												if($(tr).find("td").index(this)!=10){
													detailRY($(tr).attr("id")); 
												}
												});
										},
										pageNumber: pageno,
										hideColIndex:[2,7,9,10],	
										isPlayResultNull:false,
										colWidths: ["14.2%","14%","14.2%","14.2%","14.2%","14.2%","14.2%","14.2%","14.2%","14.2%","0%"]									
									});				
}

 
</script>
<html>
	<body>
	<input type="hidden" id="p_gxdwlevel">
	<input type="hidden" id="p_isleaf">
	    <input type="hidden" id="q_idcard">
		<input type="hidden" id="current_recordBjlx" value="">
		<%-- 当前选择的记录的报警类型，用来给子div用 --%>
		<input type="hidden" id="current_bjxxid" value="">
		<%-- 当前选择的记录的报警信息ID，用来给子div用 --%>
		<input type="hidden" id="m_bjxxid" value="">
		<%-- 当前选择的记录的报警信息ID，用来给子div用 --%>
		 <input type="hidden" id="m_startDate" value="<%=new Date() %>" />
			 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="3"></td>
			</tr>
		</table>

		<div id="bjxxb_detail"  class="page-layout" src="#"
		style="top: 40px; left: 160px; width: 500px; display: none;">
		</div>
 
		<div id="BjxxbData" style="width: 100%;">
		<table width="100%" cellpadding="0" cellspacing="0">
<!-- 			<tr class="queryfont"> -->
<!-- 				<td> -->
<!-- 					人员警情信息 -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td>
					<table id="BjxxbTable" width="100%">
					<thead>
						<tr>
							<th name="l_xm" datatype="string" sumflag="0">
								姓名
							</th>
							<th name="l_gmsfhm" datatype="string" sumflag="0">
								公民身份号码
							</th>
							<th name="l_ssqymc" datatype="string" sumflag="0">
								所属企业名称
							</th>
							<th name="l_gxdwmc" datatype="string" sumflag="0">
								治安管辖机构名称
							</th>
							<th name="l_bjsj" datatype="string" sumflag="0">
								报警时间
							</th>
							<th name="l_bjlx" datatype="string" sumflag="0">
								报警类型
							</th>
							<th name="l_sfyxbj" datatype="string" sumflag="0">
								警情是否有效
							</th>
							<th name="l_jqzt" datatype="string" sumflag="0">
								警情状态
							</th>
							<th name="l_chjjg" datatype="string" sumflag="0">
								处警结果
							</th>
							<th name="">
								警情状态代码
							</th>
							<th name="">
								操作
							</th>
						</tr>
					</thead>
					</table>
				</td>
			</tr>
			</table>
		</div>
	</body>
</html>