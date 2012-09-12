<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	qybm = "T013306005003";
%>
<script type="text/javascript">
var trNum=0;
var ljjdpxx = new Array();
$(document).ready(function() {	
	Modifyurl="jdy/query_ljxx.action";
	$('#ljjbxxmodif_id').val(dataid);
	$("#ljjbxx_detail [id^=lj_]").attr("class","readonly");
	$("#ljjbxx_detail [id^=lj_jjrzjlx]").removeAttr("class").attr("disabled","true");//删除class属性
	$("#ljjbxx_detail [id^=lj_sjrzjlx]").removeAttr("class").attr("disabled","true");//删除class属性
	$("#jj_sj_yr .red").removeAttr("class").attr("class","distd");
	$("#ljjbxx_detail [id=jjrssxmc]").attr("class","readonly");
	$("#ljjbxx_detail [id=sjrssxmc]").attr("class","readonly");
	
	var params = getSubmitParams("#ljjbxx_detail [name*=lj.]");
	jQuery.post("jdy/query_ljxx.action",params,modifyback,"json");
	
	//证件类型--寄件人
	getDictItemBox("lj_jjrzjlx","lj_jjrzjlxdm","dm_zjlx");
	//证件类型--收件人
	getDictItemBox("lj_sjrzjlx","lj_sjrzjlxdm","dm_zjlx");
	
	daggleDiv("ljjbxxadd_detail");//div拖动
	dzcl_pageUrl="#";
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1);
}); 
function modifyback(json){
	$("#ljjbxx_detail [id=lj_djxh]").val(json.lj.djxh);//登记序号
	$("#ljjbxx_detail [id=lj_wldh]").val(json.lj.wldh);//物流单号
	
	$("#ljjbxx_detail [id=lj_jjrxm]").val(json.lj.jjr.xm);//寄件人姓名
	$("#ljjbxx_detail [id=lj_jjrzjlx]").val(setNull(json.lj.jjr.zjlx));//寄件人证件类型
	$("#ljjbxx_detail [id=lj_jjrzjhm]").val(json.lj.jjr.zjhm);//寄件人证件号码
	$("#ljjbxx_detail [id=jjrssxmc]").val(json.lj.jjr.ssxmc);//寄件地址
	$("#ljjbxx_detail [id=lj_jjrssx]").val(json.lj.jjr.ssx);//寄件地址代码
	$("#ljjbxx_detail [id=lj_jjrxxdz]").val(json.lj.jjr.xxdz);//寄件人现住地详址
	$("#ljjbxx_detail [id=lj_jjrdw]").val(json.lj.jjr.dw);//寄件人单位
	$("#ljjbxx_detail [id=lj_jjrlxdh]").val(json.lj.jjr.lxdh);//寄件人手机
	$("#ljjbxx_detail [id=lj_jjrgddh]").val(json.lj.jjr.gddh);//固定电话
	
	$("#ljjbxx_detail [id=lj_sjrxm]").val(json.lj.sjr.xm);//收件人姓名
	$("#ljjbxx_detail [id=lj_sjrzjlx]").val(setNull(json.lj.sjr.zjlx));//收件人证件类型
	$("#ljjbxx_detail [id=lj_sjrzjhm]").val(json.lj.sjr.zjhm);//收件人证件号码
	$("#ljjbxx_detail [id=sjrssxmc]").val(json.lj.sjr.ssxmc);//收件地址
	$("#ljjbxx_detail [id=lj_sjrssx]").val(json.lj.sjr.ssx);//寄件地址代码
	$("#ljjbxx_detail [id=lj_sjrxxdz]").val(json.lj.sjr.xxdz);//收件人现住地详址
	$("#ljjbxx_detail [id=lj_sjrdw]").val(json.lj.sjr.dw);//收件人单位
	$("#ljjbxx_detail [id=lj_sjrlxdh]").val(json.lj.sjr.lxdh);//收件人手机
	$("#ljjbxx_detail [id=lj_sjrgddh]").val(json.lj.sjr.gddh);//固定电话
	
	$("#ljjbxx_detail [id=lj_ljrxm_mod]").val(json.lj.ljr.xm);//揽件人
	$("#ljjbxx_detail [id=lj_ljr_cyrybh]").val(json.lj.ljr.cyrybh);//揽件人编码
	$("#ljjbxx_detail [id=lj_ljsj]").val(setNull(json.lj.ljsj));//揽件日期
	for(var i=0;i<json.lj.jdp_list.length;i++){
		//寄递物品信息保存时添加到列表---添加行的方法
		    var jdwp_id=json.lj.jdp_list[i].id;//寄递品类型
			var jdwp_jdplx=json.lj.jdp_list[i].jdplx;//寄递品类型
			var jdwp_jdpmc=json.lj.jdp_list[i].jdpmc;//寄递品名称
			var jdwp_jdpsm=json.lj.jdp_list[i].jdpsm;//寄递品数量
			var jdwp_jdpzl=json.lj.jdp_list[i].jdpzl;//寄递品重量
			var jdwp_jdptj=json.lj.jdp_list[i].jdptj;//寄递品体积
				var addTableTr1="";
				//获取行数
				var trLen1= $("#YwwffzjlTable").find("tr").length;
				//通过行数判断每行的css
				var tr_class1 = "grid-row-style1";//当为奇数时的css
				//当为偶数时的css
				if((trLen1-1)%2==1)
					tr_class1 = "grid-row-style2";
				//设置行的属性和样式	
				addTableTr1 += "<tr _selected='false' name='Tr' class='"+tr_class1+"' id='"+i+"'>";
				//设置每列的属性
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_xh"+i+"'>"+i+"</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_sfscbz"+i+"'>0</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_jdpmc"+i+"'>"+jdwp_jdpmc+"</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_jdpsm"+i+"'>"+jdwp_jdpsm+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdplx"+i+"'>"+jdwp_jdplx+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpzl"+i+"'>"+jdwp_jdpzl+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdptj"+i+"'>"+jdwp_jdptj+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_id"+i+"'>"+jdwp_id+"</td>";
				addTableTr1 += "</tr>";
				if(addTableTr1!=""){
					$("#YwwffzjlTable").append(addTableTr1);
					addTrEvent($("#YwwffzjlTable").find("tr:last"));
				}
	}
}
//寄递品信息grid
function setPageList_ywwffzjlzmfj(pageno,url){	
	if (true){
		$("#"+dzcl_divnid).html(dzcl_tables);	
		createXML("ywwffzjlfj_");
		if (url==null || url=="undefined"){
			url=dzcl_pageUrl;
		}
		var mygrid1 = $("#"+dzcl_tableid).ingrid({ 
										url: url,
										height: 40,
										ingridPageWidth : 945,		
						               	ingridPageParams:sXML,
						               	tableid:dzcl_tableid,
										pageNumber: pageno,
										sorting: false,
										paging: false,	
										//havaWaiDivGunDong: true,//控制不能出现滚动条
										hideColIndex:[1,4,5,6,7],
										isPlayResultNull:false,
										onRowSelect:null,
										colWidths: ["50","0","50%","50%","0","0","0","0"]								
									});				
		}
}
//处理鼠标悬停是的页面样式
function addTrEvent(tr){
	var currTrClass;
	jQuery(tr).hover(
		function() { 
		currTrClass = $(tr).attr("class");
		if (jQuery(this).attr('_selected') != 'true')
			jQuery(this).removeClass(currTrClass).addClass("grid-row-hover") ; 
		},
		function() { if (jQuery(this).attr('_selected') != 'true') jQuery(this).removeClass("grid-row-hover").addClass(currTrClass); }	
	);
	
	jQuery(tr).click(function(event){
		var tr_class;
		var target = (event.target) ? event.target : event.srcElement;
		var parents = $(target).parents();
		var ishave = true;
		for(var i=0;i<parents.length;i++){
			if(parents.eq(i).attr("id")==("divs_fjxx_wpzl")||
					$(target).attr("id")==("divs_fjxx_wpzl")){
				ishave = false;
				break;
			}
		}
		if(ishave){
			jQuery(this).parent().find("tr").each(function(i){
				if(i%2==1)
					tr_class = "grid-row-style2";
				else
					tr_class = "grid-row-style1";
					
				jQuery(this).removeClass("grid-row-sel").removeClass("grid-row-hover").addClass(tr_class).attr("_selected","false");
			});
			jQuery(this).removeClass("grid-row-hover").addClass("grid-row-sel").attr("_selected","true");
		}
	});
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递品信息详情</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav33"  id="table_jbxx">
            		<tr><td><a href="#" id="ljxx_a" onMouseDown="show_ljxx(this,'ljxx')" cliNum="0"  class="navfont" hidefocus="true">寄递品信息</a></td></tr>
            		</table>
            	</td>
        		<td width="800" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>         
      		</tr>
    		</table>
</td>
</tr>
<tr>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="ljjbxx_detail">
<input type="hidden" id="lj_jjrssx" name="lj.jjr.ssx" value="">
<input type="hidden" id="lj_sjrssx" name="lj.sjr.ssx" value="">
<input type="hidden" id="lj_qyjbxx" name="lj.qyjbxx.qybm" value="<%=qybm %>">
<input type="hidden" id="lj_ljr_cyrybh" name="lj.ljr.cyrybh">
<input type="hidden" id="ljjbxxmodif_id" name="lj.djxh" value=""><!-- 修改传递过来的ID号 -->
<tr>
  <td>
    <fieldset>
	<legend style="color: black;">业务基本信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">登记序号</td>
			<td class="detailtd"><input type="text" id="lj_djxh" class="readonly" value="" /></td>
			<td class="distd">物流单号</td>
			<td class="detailtd"><input type="text" id="lj_wldh" name="lj.wldh" class="readonly" value="" /></td>
		</tr>
	</table>
	</fieldset>
	<table width="100%" border="0" cellSpacing="0" cellPadding="0" id="jj_sj_yr">
	   <tr>
	       <td>
	           <jsp:include page="../../business/jdyzagl/jjrxx.jsp"></jsp:include>
	       </td>
	       <td>
	       		&nbsp;
	       </td>
	       <td>
	            <jsp:include page="../../business/jdyzagl/sjrxx.jsp"></jsp:include>
	       </td>
	   </tr>
	</table>
	<fieldset>
	<legend>寄递品信息</legend>
	<div id="zxzybaydwdzcl_detail" class="page-layout" src="#" style="top:180px; left:160px;"></div>
		<div id="YwwffzjlData" style="width:100%;">
			<table id="YwwffzjlTable"  width="100%">
			  <thead>
			    <tr>       
			     	<th id="lj_xh" name="lj_xh">序号</th>
			     	<th name="lj_sfscbz">标志位</th>
			     	<th name="lj_jdpmc">内件品名</th>
			     	<th name="lj_jdpsm">数量</th>
			     	<th name="lj_jdplx">类型</th>
			     	<th name="lj_jdpzl">重量</th>
			     	<th name="lj_jdptj">体积</th>
			     	<th name="lj_id">ID</th>
			    </tr>
			  </thead>
			</table>	
		</div>
	</fieldset>
	<fieldset>
	<legend>揽件人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">揽件人</td>
			<td class="detailtd"><input type="text" id="lj_ljrxm_mod"   name="lj.ljr.xm" class="readonly" value=""></td>
			<td class="distd">揽件时间</td>
			<td class="detailtd"><input type="text" id="lj_ljsj" name="lj.ljsj" class="readonly" value=""></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>返回</a></td>
</tr>
</table>

