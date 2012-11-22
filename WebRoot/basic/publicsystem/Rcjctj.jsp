<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<jsp:include page="../../public/publicGADTJ.jsp" flush="true"></jsp:include>

<script type="text/javascript">
	var jb;
    var thePlayColWidths=["30%","0%","0%","14%","14%","14%","14%","14%"];
    var theHideCols=[1,2];
	
	$(document).ready(function() {
		$("#rcjctj_detail").hide();
		daggleDiv("rcjctj_detail");
		pageUrl="publicsystem/queryRcjctjlist_cxtj.action";
		excelUrl="publicsystem/queryRcjctjlistExcel_cxtj.action";
		searchLongUrl="publicsystem/queryRcjctjlistExcelTemp_cxtj.action";
		divnid="tabledata_rcjctj";
		tableid="table_rcjctj";
		loadPage(divnid);
		ksd_csxxtjInit();
		initTJDate();
		$("#t_qsrq").attr("readonly","true").attr("value",tomorrowDate).datepicker();
		$("#t_jzrq").attr("readonly","true").attr("value",currentDate).datepicker();
 		$("#t_hylbdm").selectBoxhylb({code:"dm_hylb"});
	});
	//查询
	function startTjcx(){ 
		if(manVerify()){
			createDataTable();
		    setPageList(1);
		}
	}
	// 校验
    function manVerify(){
    	if (!checkControlValue("t_qsrq","Date",null,null,null,1,"起始日期"))
			return false;
        if (!checkControlValue("t_jzrq","Date",null,null,null,1,"截止日期"))
			return false;
		return true;
	}
	
	// 建立数据列表
    function createDataTable(){
        $("#x_hylbdm").attr("value", $("#t_hylbdm").attr("value"));
		$("#x_qsrq").attr("value", $("#t_qsrq").attr("value"));
		$("#x_jzrq").attr("value", $("#t_jzrq").attr("value"));
		$("#x_dsjgbz").attr("value", $("#t_dsjgbz").attr("value"));
		$("#x_dsjgdm").attr("value", $("#t_dsjgdm").attr("value"));
		$("#x_fxjbz").attr("value",  $("#t_fxjbz").attr("value"));
		$("#x_fxjdm").attr("value",  $("#t_fxjdm").attr("value"));
		$("#x_gxdwbz").attr("value", $("#t_gxdwbz").attr("value"));
		$("#x_gxdwdm").attr("value", $("#t_gxdwdm").attr("value"));
    	thePlayColWidths=["30%","0%","0%","14%","14%","14%","14%","14%"];
		theHideCols=[1,2];
        $("#gajgAll").find("input[type='checkbox']").each(function(){
			if($(this).attr("checked")==true){
				if($(this).attr("dataKey")=='dsjgdm'){
					jb="ds";
					thePlayColWidths=["30%","0%","0%","14%","14%","14%","14%","14%"];
					theHideCols=[1,2];
				}
				if($(this).attr("dataKey")=='fxjdm'){
					jb="fxj";
					thePlayColWidths=["0%","30%","0%","14%","14%","14%","14%","14%"];
					theHideCols=[0,2];
				}
				if($(this).attr("dataKey")=='gxdwdm'){
					jb="gxdw";
					thePlayColWidths=["0%","0%","30%","14%","14%","14%","14%","14%"];
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
				height: pageHeight-260,
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
							$(this).find("td:nth(3)").html("<a href='#' class='fontbutton' onClick=setQyxxQuery('"+temp1+"');>"+temp+"</a>");
						}
						if($(this).find("td:nth(4)").text()>0){
							var temp=$(this).find("td:nth(4)").text();
							$(this).find("td:nth(4)").html("<a href='#' class='fontbutton' onClick=setYjcQyxxQuery('"+temp1+"');>"+temp+"</a>");
						}
						if($(this).find("td:nth(5)").text()>0){
							var temp=$(this).find("td:nth(5)").text();
							$(this).find("td:nth(5)").html("<a href='#' class='fontbutton' onClick=setWjcQyxxQuery('"+temp1+"');>"+temp+"</a>");
						}
						if($(this).find("td:nth(6)").text()>0){
							var temp=$(this).find("td:nth(6)").text();
							$(this).find("td:nth(6)").html("<a href='#' class='fontbutton' onClick=setRcjcxxQuery('"+temp1+"');>"+temp+"</a>");
						}
						if($(this).find("td:nth(7)").text()>0){
							var temp=$(this).find("td:nth(7)").text();
							$(this).find("td:nth(7)").html("<a href='#' class='fontbutton' onClick=setMjkjcxxQuery('"+temp1+"');>"+temp+"</a>");
						}
					});
					
				},
				onRowSelect: null,
				sort:true
		});
	}
	
	//传递详细页面参数
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
	
	function setQyxxQuery(id){
		 setXParmValue(id);
	     detailid="rcjctj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/publicsystem/Rcjctj-qyxx.jsp";
	     setUrl(detailid,url);
	}
	function setYjcQyxxQuery(id){
		 setXParmValue(id);
	     detailid="rcjctj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/publicsystem/Rcjctj-yjcqyxx.jsp";
	     setUrl(detailid,url);
	}
	function setWjcQyxxQuery(id){
		 setXParmValue(id);
	     detailid="rcjctj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/publicsystem/Rcjctj-wjcqyxx.jsp";
	     setUrl(detailid,url);
	}
	function setRcjcxxQuery(id){
		 setXParmValue(id);
	     detailid="rcjctj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/publicsystem/Rcjctj-rcjcxx.jsp";
	     setUrl(detailid,url);
	}
	function setMjkjcxxQuery(id){
		 setXParmValue(id);
	     detailid="rcjctj_detail";
		 setWidth(detailid,"1000");
	     $('#'+detailid).css('top','160');
		 var url="basic/publicsystem/Rcjctj-mjkjcxx.jsp";
	     setUrl(detailid,url);
	}
	
	// 导出Excel
	function setExportExcel(){ 
	    if(manVerify()){
		    createDataTable();
		    setParams("t_");
			jQuery.post(searchLongUrl,params,searchLongBack,"json");
		    setPageList(1);
		}
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){  
		//报表标题
		var bbmc="日常检查统计(含民警检查证)";
		//生成表头
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
		    result += "<th name='l_qyzs' datatype='String' sumflag='0'>企业总数</th>";
			result += "<th name='l_yjcqys' datatype='String' sumflag='0'>已检查企业数</th>";
			result += "<th name='l_wjcqys' datatype='String' sumflag='0'>未检查企业数</th>";
			result += "<th name='l_rcjccs' datatype='String' sumflag='0'>日常检查次数</th>";
			result += "<th name='l_mjjczjccs' datatype='String' sumflag='0'>民警检查证检查次数</th>";
			result += "</tr>";
		var tabletitle=result;
		//报表请求
		var surl=excelUrl+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
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
<input type="hidden" id="x_qsrq">
<input type="hidden" id="x_jzrq">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">日常检查统计(含民警检查证)</td>
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
			<td class="pagedistd">起始日期</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_qsrq"></td>
			<td class="pagedistd">截止日期</td>
			<td class="pagetd"><input class="inputstyle" type="text" id="t_jzrq"></td>
		</tr>
		<tr >
		    <td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td class="pagedistd">&nbsp;</td>
			<td width="23%"  class="pagetd">
				<table width="186px" border="0" align="right" cellpadding="2" cellspacing="0">
				<tr>
				<td><a href="#" class="searchbutton" onClick="startTjcx();">查询</a></td>
				<td><a href="#" class="exceldcbutton" onClick="setExportExcel()" id="rcjctjExcel">导出</a></td>
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
<div id="rcjctj_detail" class="page-layout" src="#" style="top:20px; left:160px; width:1000px;"></div>
<div id="tabledata_rcjctj" style="width:100%;">
	<table id="table_rcjctj" width="100%">
	  <thead>
	    <tr>
	    	<th>市级公安机关</th>
	        <th>分县局公安机关</th>
	        <th>科所队</th>
	     	<th>企业总数</th>
	     	<th>已检查企业数</th>
	     	<th>未检查企业数</th>
	     	<th>日常检查次数</th>
	     	<th>民警检查证检查次数</th>
	    </tr>
	  </thead>
	</table>
</div>
</body>