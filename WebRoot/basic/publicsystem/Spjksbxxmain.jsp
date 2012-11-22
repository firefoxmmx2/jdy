<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var otherTableHead="";
var publicHylbdm="";
	$(document).ready(function() {
	    
	   pageUrl="publicsystem/queryspjkxxlist_bldsjksb.action";
		divnid="spjkxxData";
		tableid="spjkxxTable";
		delUrl="publicsystem/delete_bldsjksb.action";
		delid="d_sjbdqxxid";
		modHtml="basic/publicsystem/SjbdqxxModify.jsp";
		modUrl="publicsystem/modify_bldsjksb.action";
		modWidth="600";
		detailHtml="basic/publicsystem/QyjbxxDetail-gzth.jsp";
		detailid="spjksbxx_detail";
		detailUrl="publicsystem/query_bldsjksb.action";
		detailWidth="600";
		
		searchLongUrl="publicsystem/queryspjksbxxForExport_bldsjksb.action";  //超长参数后台Action对应url
		excelUrl="publicsystem/exportspjksbxxExcel_bldsjksb.action";
		tabletitle = "";	 
	    geteExcelHead("spjkxxData");	
	    
		loadPage(divnid);	
		$("#p_hylb").selectBoxhylb({code:"ggmk"});
		$("#p_qymc").click(function(){ //服务场所筛选框
		 	dataid=$('#p_hylb').val();
			getTy_item("p_qymc","s_qybm");
		});
		$("#p_zt").selectBox({code:"dm_sbzt"});
		
		daggleDiv(detailid); 
	});
		
	function setPageList(pageno,url){	
		if (manVerify()){
			url=setList(pageno,url);
			var mygrid1 = $("#"+tableid).ingrid({
			    tableid:"bldsjksbTable",
				url: url,
				pageNumber: pageno,				
				ingridPageParams:sXML,
				height: pageHeight-253,
				onRowSelect: null,
				onTdSelect: function(tr){
					var qyid = $(tr).attr("id");
					var qyflbm=$(tr).find("td").eq(13);
					var obj = $(tr).find("td").eq(1); //企业名称
					obj.html("<a href='#' class='hyperlink' onClick=qyjbxx_qyxx('"+qyid+"','"+qyflbm.text()+"');>"+obj.text()+"</a>");
				},
				 changeHref:function(table){
					$(table).find("tr").each(function(){
						$(this).append("<td><a href='#' class='fontbutton' onclick='bldsjksb_setDetailQueryMain("+$(table).find("tr").index(this)+")'>详细信息</a></td>"
						);
					});
					if($(table).find("tr").length==0){
					    daochuNum = 0;
					}else{
					    daochuNum = 1;
					}	
				},
				hideColIndex:[8,9,10,11,12,13],
				colWidths: ["14%","19%","14%","10%","13%","6%","6%","12%","0%","0%","0%","0%","0%","0%","6%"]
			});
		}
	}	
	
	var qyjbxx_dataid;
	var qyjbxx_qymc;
	var qyjbxx_requestType;
	var ylyjbxx_detailHtml="business/Ylfwzagl/YlcsjbxxDetail.jsp";
	var qyjbxx_detailHtml="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	var qyjbxx_detailWidth="1000";
	function qyjbxx_qyxx(id,qymc){ //企业基本信息
	    qyjbxx_requestType="detail";
		qyjbxx_dataid=id;
		qyjbxx_qymc=qymc;
		$("#"+detailid).css("top","10px");
		setWidth(detailid,qyjbxx_detailWidth);
		if(qyjbxx_qymc!='J01'){
		setUrl(detailid,qyjbxx_detailHtml);
		 }else {
		setUrl(detailid,ylyjbxx_detailHtml);}
		bindDocument(detailid);
	}
	
	var bldsjksb_dataid;
	var bldsjksb_detailHtml="basic/publicsystem/BldsjksbDetail.jsp";
	var bldsjksb_detailUrl="publicsystem/query_bldsjksb.action";
	var bldsjk_detailWidth="650";
	
	function bldsjk_spsbxx(id){ //设备详细 
		bldsjksb_dataid=id
		$("#"+detailid).css("top","140px");
		setWidth(detailid,bldsjk_detailWidth);
		setUrl(detailid,bldsjksb_detailHtml);
		bindDocument(detailid);
	}
	
	function bldsjksb_setDetail(){
		var child=new Array(bldsjksb_dataid);
		setParams("q_",child);
		jQuery.post(bldsjksb_detailUrl,params,bldsjksb_updatediv,"json");
	}
	
	
	function bldsjksb_setDetailQueryMain(trIndex){
	    $("#"+detailid).css("top","140px");
		setWidthSome("spjksbxx_detail","700");
		$("#spjksbxx_detail").empty().load("basic/publicsystem/BldsjksbDetail-gzth.jsp",function(){
			bldspjksb_updatediv($("#bldsjksbTable").find("tbody").find("tr:nth("+trIndex+")"));
		}).show("slow");
		upAllPage("spjksbxx_detail");
	}
	
	
	function manVerify(){
		return true;
	}
	
	//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
  	    setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		alert('无查询结果不能导出！');
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="视频监控信息";
	//报表请求
	setExcelLong("spjksbxxexcel",bbmc);	
}

</script>
<head>
<body>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
	<tr>
    <td class="queryfont">视频监控信息查询条件</td>
	</tr>
	<tr>
		<td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td class="pagedistd">行业类别</td>
				<td class="pagetd"><select name="select" id="p_hylb"></td>
				<td class="pagedistd">企业名称</td>
				<td class="pagetd" colspan="3"><input type="text" class="inputstyle" style="width:490px" id="p_qymc" readonly/></td>
			</tr>
			<tr>
				<td width="12%" class="pagedistd">设备名称</td>
				<td width="23%" class="pagetd"><input type="text" id="p_sbmc" class="inputstyle"></td>
				<td width="10%" class="pagedistd">设备生产商</td>
				<td width="23%" class="pagetd"><input type="text" id="p_sccsmc" class="inputstyle"></td>
				<td width="10%" class="pagedistd">规格型号</td>
				<td width="21%" class="pagetd"><input type="text" id="p_ggxh" class="inputstyle"></td>
			</tr>
			<tr>
				<td class="pagedistd">IP地址</td>
				<td class="pagetd"><input type="text" id="p_ipdz" class="inputstyle"><br></td>
				<td class="pagedistd">设备状态</td>
				<td class="pagetd"><select name="select" id="p_zt"><option></option></td>
			    <td colspan="2">
			    <table border="0" align="right" cellpadding="0" cellspacing="0">
					<tr>
						<td width="62px"><a href="#" class="searchbutton" id="querys" onClick="setPageList(1);">查询</a></td>
						<td width="10px"></td>
						<td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="spjksbxxexcel">导出</a></td>
						<td width="10px"></td>
					</tr>
				</table></td>
			</tr>
		</table>
    </td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>
<div id="spjksbxx_detail" class="page-layout" src="#" style="top:60px;"></div>
<div id="spjkxxData" style="width:100%;">
	<table id="spjkxxTable" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_hylb"  datatype="string" sumflag="0">行业类别</th>
	     	<th name="l_qymc"  datatype="string" sumflag="0">企业名称</th>
	     	<th name="l_sbmc" datatype="string" sumflag="0" >设备名称</th>
	     	<th name="l_sccsmc"  datatype="string" sumflag="0">设备生产商</th>
	     	<th name="l_ggxh" datatype="string" sumflag="0">规格型号</th>
	     	<th name="l_azsl" datatype="string" sumflag="0">安装数量</th>
	     	<th name="l_sflx" datatype="string" sumflag="0">是否录像</th>
	     	<th name="l_ipdz"  datatype="string" sumflag="0">IP地址</th>
	     	<th name="" >设备检测机构 </th>
	     	<th name="" >网络传输类型</th>
	     	<th name="" >填报人</th>
	     	<th name="" >填报时间</th>
	     	<th name="" >备注</th>
	     	<th name="" >企业主分类编码</th>
	     	<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>