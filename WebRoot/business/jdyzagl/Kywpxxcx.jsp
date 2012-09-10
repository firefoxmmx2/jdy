<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript">
$(document).ready(function() {
	pageUrl="jdy/queryList_kyjdwp.action";
	divnid="tabledata";
	tableid="table1";
	//页面用于加载用的DIV的操作
	detailid="kyjdwp_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide()
	
	//loadPage(divnid);
	tables=$("#"+divnid).html();
	$("#"+detailid).hide(); 	
	setPageListKyjdwpxx(1,'#');
		$("#kyjdwpxx_sbsjt").attr("readonly","true");
		$("#kyjdwpxx_sbsjt").datepicker();
		$("#kyjdwpxx_sbsjf").attr("readonly","true");
		$("#kyjdwpxx_sbsjf").datepicker();
		//可疑物品类别
		$('#kyjdwpxx_kywplb_man').selectBox({code:'dm_kywplb'});
	daggleDiv("kyqk_detail");
}); 

function setPageListKyjdwpxx(pageno,url){	
	if (manVerify_bm()){
		params =getSubmitParams("#kyjdwpxx_man [name*=kyjdwpxx.]");
		url=setList(pageno,url);
		rows = Math.ceil((pageHeight-225-25-23)/20);
		var mygrid1 = $("#"+tableid).ingrid({ 
										onRowSelect:null,
										ingridPageWidth: pageWidth,
										url: url,	
                                        ingridExtraParams:params,
										height: pageHeight-225,
										pageNumber: pageno,
										changeHref:function(table){
											$(table).find("tr").each(function(){
												$(this).find("td:last").find("a[title='修改']").remove();
												$(this).find("td:last").find("a[title='删除']").remove();
											});
										},
										ingridPageParams: sXML,
										colWidths: ["10%","10%","10%","10%","10%","10%","10%","10%","10%","10%","18%"]									
									});				
		}
}
//可疑寄递物品详情
function setKyjdwpxxDetail(id){
	$("#"+detailid).empty();
	dataid = id;
	setWidth(detailid,600);
	setUrl(detailid,"business/jdyzagl/KyjdwpxxDetail2.jsp");
	bindDocument(detailid);
}

</script>

<body>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">可疑物品管理</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="kyjdwpxx_man">
		  <tr>
			<td width="10%" class="pagedistd">物流单号</td>
			<td width="23%" class="pagetd"><input type="text" id="kyjdwpxx_wldh" name="kyjdwpxx.ljjbxx.wldh" class="inputstyle" value=""></td>	
			<td width="7%" class="pagedistd">上报时间</td>
				  <td width="41%" class="pagetd"><input type="text" class="inputstyle"  id="kyjdwpxx_sbsjf" name="kyjdwpxx.sbsjf" value="">
			      <span class="pagedistd">至
			           <input type="text" class="inputstyle"  id="kyjdwpxx_sbsjt" name="kyjdwpxx.sbsjt" value="">
			      </span>
			</td>
		  </tr>
		   <tr>
			<td width="10%" class="pagedistd">可疑物品类别</td>
			<td width="23%" class="pagetd"><select class="select1" id="kyjdwpxx_kywplb_man" name="kyjdwpxx.kywplb" ><option></option></select></td>
		  </tr>
		  <tr>
			<td colspan="6" class="pagedistd">&nbsp;</td>
		    <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListKyjdwpxx(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='setkyjdwpdaoc();'>导出</a></td>
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
<div id="kyjdwp_detail" class="page-layout" src="#"
		style="top:5px; left:160px;">
</div>	

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_wldhlb">物流单号</th>
	     	<th name="l_jdpmc">内件品名</th>
	    	<th name="l_jjrxm">寄件人</th>
	    	<th name="l_jjrzjlx">证件类型</th>
	    	<th name="l_jjrzjhm">证件号码</th>
	    	<th name="l_jdpdlxmc">寄递品大类</th>
	    	<th name="l_jdplxmc">寄递品小类</th>
	    	<th name="l_bgrxm">报告人</th>
	    	<th name="l_bgsj">报告时间</th>
	    	<th name="l_kywplb">可疑物品类别</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
