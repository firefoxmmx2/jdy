<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>
<%
	String userbm = "";
	User user= (User)session.getAttribute(Constants.userKey);
	if(user!=null&&user.getSsdwbm()!=null&&!"".equals(user.getSsdwbm())){
		userbm = user.getSsdwbm();
	}
%>
	
	
<html>
<head>
<jsp:include page="../../public/prjWebControl-Card.jsp">
	<jsp:param name="objid" value="ctlICCard" />
</jsp:include>
<jsp:include page="../../public/device.jsp">
	<jsp:param name="objid" value="device" />
</jsp:include>
<script type="text/javascript">



	var skjl_tables="";
	var skjl_pageUrl="icksystem/querylistSkjllsxx_qyryskjl.action";
	var skjl_divnid="tabledata";
	var skjl_tableid="table1";
	
	var qybm="<%=userbm %>";
	$(document).ready(function(){
		
	});
	
	
	function skjlslxxx(cyrybh){
	    $("#p_cyrybh").attr("value",cyrybh);
	    $("#p_qybm").attr("value",qybm);
		 skjl_loadPage("tabledata");
	}
	
	function skjl_setPageList(pageno,url){	
		url=skjl_setList(pageno,url);
		var mygrid1 = $("#"+skjl_tableid).ingrid({ 
							url: url,
							ingridPageParams:sXML,
							height: pageHeight-206,
							pageNumber: pageno,
							onRowSelect: null,
							sorting: false,
							colWidths: ["25%","25%","25%","25%"]
					});				
	}
	function skjl_loadPage(divpageid){
		ctreatTable();
		skjl_tables=$("#"+divpageid).html();
		//$("#"+skjl_detailid).hide(); 	
		skjl_setPageList(1);
	}
	function ctreatTable(){
	       $("#tabledata").empty();
	        var result = "<table id='table1' width='100%'><thead><tr>";
		
		    result += "<th name='l_cyrybh' datatype='Integer' sumflag='0'>从业人员编号</th>";
	     	result += "<th name='l_xm' datatype='Integer' sumflag='0'>姓名</th>";
	     	result += "<th name='l_zjhm' datatype='Integer' sumflag='0'>证件号码</th>";
	     	result += "<th name='l_sksj' datatype='Integer' sumflag='0'>刷卡时间</th>";
			result += "</tr></thead><tbody></tbody></table>";
			$("#tabledata").html(result);
	}
	
	
			
	
	function skjl_setList(pageno,url){	
		$("#"+skjl_divnid).html(skjl_tables);
		setParams("p_");
		if (url==null || url=="undefined"){
			url=skjl_pageUrl;
		}
		return url;
	}

</script>
</head>
<body>
<input type="hidden" id="p_qybm">
<input type="hidden" id="p_cyrybh">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">刷卡历史记录</td>
  </tr>
</table>

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>
	     	<th name="l_cyrybh">从业人员编号</th>
	     	<th name="l_xm">姓名</th>
	     	<th name="l_zjhm">证件号码</th>
	     	<th name="l_sksj">刷卡时间</th>
	    </tr>
	  </thead>
	</table>	
</div>

</body>
<script language="javascript" type="text/javascript">
	OpenRead1();
function OpenRead1(){


	document.getElementById('ctlICCard').ConnJava=content_connJava;
	document.getElementById('ctlICCard').ICCardDevice=content_deviceType;
	document.getElementById('ctlICCard').OpenRead();
}
var cardInfoArray= new Array();
var kncyrybh="";
 function ReadICCardFinish(strValue)
      { 
   
        if(strValue.indexOf("$")>=0){
            
                     cardInfoArray = strValue.split('$');
					     kncyrybh = cardInfoArray[1];	
					      
					      if(kncyrybh!=''){
					         skjlslxxx(kncyrybh);
					     }else{
					       // alert("卡内信息从业人员编号为空");
					     }     			    
             }
       }  
          
      
</script>
</html>