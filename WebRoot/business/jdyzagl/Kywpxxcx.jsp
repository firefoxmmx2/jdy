<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>
<script type="text/javascript">
var hylbbz="Y";
$(document).ready(function() {
	pageUrl="jdy/queryList_kyjdwp.action";
	divnid="tabledata";
	tableid="table1";
	//页面用于加载用的DIV的操作
	detailid="kyjdwp_detail";
	//设置显示详情页面的路径
	qyjbxx_detailHtml_kyqk="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	qyjbxx_detailWidthkk="1000";
	qycx_timeFlag = true;
	
	daggleDiv(detailid);
	$("#"+detailid).hide()
	
	//loadPage(divnid);
	tables=$("#"+divnid).html();
	$("#"+detailid).hide(); 	
	setPageListKyjdwpxx(1,'#');
		//时间设置
		$('.datef').attr("readOnly",true).datepicker(true,'0');
		$('.datet').attr("readOnly",true).datepicker(true,'1');

		//可疑物品类别
		$('#kyjdwpxx_kywplb_man').selectBox({code:'dm_kywplb'});
		// 治安管理机构
		$("#kyjdwpxx_ljjbxx_qyjbxx_gxdwmc").click(function(){
			getGxdwTree("kyjdwpxx_ljjbxx_qyjbxx_gxdwmc","lj_gxdwbm",null,"jdytjxx_departlevel");
		});
		//企业名称
		$("#kyjdwpxx_ljjbxx_qyjbxx_qymc").click(function(){
			dataid="";
			getTy_item("kyjdwpxx_ljjbxx_qyjbxx_qymc","p_qybm","","",$("#lj_gxdwbm").attr("value"),$('#p_allhylbdm').val());
		});
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
										height: pageHeight-270,
										//colIndex: [1,2],
										pageNumber: pageno,
										onTdSelect: function(tr){
								            $(tr).find("td").click(function(){
								                var tdnum = $(tr).find("td").index(this);
								                if (tdnum == 1) {
								                	//此ID表示的是该行的逐渐列
								                	var id =$(tr).attr("id");
								                	var hdqyid=$("#bayjbxxTable #"+id).find("td:nth(11)").text();
								                	//通过gird的tableid属性+主键列，获取到第N的值
									       	        var hylbdm=$("#p_allhylbdm").val();
								                	//alert(hylbdm);
								                	//alert("行业类别代码="+hylbdm);
												   //"行业类别"不是旅馆业 所掉的页面
												       		if (sFlag=="true"){
												       		    //这个变量是控制列点击时间不执行用的
													       		sFlag="false";
																//if(tdnum!=$(tr).find("td").length-1){
																	//if(qycx_timeFlag){
															       	//	qycx_timeFlag = false;
															 		//	qyjbxx_requestType="detail";
															 		//	qyjbxx_dataid=hdqyid;
															 		//	//alert("企业ID="+qyjbxx_dataid);
															 		//	setWidth("kyjdwp_detail",qyjbxx_detailWidthkk);
															 		//	setUrl("kyjdwp_detail",qyjbxx_detailHtml_kyqk);
															 		//	bindDocument("kyjdwp_detail");
															 		//	setTimeout(function(){qycx_timeFlag = true;},1000);
																	//}
																//}
															}
								                }
								            });
								        },
										ingridPageParams: sXML,
										colWidths: ["10%","10%","10%","10%","10%","10%","10%","10%","10%","10%","10%","10%","18%"]									
									});				
		}
}
//查询提交时验证方法
function manVerify_bm(){
	var sj1 = $("#kyjdwpxx_sbsjf").val();
	var sj2 = $("#kyjdwpxx_sbsjt").val();
	if(sj1!=null && sj1!="" && sj2!=null && sj2!=""){
		if(sj1>sj2){
			jAlert('填报时间时间不能大于填报时间至','提示信息')
			return false;
		}
	}
	return true;
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
    	 <input type="hidden" id="lj_gxdwbm" name="kyjdwpxx.ljjbxx.qyjbxx.gxdwbm" value="<%=gxdwbm%>"><!-- 管辖单位编码 -->
    	 <input type="hidden" id="kyjdwpxxcxbz" name="kyjdwpxx.kyjdwpxxcxbz" value="gadcxbz"><!-- 可疑寄递物品查询标志 -->
    	 <input type="hidden" id="jdytjxx_departlevel" value="<%=departlevel %>"><!-- 级别 -->
    	  <input type="hidden" id="p_allhylbdm" value="'Y'"><!-- 级别 -->
		  <tr>
			<td width="10%" class="pagedistd">治安管理机构</td>
			<td width="23%" class="pagetd"><input type="text" id="kyjdwpxx_ljjbxx_qyjbxx_gxdwmc"  class="inputstyle" value="" readonly></td>
			<td width="10%" class="pagedistd">企业名称</td>
			<td width="23%" class="pagetd"><input type="text" id="kyjdwpxx_ljjbxx_qyjbxx_qymc" name="kyjdwpxx.ljjbxx.qyjbxx.qymc" class="inputstyle" value=""></td>
			<td width="10%" class="pagedistd">物流单号</td>
			<td width="23%" class="pagetd"><input type="text" id="kyjdwpxx_ljjbxx_wldh" name="kyjdwpxx.ljjbxx.wldh" class="inputstyle" value=""></td>
		  </tr>
		   <tr>
			<td width="7%" class="pagedistd">上报时间</td>
				  <td width="41%" class="pagetd"><input type="text" class="inputstyle datef"  id="kyjdwpxx_sbsjf" name="kyjdwpxx.sbsjf" value="">
			      <span class="pagedistd">至
			           							 <input type="text" class="inputstyle datet"  id="kyjdwpxx_sbsjt" name="kyjdwpxx.sbsjt" value="">
			      </span>
			</td>
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
	    	<th name="l_jdpmc">内件品名</th>
	    	<th name="l_qymc">企业名称</th>
	     	<th name="l_wldhlb">物流单号</th>
	     	<th name="l_kywplb">可疑物品类别</th>
	     	<th name="l_bgrxm">报告人</th>
	    	<th name="l_bgsj">报告日期</th>
	    	<th name="l_jjrxm">寄件人</th>
	    	<th name="l_sjrxm">收件人</th>
	    	<th name="l_jdpdlxmc">寄递品大类</th>
	    	<th name="l_jdplxmc">寄递品小类</th>
	    	<th name="l_ljtbsj">揽件登记时间</th>
	    	<th name="l_qyid">企业ID</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
