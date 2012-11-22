<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<jsp:include page="../../public/publicGADTJ.jsp" flush="true"></jsp:include>

<script type="text/javascript">
	var jb;
    var thePlayColWidths=["22%","0%","0%","16%","16%","16%","16%","16%","16%"];
    var theHideCols=[1,2];
	
	$(document).ready(function() {
		$("#icktj_detail").hide();
		daggleDiv("icktj_detail");
		pageUrl="icksystem/querylist_icktjrb.action";
		excelUrl="icksystem/querylistExcel_icktjrb.action";
		searchLongUrl="icksystem/querylistExcelTemp_icktjrb.action";
		divnid="tabledata_icktj";
		tableid="table_icktj";
		loadPage(divnid);
		ksd_csxxtjInit();
		initTJDate();
		$("#t_tjrq").attr("readonly","true").attr("value",currentDate).datepicker();
		// 行业类别	
 		$("#t_hylbdm").selectBoxhylb({code:"dm_hylb"});
	});
	
	// 校验
    function manVerify(){
        if (!checkControlValue("t_tjrq","Date",null,null,null,1,"统计日期"))
			return false;
		return true;
	}
	//查询
	function startTjcx(){ 
		if(manVerify()){
			createDataTable();
		    setPageList(1);
		}
	}
	// 建立数据列表
    function createDataTable(){
        $("#x_hylbdm").attr("value", $("#t_hylbdm").attr("value"));
		$("#x_tjrq").attr("value", $("#t_tjrq").attr("value"));
		$("#x_dsjgbz").attr("value", $("#t_dsjgbz").attr("value"));
		$("#x_dsjgdm").attr("value", $("#t_dsjgdm").attr("value"));
		$("#x_fxjbz").attr("value",  $("#t_fxjbz").attr("value"));
		$("#x_fxjdm").attr("value",  $("#t_fxjdm").attr("value"));
		$("#x_gxdwbz").attr("value", $("#t_gxdwbz").attr("value"));
		$("#x_gxdwdm").attr("value", $("#t_gxdwdm").attr("value"));
    	thePlayColWidths=["22%","0%","0%","16%","16%","16%","16%","16%","16%"];
		theHideCols=[1,2];
        $("#gajgAll").find("input[type='checkbox']").each(function(){
			if($(this).attr("checked")==true){
				if($(this).attr("dataKey")=='dsjgdm'){
					jb="ds";
					thePlayColWidths=["22%","0%","0%","16%","16%","16%","16%","16%","16%"];
					theHideCols=[1,2];
				}
				if($(this).attr("dataKey")=='fxjdm'){
					jb="fxj";
					thePlayColWidths=["0%","22%","0%","16%","16%","16%","16%","16%","16%"];
					theHideCols=[0,2];
				}
				if($(this).attr("dataKey")=='gxdwdm'){
					jb="gxdw";
					thePlayColWidths=["0%","0%","22%","16%","16%","16%","16%","16%","16%"];
					theHideCols=[0,1];
				}
			}
		});
    }
	function setPageList(pageno,url){
		url=setList(pageno,url);
		setParams("t_"); 
		var mygrid1 = $("#"+tableid).ingrid({
				ingridPageParams:sXML,
				url: url,
				height: pageHeight-236,
				pageNumber: pageno,
				colWidths: thePlayColWidths,
				hideColIndex: theHideCols,
				changeHref:function(table){
					if(table.find("tbody tr").length==1&&table.find("tbody tr td").eq(0).html()=="&nbsp;&nbsp;"){
					table.find("tbody tr td").eq(0).html(departName);
					}
					$(table).find("tr").each(function(){
						var temp1=$(this).attr('id');
						if($(this).find("td:nth(3)").text()>0){
							var temp=$(this).find("td:nth(3)").text();
							$(this).find("td:nth(3)").html("<a href='#' class='fontbutton' onClick=setIcktjcsmxQuery('"+temp1+"');>"+temp+"</a>");
						}
						
					});
					
				},
				onRowSelect: null,
				sort:true
		});
	}
	
	function setIcktjcsmxQuery(id){
		 setXParmValue(id);
	     detailid="icktj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/icksystem/Icktjcsmx.jsp";
	     setUrl(detailid,url);
	}
	
	// 导出Excel
	function setExportExcel(){ 
	    if(manVerify()){
		    createDataTable();
		    //excel表头手动生成
		    var result = "<tr>";
		    if (jb=="ds"){
		    result += "<th name='l_ssddsjgmc' datatype='String' sumflag='0'>地市公安机关</th>";
		    } else if (jb=="fxj"){
		    result += "<th name='l_ssdxjgajgmc' datatype='String' sumflag='0'>分县局公安机关</th>";
		    } else if (jb=="gxdw"){
		    result += "<th name='l_gxdwmc' datatype='String' sumflag='0'>科所队</th>";
		    } else {
		    result += "<th name='l_ssddsjgmc' datatype='String' sumflag='0'>管辖机构名称</th>";
		    }
		    result += "<th name='l_lrcss' datatype='String' sumflag='0'>场所数</th>";
			result += "<th name='l_lrcyrys' datatype='String' sumflag='0'>从业人数</th>";
			result += "<th name='l_slicks' datatype='String' sumflag='0'>IC卡受理张数</th>";
			result += "<th name='l_fficks' datatype='String' sumflag='0'>IC卡发放张数</th>";
			result += "<th name='l_skicks' datatype='String' sumflag='0'>IC卡累计使用量</th>";
			result += "<th name='l_drskicks' datatype='String' sumflag='0'>IC卡当日使用量</th>";
			result += "</tr>";
		    tabletitle=result;
		    setSearchLong();
		    setPageList(1);
		}
	}
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLong(){
		setParams("t_");
		jQuery.post(searchLongUrl,params,searchLongBack,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){  
		//报表标题
		var bbmc="刷卡场所统计";
		//报表请求
		setExcelLong("csxxExcel",bbmc);	
	}
	/*setExcel 生成EXCEL,不传参数，防止超长

	 * excelid 链接id
	 * bbmc：报表标题

	 */
	function setExcelLong(excelid,bbmc){
		var surl=excelUrl+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
	
	function setXParmValue(id){
		if(jb!=null&&jb!=''){
					if(jb=='ds'){
						 $("#x_dsjgdm").attr("value", id);
					}
					if(jb=='fxj'){
						 $("#x_fxjdm").attr("value", id);
					}
					if(jb=='gxdw'){
						 $("#x_gxdwdm").attr("value", id);
					}
				}
	}
	
</script>

<body>
<input type="hidden" id="k_deptCode">
<input type="hidden" id="t_dsjgbz" value="0">
<input type="hidden" id="t_dsjgdm">
<input type="hidden" id="t_fxjbz" value="0">
<input type="hidden" id="t_fxjdm">
<input type="hidden" id="t_gxdwbz" value="0">
<input type="hidden" id="t_gxdwdm">

<input type="hidden" id="x_dsjgbz" value="0">
<input type="hidden" id="x_dsjgdm">
<input type="hidden" id="x_fxjbz" value="0">
<input type="hidden" id="x_fxjdm">
<input type="hidden" id="x_gxdwbz" value="0">
<input type="hidden" id="x_gxdwdm">
<input type="hidden" id="x_hylbdm">
<input type="hidden" id="x_tjrq">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">查询条件</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr id="gajgAll">
			<td width="10%" class="pagedistd">
			<input dataKey="dsjgdm" type="checkbox" id="ch_dsjgdm" onClick="ksd_gajgSelect(this);"/>市级公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_dsjgdm" onChange="ksd_dsjgdmOnchange();"><option>全部</option></select>
			</td>
			<td width="10%" class="pagedistd">
			<input dataKey="fxjdm" type="checkbox" id="ch_fxjdm" onClick="ksd_gajgSelect(this);">分县局公安机关</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_fxjdm" onChange="ksd_fxjdmOnchange();"><option>全部</option></select></td>
			<td width="10%" class="pagedistd">
			<input dataKey="gxdwdm" type="checkbox" id="ch_gxdwdm" onClick="ksd_gajgSelect(this);">科所队</td>
			<td width="23%" class="pagetd">
			<select name="cylb" id="bq_gxdwdm" onChange="ksd_gxdwdmOnchange();"><option>全部</option></select></td>
		</tr>
		<tr id="cszflAll">
		   <td class="pagedistd">行业类别</td>
			<td class="pagetd"><select type="select" id="t_hylbdm"></select></td>
			<td class="pagedistd">统计日期</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_tjrq"></td>
			<td class="pagedistd">&nbsp;</td>
			<td width="23%"  class="pagetd">
				<table width="186px" border="0" align="right" cellpadding="2" cellspacing="0">
				<tr>
				<td><a href="#" class="searchbutton" onClick="startTjcx();">查询</a></td>
				<td><a href="#" class="exceldcbutton" onClick="setExportExcel()" id="csxxExcel">导出</a></td>
				</tr>
				</table>
			</td>
		</tr>
    	</table>
    </td>
  </tr>
</table>	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="icktj_detail" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_icktj" style="width:100%;">
	<table id="table_icktj" width="100%">
	  <thead>
	    <tr>
	    	<th>市级公安机关</th>
	        <th>分县局公安机关</th>
	        <th>科所队</th>
	     	<th>场所数</th>
	     	<th>从业人员数</th>
	     	<th>IC卡受理张数</th>
	     	<th>IC卡发放张数</th>
	     	<th>IC卡累计使用量</th>
	     	<th>IC卡当日使用量</th>
	    </tr>
	  </thead>
	</table>
</div>
</body>