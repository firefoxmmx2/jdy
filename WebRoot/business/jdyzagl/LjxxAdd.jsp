<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
$(document).ready(function() {	
	daggleDiv("ljjbxxadd_detail");//div拖动
	
	dzcl_pageUrl="../../bazagl/queryywwffzjlzmfj_modifylist_ywwffzjlfj.action";
	
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1);
}); 
//有无违法犯罪记录grid
function setPageList_ywwffzjlzmfj(pageno,url){	
	if (true){
		$("#"+dzcl_divnid).html(dzcl_tables);	
		createXML("ywwffzjlfj_");
		if (url==null || url=="undefined"){
			url=dzcl_pageUrl;
		}
		var mygrid1 = $("#"+dzcl_tableid).ingrid({ 
										url: url,
										height: 40,
										ingridPageWidth : 945,		
						               	ingridPageParams:sXML,
						               	tableid:dzcl_tableid,
										pageNumber: pageno,
										sorting: false,
										paging: false,	
										//havaWaiDivGunDong: true,//控制不能出现滚动条
										hideColIndex:[0,4],
										isPlayResultNull:false,
										onRowSelect:null,
										colWidths: ["0","20%","35%","30%","0","15%"]								
									});				
		}
}
//添加物品执行方法
function tianJiaZxzybaydwDzcl(cllb){
	setWidth("zxzybaydwdzcl_detail",300);
	setUrl("zxzybaydwdzcl_detail","business/jdyzagl/tjwp.jsp");
	bindDocument("zxzybaydwdzcl_detail");
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递品信息登记</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav33"  id="table_jbxx">
            		<tr><td><a href="#" id="ljxx_a" onMouseDown="show_ljxx(this,'ljxx')" cliNum="0"  class="navfont" hidefocus="true">寄递品信息</a></td></tr>
            		</table>
            	</td>
        		<td width="800" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>         
      		</tr>
    		</table>
</td>
</tr>
<tr>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="add">
<tr>
  <td>
    <fieldset>
	<legend style="color: black;">业务基本信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">登记序号</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value="" /></td>
			<td class="red">物流单号</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzqxdm" class="inputstyle" value="" /></td>
		</tr>
	</table>
	</fieldset>
	<table>
	   <tr>
	       <td>
	            <jsp:include page="../../business/jdyzagl/jjrxx.jsp"></jsp:include>
	       </td>
	       <td>
	            <jsp:include page="../../business/jdyzagl/sjrxx.jsp"></jsp:include>
	       </td>
	   </tr>
	</table>
	<fieldset>
	<legend>寄递品信息</legend>
	<table width="100%" >
		<tr height="20">
   	  		<td width="60%" align="right"><a href="#" class="addbutton" id="addbutton" onclick="tianJiaZxzybaydwDzcl()">添加</a></td>
		</tr>
	</table>
	<div id="zxzybaydwdzcl_detail" class="page-layout" src="#" style="top:180px; left:160px;"></div>
		<div id="YwwffzjlData" style="width:100%;">
			<table id="YwwffzjlTable"  width="100%">
			  <thead>
			    <tr>       
			     	 <th name="l_scsid">删除时用到附件ID</th>
			     	<th name="l_xh">序号</th>
			     	<th name="l_njpm">内件品名</th>
			     	<th name="l_sl">数量</th>
			     	<th name="l_bzw">标志位</th>
					<th name="">操作</th>
			    </tr>
			  </thead>
			</table>	
		</div>
	</fieldset>
	<fieldset>
	<legend>揽件人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="red">揽件人</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value=""></td>
			<td class="red">揽件时间</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzqxdm" class="inputstyle" value=""></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='valadateCode();'>保存</a></td>
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存新增" onclick='valadateCode();'>保存新增</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>返回</a></td>
</tr>
</table>

