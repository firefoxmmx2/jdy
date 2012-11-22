<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%
	String prjWebControlMargin_version = QjblUtil.queryQjblVal("prjweb-bbh-new"); //全局参数取版本号
	String prjWebControlMargin_objid = request.getParameter("objid"); //取对象ID
	String prjWebControlMargin_objwidth = request.getParameter("objwidth"); //取对象WIDTH
	String prjWebControlMargin_objheight = request.getParameter("objheight"); //取对象HEIGHT
	prjWebControlMargin_objid = (prjWebControlMargin_objid!=null&&!"".equals(prjWebControlMargin_objid))?prjWebControlMargin_objid:"ctlMargin"; //ID默认值
	prjWebControlMargin_objwidth = (prjWebControlMargin_objwidth!=null&&!"".equals(prjWebControlMargin_objwidth))?prjWebControlMargin_objwidth:"0"; //WIDTH默认值
	prjWebControlMargin_objheight = (prjWebControlMargin_objheight!=null&&!"".equals(prjWebControlMargin_objheight))?prjWebControlMargin_objheight:"0"; //HEIGHT默认值
%>

<html>
<body>
	<div style ="display:none" id="div_<%=prjWebControlMargin_objid %>">
		<object id="<%=prjWebControlMargin_objid %>" style="width:<%=prjWebControlMargin_objwidth %>px; height:<%=prjWebControlMargin_objheight %>px;" 
			classid="CLSID:8B06C73F-9E34-432B-ACB1-BFFB3260FE2C" codeBase="<%=request.getContextPath() %>/active/prjWebControl.CAB#version=<%=prjWebControlMargin_version %>"></object>&nbsp;
	</div>
</body>
</html>
