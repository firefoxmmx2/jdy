<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/user-info.jsp" %>
<%@include file="../../public/common.jsp"%>
<%@ page import="com.aisino2.common.QjblUtil"%>
<%
	String isDisplay=QjblUtil.queryQjblVal("isDisplay");
	if(isDisplay==null||"".equals(isDisplay)){
		isDisplay="false";
	}else{
		isDisplay="true";
	}
%>
<script type="text/javascript">
var display;
$(document).ready(function() {
		display='<%=isDisplay%>';
		if(display=='false'){
			$("#yjxx").hide();
		}
		$("#findChildrenTd").children().css( {
			"height" : pageHeight-40,
			"overflow-y": "auto",
			"overflow-x": "hidden",
			"width":pageWidth
		}).addClass("scrollbarface");
		show_Bjxx("#jbxx_a", "wsslsqzhSh");
	});


var tempClass;
var tempTable;

function show_Bjxx(aObj, id) {
	var classTableId = "table_" + id;//标签table的ID值
	var divTableId = id + "_div";//加载内容DIV的ID值

	if(tempClass=='nav66'){
		tempTable.removeClass("nav66").addClass('nav6');
	}else if(tempClass=='nav55'){
		tempTable.removeClass("nav55").addClass('nav5');
	}else if(tempClass=='nav44'){
		tempTable.removeClass("nav44").addClass('nav4');
	}else if(tempClass=='nav11'){
		tempTable.removeClass("nav11").addClass('nav1');
	}else if(tempClass=='nav33'){
		tempTable.removeClass("nav33").addClass('nav3');
	}
	var table=$(aObj).parent().parent().parent().parent();
	var tableClass=table.attr('class');
	if(tableClass=='nav6'){
		table.removeClass("nav6").addClass('nav66');
		tempClass='nav66';
	}else if(tableClass=='nav5'){
		table.removeClass("nav5").addClass('nav55');
		tempClass='nav55'
	}else if(tableClass=='nav4'){
		table.removeClass("nav4").addClass('nav44');
		tempClass='nav44';
	}else if(tableClass=='nav1'){
		table.removeClass("nav1").addClass('nav11');
		tempClass='nav11'
	}else if(tableClass=='nav3'){
		table.removeClass("nav3").addClass('nav33');
		tempClass='nav33';
	}
	tempTable=table;
	
	$("#findChildrenTd").children("not(#" + divTableId + ")").hide();
	$("#" + divTableId).show();
	var loadCommonPath = "#";
	if(id=='wsslsqzhSh'){
		loadCommonPath = "basic/basicsystem/JqxxClient_baoJing.jsp";
	} else if (id == 'sjclbjxx') {
		loadCommonPath = "basic/basicsystem/WpbjxxbMan_baoJing.jsp";
	}
	jiaZaiBiaoQym(divTableId, loadCommonPath);
}

function jiaZaiBiaoQym(divTableId, loadCommonPath) {
	$("#" + divTableId).empty().load(loadCommonPath);
}

//设置股东及出资额详情
//function gd_setDetail(){
//	jQuery.post('bazagl/gdquerylist_gdjczexx.action',null,updatediv,"json");
//}


//设置保安公司基本信息详情
function setSpDetail(){
	setParams("gdinit_");
	jQuery.post(detailUrl,params,updatediv,"json");
}






</script>
<!-- 基本信息开始 -->

<table  border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" width="100">
			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" id="sqbafwgsCommTab">
				<tr>
					<td width="10%" valign="bottom">
						<table width="100%" border="0" align="right" cellpadding="0"
							cellspacing="0" class="nav3" id="table_wsslsqzhSh" >
							<tr>
								<td>
									<a href="#" id="jbxx_a"
										onMouseDown="show_Bjxx(this,'wsslsqzhSh')"
										cliNum="0" class="navfont" hidefocus="true">人员报警信息</a>
								</td>
							</tr>
						</table>
					</td>
					<td width="10%" valign="bottom" id='yjxx'>
						<table width="100%" border="0" align="right" cellpadding="0"
							cellspacing="0" class="nav3" id="table_sjclbjxx">
							<tr>
								<td>
									<a href="#" id="jbxx_a"
										onMouseDown="show_Bjxx(this,'sjclbjxx')"
										cliNum="0" class="navfont" hidefocus="true">物品报警信息</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td id="findChildrenTd" class="tableborder">
			<div id="wsslsqzhSh_div" style="display: none;" class="line" ></div>
			<div id="sjclbjxx_div" style="display: none;" class="line"></div>
		</td>
	</tr>
</table>



