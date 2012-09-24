<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>

<script type="text/javascript">
	var qyljpjqk_div='qyljpjqktjData';
	var qyljpjqk_table = 'qyljpjqktjTable';
	var qyljpjqk_tabledata;
	
	$(function(){
		qyljpjqk_tabledata = $('#'+qyljpjqk_div).html();
		querylistQyljpjqk(1);
	});
	
	function querylistQyljpjqk(pageno,url){
		$("#"+qyljpjqk_div).html(qyljpjqk_tabledata);
		var params = {'gxdwbm':$('#pgxdwbm').val()};
		var mygrid1 = $("#"+qyljpjqk_table).ingrid( {
			onRowSelect :null,
			url :"jdy/querylistQyljpjqk_jdytjxx.action",
			height :pageHeight/2-140,
			pageNumber :pageno,
			ingridPageWidth :795,
			isPlayResultNull :false,
			ingridPageParams :sXML,
			ingridExtraParams:params,
			sorting :false,
			colWidths : [ "30%", "11.6%", "11.6%", "11.6%", "11.6%","11.6%","11.6%"]
		});	
	}
	function exportExcelQyljpjqk(){
		
	}
	
	function closeQyljpjqkDialog(){
		$('#'+yxqk_jdy_detailid).hideAndRemove("show");		
	}
</script>

<%
	String pgxdwbm = request.getParameter("gxdwbm");
	if(pgxdwbm==null)
		pgxdwbm = "";
	
%>
<input type="hidden" id="pgxdwbm" value="<%=pgxdwbm%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">昨日上传揽件派件情况</td>
      <td align="right"><a href="#" id="exportExcelQyljpjqkBtn" onclick='exportExcelQyljpjqk();' class="exceldcbutton"></a></td>
      <td align="right"><a href="#" id="closeDiv" onclick='closeQyljpjqkDialog();' class="close"></a></td>
    </tr>
</table>
<div id="qyljpjqktjData">
	<table id="qyljpjqktjTable">
		<thead>
			<tr>
				<th>企业编码</th>
				<th>企业名称</th>
				<th>管辖单位</th>
				<th>昨日揽件数</th>
				<th>昨日派件数</th>
				<th>联系电话</th>
				<th>状态</th>
			</tr>
		</thead>
		
	</table>
</div>