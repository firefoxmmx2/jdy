<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/javascript/dictDropDown.js"></script>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
$(document).ready(function() {
	pageUrl="publicsystem/querylistGadzx_publicwgcyryxx.action";
	divnid="tabledata";
	tableid="table1";
	addUrl="ylfwzagl/insert_wgcyryxx.action";
	addHtml="business/Ylfwzagl/WgcyryxxAdd.jsp";
	addWidth="800";
	delUrl="ylfwzagl/delete_wgcyryxx.action";
	delid="d_ryid";
	modHtml="business/Ylfwzagl/WgcyryxxModify.jsp";
	modUrl="publicsystem/modifyZx_publicwgcyryxx.action";
	modWidth="500";
	detailHtml="basic/publicsystem/WgcyryxxDetail-gzth.jsp";
	detailid="wgcyryxx_detail";
	detailUrl="publicsystem/query_publicwgcyryxx.action";
	detailWidth="800";
	
	searchLongUrl="publicsystem/queryzxForExport_publicwgcyryxx.action";  //超长参数后台Action对应url
	excelUrl="publicsystem/exportExcel_publicwgcyryxx.action";
	tabletitle = "";	 
    geteExcelHead("tabledata");	
	
	loadPage("tabledata");
		$("#p_csrq").attr("readonly","true");
		$("#p_csrq").datepicker();
			
  	$("#p_xbdm").selectBox({code:"dm_xb"});
 	//$("#p_gwbh").selectBox({code:"dm_cyrylb"});
  	$("#p_zxbz").selectBox({code:"dm_cszt"});
 	//hy_gwselectBox("p_hylbdm","p_gwbh");
    //$('#p_hylbdm').change(function(){
 	//	hy_gwselectBox("p_hylbdm","p_gwbh");
 	//});
 	// 行业类别	
	$("#p_allhylbdm").selectqbBoxinhylb({code:"ggmk"});
	daggleDiv("wgcyryxx_detail");	
}); 
	
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var mygrid1 = $("#"+tableid).ingrid({ 
										ingridPageParams:sXML,
										ingridPageWidth: pageWidth,
										ingridExtraParams:{'tag':'WgcyyrycxMan-gn'},
										url: url,	
										height: pageHeight-314,
										changeHref : function(table){
												if($(table).find("tr").length==0){
												    daochuNum = 0;
												}else{
												    daochuNum = 1;
												}
											},
										pageNumber: pageno,
										hideColIndex: [7],
										noSortColIndex:[10],
										colWidths: ["10%","12%","12%","5%","5%","13%","14%","0%","7%","10%","10%"]										
									});				
		}
}	
	function manVerify(){
		return true;
	}
		
//国籍筛选框
$("#p_gj").click(function(){
	getDict_item("p_gj","p_gjdm","dm_gj(lgy)");
});

//服务场所筛选框
 $("#p_qymc").click(function(){
 	dataid="";
	getTy_item("p_qymc","p_qybm","","","",$('#p_allhylbdm').val());
});
		
//管辖单位所筛选框
 $("#p_gxdw").click(function(){
	getGxdwTree("p_gxdw","p_gxdwbm",'1');
});
	
//从业人员详情
function setWgcyryXq(id){
	dataid=id;
	setWidth(detailid,detailWidth);
	setUrl(detailid,detailHtml);;
	bindDocument(detailid); 
}

//从业人员注销
function setWgcyryZx(id){
	dataid=id;
	setWidth(detailid,modWidth);
	setUrl(detailid,"basic/publicsystem/wgcyryzx_gn.jsp");;
	bindDocument(detailid); 
}

//从业人员注销
function setWgcyryZxhf(id){
	sFlag="false";
	jConfirm('确定注销恢复吗？', '注销恢复提示', function(r) {
    	if(r==true){
			$("#"+delid).attr("value",id);
			setParams("d_");
	        jQuery.post("publicsystem/modifyZxhf_publicwgcyryxx.action",params,zxhfback,"json");
		}else{
		   return false;
		}
	});
}

function zxhfback(json){
	if  (json.result=="success"){
		jAlert("注销恢复成功",'提示信息');
		var pageno=$("#pageNo").attr("value");
		if ($("#startno").html()==$("#endno").html()){
			if ($("#pageNo").attr("value")>1){
				pageno=""+(parseInt(pageno)-1);
			}
		}
		setPageList(pageno);
	}else{
		jAlert(json.result,'错误信息');
	}	
}	

function getObject(obj){ //点击链接方法(判断是否注销)
	sFlag="false";
	//alert($(obj).attr("id")+"="+$(obj).text());
	//ylcsjbxx_dataid=$(obj).attr("id").split("_")[1];
	if($(obj).text()=="注销"){
		setWgcyryZx($(obj).attr("id").split("_")[1]);
	}else{
		setWgcyryZxhf($(obj).attr("id").split("_")[1]);
	}
}	
//高级查询
function getGaoJiChaXun(){
	//sjbid:数据表id;loadDiv:加载高级查询页面的div
	// gaojichaxun(sjbid,loadDiv);
	gaojichaxun("61,48,44",detailid);
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
	var bbmc="境外从业人员注销信息";
	//报表请求
	setExcelLong("qyryexcel",bbmc);	
}
</script>

<body>
	
	<input type="hidden" id="d_ryid" value="">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">境外人员注销查询</td> 
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="10%" class="pagedistd">英文姓</td>
			      <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_ywx" /></td>
			    <td width="10%" class="pagedistd">行业类别</td>
			      <td width="27%" class="pagetd"><select name="cylb" id="p_allhylbdm">
				    </select></td>
			      <!-- <td width="10%" class="pagedistd">岗位类别</td>
				  <td width="25%" class="pagetd"><select name="cylb" id="p_gwbh">
				    <option></option></select></td> -->
				    <td width="10%" class="pagedistd">注销状态</td>
		          <td width="23%" class="pagetd"><select id="p_zxbz" ><option></option></select></td>
		  </tr>
				<tr>
					<td width="10%" class="pagedistd">英文名</td>
				  <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_ywm" /></td>
				  <td width="10%" class="pagedistd">证件号码</td>
				  <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_zjhm" /></td>
				  <td width="10%" class="pagedistd">企业名称</td>
				  <td width="23%" class="pagetd"><input type="hidden" id="p_qybm" /><input type="text" class="inputstyle" id="p_qymc" readonly /></td>
		  </tr>
				<tr>
					<td width="10%" class="pagedistd">性别</td>
	              <td width="23%" class="pagetd"><select id="p_xbdm"><option></option>
                  </select></td>
	              <td width="10%" class="pagedistd">出生日期</td>
				  <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_csrq" /></td>
				  <td width="10%" class="pagedistd">从业人员编号</td>
				  <td width="23%" class="pagetd">	<input type="text" class="inputstyle" id="p_cyrybh" />	  </td>
		  </tr>
				<tr>
				  <td class="pagedistd">国籍</td>
		          <td width="23%" class="pagetd"><input type="hidden" id="p_gjdm" /><input type="text" class="inputstyle" id="p_gj" readonly /></td>
		          <td width="10%" class="pagedistd">管辖单位</td>
		          <td width="23%" class="pagetd"><input type="text" id="p_gxdw" class="inputstyle" readonly /><input type="hidden" id="p_gxdwbm" /></td>
		          <td width="10%" class="pagedistd">&nbsp;</td>
		          <td width="23%" class="pagetd">&nbsp;</td>
		  </tr>
          				<tr>
				  <td colspan="6" class="pagedistd"><table width="120" border="0" align="right" cellpadding="2" cellspacing="0">
                    <tr>
                      <td width="52" height="28px" ></td>
                      <td width="68" ><a href="#" class="searchbutton"id="querys2" onClick="setPageList(1);">查询</a></td>
                      <td width="12" height="28px" ></td>
                      <td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="qyryexcel">导出</a></td>
                    </tr>
                  </table></td>
          </tr>
    	</table>
    </td>
  </tr>
</table>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="3"></td>
		</tr>
	</table>
<div id="wgcyryxx_detail"  class="page-layout" src="#"
		style="top:20px;">
</div>	

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	     	<th name="l_zjhm" datatype="string" sumflag="0">证件号码</th>
	     	<th name="l_cyrybh" datatype="string" sumflag="0">从业人员编号</th>
	     	<th name="l_xb" datatype="string" sumflag="0">性别</th>
	     	<th name="l_gj" datatype="string" sumflag="0">国籍</th>
	     	<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="">岗位</th>
	     	<th name="l_zt" datatype="string" sumflag="0">状态</th>
	     	<th name="l_cyryzt" datatype="string" sumflag="0">从业人员状态</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	  
	</table>	
</div> 
</body>