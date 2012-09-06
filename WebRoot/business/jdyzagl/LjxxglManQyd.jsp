<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->

<script type="text/javascript">
//默认加载执行内容
$(document).ready(function() {
	pageUrl="jdy/queryListlj_ljxx.action";
	detailWidth="950";
	//添加揽件信息的DIV
	detailid="ljjbxxadd_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	//定义gird数据信息
	divnid="LjjbxxDate";
	tableid="LjjbxxTable";
	tables=$("#"+divnid).html();
	
	//寄递物品联动下拉列表
	selectboxlink("jdpdlx","jdpxlx","dm_jdwpdl");
	//证件类型--寄件人
	getDictItemBox("lj_jjrzjlx1","lj_jjrzjlx1dm","dm_zjlx");
	//揽件人
	$('#lj_ljrxm').attr('readOnly',true).click(function(){
		getTyRY_item('lj_ljrxm','lj_ljr_cyrybh','<%=qybm%>');
	})	
	//页面时间格式
	$('.date').attr("readOnly",true).datepicker();
	
	setPageListlj(1);
}); 
//页面gird加载方法
function setPageListlj(pageno,url){	
	if (manVerify_bm()){
	    $("#"+divnid).html(tables);
		//alert("寄件人证件类型="+$("#lj_jjrzjlx1").val());
		//alert("寄递品大类="+$("#lj_jdpdlx").val());
		//alert("寄递品小类="+$("#lj_jdpxlx").val());
		if($("#jdpdlx").val()!=""){
			$("#lj_jdwp_jdplx").val($("#jdpdlx").val());
		}
		if($("#jdpxlx").val()!=""){
			$("#lj_jdwp_jdplx").val($("#jdpxlx").val());
		}
		if($("#jdpdlx").val()!=""&&$("#jdpxlx").val()!=""){
			$("#lj_jdwp_jdplx").val($("#jdpxlx").val());
		}
		//var params =getSubmitParams("#ljjbxx_man_qyd [name*=lj.]");
		var aaa=$("#ljjbxx_man_qyd [name*=lj.jjr.xm]").val();
		if (url==null || url=="undefined"){
			url=pageUrl;
		}
		var mygrid1 = $("#LjjbxxTable").ingrid({ 
										url: url,	
										onRowSelect:null,
										height: pageHeight-267,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
										pageNumber: pageno,
										//colIndex: [0],
										noSortColIndex:[11],
										//hideColIndex:[1],
										isHaveMorenPaixuClass: true, //加默认排序样式
										morenPaixuCol: 8, //第一默认排序	
										morenPaixuFangshi:'desc', //默认排序方式 
										alignCenterColIndex: [1,2,8],
										changeHref:function(table){
											$(table).find("tr").each(function(){
												$(this).find("td:last").find("a[title='可疑']").remove();
											});
										},
										colWidths: ["10%","15%","10%","10%","20%","10%","15%","18%"]									
									});				
		}
}	
//查询提交时验证方法
function manVerify_bm(){
	return true;
}
//新增揽件信息方法
function setljAdd(){
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxAdd.jsp");
	bindDocument("ljjbxxadd_detail");
	//$("#tep_Comm_tag").val("jdyAdd");
	//return GB_showCenter("business/jdyzagl/Comm.jsp",510,950);
	//$("#ljjbxxadd_detail").empty();
	//$("#ljjbxxadd_detail").load("business/jdyzagl/ljAdd.jsp");
	//$("#ljjbxxadd_detail").show();
}
//揽件信息修改
function setLjxxUpdate(id){
	$("#"+ljjbxxadd_detail).empty();
	dataid = id;
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxModify.jsp");
	bindDocument("ljjbxxadd_detail");
} 
function setLjxxDetail(id){
	$("#"+ljjbxxadd_detail).empty();
	dataid = id;
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxDetail.jsp");
	bindDocument("ljjbxxadd_detail");
}
//揽件信息删除
function setLjxxDelete(id) {
	alert("进入该方法");
	$.post("jdy/delete_ljxx.action",{'lj.djxh':id},function(json){ if(json.result == 'success') { setPageListlj(1); } },'json');
}
</script>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="">
  <tr>
    <td class="queryfont">揽件信息管理</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="ljjbxx_man_qyd">
    	<input type="hidden" id="lj_jdwp_jdplx" name="lj.jdwp.jdplx" /><!-- 寄递品类型-->
    	<input type="hidden" id="lj_ljr_cyrybh" name="lj.ljr.cyrybh" value="<%=qybm %>" /><!-- 揽件人 -->
				<tr>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_wldh" name="lj.wldh" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_jjrxm" name="lj.jjr.xm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄件人证件类型</td>
					<td width="23%" class="pagetd"><select id="ljxx_jjrzjlx1" name="lj.jjr.zjlx"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">寄件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_jjrzjhm" name="lj.jjr.zjhm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd"><select id="jdpdlx"><option></option></select></td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd"><select id="jdpxlx"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">揽件员</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljrxm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">揽件登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljsj" name="lj.ljsjf" class="inputstyle date" value="" /></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljsj" name="lj.ljsjt" class="inputstyle date" value="" /></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListlj(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="addbutton" onclick='setljAdd();'>添加</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='setBayAdd();'>导出</a></td>
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
<div id="ljjbxxadd_detail" class="page-layout" src="#"
		style="top:5px; left:160px;">
</div>	

<div id="LjjbxxDate" style="width:100%;">
	<table id="LjjbxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_djxh">登记序号</th>
	    	<th name="l_wldh">物流单号</th>
	    	<th name="l_jjrxm">寄件人姓名</th>
	    	<th name="l_jjrzjlx">证件类型</th>
	    	<th name="l_jjrzjhm">证件号码</th>
	    	<th name="l_ljyxm">揽件员</th>
	    	<th name="l_ljtbsj">登记时间</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
