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
	pageUrltab="jdy/jdywxxquerylist_ljxx.action";
	
	//添加揽件信息的DIV
	detailidtab="ljjbxxadd_detail";
	daggleDiv(detailidtab);
	$("#"+detailidtab).hide();
	//定义gird数据信息
	divnidtab="LjjbxxDate";
	tableidtab="LjjbxxTable";
	tablestab=$("#"+divnidtab).html();
	
	setPageListlj(1);
}); 
//页面gird加载方法
function setPageListlj(pageno,url){	
	if (true){
	    $("#"+divnidtab).html(tablestab);
		params = getSubmitParams("#KyjdwpxxTab [name*=lj.]");
		if (url==null || url=="undefined"){
			url=pageUrltab;
		}
		var mygrid1 = $("#LjjbxxTable").ingrid({ 
										url: url,	
										onRowSelect:null,
										height: pageHeight-267,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
										pageNumber: pageno,
										ingridPageWidth: 950,//定义宽度
										//colIndex: [0],
										noSortColIndex:[11],
										hideColIndex:[1],
										isHaveMorenPaixuClass: true, //加默认排序样式
										morenPaixuCol: 8, //第一默认排序	
										morenPaixuFangshi:'desc', //默认排序方式 
										alignCenterColIndex: [1,2,8],
										changeHref:function(table){
											$(table).find("tr").each(function(){
												$(this).find("td:last").find("a[title='修改']").remove();
												$(this).find("td:last").find("a[title='删除']").remove();
											});
										},
										colWidths: ["10","10","10%","15%","10%","10%","20%","10%","15%","10%"]									
									});				
		}
}	
//寄递品详情方法
function setLjxxDetail(id){
	$("#"+ljjbxxadd_detail).empty();
	dataid = id;
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxDetail.jsp");
	bindDocument("ljjbxxadd_detail");
}
//可疑物品添加方法
function setLjxxKy(id){
	//return GB_showCenter("保安企业奖励增加","business/jdyzagl/KyjdwpxxAdd.jsp",270,540);
	$("#"+ljjbxxadd_detail).empty();
	dataid = id;
	setWidth("ljjbxxadd_detail",600);
	setUrl("ljjbxxadd_detail","business/jdyzagl/KyjdwpxxAdd.jsp");
	bindDocument("ljjbxxadd_detail");
}

</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">可疑物品新增</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#kyjdwp_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="KyjdwpxxTab">
  <input type="hidden" id="lj_qydjdywxxcx" name="lj.ywcxbz" value="qydjdywxxcx"><!-- 企业端可疑寄递物品信息查询标志 -->
  <input type="hidden" id="gadqydcxqbbz_ljman" name="lj.gadqydcxqbbz" value="qydkywpcx" /><!-- 安端端、企业端查询寄递物品区别标志 -->
  <tr height="10" align="center">
  </tr>
   <tr>
	  <td class="distd" style="width:110px">物流单号</td>
	  <td class="pagetd"><input type="text" id="ljxx_wldh" name="lj.wldh" class="inputstyle" value="" /></td>
  </tr>
  <tr>
	  <td colspan="6">
	  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
	    	<tr>
	    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListlj(1);">查询</a></td>
	    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='setBayAdd();'>扫条码</a></td>
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
	    	<th name="l_jdpxxid">寄递品信息ID</th>
	    	<th name="l_djxh">登记序号</th>
	    	<th name="l_jdpmc">内件品名</th>
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

<tr height="25" align="center">
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#kyjdwp_detail").hideAndRemove("show");'>退出</a></td>
</tr>
