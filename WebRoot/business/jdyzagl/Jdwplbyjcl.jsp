<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript">
var Wplbbkyscl_grid_table="yjcltable";
var Wplbbkyscl_grid_div="yjwptabledata";
var Wplbbkyscl_table_html="";
var yjwpclpageUrl="jdy/findYjwuclList_wpyjsz.action";
var updateJdpbzUrl="jdy/setJdpyjbz_wpyjsz.action";
$(document).ready(function() {
	loadPageWplbbkys(Wplbbkyscl_grid_div);
}); 
function loadPageWplbbkys(divpageid){
	Wplbbkyscl_table_html=$("#"+divpageid).html();
	setPageListWplbbkyscl(1);
}
function setListYjcl(pageno,url){
 	$("#"+Wplbbkyscl_grid_div).html(Wplbbkyscl_table_html);
	//params = getSubmitParams("#wplbbkys_man [id*=wp_]",params);
	if (url==null || url=="undefined"){
		url=yjwpclpageUrl;
	}
	return url;
 }
function setPageListWplbbkyscl(pageno,url){	
		url=setListYjcl(pageno,url);
		var mygrid1 = $("#"+Wplbbkyscl_grid_table).ingrid({ 
			url: url,	
			onRowSelect:null,
			ingridPageWidth:850,
			height: pageHeight-286,
            ingridPageParams:sXML,
            ingridExtraParams:params,
			pageNumber: pageno,
			noSortColIndex:[8],
			colWidths: ["20%","5%","10%","10%","10%","10%","10%","15%","10%"]									
		});	
		
}
var dataid;
function getDetail(id){
	$("#yjcl_detail").empty();
	daggleDiv("yjcl_detail");
	dataid=id.split('_')[1]
	setWidth("yjcl_detail",950);
	setUrl("yjcl_detail","business/jdyzagl/LjxxDetail.jsp");
	bindDocument("yjcl_detail");
	
}
function setJdpyjbz(id){
	var jdpid=id.split('_')[0];
	jConfirm('确认处理？', '提示信息', function(r) {
    	if(r==true){
    		jQuery.post(updateJdpbzUrl, {"itemId":jdpid}, function(){
    			setPageListWplbbkyscl(1);
    			}, "") 
		}
		else{
		   return false;
		}
	}); 
	
	
}
</script>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递物品类别预警处理</td>
      <td align="right"><a href="#" id="closeDiv" onclick='close_dialog(this);' class="close"></a></td>
    </tr>
</table><table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
	</table>	

<div id="yjwptabledata" style="width:100%;">
	<table id="yjcltable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
	    	<th name="l_jjrxm" datatype="string" sumflag="0">寄件人</th>
	    	<th name="l_jjrzjhm" datatype="string" sumflag="0">寄件人证件号码</th>
	    	<th name="l_sjrxm" datatype="string" sumflag="0">收件人</th>
	    	<th name="l_jdpdlxmc" datatype="string" sumflag="0">寄递品大类</th>
	    	<th name="l_jdplxmc" datatype="string" sumflag="0">寄递品小类</th>
	    	<th name="l_ljtbsj" datatype="string" sumflag="0">登记时间</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div><div id="yjcl_detail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

</body>
