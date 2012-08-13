<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript">
//默认加载执行内容
$(document).ready(function() {
	pageUrl="jdy/queryListlj_ljxx.action";
	
	//添加揽件信息的DIV
	detailid="ljjbxxadd_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	//定义gird数据信息
	divnid="LjjbxxDate";
	tableid="LjjbxxTable";
	tables=$("#"+divnid).html();
	setPageListLjxx(1);
}); 
//页面gird加载方法
function setPageListLjxx(pageno,url){	
	if (manVerify_bm()){
	    $("#"+divnid).html(tables);
		//createXML("ljxx_");
		var params = getSubmitParams("[name*=lj.]");
		if (url==null || url=="undefined"){
			url=pageUrl;
		}
		alert(url);
		var mygrid1 = $("#LjjbxxTable").ingrid({ 
										url: url,	
										onRowSelect:null,
										height: pageHeight-267,
                                        ingridPageParams:sXML,
										pageNumber: pageno,
										colIndex: [0],
										noSortColIndex:[11],
										hideColIndex:[1],
										isHaveMorenPaixuClass: true, //加默认排序样式
										morenPaixuCol: 8, //第一默认排序	
										morenPaixuFangshi:'desc', //默认排序方式 
										alignCenterColIndex: [1,2,8],
										colWidths: ["10%","10%","10%","10%","10%","10%","10%","10%","10%","18%"]									
									});				
		}
}	
//查询提交时验证方法
function manVerify_bm(){
	return true;
}
//新增揽件信息方法
function setLjxxAdd(){
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxAdd.jsp");
	bindDocument("ljjbxxadd_detail");
}
</script>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">揽件信息管理</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
				<tr>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.wldh" name="ljxx.wldh" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">寄件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.jjr.xm" name="ljxx.jjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">寄件人证件类型</td>
					<td width="23%" class="pagetd"><select id="ljxx.jjr.zjlx" name="ljxx.jjr.zjlx" class="select1"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">寄件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.jjr.zjhm" name="ljxx.jjr.zjhm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd"><select id="ljxx.jdplx1d" name="ljxx.jdplx1d" class="select1"><option></option></select></td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd"><select id="ljxx.jdplx"  name="ljxx.jdplx" clss="select1"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">揽件员</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.jjr.xm" name="ljxx.jjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">揽件登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.ljsj" name="ljxx.ljsj" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx.ljsj" name="ljxx.ljsj" class="inputstyle" value=""></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListLjxx(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="addbutton" onclick='setLjxxAdd();'>添加</a></td>
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
	    	<th name="l_zjlx">证件类型</th>
	    	<th name="l_zjhm">证件号码</th>
	    	<th name="l_jdpdl">寄递品大类</th>
	    	<th name="l_jdpxl">寄递品小类</th>
	    	<th name="l_ljy">揽件员</th>
	    	<th name="l_ljsj">登记时间</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
