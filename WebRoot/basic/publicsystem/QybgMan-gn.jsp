<%@ page language="java" pageEncoding="UTF-8"
import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
	User user= (User)session.getAttribute(Constants.userKey);
	String deptCode = user.getDepartment().getDepartcode();
 %>
<html>
<head>
<script type="text/javascript">
    var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var qyjbxx_requestType=""; //添加、查看、修改
	var qyjbxx_dataid="";
	var qyjbxx_tables = "";
	var qyjbxx_divnid="QyjbxxData";
	var qyjbxx_tableid="QyjbxxTable";
	var qyjbxx_pageUrl="publicsystem/queryQyBianGengList_qyjbxx.action";
	var qyjbxx_modHtml="basic/publicsystem/QyjbxxModify-gzth.jsp";
	var qyjbxx_modUrl="publicsystem/biangeng_qyjbxx.action"; //不是修改而是变更
	var qyjbxx_modUrl1="basic/publicsystem/Qybgxxman-gn.jsp"; //不是修改而是详细
	var qyjbxx_modWidth="1000";
	var qyjbxx_detailid="qyjbxx_detail";
	var qyjbxx_detailHtml="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	var qyjbxx_detailUrl="publicsystem/query_qyjbxx.action";
	var qyjbxx_detailWidth="1000";
	$(document).ready(function() {
	    searchLongUrl="publicsystem/queryQyBianGengList_qyjbxx.action";
	    excelUrl="publicsystem/exportExcel_qyjbxx.action";
	    tabletitle = "";	 
	    geteExcelHead("QyjbxxData");	
	
		qyjbxx_loadPage(qyjbxx_divnid);
		$("#p_relation").selectBox({state:"temp",width:"80px"});
		$("#p_gxdwmc").click(function(){ //管辖单位
			getGxdw("p_gxdwmc","p_gxdwbm");
		});
	
	    // 行业类别与企业主分类联动
	    allhylbLinkQyzfl("p_allhylbdm","p_qyzflbm");
	
		daggleDiv(qyjbxx_detailid);
    });
	
	function qyjbxx_loadPage(divpageid){
		qyjbxx_tables=$("#"+divpageid).html();
		$("#"+qyjbxx_detailid).hide(); 	
		qyjbxx_setPageList(1,'#');
	}
	function qyjbxx_setList(pageno,url){	
		$("#"+qyjbxx_divnid).html(qyjbxx_tables);	
		createXML("p_");
		if (url==null || url=="undefined"){
			url=qyjbxx_pageUrl;
		}
		return url;
	}
	function qyjbxx_setPageList(pageno,url){	
	    $("#p_exportFlag").val('0');
		if (qybg_manVerify()){
			url=qyjbxx_setList(pageno,url);
			var mygrid1 = $("#"+qyjbxx_tableid).ingrid({
										url: url,
										ingridPageParams:sXML,
										height: pageHeight-253,
										pageNumber: pageno,
										//colClasses: ['grid-col-style2','grid-col-style2'],
										//colIndex: [0,1],
										onRowSelect: function(tr, selected){
										},
										onTdSelect: function(tr){
											$(tr).find("td").click(function(){
												if (sFlag=="true"){
													var tdnum = $(tr).find("td").index(this);
													if(tdnum!=$(tr).find("td").length-1){
														qy_setQuery($(tr).attr("id"));
													}
												}else{
													sFlag="true";
												}
											});	
										},
										changeHref:function(table){//若表格无数据，则点击导出不起作用
				                                if($(table).find("tr").length==0){
				                                    daochuNum = 0;
				                                }else{
				                                    daochuNum = 1;
				                                }	
			                            },
										colWidths: ["31%","12%","27%","10%","10%","8%"]									
									});				
		}
	}
	function qy_setQuery(id){
		qyjbxx_requestType="detail";
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,qyjbxx_detailWidth);
		setUrl(qyjbxx_detailid,qyjbxx_detailHtml);
		bindDocument(qyjbxx_detailid);
	}
	function qyjbxx_setDetail(){
		setParams("q_");
		jQuery.post(qyjbxx_detailUrl,params,qyjbxx_updatediv,"json");
	}
	function qybg_setBianGeng(id){
		qyjbxx_requestType="biangeng";
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,qyjbxx_modWidth);
		setUrl(qyjbxx_detailid,qyjbxx_modHtml);
	}
	function qyjbxx_biangeng(){ //变更
		if (qyjbxx_modifyVerify()){
			ajaxAddDivCeng();
			dataid=['baryid','bwryid','bldsjksbid','anjcsbid'];
			var child=new Array("BaryxxListData","BwryxxListData","BldsjksbListData","AqjcsbListData","ZzclxxListData");
			setParams("m_",child);
			jQuery.post(qyjbxx_modUrl,params,qyjbxx_bgback,"json"); 
		}
	}
	function qyjbxx_bgback(json){	
		removeAllDivCeng();			
		if  (json.result=="success"){
			jAlert('操作成功','保存信息');
			qyjbxx_setPageList(1);
			$("#qyjbxx_detail").hideAndRemove("show");
			$("#qyjbxx_detail").empty();
		}else{
			jAlert(json.result,'错误信息');
		}
	}
	function qybg_setXiangQing(id){
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,qyjbxx_modWidth);
		setUrl(qyjbxx_detailid,qyjbxx_modUrl1);
		bindDocument(qyjbxx_detailid);
	}
	function bgcx_setWidth(divid,sWidth){
		$("#"+divid).css("width",sWidth+"px");
		$("#"+divid).css("left","0px");
	}
	function qybg_manVerify(){
		if (!checkControlValue("p_qymc","String",1,120,null,0,"企业名称"))
			return false;
		if (!checkControlValue("p_zrs","Integer",-999999,999999,null,0,"从业人员数量"))
			return false;
		if (!checkControlValue("p_gxdwmc","String",1,60,null,0,"管辖单位名称"))
			return false;
		if (!checkControlValue("p_qybm","String",1,20,null,0,"企业编码"))
			return false;
		if (!checkControlValue("p_zjbh","String",1,60,null,0,"营业执照编号"))
			return false;
		return true;
	}
	function formatDate(strDate){ //转换成日期格式
		var rqAndTime = strDate.split(" ");
		var riqi = rqAndTime[0].split("-");
		return new Date(riqi[0],(riqi[1]-1),riqi[2]);
	}
	function dateDiff(datestart,dateend){ //日期相差的天数
		return parseInt(Math.abs(datestart - dateend) / 1000 / 60 / 60 /24);
	}
	function gaojichaxun_qybg(){
		gaojichaxun("44,46",qyjbxx_detailid,"qyjbxx_setPageList");
	}
	$("#p_qymc").click(function(){ //服务场所筛选框
	 		dataid="";
			//getTy_item("p_qymc","p_qybm","","",$("#p_gxdwbm").attr("value"),$('#p_allhylbdm').val());
			getTy_item_super("p_qymc","p_qybm","","kcyzx",$("#p_gxdwbm").attr("value"),"","","1",$('#p_allhylbdm').val());
	});
//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
  	    $("#p_exportFlag").val('1');
  	    setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		alert('无查询结果不能导出！');
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="企业信息";
	//报表请求
	setExcelLong("qyxxexcel",bbmc);	
}

</script>
</head>
<body>
<input type="hidden" id="p_gxdwbm" value="<%=deptCode %>"/>
<input type="hidden" id="p_qybm"/>
<input type="hidden" id="p_exportFlag"/>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">企业变更</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
				    <td width="10%" class="pagedistd">行业类别</td>
			       <td width="23%" class="pagetd"><select type="select" id="p_allhylbdm"></select>
			       </td>
				    <td class="pagedistd">企业分类</td>
					<td class="pagetd"><select name="select" id="p_qyzflbm">
			        <option></option></select></td>
			        <td width="10%" class="pagedistd">管辖单位</td>
					<td width="23%" class="pagetd" colspan="2"><input type="text" class="inputstyle"id="p_gxdwmc" value="" readonly></td>
				</tr>
				<tr>
				    <td width="10%" class="pagedistd">企业名称</td>
				    <td width="23%" class="pagetd" ><input type="text" class="inputstyle"  id="p_qymc" value="" readonly></td>
					<td class="pagedistd">营业执照编号</td>
				    <td class="pagetd"><input type="text" class="inputstyle"  id="p_zjbh" value=""></td>
				    <td width="10%" class="pagedistd">从业人员数量</td>
				    <td class="pagetd" width="6%">
				    <select style="width:60px;" id="p_relation">
				    <option></option>
				    <option value="3">等于</option>
				    <option value="4">大于</option>
				    <option value="5">小于</option>
				    <option value="1">大于等于</option>
				    <option value="2">小于等于</option>
				    </select></td>
				    <td class="pagetd"><input type="text" class="inputstyle3" id="p_zrs" style="width:60px;"></td>
		 		</tr>
		 		<tr>
				    <td colspan="7">
                    <table width="124" border="0" align="right" cellpadding="0" cellspacing="0">
	                    <tr>
	                      <td><a href="#" class="searchbutton" id="querys" onClick="qyjbxx_setPageList(1);">查询</a></td>
	                      <td><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="qyxxexcel">导出</a></td>
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
<div id="qyjbxx_detail" class="page-layout" src="#" style="z-index:2000; top:5px;">
</div>
<div id="QyjbxxData" style="width:100%;">
	<table id="QyjbxxTable" width="100%">
	  <thead>
	    <tr>  
	    	<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>     
	     	<th name="l_qybm" datatype="string" sumflag="0">企业代码</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="l_zrs" datatype="string" sumflag="0">总人数</th>
	     	<th name="l_qyzflmc" datatype="string" sumflag="0">企业分类</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
</body>
</html>