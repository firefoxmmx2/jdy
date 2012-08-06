<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>
<%@page import="com.aisino2.common.DepartmentUtil"%>
<%
User user = (User)session.getAttribute(Constants.userKey);
String departCode = user.getDepartment().getDepartcode();
String departName = user.getDepartment().getDepartname();
String departFullCode = user.getDepartment().getDepartfullcode();
int departLevel = user.getDepartment().getDepartlevel().intValue();
String stCode = ""; //省厅编码
String dsCode = ""; //地市编码
String fjCode = ""; //分局编码
String sdfjksdFlage = ""; //省地分局科所队 标志
String isZxs = "0";
while(departCode.length()<12){
		departCode += "0";
}
if(DepartmentUtil.departIsZxs(departFullCode)){ //直辖市
	isZxs = "1";
}
if(departLevel == 2){ //省厅
	sdfjksdFlage = "1";
	if("1".equals(isZxs)){ //直辖市既然是市则转到地市
		sdfjksdFlage = "2";
		stCode = departFullCode.substring(0,4);
	}
}else if(departLevel == 3){ //地市
	sdfjksdFlage = "2";
	stCode = departFullCode.substring(5,17);
	if("1".equals(isZxs)){ //直辖市地市则转到分局
		sdfjksdFlage = "3";
		stCode = departFullCode.substring(0,4);
		dsCode = departFullCode.substring(5,17);
	}
}else if(departLevel == 4){ //分局
	sdfjksdFlage = "3";
	stCode = departFullCode.substring(5,17);
	dsCode = departFullCode.substring(18,30);
	if("1".equals(isZxs)){ //直辖市分局转到派出所
	    sdfjksdFlage = "4";
	    stCode = departFullCode.substring(0,4);
		dsCode = departFullCode.substring(5,17);
		fjCode = departFullCode.substring(18,30);
	}
}else if(departLevel == 5){ //科所队
	sdfjksdFlage = "4";
	stCode = departFullCode.substring(5,17);
	dsCode = departFullCode.substring(18,30);
	fjCode = departFullCode.substring(31,43);
}
%>
<script type="text/javascript">
var js_sdfjksdFlage = '<%=sdfjksdFlage %>';
var js_departCode = '<%=departCode %>';
var departName = '<%=departName%>';
var isZxs = '<%=isZxs %>';
var js_departFullCode = '<%=departFullCode%>';
var js_stCode = '<%=stCode%>';
var js_dsCode = '<%=dsCode%>';
var js_fjCode = '<%=fjCode%>';
</script>
