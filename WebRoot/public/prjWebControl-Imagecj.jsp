<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.common.QjblUtil"%>
<%
	String prjWebControlPrint_version = QjblUtil.queryQjblVal("prjweb-bbh-new"); //全局参数取版本号
	String prjWebControlPrint_objid = request.getParameter("objid"); //取对象ID
	String prjWebControlPrint_objwidth = request.getParameter("objwidth"); //取对象WIDTH
	String prjWebControlPrint_objheight = request.getParameter("objheight"); //取对象HEIGHT
	prjWebControlPrint_objid = (prjWebControlPrint_objid!=null&&!"".equals(prjWebControlPrint_objid))?prjWebControlPrint_objid:"ctlPicture"; //ID默认值
	prjWebControlPrint_objwidth = (prjWebControlPrint_objwidth!=null&&!"".equals(prjWebControlPrint_objwidth))?prjWebControlPrint_objwidth:"0"; //WIDTH默认值
	prjWebControlPrint_objheight = (prjWebControlPrint_objheight!=null&&!"".equals(prjWebControlPrint_objheight))?prjWebControlPrint_objheight:"0"; //HEIGHT默认值
%>

<html>
<body>
	<div style ="display:none" id="div_<%=prjWebControlPrint_objid %>">
		<object id="<%=prjWebControlPrint_objid %>" style="width:<%=prjWebControlPrint_objwidth %>px; height:<%=prjWebControlPrint_objheight %>px;" 
			classid="CLSID:41061AD5-9906-408C-BEC6-E9B16805EBF9" codeBase="<%=request.getContextPath() %>/active/prjWebControl.CAB#version=<%=prjWebControlPrint_version %>"></object>&nbsp;
	</div>
</body>
</html>
