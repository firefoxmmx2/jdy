<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->
<script type="text/javascript">
var Wplbbkys_grid_table="table1";
var Wplbbkys_grid_div="tabledata";
var Wplbbkys_table_html="";
var pageUrl="jdy/findYjwpPage_wpyjsz.action";
var addYjwpUrl="jdy/setYjwp_wpyjsz.action";
var yjaddjdpxx="yjaddjdpxx";
$(document).ready(function() {
	//寄递物品联动下拉列表
	selectboxlink_new("yj_jdpdlx","yj_jdplx","dm_jdwpdl");
	daggleDiv(yjaddjdpxx);
	loadPageWplbbkysQuery(Wplbbkys_grid_div);
}); 
function selectboxlink_new(firstId,secondId,dicDM){
    var firstdm;
    // 主控件初期化
    $("#"+firstId).selectBox({code:dicDM,query:0});
    // 辅控件初期化
    $("#"+secondId).selectBox({state:"1"});
	
    firstdm=$("#"+firstId).find("option:nth(0)").attr("item");
	//$("#"+secondId).selectBox({code:dicDM,query:firstdm});

    $("#"+firstId).change(function(){
        firstdm = $("#"+firstId).find("option:selected").attr("item");
	    $("#"+secondId).selectBox({code:dicDM,query:firstdm});
    });
}
function loadPageWplbbkysQuery(divpageid){
	Wplbbkys_table_html=$("#"+divpageid).html();
	setPageListWplbbkys(1);
}
function setList(pageno,url){
 	$("#"+Wplbbkys_grid_div).html(Wplbbkys_table_html);
 	setParams("yj_");
	//params = getSubmitParams("#wplbbkys_man [name*=yj.jdpxx.]");
	if (url==null || url=="undefined"){
		url=pageUrl;
	}
	return url;
 }
function setPageListWplbbkys(pageno,url){	
		url=setList(pageno,url);
		var mygrid1 = $("#"+Wplbbkys_grid_table).ingrid({ 
			url: url,	
			onRowSelect:null,
			height: pageHeight-230,
            ingridPageParams:sXML,
            ingridExtraParams:params,
			pageNumber: pageno,
			noSortColIndex:[0,1,2],
			colWidths: ["40%","40%","20%"]									
		});	
		
}

function getaddYjwpPage(){
	setWidth(yjaddjdpxx,500);
	setUrl(yjaddjdpxx,"business/jdyzagl/YjwpAdd.jsp");
	bindDocument(yjaddjdpxx);
}
function removeYjwp(id){
	jQuery.post(addYjwpUrl, {"itemId":id,"result":"del"}, function(){
		setPageListWplbbkys(1);
	}, "") 
}
</script>

<body>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">物品类别预警设置</td>
  </tr>
  <tr>
    <td class="tdbg">
     <table width="100%" border="0" cellspacing="0" cellpadding="2" id="wplbbkys_man">
		  <tr>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd">
					  <select id="yj_jdpdlx" name="yj.jdpxx.jdpdlx">
						<option></option>
					  </select>
					</td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd">
						 <select id="yj_jdplx" name="yj.jdpxx.jdplx">
							<option></option>
						 </select>
					</td>
		 </tr>
		 <tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListWplbbkys(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="jdywxx" onclick='getaddYjwpPage();'>新增</a></td>
    		    	</tr>
    		  	</table>
    		  </td>
    		</tr>
    	</table>
    </td>
  </tr>
</table>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
	</table>	

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_jdpdlxmc" datatype="string" sumflag="0">物品大类</th>
	    	<th name="l_jdplxmc" datatype="string" sumflag="0">物品小类</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
<div id="yjaddjdpxx" class="page-layout" src="#"
		style="top:50px; left:160px; display: none;">
</div>
</body>
