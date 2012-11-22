<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>
<%
User user = (User)session.getAttribute(Constants.userKey);
String departCode = user.getDepartment().getDepartcode();
String stCJDFlag = "";// 省厅采集点标志
if((departCode.indexOf("CJD")!=-1) && (departCode.length()==5)){// 省厅采集点
    stCJDFlag = "1";
}else{
    stCJDFlag = "0";
}
%>
<html>
<head>
<script type="text/javascript">
var gnIckNjHtml,gwIckNjHtml,gnRyHtml,gwRyHtml,QyHtml;
$(document).ready(function() {
	pageUrl="icksystem/ickNJList_icksl.action";
	divnid="tabledata";
	tableid="table1";
	addWidth="500";
	delid="d_ryid";
	gwIckNjHtml="basic/icksystem/WgicknjAdd.jsp";
	gnIckNjHtml="basic/icksystem/IcknjAdd.jsp";
	//从业人员详细信息页面
	gnRyHtml="business/Ylfwzagl/CyryxxDetail-cjd.jsp";
	gwRyHtml="business/Ylfwzagl/CyryxxDetail-wg-cjd.jsp";
	//场所详细信息页面
	QyHtml="business/Ylfwzagl/YlcsjbxxDetail.jsp";
	
	modUrl="icksystem/modify_icksl.action";
	modWidth="800";
	detailHtml="basic/icksystem/IckslDetail.jsp";
	detailid="icknj_detail";
	detailUrl="icksystem/query_icksl.action";
	detailWidth="800";
	icknj_loadPage("tabledata");
		$("#p_cyzjdm").selectBox({code:"dm_rycyzj"});
		// 行业类别	
		$("#p_hylbdm").selectBoxhylb();
		// 企业筛选框
		$("#p_qymc").click(function(){
  			  dataid=$('#p_hylbdm').val();
 			getTy_item("p_qymc","p_qybm");
 		 });
		
		daggleDiv("icknj_detail");
		daggleDiv("qyjbxx_detail");
		setHyxx();
}); 
function icknj_loadPage(divpageid){
    tables=$("#"+divpageid).html();
	$("#"+detailid).hide(); 	
	if(dataid=="tzxxFlag"){
	    dataid="";
	    setPageList(1);
	}else{
	    setPageList(1,'#');
	}
}
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var mygrid1 = $("#"+tableid).ingrid({ 
										ingridPageParams:sXML,
										ingridPageWidth: pageWidth,
										tableid:'icknjtableid',
										onRowSelect: null,
										colClasses: ['grid-col-style2','grid-col-style2','grid-col-style2'],
										colIndex: [1,2,4],
										onTdSelect: function(tr){
											$(tr).find("td").click(function(){
													var tdnum = $(tr).find("td").index(this);
													if(tdnum!=$(tr).find("td").length-1){
														if(tdnum==1||tdnum==2)
															setRyDetail(tr);
														else if(tdnum==4)
															setQyDetail(tr);
													}
											});
										},
										url: url,	
										height: pageHeight-235,
										pageNumber: pageno,
										colWidths: ["14%","8%","16%","4%","20%","8%","11%","9%","6%"]									
									});				
		}
		setHyxx();
}	

function manVerify(){
	if (!checkControlValue("p_qymc","String",1,40,null,0,"企业名称"))
		return false;
	if (!checkControlValue("p_xm","String",1,20,null,0,"姓名"))
		return false;
	if (!checkControlValue("p_cyzjdm","String",1,40,null,0,"证件类型"))
		return false;
	if (!checkControlValue("p_zjhm","String",1,20,null,0,"证件号码"))
		return false;
	return true;
}


//人员详细查询
function setRyDetail(obj){
	dataid=$(obj).find("input[name='ryid"+$(obj).attr("id")+"']").val();
	
	sFlag="false";
	setWidth(detailid,modWidth);
	var rylbInput = $(obj).find("input[name='"+$(obj).attr("id")+"']");
	var rylbValue = rylbInput.val();
	$("#f_rylbbm").val(rylbValue);
	if(rylbValue == 0){
		detailUrl="publicsystem/query_qyryxx.action";
		setUrl(detailid,gnRyHtml);
	}else{
		detailUrl="publicsystem/query_publicwgcyryxx.action";
		setUrl(detailid,gwRyHtml);
	}
	bindDocument(detailid);
}

//场所详细查询
var qyjbxx_requestType;
var qyjbxx_dataid;
var qyjbxx_detailWidth="990";
function setQyDetail(obj){
	detailUrl="publicsystem/query_qyjbxx.action";
	qyjbxx_requestType="detail";
	qyjbxx_dataid=$(obj).find("input[name='qy"+$(obj).attr("id")+"']").val();
	setWidth("qyjbxx_detail",qyjbxx_detailWidth);
	setUrl("qyjbxx_detail",QyHtml);
	sFlag="false";
	bindDocument("qyjbxx_detail");
}
/**
function qyjbxx_setDetail(){
	setParams("q_");
	jQuery.post("publicsystem/query_qyjbxx.action",params,qyjbxx_updatediv,"json");
}*/

  
function setHyxx(){
        var hylb=$("#p_hylbdm").val();
		if(hylb=='J'||hylb=='K'){
			$('#td_qymc').text('场所名称');
			$('#tabledata').find('thead').find('th[@name=l_qymc]').find('DIV').html('场所名称');
		}else{
		    $('#td_qymc').text('企业名称');
			$('#tabledata').find('thead').find('th[@name=l_qymc]').find('DIV').html('企业名称');
		}
}

function setIckNJ(id){
	detailUrl="icksystem/queryNJ_icksl.action";
	dataid=id;
	sFlag="false";
	setWidth(detailid,modWidth);
	var rylbInput = $("#icknjtableid").find("tr[id='"+id+"']").find("input[name='"+id+"']");
	var rylbValue = rylbInput.val();
	$("#f_rylbbm").val(rylbValue);
	if(rylbValue == 0){
		setUrl(detailid,gnIckNjHtml);
	}else{
		setUrl(detailid,gwIckNjHtml);
	}
	bindDocument(detailid);
}

</script>

</head>
<body>

<input type="hidden" id="d_ryid" value="">
<input type="hidden" id="f_rylbbm" value="">
<table width="100%" cellpadding="0" cellspacing="0" class="tableborder">
		<tr>
			<td class="queryfont">
				IC卡年检管理
			</td>
		</tr>
		<tr>
			<td class="tdbg">
				<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="10%" class="pagedistd">行业类别</td>
						<td width="23%" class="pagetd">
								<select  id="p_hylbdm" onchange="setHyxx();"></select>
						</td>
						
						<td width="10%" class="pagedistd" id="td_qymc">场所名称</td>
						<td width="23%" class="pagetd">
								<input type="text" id="p_qymc" readonly class="inputstyle">
						</td>
						
						<td width="10%" class="pagedistd">姓名</td>
						<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_xm">
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<td width="10%" class="pagedistd">证件类型</td>
						<td width="23%" class="pagetd">
							<select id="p_cyzjdm"><option></option></select>
						</td>
						
						<td width="10%" class="pagedistd">证件号码</td>
						<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_zjhm">
						</td>
						<td width="10%" class="pagedistd">从业人员编号</td>
						<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_cyrybh">
						</td>
						<td width="10%" class="pagetd">
								<table border="0" align="right" cellpadding="0" cellspacing="0">
									<tr>
										<td width="100%" height="28px">
											<a href="#" class="searchbutton" id="querys"
												onClick="setPageList(1);">查询</a>
										</td>
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
<div id="icknj_detail" class="page-layout" src="#" style="top: 20px; left: 160px; width: 500px;"></div>

<div id="qyjbxx_detail" class="page-layout" src="#" style="display: none; top: 20px; left: 160px; width: 500px;"></div>

<div id="tabledata" style="width: 100%;">
		<table id="table1" width="100%">
			<thead>
					<tr>
						<th name="l_cyrybh">
							人员编号
						</th>
						<th name="l_xm">
							姓名
						</th>
						<th name="l_zjhm">
							证件号码
						</th>
						<th name="l_xb">
							性别
						</th>
						<th name="l_qymc">
							场所名称
						</th>
						<th name="l_yxqhzrq">
							Ic卡有效期
						</th>
						<th name="l_cylb">
							人员类别
						</th>
						<th name="l_cyryzt">
							状态
						</th>
						<th name="">
							操作
						</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>