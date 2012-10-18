<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>

<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->
<script type="text/javascript" src="business/jdyzagl/js/gspicturejdy.js"></script><!-- 身份证扫描js -->

<script type="text/javascript">
	var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var lssjxx_detail_div="ljjbxxadd_detail";
	var lssjxx_detail_width=950;
	var lssjxx_grid_div="LssjxxDiv";
	var lssjxx_grid_table = "LssjxxTable";
	var lssjxx_grid_table_html;
	var lssjxx_page_url = "jdy/queryList_lssjxx.action"
	var lssjxx_detail_url="jdy/query_lssjxx.action";
	var lssjxx_detail_html = "business/jdyzagl/LjxxDetail.jsp";
	var searchLongUrl="jdy/queryForExport_lssjxx.action";
	var excelUrl="jdy/exportExcel_lssjxx.action";
	
	$(function(){
		//导出用到参数
		tabletitle = "";
		getExcelHead("LssjxxDiv");
		
		loadPagePjxxQuery(lssjxx_grid_div);
		daggleDiv(lssjxx_detail_div);
	});
	
	function loadPagePjxxQuery(divpageid){
		lssjxx_grid_table_html=$("#"+divpageid).html();
		lssjQueryPageList(1,'#');
	}
	
	function setlssjQueryList(pageno,url){
	 	$("#"+lssjxx_grid_div).html(lssjxx_grid_table_html);
		params = getSubmitParams("#lssjxxcx [id*=lssj_]",params);
		if (url==null || url=="undefined"){
			url=lssjxx_page_url;
		}
		return url;
	 }
	//页面gird加载方法
	function lssjQueryPageList(pageno,url){	
		url=setlssjQueryList(pageno,url);
		var mygrid1 = $("#"+lssjxx_grid_table).ingrid({ 
									url: url,	
									onRowSelect:null,
									height: pageHeight - 250,
	                                ingridPageParams:sXML,
	                                ingridExtraParams:params,
									pageNumber: pageno,
									isHaveMorenPaixuClass: true, //加默认排序样式
									morenPaixuCol: 2, //第一默认排序	
									changeHref:function(table){
						                var trs =$(table).find("tr");
						                if(trs.length==0){
											daochuNum = 0;
										}else{
											daochuNum = 1;
										}	
									},
									morenPaixuFangshi:'desc', //默认排序方式
									alignCenterColIndex: [3,9],
									hideColIndex:[7,8],
									colWidths: ["10%","15%","12%","8%","15%","15%","17%","0%","0%","8%"]									
								});				
	}	
	
	/**
	历史数据信息详情 
	*/
	var closeTag='lssj';
	function setLssjxxDetail(id) {
		dataid = id;
		setWidth(lssjxx_detail_div,lssjxx_detail_width);
		setUrl(lssjxx_detail_div,lssjxx_detail_html);
		bindDocument(lssjxx_detail_div);
	}
	
	//导出Excel
	function exportLsxx(){	
	  	if(daochuNum==1){
	  	  params = getSubmitParams("#lssjxxcx [id*=lssj_]",params);
	  	  jQuery.post(searchLongUrl,params,searchLongBack,"json");
	  	}else{
	  		jAlert("无查询结果不能导出！",'验证信息',null,null);
	  	}		
	}
	
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){  
	    //报表标题
		var bbmc="历史数据信息";
		//报表请求
		setExcelLong("lssjexcel",bbmc);	
	}
	
	//构建表头 
	function getExcelHead(divid){
		var theadHtml= $("#"+divid).find("thead:first");
		var ths = theadHtml.find("th");
		var tempTitle="";
		$(ths).each(function(i,n){
			if(i != 7 && i != 8){
				tempTitle=tempTitle+"<th sumflag='0' datatype='"+$(n).attr("datatype")+"' name='"+$(n).attr("name")+"'>"+$(n).text()+"</th>";
			}
		});
		tabletitle="<tr>"+tempTitle+"</tr>";
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="lssjxxcx">
  <tr>
    <td class="queryfont">历史数据轨迹查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
				<tr height="30">
					<td width="10%" class="pagedistd">姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="lssj_xm" name="jdytjxx.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">身份证号</td>
					<td width="23%" class="pagetd"><input type="text" id="lssj_zjhm" name="jdytjxx.zjhm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">时间范围</td>
					<td width="23%" class="pagetd">
						<select id="lssj_sjfw" name="jdytjxx.sjfw" class="select1">
							<option value='half'>半年</option>
							<option value='one' selected="selected">一年</option>
							<option value='two'>两年</option>
						</select>
					</td>
				</tr>
    			<tr>
	    		 	<td colspan="6">
	    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
	    		    	<tr>
	    		    		<td ><a href="#" class="searchbutton" id="qu_erys" onclick="lssjQueryPageList(1);">查询</a></td>
		    		    	<td ><a href="#" class="addbutton" id="pjxxexcel" onclick='exportLsxx();'>导出</a></td>
    		    		</tr>
    		  	</table>
    		  </td>
    		</tr>
    	</table> 
    </td>
  </tr>
</table>

<div id="ljjbxxadd_detail" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;"> 
</div>	

<div id="LssjxxDiv" style="width:100%;">
	<table id="LssjxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	    	<th name="l_zjhm" datatype="string" sumflag="0">身份证号</th>
	    	<th name="l_ywdjsj" datatype="date" sumflag="0">业务登记时间</th>
	    	<th name="l_ywlx" datatype="string" sumflag="0">业务类型</th>
	    	<th name="l_qymc" datatype="string" sumflag="0">相关寄递企业</th>
	    	<th name="l_gxdwmc" datatype="string" sumflag="0">企业管辖单位</th>
	    	<th name="l_xxdz" datatype="string" sumflag="0">业务相关地址</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
			<th name="l_djxh" datatype="string" sumflag="0">登记序号</th>
			<th name="">业务详情</th>
	    </tr>
	  </thead>
	</table>	
</div>
