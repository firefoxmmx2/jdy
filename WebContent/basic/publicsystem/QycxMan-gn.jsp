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
	var qyjbxx_pageUrl="publicsystem/queryQyChaxunList_qyjbxx.action";
	var qyjbxx_detailid="qyjbxx_detail";
	var qyjbxx_detailHtml="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	var qyjbxx_detailUrl="publicsystem/query_qyjbxx.action";
	var qyjbxx_detailWidth="1000";
	var qyjbxx_qycyryHtml="basic/publicsystem/Cscx-cyryxxMan-gn.jsp";
	var qyjbxx_qycyryWidth="800";
	var qycx_timeFlag = true;
	$(document).ready(function() {
	
	    searchLongUrl="publicsystem/queryQyChaxunList_qyjbxx.action";  //超长参数后台Action对应url
		excelUrl="publicsystem/exportExcel_qyjbxx.action";
		tabletitle = "";	 
	    geteExcelHead("QyjbxxData");	
		qyjbxx_loadPage(qyjbxx_divnid);
	    $("#y_fl").hide();
	  $("#p_sgscxfjjs").hide();
		//$("#p_zabdm").selectBox({code:"dm_cszajb"});// 治安级别
		$("#p_yyztdm").selectBox({code:"dm_yyzt(ylcs)"});// 营业状态
		$("#p_zjztdm").selectBox({code:"dm_yyzt"});// 装机状态
		$("#p_relation").selectBox({state:"temp",width:"80px"});
		$("#p_gxdwmc").click(function(){ //管辖单位
			getGxdw("p_gxdwmc","p_gxdwbm");
		});
		
	    // 行业类别与企业主分类联动
	    allhylbLinkQyzfl("p_allhylbdm","p_qyzflbm");
	    changeFjjsfl();
		daggleDiv("qyjbxx_detail");
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
	    var hideColNum=[6,8];
	    if($("#p_allhylbdm").val()=="'E04'"){
	    	hideColNum=[8];
	    }
	  
		if (manVerify()){
			url=qyjbxx_setList(pageno,url);
			var mygrid1 = $("#"+qyjbxx_tableid).ingrid({
										url: url,
										ingridPageParams:sXML,
										height: pageHeight-275,
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
														qyhc_setQuery($(tr).attr("id"));
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
										hideColIndex:hideColNum,
										colWidths: ["19%","10%","15%","5%","14%","6%","7%","7%","0%","20%"]									
									});				
		}
	}
	function qyhc_setQuery(id){
		if(qycx_timeFlag){
			qycx_timeFlag = false;
			qyjbxx_requestType="detail";
			qyjbxx_dataid=id;
			setWidth(qyjbxx_detailid,qyjbxx_detailWidth);
			setUrl(qyjbxx_detailid,qyjbxx_detailHtml);
			bindDocument(qyjbxx_detailid);
			setTimeout(function(){qycx_timeFlag = true;},1000);
		}
	}
	function getObject(obj){ //修改
	if(qycx_timeFlag){
			qycx_timeFlag = false;
			if($(obj).text()=='营业状态'){
				qyjbxx_requestType="modify";
				qyjbxx_dataid=$(obj).attr("id").split("_")[1];
				setWidth(qyjbxx_detailid,'450');
				setUrl(qyjbxx_detailid,'basic/publicsystem/Yyztbg.jsp');
			}
			if($(obj).text()=='从业人员'){
				qyjbxx_requestType="modify";
				qyjbxx_dataid=$(obj).attr("id").split("_")[1];
				setWidth(qyjbxx_detailid,qyjbxx_qycyryWidth);
				setUrl(qyjbxx_detailid,qyjbxx_qycyryHtml);
			}
			if($(obj).text()=='装机状态'){
				qyjbxx_requestType="modify";
				qyjbxx_dataid=$(obj).attr("id").split("_")[1];
				setWidth(qyjbxx_detailid,'450');
				setUrl(qyjbxx_detailid,'basic/publicsystem/Zjztbg.jsp');
			}
			setTimeout(function(){qycx_timeFlag = true;},1000);
		}
	}

	function qyjbxx_setDetail(){
		setParams("q_");
		jQuery.post(qyjbxx_detailUrl,params,qyjbxx_updatediv,"json");
	}
	function qyhc_setCongye(id){ //从业人员
		if(qycx_timeFlag){
			qycx_timeFlag = false;
			qyjbxx_dataid=id;
			setWidth(qyjbxx_detailid,qyjbxx_qycyryWidth);
			setUrl(qyjbxx_detailid,qyjbxx_qycyryHtml);
			bindDocument(qyjbxx_detailid);
			setTimeout(function(){qycx_timeFlag = true;},800);
		}
	}
	function qyjbxx_zjztbg(){ //装机状态变更
		if (qyjbxx_zjztmodifyVerify()){
			setParams("m_");
			jQuery.post("publicsystem/ztbg_qyjbxx.action",params,qyjbxx_zjztbgback,"json"); 
		}
	}
	function qyjbxx_zjztbgback(json){
		if  (json.result=="success"){
			jAlert('操作成功','保存信息');
			qyjbxx_setPageList($("#pageNo").attr("value"));
			$("#"+qyjbxx_detailid).hideAndRemove("slow"); 
		}else{
			jAlert(json.result,'错误信息');
		}
	}
	function qyjbxx_yyztbg(){ //营业状态变更
		if (qyjbxx_yyztmodifyVerify()){
			setParams("m_");
			jQuery.post("publicsystem/ztbg_qyjbxx.action",params,qyjbxx_yyztbgback,"json"); 
		}
	}
	function qyjbxx_yyztbgback(json){
		if  (json.result=="success"){
			jAlert('操作成功','保存信息');
			qyjbxx_setPageList($("#pageNo").attr("value"));
			$("#"+qyjbxx_detailid).hideAndRemove("slow"); 
		}else{
			jAlert(json.result,'错误信息');
		}
	}
	function qycx_setWidth(divid,sWidth){
		$("#"+divid).css("width",sWidth+"px");
		$("#"+divid).css("left","0px");
	}
	function manVerify(){
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
	function gaojichaxun_qycx(){
		gaojichaxun("44,46",qyjbxx_detailid,"qyjbxx_setPageList");
	}
	$("#p_qymc").click(function(){ //服务场所筛选框
			dataid="";
			//getTy_item("p_qymc","p_qybm","","",$("#p_gxdwbm").attr("value"),$('#p_allhylbdm').val());
			getTy_item_super("p_qymc","p_qybm","","kcyzx",$("#p_gxdwbm").attr("value"),"1","","",$('#p_allhylbdm').val());
	});
	function hideNameCodeDiv(qz){
		$("#"+qz+"_code").hide();
		$("#"+qz+"_name").hide();
	}
	function showNameCodeDiv(qz){
		$("#"+qz+"_code").show();
		$("#"+qz+"_name").show();
	}
	function changeFjjsfl(){
		if($('#p_hylbdm').val()=='E04'){
			showNameCodeDiv("fjjsfl");
			//$("#p_sgscxfjjs").selectBox({state:"1"});
		}else{
			hideNameCodeDiv("fjjsfl");
			//$("#p_sgscxfjjs").selectBox({state:"1"});
		}
		if($('#p_hylbdm').val()=='C'){
			showNameCodeDiv("wxywfl");
			$("#p_wxywfldm").selectBox({code:"dm_wxywfl"});
		}else{
			hideNameCodeDiv("wxywfl");
			$("#p_wxywfldm").selectBox({state:"1"});
		}
	} 
	$('#p_hylbdm').change(function(){
		changeFjjsfl();
	});
	
	$('#p_allhylbdm').change(function(){
		var hylbdmpd=  $("#p_allhylbdm").val();
		  if(hylbdmpd=="'E04'"){
			  $("#y_fl").show();
				 $("#p_sgscxfjjs").show();
		  }else{
			  $("#y_fl").hide();
				 $("#p_sgscxfjjs").hide();
				 $("#p_sgscxfjjs").val("");
		  }
		
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
    <td class="queryfont">企业查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
				    <td width="10%" class="pagedistd">行业类别</td>
			       <td width="23%" class="pagetd"><select type="select" id="p_allhylbdm"></select>
			       </td>
					<td width="10%" class="pagedistd">企业分类</td>
					<td width="23%" class="pagetd"><select name="select" id="p_qyzflbm">
			        <option></option></select></td>
			        <td width="10%" class="pagedistd">管辖单位</td>
					<td width="23%" class="pagetd"><input type="text" id="p_gxdwmc" class="inputstyle" value="" readonly></td>
				</tr>
				<tr>
				    <td width="10%" class="pagedistd">企业名称</td>
				    <td width="23%" class="pagetd"><input type="text" class="inputstyle"  id="p_qymc" value="" readonly></td>
					<td width="10%" class="pagedistd">营业执照编号</td>
				    <td width="23%" class="pagetd"><input type="text" class="inputstyle"  id="p_zjbh" value=""></td>
				    <td width="10%" class="pagedistd">营业状态</td>
				    <td width="23%" class="pagetd"><select id="p_yyztdm">
				    <option></option></select></td>
		 		 </tr>
				<tr>
				   <td width="10%" class="pagedistd">装机状态</td>
					<td width="23%" class="pagetd"><select id="p_zjztdm">
					<option></option></select></td>
					<td width="10%" class="pagedistd">从业人员数量</td>
				    <td class="pagetd" width="6%">
				    <table border="0"  cellspacing="0" cellpadding="0">
				    <tr>
				    <td>
				    <select style="width:60px;" id="p_relation">
				    <option></option>
				    <option value="3">等于</option>
				    <option value="4">大于</option>
				    <option value="5">小于</option>
				    <option value="1">大于等于</option>
				    <option value="2">小于等于</option>
				    </select>
				    </td>
				    <td>
				    &nbsp;<input type="text" class="inputstyle3"  id="p_zrs"  style="width:60px;" >
				    </td>
				    </tr>
				    </table>
				    </td>
 
						<td width="10%" class="pagedistd" id="y_fl" >收购业务分类</td>
						<td width="100px"  id="y_flxx"   ><select id="p_sgscxfjjs" width="90px"   >
								<option></option>
								<option value="1">生产性</option>
								<option value="0">非生产性</option>
						</select>
						</td>
					 

						<!-- <td id="fjjszajb_name" class="pagedistd">治安级别</td>
				    <td id="fjjszajb_code" class="pagetd"><select id="p_zabdm">
		            <option></option></select></td> -->
		              <td width="10%" class="pagedistd">
					    <div id='fjjsfl_name'>收购业务分类</div>
					    <div id='wxywfl_name'>维修业务分类</div>
				    </td>
				    
				    <td width="23%" class="pagetd">
					    <div id='fjjsfl_code'><select id="p_sgscxfjjsby"><option></option><option value='1'>生产性</option><option value='0'>非生产性</option></select></div>
					    <div id='wxywfl_code'><select id="p_wxywfldm"><option></option></select></div>
				    </td>
				</tr>
				<tr>
				   <td width="10%" class="pagedistd"></td>
				    <td width="23%" class="pagetd"></td>
				    <td width="10%" class="pagedistd"></td>
				    <td width="23%" class="pagetd"></td>
				<td colspan="3">
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
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>
<div id="qyjbxx_detail" class="page-layout" src="#" style="z-index:2000;  top:10px; left:0px;">
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
	     	<th name="l_yyztmc" datatype="string" sumflag="0">营业状态</th>
	     	<th name="l_sgscxfjjs" datatype="string" sumflag="0">收购业务类别</th>
	     	<th name="l_zjztmc" datatype="string" sumflag="0">装机状态</th>
	     	<th name="">治安级别</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>
