<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.common.QjblUtil,java.text.*"%>
<%

	//String mjjcqxms = QjblUtil.queryQjblVal("rcjcsfsymjk");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String currDate = sdf.format(new Date());
	String ymd[]=currDate.split("-");
	String fy=ymd[0];
%>

<script type="text/javascript">
var zagxjgdm=null;
	$(document).ready(function (){
		//配置本页面的参数		
		daggleDiv("ga_jiaoyan");
		setWidth("ga_jiaoyan",300);
		setUrl("ga_jiaoyan","basic/publicsystem/RcjcMan-qyd-dljy.jsp");
		bindDocument("ga_jiaoyan");
	});
	
	function closeie(){
		window.opener=null; 
		window.close();
	}
	
</script>
<body> 
<input type="hidden" id="u_jcjgdm" />
<input type="hidden" id="u_jcjgmc" />
<input type="hidden" id="u_jcrxm" />
<div id="ga_jiaoyan" class="page-layout" src="#" style="top:210px; left:160px;display:none;">
</div>
<div id="rcjcman_load"></div>
</body>

