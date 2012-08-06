<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
var publicHylbdm="";
var neibaoyw ="";
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	$(document).ready(function() {
		pageUrl="publicsystem/querylistGadGl_publicwgcyryxx.action";
		divnid="tabledata";
		tableid="table1";
		addUrl="publicsystem/insertGad_publicwgcyryxx.action";
		addHtml="basic/publicsystem/WgcyryxxAdd-gad.jsp";
		addWidth="800";
		delUrl="publicsystem/delete_qyryxx.action";
		delid="d_ryid";
		modHtml="basic/publicsystem/WgcyryxxModify-gad-gzth.jsp";
		modUrl="publicsystem/modify_publicwgcyryxx.action";
		modWidth="800";
		detailHtml="basic/publicsystem/WgcyryxxDetail-gzth.jsp";
		detailid="wgcyryxx_detail";
		detailUrl="publicsystem/query_publicwgcyryxx.action";
		detailWidth="800";
		
		searchLongUrl="publicsystem/queryForExport_publicwgcyryxx.action";  //超长参数后台Action对应url
		excelUrl="publicsystem/exportExcel_publicwgcyryxx.action";
		tabletitle = "";	 
	    geteExcelHead("tabledata");	
		
		//hy_gwselectBox("p_hylbdm","p_gwbh");
		loadPage("tabledata");
		$("#p_xbdm").selectBox({code:"dm_xb"});
		// 行业类别	
		$("#p_allhylbdm").selectqbBoxinhylb({code:"ggmk"});
		daggleDiv("wgcyryxx_detail");
	});
	
	//$('#p_hylbdm').change(function(){
	//	hy_gwselectBox("p_hylbdm","p_gwbh");
	//});
	$("#p_gj").click(function(){
		getDict_item("p_gj","p_gjdm","dm_gj(lgy)");
	});
	$("#p_csmc").click(function(){
		getYlcs_item("p_csmc","");
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
	
	function setPageList(pageno,url){
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({
			ingridPageParams:sXML,
			ingridPageWidth: pageWidth,
			url: url,
			height: pageHeight-255,
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
					var numIn = $(tr).find("td").index(this);
					if(numIn!=$(tr).find("td").length-1){
						setQuery($(tr).attr("id"),detailHtml,detailWidth);
					}
				});
			},
			hideColIndex: [8,11],
			colWidths: ["10%","8%","12%","8","5%","10%","11%","15%","0%","5%","8%","0%","8%"]
		});
	}

	function setDelete(id){
		sFlag="false";
		jConfirm('确定删除吗？', '删除提示', function(r) {
	    	if(r==true){
				var rylbInput = $("#grid").find("tr[id='"+id+"']").find("input[name='cs"+id+"']");
				var rylbValue = rylbInput.val();
				$("#d_csid").val(rylbValue);
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
	function updateWgcyryxx(id){
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
	function getObject(obj){
		var idArray = $(obj).attr("id").split("_");
		var panduan = idArray[0];
		var id=idArray[1];
		if(panduan=="updateWgcyryxx"){
			updateWgcyryxx(id);
		}
		if(panduan=="setDelete"){
			setDelete(id);
		}
		
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
	var bbmc="境外从业人员信息";
	//报表请求
	setExcelLong("jwryexcel",bbmc);	
}
</script>
<input type="hidden" id="d_ryid">
<input type="hidden" id="d_csid">
<input type="hidden" id="p_gjdm"/>
<input type="hidden" id="p_gxdwbm">
<input type="hidden" id="p_qybm">

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
	<tr><td class="queryfont">境外从业人员管理</td></tr>
	<tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td width="8%" class="pagedistd">行业类别</td>
			<td width="17%" class="pagetd"><select type="select" id="p_allhylbdm"></select></td>
	        <td width="8%" class="pagedistd">从业人员编号</td>
	        <td width="17%" class="pagetd"><input type="text" class="inputstyle" id="p_cyrybh"></td>
	        <td width="8%" class="pagedistd">管辖单位</td>
			<td width="17%" class="pagetd"><input type="text" class="inputstyle" id="p_gxdw" readonly></td>
			<td width="8%" class="pagedistd">企业名称</td>
			<td width="17%" class="pagetd"><input type="text" class="inputstyle" id="p_qymc" readonly/></td>
		</tr>
		<tr>
	        <td class="pagedistd">英文姓</td>
	        <td class="pagetd"><input type="text" class="inputstyle" id="p_ywx"/></td>
	        <td class="pagedistd">英文名</td>
	        <td class="pagetd"><input type="text" class="inputstyle" id="p_ywm"/></td>
	        <td class="pagedistd">国籍</td>
	        <td class="pagetd"><input type="text" class="inputstyle" id="p_gj" readonly/></td>
	        <td class="pagedistd">护照号</td>
	        <td class="pagetd"><input type="text" class="inputstyle" id="p_zjhm"></td>
		</tr>
		<tr>
	        <td class="pagedistd">性别</td>
	        <td class="pagetd"><select id="p_xbdm"><option></option></select></td>
	        <!-- <td class="pagedistd">岗位类别</td>
	        <td class="pagetd"><select id="p_gwbh"><option></option></select></td> -->
	        <td colspan="6">
	        <table border="0" align="right" cellpadding="1" cellspacing="0">
				<tr>
					<td width="61px"><a href="#" class="searchbutton" id="querys" onClick="setPageList(1);">查询</a></td>
					<td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="jwryexcel">导出</a></td>
					<td width="61px"><a href="#" class="addbutton" onclick='setAddPage()'>新增</a></td>
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

<div id="wgcyryxx_detail"  class="page-layout" src="#" style="top:20px; left:160px; width:500px;"></div>
	
<div id="icksl_detail"  class="page-layout" src="#" style="display:none;top:20px; left:160px; width:500px;"></div>
	
<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	<thead>
	    <tr>       
	     	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	     	<th name="l_zjhm" datatype="string" sumflag="0">护照号</th>
	     	<th name="l_cyrybh" datatype="string" sumflag="0">人员编号</th>
	     	<th name="l_xb" datatype="string" sumflag="0">性别</th>
	     	<th name="l_shouji" datatype="string" sumflag="0">联系方式</th>
	     	<th name="l_gj" datatype="string" sumflag="0">国籍</th>
	     	<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="">岗位类别</th>
	     	<th name="l_zt" datatype="string" sumflag="0">状态</th>
	     	<th name="l_cyryzt" datatype="string" sumflag="0">人员状态</th>
	     	<th name="">注销标志</th>
			<th name="">操作</th>
	    </tr>
	</thead>
	</table>	
</div>
 