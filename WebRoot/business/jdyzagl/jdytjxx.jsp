<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	String path_baybmxxtj=request.getContextPath();
%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>

<script type="text/javascript">
var jdytjxx_daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var jdytjxx_gxdwbm;
var jdytjxx_departlevel;
var jdytjxx_zwcjbz;
var jdytjxx_zpcjbz;
var jdytjxx_queryTable;
var jdytjxx_qy_queryTable;
var jdytjxx_pageUrl;
var jdytjxx_divnid;
var jdytjxx__table_id;
var jdytjxx_detailid;
var jdytjxx_tabletitle = "寄递数据分析统计";	
var jdytjxx_tables = "";
var myTableDataBmXx="";
var jdytjxx_query_page_func;
var jdytjxx_detail_width=1000;
var qyjbxx_dataid;
var qyjbxx_requestType="detail";
var jdytjxx_wp_queryTable;
var jdytjxx_chartType="bar";
var jdytjxx_excel_url;
$(document).ready(function() {
	
	jdytjxx__table_id="jdytjxx_table_gr";
	jdytjxx_detailid="jdytjxx_detail";
		//*****导出Excel 		 
	geteExcelHead_baybmxxtj("jdytjxx_data_gr_div");	
	
	daggleDiv(jdytjxx_detailid);
	$("#jdytjxx_tjsjf").datepicker(true,"0");
	$("#jdytjxx_tjsjf").attr('readonly','readonly');
	$("#jdytjxx_tjsjt").datepicker(true,"1");
	$("#jdytjxx_tjsjt").attr('readonly','readonly');
	$("#jdytjxx_gxdwmc").click(function(){
		getGxdwTree("jdytjxx_gxdwmc","jdytjxx_gxdwbm",null,"jdytjxx_departlevel");
	});
	$("#jdytjxx_gxdwmc").attr('readonly','readonly');
	
	//企业揽件量统计设置
	$('#jdytjxx_tjlx_qyljltj').click(function(){
		jdytjxx_pageUrl="jdy/queryQyljltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_qy_div";
		jdytjxx__table_id='jdytjxx_table_qy';
		jdytjxx_tabletitle="揽件量统计排名";
		jdytjxx_excel_url="jdy/exportQyljltj_jdytjxx.action";
		
		$('#table_lbzs_bmxx').show();
		$('#table_txzs_bmxx').show();
		if(!jdytjxx_qy_queryTable)
			jdytjxx_qy_queryTable=$("#"+jdytjxx__table_id);
		if($('#jdlx',jdytjxx_qy_queryTable).length)
			$('#jdlx',jdytjxx_qy_queryTable).text('揽件量');
		
		qydxtj_loadPage(jdytjxx_divnid);
		if($('#jdlx').length)
			$('#jdlx').text('揽件量');
		//默认点击列表
		show_biaoqianBmXx({},'lb');
	});
	//辖区内寄件量排名前十的个人
	$('#jdytjxx_tjlx_grjjltj').click(function(){
		jdytjxx_pageUrl="jdy/queryGrjjltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_gr_div";
		jdytjxx__table_id="jdytjxx_table_gr";
		jdytjxx_tabletitle="寄件量统计排名";
		jdytjxx_excel_url="jdy/exportGrjjltj_jdytjxx.action";
		$('#table_lbzs_bmxx').show();
		$('#table_txzs_bmxx').show();
		if(!jdytjxx_queryTable)
			jdytjxx_queryTable=$("#"+jdytjxx__table_id);
		if($('#jddxlx',jdytjxx_queryTable).length)
			$('#jddxlx',jdytjxx_queryTable).text('寄件人');
		jddxtj_loadPage(jdytjxx_divnid);
		if($('#jddxlx').length)
			$('#jddxlx').text('寄件人');
		//默认点击列表
		show_biaoqianBmXx({},'lb');
	});
	//辖区内派件量排名前十的企业
	$('#jdytjxx_tjlx_qypjltj').click(function(){
		jdytjxx_pageUrl="jdy/queryQypjltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_qy_div";
		jdytjxx__table_id='jdytjxx_table_qy';
		jdytjxx_tabletitle="派件量统计排名";
		jdytjxx_excel_url="jdy/exportQypjltj_jdytjxx.action";
		$('#table_lbzs_bmxx').show();
		$('#table_txzs_bmxx').show();
		if(!jdytjxx_qy_queryTable)
			jdytjxx_qy_queryTable=$("#"+jdytjxx__table_id);
		if($('#jdlx',jdytjxx_qy_queryTable).length)
			$('#jdlx',jdytjxx_qy_queryTable).text('派件量');
		qydxtj_loadPage(jdytjxx_divnid);
		if($('#jdlx').length)
			$('#jdlx').text('派件量');
		//默认点击列表
		show_biaoqianBmXx({},'lb');
	});
	//辖区内收件量排名前十的个人
	$('#jdytjxx_tjlx_grsjltj').click(function(){
		jdytjxx_pageUrl="jdy/queryGrsjltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_gr_div";
		jdytjxx__table_id="jdytjxx_table_gr";
		jdytjxx_tabletitle="收件量统计排名";
		jdytjxx_excel_url="jdy/exportGrsjltj_jdytjxx.action";
		$('#table_lbzs_bmxx').show();
		$('#table_txzs_bmxx').show();
		if(!jdytjxx_queryTable)
			jdytjxx_queryTable=$("#"+jdytjxx__table_id);
		if($('#jddxlx',jdytjxx_queryTable).length)
			$('#jddxlx',jdytjxx_queryTable).text('收件人');
		jddxtj_loadPage(jdytjxx_divnid);
		if($('#jddxlx').length)
			$('#jddxlx').text('收件人');
		//默认点击列表
		show_biaoqianBmXx({},'lb');
	});
	//辖区内物品分类统计
	$('#jdytjxx_tjlx_wpfltj').click(function(){
		jdytjxx_pageUrl="jdy/queryJdyWpfltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_wp_div";
		jdytjxx__table_id="jdytjxx_table_wp";
		jdytjxx_tabletitle="物品分类统计";
		jdytjxx_excel_url="jdy/exportJdyWpfltj_jdytjxx.action";
		$('#table_lbzs_bmxx').hide();
		$('#table_txzs_bmxx').hide();
		
		if(!jdytjxx_wp_queryTable)
			jdytjxx_wp_queryTable=$("#"+jdytjxx__table_id);
		wpfltj_loadPage(jdytjxx_divnid);
		//默认点击图表
		show_biaoqianBmXx({},'tx');
		$('#jdytjxx_tx_ct').hide();
	});
	$('.listdata').hide();
	
	//默认触发企业揽件量统计设置
	$('#jdytjxx_tjlx_qyljltj').attr('checked',true).click();
	
	$('#jdytjxx_tx_ct input:radio').click(function(){
		jdytjxx_chartType=$(this).val();
		show_biaoqianBmXx({},'tx');
	});
}); 
//显示标签方法
function show_biaoqianBmXx(aObj,id){
	$('a[id*=bmxxtjTuxing_]').removeClass('selected');
	if(!$(aObj).hasClass('selected'))
			$(aObj).addClass('selected');
 	if(id=='lb'){
 		$("#table_txzs_bmxx").removeClass("nav11").addClass("nav1");
 		$("#table_lbzs_bmxx").removeClass("nav1").addClass("nav11");
	   	$("#jdytjxx_tx_div").hide();
	   	$(".listdata").hide();
	   	$("#"+jdytjxx_divnid).show();
 	}else{
 		$('#jdytjxx_tx_ct').show();
 		$("#table_lbzs_bmxx").removeClass("nav11").addClass("nav1");
 		$("#table_txzs_bmxx").removeClass("nav1").addClass("nav11");
 		$(".listdata").hide();
 		
	   	$("#jdytjxx_tx_div").show();
	   	if(jdytjxx_chartType=='bar')
	   		ceshiBar();
	   	else
	   		ceshiPie();
 	}
}
//生成柱状图
function ceshiBar(){
		$("#jdytjxx_tx_div").empty();
		if(myTableDataBmXx!=null&&myTableDataBmXx!=""){
			$("#jdytjxx_tx_div").fusionChart({
				prefix:'ddd',
				type:'bar',
				columns:[1],
				data:myTableDataBmXx,
				title:jdytjxx_tabletitle,
				width:pageWidth,
				height:pageHeight-290,
				isTotal:true
			});
		}
}
/**
 * 生成饼状图
 */
function ceshiPie(){
	$("#jdytjxx_tx_div").empty();
	if(myTableDataBmXx!=null&&myTableDataBmXx!=""){
		$("#jdytjxx_tx_div").fusionChart({
			prefix:'ddd',
			type:'pie',
			columns:[1],
			data:myTableDataBmXx,
			title:jdytjxx_tabletitle,
			width:pageWidth,
			height:pageHeight-290,
			isTotal:true
		});
	}
}
/**
 * 物品分类统计图
 */
function displayWpflTjImage(){
	$("#jdytjxx_tx_div").empty();
	$('<div id="jdytjxx_tx_bar" style="float:left;"></div>').appendTo("#jdytjxx_tx_div");
	$('<div id="jdytjxx_tx_pie"></div>').appendTo('#jdytjxx_tx_div');
	
	if(myTableDataBmXx!=null&&myTableDataBmXx!=""){
		$("#jdytjxx_tx_bar").fusionChart({
			prefix:'ddd',
			type:'bar',
			columns:[1],
			data:myTableDataBmXx,
			title:jdytjxx_tabletitle,
			width:pageWidth/2,
			height:pageHeight-270,
			isTotal:true
		});
		$("#jdytjxx_tx_pie").fusionChart({
			prefix:'ddd',
			type:'pie',
			columns:[1],
			data:myTableDataBmXx,
			title:jdytjxx_tabletitle,
			width:pageWidth/2,
			height:pageHeight-270,
			isTotal:true
		});
		
	}
}
function geteExcelHead_baybmxxtj(divid){
	var theadHtml = $("#"+divid).find("table:first").find("thead:first");
	theadHtml.find("td").remove();
	jdytjxx_tabletitle=theadHtml.html();

}

function set_jdytjxx_list(pageno,url){	
	//$("#"+jdytjxx_divnid).html(jdytjxx_tables);	

	createXML("jdytjxx_");
	params=getSubmitParams('#jdytjxx_ct [id*=jdytjxx_]');
	if (url==null || url=="undefined"){
		url=jdytjxx_pageUrl;
	}
	
	return url;
}


/*loadPage 对于有翻页的页面的初始化
 * param divpageid：有翻页的div的id
 * param detailid：用于修改，明细查询的div的id
 */
function jddxtj_loadPage(divpageid){
	jdytjxx_tables=$("#"+divpageid).html();
	$("#"+jdytjxx_detailid).hide();
	jdytjxx_query_page_func=jdyjddxtj_page_query;
	jdytjxx_query_page_func(1,'#');
	myTableDataBmXx=null;
}

function qydxtj_loadPage(divpageid){
	jdytjxx_tables=$("#"+divpageid).html();
	$("#"+jdytjxx_detailid).hide();
	jdytjxx_query_page_func=jdyqydxtj_page_query;
	jdytjxx_query_page_func(1,'#');
	myTableDataBmXx=null;
}
function wpfltj_loadPage(divpageid){
	jdytjxx_tables=$("#"+divpageid).html();
	$("#"+jdytjxx_detailid).hide();
	jdytjxx_query_page_func=wpfltj_page_query;
	jdytjxx_query_page_func(1,'#');
	myTableDataBmXx=null;
}
/**
 * 物品分类排名查询
 */
function wpfltj_page_query(pageno,url){
	if (jdytjxxManVerify()){
		var aybmxxtj_gxdwbm=$("#jdytjxx_gxdwbm").val();
		if(aybmxxtj_gxdwbm==''||aybmxxtj_gxdwbm==null){
			$("#jdytjxx_gxdwbm").val(<%=gxdwbm%>);
			$("#jdytjxx_departlevel").val(<%=departlevel%>);
		} 
		
		if($('#'+jdytjxx__table_id).length == 0){
			$('#'+jdytjxx_divnid).html(jdytjxx_wp_queryTable);
		}

		
		url=set_jdytjxx_list(pageno,url);
		
		params.show_number = undefined;
		var mygrid1 = $("#"+jdytjxx__table_id).ingrid({
										paging:false,	 
										url: url,	
										height: pageHeight-263,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
                                        onRowSelect:null,
                                        changeHref:function(table){
                                        	try{
                                        		myTableDataBmXx=null;
    	                                    	var $chart_table = $(table).clone();
//     	                                    	$chart_table.find('tr').each(function(){
//     	                                    		var $tr = $(this);
//     	                                    		$tr.find('td:nth(0)').remove();
//     	                                    		$tr.find('th:nth(0)').remove();
//     	                                    	});
    	                                    	myTableDataBmXx= $(jdytjxx_queryTable).clone().append($chart_table.find('tbody').html()).hide();
//     	                                    	myTableDataBmXx.find('tr:first').find('th:nth(0)').remove();
												if(myTableDataBmXx)
    												displayWpflTjImage();
												else
													$('#jdytjxx_tx_div').text('没有统计数据');
                                        	}catch(e){
                                        		$('#jdytjxx_tx_div').text('没有统计数据');
                                        	}
                                    },
										pageNumber: pageno,
										sorting: false,
										isPlayResultNull:false,
										colWidths: ["50%","50%"]									
									});				
		}
}
function jdyjddxtj_page_query(pageno,url){
	if (jdytjxxManVerify()){
		var aybmxxtj_gxdwbm=$("#jdytjxx_gxdwbm").val();
		if(aybmxxtj_gxdwbm==''||aybmxxtj_gxdwbm==null){
			$("#jdytjxx_gxdwbm").val(<%=gxdwbm%>);
			$("#jdytjxx_departlevel").val(<%=departlevel%>);
		} 
		
		if($('#'+jdytjxx__table_id).length == 0){
			$('#'+jdytjxx_divnid).html(jdytjxx_queryTable);
		}

		
		url=set_jdytjxx_list(pageno,url);
		
		
		var mygrid1 = $("#"+jdytjxx__table_id).ingrid({
										paging:false,	 
										url: url,	
										height: pageHeight-263,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
                                        onRowSelect:null,
                                        changeHref:function(table){
                                        	try{
                                        		myTableDataBmXx=null;
    	                                    	var $chart_table = $(table).clone();
    	                                    	$chart_table.find('tr').each(function(){
    	                                    		var $tr = $(this);
    	                                    		$tr.find('td:nth(0)').remove();
    	                                    		$tr.find('th:nth(0)').remove();
    	                                    	});
    	                                    	myTableDataBmXx= $(jdytjxx_queryTable).clone().append($chart_table.find('tbody').html()).hide();
    	                                    	myTableDataBmXx.find('tr:first').find('th:nth(0)').remove();
    	                                    	 if($('#bmxxtjTuxing_a').hasClass('selected')){
    	                                    		 show_biaoqianBmXx({},'tx');
    	                                    	 }
                                        	}catch(e){
                                        		
                                        	}
                                    },
										pageNumber: pageno,
										sorting: false,
										isPlayResultNull:false,
										colWidths: ["5%","15%","5%","25%","25%","25%"]									
									});				
		}
}	

function jdyqydxtj_page_query(pageno,url){
	if (jdytjxxManVerify()){
		var aybmxxtj_gxdwbm=$("#jdytjxx_gxdwbm").val();
		if(aybmxxtj_gxdwbm==''||aybmxxtj_gxdwbm==null){
			$("#jdytjxx_gxdwbm").val(<%=gxdwbm%>);
			$("#jdytjxx_departlevel").val(<%=departlevel%>);
		} 
		
		if($('#'+jdytjxx__table_id).length == 0){
			$('#'+jdytjxx_divnid).html(jdytjxx_qy_queryTable);
		}
		url=set_jdytjxx_list(pageno,url);
		
		var mygrid1 = $("#"+jdytjxx__table_id).ingrid({
										paging:false,	 
										url: url,	
										height: pageHeight-263,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
                                        onRowSelect:null,
                                        changeHref:function(table){
                                        	try{
                                        		myTableDataBmXx=null;
    	                                    	var $chart_table = $(table).clone();
    	                                    	$chart_table.find('tr').each(function(){
    	                                    		var $tr = $(this);
    	                                    		$tr.find('td:nth(0)').remove();
    	                                    		$tr.find('th:nth(0)').remove();
    	                                    	});
    	                                    	myTableDataBmXx= $(jdytjxx_qy_queryTable).clone().append($chart_table.find('tbody').html()).hide();
    	                                    	myTableDataBmXx.find('tr:first').find('th:nth(0)').remove();
    	                                    	 if($('#bmxxtjTuxing_a').hasClass('selected')){
    	                                    		 show_biaoqianBmXx({},'tx');
    	                                    	 }
                                        	}catch(e){
                                        		
                                        	}
                                        	
                                        },
										pageNumber: pageno,
										sorting: false,
										isPlayResultNull:false,
										colWidths: ["5%","15%","5%","25%","25%","20%","5%"]									
									});				
		}
}

function jdytjxxManVerify(){
	var sj1 = $("#jdytjxx_tjsjf").val();
	var sj2 = $("#jdytjxx_tjsjt").val();
	if(sj1!=null && sj1!="" && sj2!=null && sj2!=""){
		if(sj1>sj2){
			jAlert('统计时间不能大于统计时间至','提示信息')
				return false;
		}else{
			return true;
		}
	}
	return true;
}
function getSubDepartMentSum_baybmxxtj(id,level){
	aybmxxtj_gxdwbm=id;
	aybmxxtj_departlevel=level;
	/* setWidth('BaybqmqktjSubDeptDetail',800);
	   setUrl('BaybqmqktjSubDeptDetail','business/bazagl/SubDeptBaybmxxtjMan.jsp');
	   bindDocument('BaybqmqktjSubDeptDetail');
	   $("#closeDivTag").val('sub'); */
	return GB_showCenter("下级部门统计情况",'<%=path_baybmxxtj%>/business/bazagl/SubDeptBaybmxxtjMan.jsp',510,800);
}

//导出Excel，20100804,excel导出功能修改， 从session直接获取查询结果
function setExportExcel_aybmxxtj(){	
	if($('#jdytjxx_tjlx_wpfltj').attr('checked')){
		$('#jdytjxx_show_number').val('');
	}
	else{
		$('#jdytjxx_show_number').val($('#jdytjxx_show_number').attr('defaultValue'));
	}
	//设置分页信息
	$('#excelTjForm').attr('action',jdytjxx_excel_url)
		.attr("target","_blank")
		.attr('type','post')
		.submit();	
}

//显示企业详情
function setQyDetail(id){
	qyjbxx_dataid=id;
	var qyjbxx_detail_page="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	detailDialog(jdytjxx_detailid, jdytjxx_detail_width, qyjbxx_detail_page);
}
</script>

<body>
<div style="width:100%;overflow:hidden" id="jdytjxx_ct">
<form id="excelTjForm" action="">
	<input type="hidden" id="d_pxjgjbxxid" value="">
	<input type="hidden" id="jdytjxx_gxdwbm" name="gxdwbm" value="<%=gxdwbm%>">
	<input type="hidden" id="jdytjxx_departlevel" value="<%=departlevel %>">	
	<input type="hidden" id="jdytjxx_zwcjbz" value="1">
	<input type="hidden" id="jdytjxx_zpcjbz" value="1">
	<input type="hidden" id="jdytjxx_cardID" value="n">
	<input type="hidden" id="jdytjxx_tag" value="">
	<input type="hidden" id="closeDivTag" value="self">
	<input type="hidden" id="jdytjxx_show_number" name="show_number" value="10" defaultValue="10">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">寄递数据分析统计</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="10%" id="ddddd" class="pagedistd">治安管理机构</td>
					<td width="23%" class="pagetd"><input type="text" id="jdytjxx_gxdwmc" class="inputstyle"></td>
					<td width="10%" class="pagedistd">统计时间</td>
					<td width="23%" class="pagetd"><input type="text" id="jdytjxx_tjsjf" name="tjsjf" class="inputstyle"></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="jdytjxx_tjsjt" name="tjsjt" class="inputstyle"></td>
				</tr>
				<tr>
					<td  class="pagedistd">统计类型</td>
					<td class="pagetd">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><label><input type="radio" id="jdytjxx_tjlx_qyljltj" name="aa">辖区内企业揽件量排名</label></td>
							</tr>
							<tr>
								<td><label><input type="radio" id="jdytjxx_tjlx_grjjltj" name="aa">辖区内个人寄件量排名</label></td>
							</tr>
							<tr>
								<td><label><input type="radio" id="jdytjxx_tjlx_wpfltj" name="aa">辖区内物品分类统计排名</label></td>
							</tr>
						</table>
					</td>
					<td class="pagetd" colspan="3">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><label><input type="radio" id="jdytjxx_tjlx_qypjltj" name="aa">辖区内企业派件量排名</label></td>
							</tr>
							<tr>
								<td><label><input type="radio" id="jdytjxx_tjlx_grsjltj" name="aa">辖区内个人收件量排名</label></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
   					<td colspan="6">
    		  			<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    			<tr>
    		    	  			<td width="50%" ><a href="#" class="searchbutton" id="querys" onclick="jdytjxx_query_page_func(1);">查询</a></td>
    		    	  			<td width="50%" ><a href="#" class="submitbutton" id="daochubutton" onclick="setExportExcel_aybmxxtj();">导出</a></td>
    		    			</tr>
    		  			</table>
    		 		</td>
    			</tr>
    	</table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="jdytjxx_detail" class="page-layout" src="#"
		style="top:180px; left:160px;display:none">
</div>
<table cellspacing="0" cellpadding="0">
	<tr>
		<td width="78">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="nav11" id="table_lbzs_bmxx">
				<tr>
					<td>
						<a id="bmxxtjTuxing_b" href="#" cliNum="0" onclick="show_biaoqianBmXx(this,'lb')" class="navfont" hidefocus="true">列表展示</a>
					</td>	
				</tr>
			</table>
		</td>
		<td width="78">
			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="nav1" id="table_txzs_bmxx">
				<tr>
					<td>
						<a id="bmxxtjTuxing_a" href="#" cliNum="0" onclick="show_biaoqianBmXx(this,'tx')" class="navfont" hidefocus="true">图形展示</a>
					</td>
				</tr>
			</table>
		</td>
		<td width="1034" valign="bottom"></td>
	</tr>
	<tr>
		<td colspan="3">
			<%--个人排名数据表格--%>
			<div id="jdytjxx_data_gr_div" style="width: 100%;" class="listdata">
				<table id="jdytjxx_table_gr" width="100%">
	  				<thead>
	    				<tr>       
							 <th name="l_seqnum" datatype="String" sumflag="0">排序号</th>      
							 <th name="l_xm" datatype="String" ><span id="jddxlx"></span>姓名</th>
							 <th name="l_cs" datatype="Integer" sumflag="0">次数</th>            
							 <th name="l_xxdz" datatype="String">地址</th>                       
							 <th name="l_lxdh" datatype="String">电话</th>                       
							 <th name="l_zjhm" datatype="String">证件号码</th>                 
	    				</tr>
	  				</thead>
				</table>	
			</div>
			<%--企业排名数据表格--%>
			<div id="jdytjxx_data_qy_div" style="width: 100%;" class="listdata">
				<table id="jdytjxx_table_qy" width="100%">
	  				<thead>
	    				<tr>       
	     					<th name="l_seqnum" datatype="String" sumflag="0">排序号</th>
	     					<th name="l_qymc" datatype="String" sumflag="0">企业名称</th>
	     					<th name="l_cs" datatype="Integer" sumflag="0"><span id="jdlx"></span></th>
	     					<th name="l_xxdz" datatype="String" sumflag="0">地址</th>
	     					<th name="l_lxdh" datatype="String" >单位电话</th>
	     					<th name="l_gxdwmc" datatype="String">管辖单位</th>
	     					<th name="">操作</th>
	    				</tr>
	  				</thead>
				</table>	
			</div>
			<%--物品分类统计数据表格--%>
			<div id="jdytjxx_data_wp_div" style="width: 100%;" class="listdata">
				<table id="jdytjxx_table_wp" width="100%">
	  				<thead>
	    				<tr>       
	     					<th name="l_wpzlmc" datatype="String" sumflag="0">物品种类</th>
	     					<th name="l_cs" datatype="Integer" sumflag="0">数目</th>
							<%-- <th name="l_xxdz" datatype="String" sumflag="0">地址</th>--%>
							<%-- <th name="l_lxdh" datatype="String" >单位电话</th>     --%>
							<%-- <th name="l_gxdwmc" datatype="String">管辖单位</th>    --%>
							<%--<th name="">操作</th>                                     --%>
	    				</tr>
	  				</thead>
				</table>	
			</div>

			<div>
				<div id="jdytjxx_tx_ct"  style="text-align: left;">
					<label><input type="radio" name="chartType" value="bar" checked="checked">柱状图</label>
					<label><input type="radio" name="chartType" value="pie">饼状图</label>
				</div>
				<div id="jdytjxx_tx_div"></div>
			</div>
			
		</td>
	</tr>
</table>
</form>	
</div>
