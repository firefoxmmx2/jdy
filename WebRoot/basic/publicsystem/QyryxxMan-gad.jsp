<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var otherTableHead="";
var publicHylbdm="";
var neibaoyw ="";
	$(document).ready(function() {
		pageUrl="publicsystem/querylistGadGl_qyryxx.action";
		divnid="tabledata";
		tableid="table1";
		addUrl="publicsystem/insertGad_qyryxx.action";
		addHtml="basic/publicsystem/QyryxxAdd-gad.jsp";
		addWidth="800";
		delUrl="publicsystem/delete_qyryxx.action";
		delid="d_ryid";
		modHtml="basic/publicsystem/QyryxxModify-gad-gzth.jsp";
		modUrl="publicsystem/modify_qyryxx.action";
		modWidth="800";
		detailHtml="basic/publicsystem/QyryxxDetail-gzth.jsp";
		detailid="cyryxx_detail";
		detailUrl="publicsystem/query_qyryxx.action";
		detailWidth="800";
		
		searchLongUrl="publicsystem/queryForExport_qyryxx.action";  //超长参数后台Action对应url
		excelUrl="publicsystem/exportExcel_qyryxx.action";
		tabletitle = "";	 
	    geteExcelHead("tabledata");	
	    
		loadPage("tabledata");
	  	$("#p_xbdm").selectBox({code:"dm_xb"});
	  	
		//hy_gwselectBox("p_hylbdm","p_gwbh");
		// 行业类别	
		$("#p_allhylbdm").selectqbBoxinhylb({code:"ggmk"});
		
		daggleDiv("cyryxx_detail");
	});
	
	$("#p_qymc").click(function(){ //服务场所筛选框
	 		dataid="";
			getTy_item("p_qymc","p_qybm","","",$("#p_gxdwbm").attr("value"),$('#p_allhylbdm').val());
	});
	$("#p_gxdw").click(function(){ //管辖单位所筛选框
		$("#p_qybm").attr("value","");
		$("#p_qymc").attr("value","");
		getGxdwTree("p_gxdw","p_gxdwbm",'1');
	});
	//$('#p_hylbdm').change(function(){
	//	hy_gwselectBox("p_hylbdm","p_gwbh");
	//});
	
	function setPageList(pageno,url){
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({
			ingridPageParams:sXML, 
			height: pageHeight-255,
			url: url,	
			pageNumber: pageno,
			onRowSelect:null,
			changeHref:function(table){//若表格无数据，则点击导出不起作用
				if($(table).find("tr").length==0){
				    daochuNum = 0;
				}else{
				    daochuNum = 1;
				    neibaoyw = $("#p_hylbdm").attr("value");
				}	
				var trObj;
			    table.find("tr").each(function() {
		            trObj = $(this);
		            if ((trObj.find("td:nth(9)").text())=='1') {										         
			            trObj.find("td:last").find("a[title='修改']").remove();
		            }
		        });
			},
			onTdSelect: function(tr){
						$(tr).find("td").click(function(){
							var numIndex = $(this).attr("_colid");
							if(numIndex!=$(tr).find("td").length-1){
								setQuery($(tr).attr("id"),detailHtml,detailWidth); 	
							}
						});	
			},
			hideColIndex:[6,11],
			colWidths: ["7%","11%","11%","5%","8","13%","0%","12%","9%","7%","8%","0%","8%"]
		});			
	}	

	function setDelete_Qyry(id){
		$("#icksl_detail").hide();
		sFlag="false";
		jConfirm('确定删除吗？', '删除提示', function(r) {
	    	if(r==true){
				var rylbInput = $("#grid").find("tr[id='"+id+"']").find("input[name='cs"+id+"']");
				var rylbValue = rylbInput.val();
				$("#d_qyid").val(rylbValue);
				$("#"+delid).attr("value",id);
				setParams("d_");
				if(neibaoyw!="N"){
					jQuery.post(delUrl,params,deleteback,"json");
				}else{
					jQuery.post("icksystem/queryjl_icksl.action",params,resultback,"json");
				}
			}else{
			   return false;
			}
		});
	}
	
	//判断人员的ick是否受理，受理后不能删除
	function resultback(json){ 
	 	if (json.result=="success"){
	        jAlert("该人员已经受理，不能删除！","提示信息");
	     	return false;
	      }else{
	        jQuery.post(delUrl,params,deleteback,"json");
	      }
		
	}
	function getObject(obj){
		var idArray = $(obj).attr("id").split("_");
		var panduan = idArray[0];
		var id=idArray[2];
		if(panduan=="setModify"){
			setModify_Qyry(id);
		}
		if(panduan=="setDelete"){
			setDelete_Qyry(id);
		}
		
	}
	function setModify_Qyry(id){
		$("#icksl_detail").hide();
		dataid=id;
		sFlag="false";
		setWidth(detailid,modWidth);
		setUrl(detailid,modHtml);
		bindDocument(detailid);
	}
	
	function selectHylbPage(url){
	    setWidth(detailid,addWidth);
	    setUrl(detailid,url);
	    bindDocument(detailid);
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
	var bbmc="国内从业人员信息";
	//报表请求
	setExcelLong("qyryexcel",bbmc);	
}
</script>

<body>
<input type="hidden" id="d_ryid">
<input type="hidden" id="d_qyid">
<input type="hidden" id="p_gxdwbm">
<input type="hidden" id="p_qybm">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
	<tr><td class="queryfont">国内从业人员管理</td></tr>
	<tr><td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td width="10%" class="pagedistd">行业类别</td>
			<td width="23%" class="pagetd"><select type="select" id="p_allhylbdm"></select></td>
			<td width="10%" class="pagedistd">管辖单位</td>
			<td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_gxdw" readonly></td>
			<td width="10%" class="pagedistd">企业名称</td>
			<td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_qymc" readonly/></td>
		</tr>
		<tr>
			<td width="10%" class="pagedistd">人员编号</td>
			<td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_cyrybh"/></td>
			<td class="pagedistd">姓名</td>
			<td class="pagetd"><input type="text" class="inputstyle" id="p_xm"/></td>
			<td class="pagedistd">证件号码</td>
			<td class="pagetd"><input type="text" class="inputstyle" id="p_zjhm"/></td>
		  </tr>
		<tr>
			<td class="pagedistd">性别</td>
			<td class="pagetd"><select name="select" id="p_xbdm"><option></option></select></td>
			<!-- <td class="pagedistd">岗位类别</td>
			<td class="pagetd"><select id="p_gwbh"><option></option></select></td> -->
			<td width="10%" class="pagedistd">&nbsp;</td>
		    <td width="23%" class="pagetd">&nbsp;</td>
		    <td class="pagetd" colspan="6">
			    <table border="0" align="right" cellpadding="1" cellspacing="0">
				<tr><td width="61px"><a href="#" class="searchbutton" id="querys" onClick="setPageList(1);">查询</a></td>
				<td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="qyryexcel">导出</a></td>
				<td width="61px"><a href="#" class="addbutton" onclick='setAddPage();'>新增</a></td></tr>
				</table>
			</td>
		</tr>
    	</table>
    </td></tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="3"></td></tr>
</table>

<div id="cyryxx_detail" class="page-layout" src="#" style="top:20px; left:160px; width:500px;"></div>

<div id="icksl_detail" class="page-layout" src="#" style="display:none;top:20px; left:160px; width:500px;"></div>	

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	<thead>
	    <tr>
	     	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	     	<th name="l_zjhm" datatype="string" sumflag="0">证件号码</th>
	     	<th name="l_cyrybh" datatype="string" sumflag="0">人员编号</th>
	     	<th name="l_xb" datatype="string" sumflag="0">性别</th>
	     	<th name="l_shouji" datatype="string" sumflag="0">联系方式</th>
	     	<th name="l_hjdxzqh" datatype="string" sumflag="0">行政区划</th>
	     	<th name="">岗位类别</th>
	     	<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="l_zt" datatype="string" sumflag="0">状态</th>
	     	<th name="l_cyryzt" datatype="string" sumflag="0">人员状态</th>
	     	<th name="">注销标志</th>
			<th name="">操作</th>
	    </tr>
	</thead>
	</table>
</div>
</body>
