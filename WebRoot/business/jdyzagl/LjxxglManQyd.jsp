<%@ page language="java" pageEncoding="UTF-8" 
import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%@include file="/public/ImgerToBase64.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script type="text/javascript" src="business/jdyzagl/js/gspicturejdy.js"></script><!-- 身份证扫描js -->
<!--寄递物品类型联动的js -->
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script> 
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var importUrl = "jdy/importLjxx_ljxx.action";
//默认加载执行内容
$(document).ready(function() {
	pageUrl="jdy/queryListlj_ljxx.action";
	detailWidth="950";
	//添加揽件信息的DIV
	detailid="ljjbxxadd_detail";
	$("#"+detailid).hide();
	//导出用到参数
	searchLongUrl="jdy/querycxForExport_ljxx.action";
	excelUrl="jdy/exportExcel_ljxx.action";
	tabletitle = "";
	geteExcelHead("LjjbxxDate");
	
	//定义gird数据信息
	divnid="LjjbxxDate";
	tableid="LjjbxxTable";
	tables=$("#"+divnid).html();
	setPageListlj(1,'#');
	//寄递物品联动下拉列表
	selectboxlink("jdpdlx","jdpxlx","dm_jdwpdl");
	//证件类型--寄件人
	getDictItemBox("ljxx_jjr_zjlx","lj_jjrzjlx1dm","dm_zjlx");
	//揽件人
	$('#ljxx_ljrxm').attr('readOnly',true).click(function(){
		dataid=null;//js中使用了次变量，且他原本传递过去的值为行业类别，所以会查询不出来东西
		getTyRY_item('ljxx_ljrxm','lj_ljr_cyrybh',null,null,'<%=qybm%>');
	});
	//时间设置
		$('.datef').attr("readOnly",true).datepicker(true,'0');
		$('.datet').attr("readOnly",true).datepicker(true,'1');
	
	
	
	daggleDiv(detailid);
	daggleDiv("ljxxImportDialog");
	
}); 
//页面gird加载方法
function setPageListlj(pageno,url){	
	if (manVerify_bm()){
	    $("#"+divnid).html(tables);
		//alert($("#ljxx_ljrxm").val());
		//alert($("#lj_ljr_cyrybh").val());
		//alert($("#ljxx_ljsjf").val());
		params =getSubmitParams("#ljjbxx_man_qyd [name*=lj.]");
		if (url==null || url=="undefined"){
			url=pageUrl;
		}
		var mygrid1 = $("#LjjbxxTable").ingrid({ 
										url: url,	
										height: pageHeight-286,
                                        ingridPageParams:sXML,
                                        ingridExtraParams:params,
										pageNumber: pageno,
										//colIndex: [0],
										noSortColIndex:[7],	
										//noSortColIndex:[11],
										onRowSelect:null,
										hideColIndex:[7,8,9],
										//isHaveMorenPaixuClass: true, //加默认排序样式
										//morenPaixuCol: 8, //第一默认排序	
										//morenPaixuFangshi:'desc', //默认排序方式 
										//alignCenterColIndex: [1,2,8],
										changeHref:function(table){
											//$(table).find("tr").each(function(){
												//$(this).find("td:last").find("a[title='可疑']").remove();
											//});
											if($(table).find("tr").length==0){
											    daochuNum = 0;
											}else{
											    daochuNum = 1;
											}	
											$('tr',table).each(function(){
												var $tr=$(this);
												//可疑寄递物品标志
												var kyzt=$tr.find('td:nth(7)').text();
												if(kyzt=='Y'){
													$tr.find('td:last a[title=修改]').remove();
													$tr.find('td:last a[title=删除]').remove();
													$tr.addClass("red");
												}
												//超时标志
												var cjbz=$tr.find('td:nth(8)').text();
												if(cjbz=='Y'){
													$tr.find('td:last a[title=修改]').remove();
													$tr.find('td:last a[title=删除]').remove();
												}
												//已派件标志
												var ypj=$tr.find('td:nth(9)').text();
												if(ypj=='Y'){
													$tr.find('td:last a[title=修改]').remove();
													$tr.find('td:last a[title=删除]').remove();
												}
											});
										},
										colWidths: ["25%","12%","10%","10%","20%","10%","15%","0","2","2","15%"]									
									});				
		}
}	
//查询提交时验证方法
function manVerify_bm(){
	var sj1 = $("#ljxx_ljsjf").val();
	var sj2 = $("#ljxx_ljsjt").val();
	if(sj1!=null && sj1!="" && sj2!=null && sj2!=""){
		if(sj1>sj2){
			jAlert('填报时间时间不能大于填报时间至','提示信息')
			return false;
		}
	}
	return true;
}
//新增揽件信息方法
function setljAdd(){
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxAdd.jsp");
	bindDocument("ljjbxxadd_detail");
	//$("#tep_Comm_tag").val("jdyAdd");
	//return GB_showCenter("business/jdyzagl/Comm.jsp",510,950);
	//$("#ljjbxxadd_detail").empty();
	//$("#ljjbxxadd_detail").load("business/jdyzagl/ljAdd.jsp");
	//$("#ljjbxxadd_detail").show();
}
//揽件信息修改
function setLjxxUpdate(id){
	var kybzw=$("#"+id+" td:nth(7)").text();//得到可疑标志 的值 
	if(kybzw=="Y"){
		jAlert("该条揽件信息存在可疑寄递物品，不能进行修改操作！",'验证信息',null,null);
	}else{
		$("#"+ljjbxxadd_detail).empty();
		dataid = id;
		setWidth("ljjbxxadd_detail",950);
		setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxModify.jsp");
		bindDocument("ljjbxxadd_detail");
	}
} 
//详情方法
function setLjxxDetail(id){
	$("#"+ljjbxxadd_detail).empty();
	dataid = id;
	setWidth("ljjbxxadd_detail",950);
	setUrl("ljjbxxadd_detail","business/jdyzagl/LjxxDetail.jsp");
	bindDocument("ljjbxxadd_detail");
}
//揽件信息删除
function setLjxxDelete(id){
	$("#"+ljjbxxadd_detail).hide();
	sFlag="false";
	jConfirm('确定删除吗？', '删除提示', function(r) {
    	if(r==true){
    		$.post("jdy/delete_ljxx.action",{'lj.djxh':id},function(json){ if(json.result == 'success') { setPageListlj(1); } },'json');
		}
		else{
		   return false;
		}
	});
}

//function setLjxxDelete(id) {
//	var kybzw=$("#"+id+" td:nth(7)").text();//得到可疑标志 的值
//	$('#ljdjxh').val(id);
//	if(kybzw=="Y"){
//		jAlert("该条揽件信息存在可疑寄递物品，不能进行删除操作！",'验证信息',null,null);
//	}else{
//		params = getSubmitParams("#scstjcx [name*=lj.]");
//		jQuery.post("jdy/query_ljxx.action",params,ljxxzymcxback,"json");
//		function ljxxzymcxback(json){
//			if(json.overUpdateTime){
//				jAlert("该条揽件信息已超过删除时间，不能进行删除操作！",'验证信息',null,null);
//			}else{
//				$("#"+ljjbxxadd_detail).hide();
//				sFlag="false";
//				jConfirm('确定删除吗？', '删除提示', function(r) {
//			    	if(r==true){
//			    		$.post("jdy/delete_ljxx.action",{'lj.djxh':id},function(json){ if(json.result == 'success') { setPageListlj(1); } },'json');
//					}
//					else{
//					   return false;
//					}
//				});
//			}
//		}
//	}
//}
//=====揽件信息导出执行函数
//function setExportExcel(){
//	if(daochuNum==1){
//		var downloadurl = "jdy/queryljxxdc_ljxx.action";
//		xzurl = encodeURI(downloadurl);
//		location.href = downloadurl;
//	}else{
//		jAlert("无查询结果不能导出！","提示信息");
//	}		
//}

//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
  	  params =null;
  	  jQuery.post(searchLongUrl,params,searchLongBack,"json");
  	  //setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		jAlert("无查询结果不能导出！",'验证信息',null,null);
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="揽件信息";
	//报表请求
	setExcelLong("ljxxexcel",bbmc);	
}

//打开导入窗口
function setImportLjxx(){
	detailDialog('ljxxImportDialog',300,'#',null,function(json){
		var html= '<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">'+
		'		    <tr>'+
		'		      <td align="left" class="title1">揽件导入</td>'+
		'		      <td align="right"><a href="#" id="closeDiv" onclick="close_dialog(this);" class="close"></a></td>'+
		'		    </tr>'+
		'		</table>'+
		'		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="margin-top:10px;">'+
		'			<tr>'+
		'				<td align="right">文件：</td>'+	
		'				<td>'+
		'					<input readonly="readonly" type="text" id="xlsFile" class="inputstyle">'+
		'				</td>'+
		'				<td>'+
		'					<a href="#" class="addbutton" id="uploadbtn" onclick="openHyfj_zxdw();">浏览</a>'+
		'				</td>'+
		'			</tr>'+
		'			<tr>'+
		'				<td colspan="2"></td>'+	
		'				<td>'+
		'					<a href="#" class="addbutton" id="uploadbtn" onclick="importLjxx();">确认</a>'+
		'				</td>'+
		'			</tr>'+
		'		</table>';
		$('#ljxxImportDialog').html(html);
	});
}
//揽件信息导入方法
function importLjxx(){
	if($('#xlsFile').val()){
		$.post(importUrl,{'uploadFile':$('#uploadFile').val()},function(json){
			if(json.result!="success"){
				jAlert(json.result,"提示");
			}
			else{
				jAlert("导入成功","提示");
				$('#ljxxImportDialog').hideAndRemove("show");
			}
		},'json');
	}
}
//浏览方法
function openHyfj_zxdw(){
	ImgerToBase1.SetFileSize= 10240;
    ImgerToBase1.OpenFile();
    ImgerToBase_zxdw();
}
//显示附件浏览的附件 
function ImgerToBase_zxdw(){
    //显示图片路径
    var pathfileName = ImgerToBase1.getFile();
    if (pathfileName != null && pathfileName != "") {
        $("#uploadFile").val(ImgerToBase1.getBase64());
        $("#xlsFile").val(ImgerToBase1.getFileName());
    }  
}
</script>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="ljjbxx_man_qyd">
  <tr>
    <td class="queryfont">揽件信息管理</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<input type="hidden" id="lj_qyjbxx_qybm" name="lj.qyjbxx.qybm" value="<%=qybm%>" /><!-- 所有查询都需要跟上企业编码 -->
    	<input type="hidden" id="lj_ljr_cyrybh" name="lj.ljr.cyrybh" value="" /><!-- 揽件人 -->
    	<%-- ++ 兼容数据关联读分析的揽件信息查询  add by 2012-9-18 --%>
    	<input type="hidden" id="lj_jjr_lxdh" name="lj.jjr.lxdh">
    	<input type="hidden" id="lj_jjr_xxdz" name="lj.jjr.xxdz">
    	<input type="hidden" id="lj_sjr_lxdh" name="lj.sjr.lxdh">
    	<input type="hidden" id="lj_sjr_xxdz" name="lj.sjr.xxdz">
    	<input type="hidden" id="lj_sjr_xm" name="lj.sjr.xm">
    	<%-- -- 兼容数据关联读分析的揽件信息查询  add by 2012-9-18 --%>
    	<input type="hidden" id="uploadFile" >
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" >
				<tr>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_wldh" name="lj.wldh" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_jjrxm" name="lj.jjr.xm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄件人证件类型</td>
					<td width="23%" class="pagetd"><select id="ljxx_jjr_zjlx" name="lj.jjr.zjlx"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">寄件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_jjrzjhm" name="lj.jjr.zjhm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd"><select id="jdpdlx" name="lj.jdpxx.jdpdlx"><option></option></select></td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd"><select id="jdpxlx" name="lj.jdpxx.jdplx"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">揽件员</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljrxm" name="lj.ljr.xm" class="inputstyle" value="" /></td>
					<td width="10%" class="pagedistd">揽件登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljsjf" name="lj.ljsjf" class="inputstyle datef" value="" /></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="ljxx_ljsjt" name="lj.ljsjt" class="inputstyle datet" value="" /></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="setPageListlj(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="addbutton" onclick='setljAdd();'>添加</a></td>
    		    	  <td ><a href="#" class="addbutton" id="exceldcbutton" onclick='setImportLjxx();'>导入</a></td>
    		    	  <td width="62"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="ljxxexcel">导出</a></td>
    		    	</tr>
    		  	</table>
    		  </td>
    		</tr>
    	</table> 
    </td>
  </tr>
</table>
<div id="ljjbxxadd_detail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

<div id="LjjbxxDate" style="width:100%;">
	<table id="LjjbxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_djxh" datatype="string" sumflag="0">登记序号</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
	    	<th name="l_jjrxm" datatype="string" sumflag="0">寄件人姓名</th>
	    	<th name="l_jjrzjlx" datatype="string" sumflag="0">证件类型</th>
	    	<th name="l_jjrzjhm" datatype="string" sumflag="0">证件号码</th>
	    	<th name="l_ljyxm" datatype="string" sumflag="0">揽件员</th>
	    	<th name="l_ljtbsj" datatype="string" sumflag="0">登记时间</th>
	    	<th name="">可疑标志</th>
	    	<th name="">时间可疑标志</th>
	    	<th name="">是否派发标志</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>

<div id="ljxxImportDialog" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	
