<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>

<script type="text/javascript" >
	var qyjbxxlist_div = 'qyjbxxListData';
	var qyjbxxlist_tabledata;
	var qyjbxxlist_table = 'qyjbxxListTable';
	
	$(function(){
		qyjbxxlist_tabledata = $('#'+qyjbxxlist_div).html();
		querylistQyjbxxtz(1,'#');
	});
	
	function querylistQyjbxxtz(pageno,url){
		$("#"+qyjbxxlist_div).html(qyjbxxlist_tabledata);
		var params = getWscqyParams();
		var mygrid1 = $("#"+qyjbxxlist_table).ingrid( {
			onRowSelect :null,
			url :url,
			height :pageHeight/2-140,
			pageNumber :pageno,
			ingridPageWidth :1000,
			isPlayResultNull :false,
			ingridPageParams :sXML,
			ingridExtraParams:params,
			sorting :false,
			colWidths : [ '11%','11%',"11%", "11.6%", "11.6%", "11.6%", "11.6%","11.6%","11.6%"]
		});		
	}
	
	function getWscqyParams(){
		return {
				'qyjbxx.gxdwbm':$('#pgxdwbm').val(),
				'qyjbxx.scbz':'0',
				'qyjbxx.hylbdm':'Y',
				'qyjbxx.zjztdm':$('#pzjztdm').val()
		};
	}
</script>


<%
	String pgxdwbm = request.getParameter("gxdwbm");
	if(pgxdwbm==null)
		pgxdwbm = "";
	String pzjztdm = request.getParameter("zjztdm");
	if(pzjztdm==null)
		pzjztdm = "";
	
%>
<input type="hidden" id="pgxdwbm" value="<%=pgxdwbm%>">
<input type="hidden" id="pzjztdm" value="<%=pzjztdm%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1"></td>
      <td align="right"><a href="#" id="closeDiv" onclick='closeYxqkDetailDialog();' class="close"></a></td>
    </tr>
</table>
<div id="qyjbxxListData">
	<table id="qyjbxxListTable">
		<thead>
			<tr>
				<th>企业编码</th>
				<th>企业名称</th>
				<th>管辖单位</th>
				<th>经济状态</th>
				<th>总人数</th>
				<th>营业状态</th>
				<th>装机状态</th>
				<th>联系电话</th>
				<th>状态</th>
			</tr>
		</thead>
		
	</table>
</div>