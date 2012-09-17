<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>

<script type="text/javascript">
	$(function(){
		$('#ryjbxxData').load('business/jdyzagl/BjxxbRY-jdy-tz.jsp');
		
		daggleDiv("ryyjxx_detail");
	});
</script>
<div>
	<fieldset>
		<legend>人员警情信息</legend>
		<div id="ryjbxxData">
		</div>
		<div id="ryyjxx_detail"  class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>
	</fieldset>
	
	<fieldset>
		<legend>运行情况</legend>
	</fieldset>
</div>