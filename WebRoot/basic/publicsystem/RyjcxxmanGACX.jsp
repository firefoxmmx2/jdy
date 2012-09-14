<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
$(document).ready(function() {
	cf_pageUrl="publicsystem/querylistForCx_ryjcxx.action";
	cf_divnid="rycfxxData";
	cf_tableid="rycfxxTable";
	
	cf_modHtml="basic/publicsystem/RyjcxxModify.jsp";
	cf_modUrl="publicsystem/modify_ryjcxx.action";
	cf_modWidth="550";
	cf_detailHtml="basic/publicsystem/RyjcxxDetailjcGa.jsp";
	cf_detailid="rycfxx_detail";
	cf_detailWidth="600";
	cf_detailUrl="publicsystem/queryForby_ryjcxx.action";
	
	cf_delUrl="publicsystem/delete_ryjcxx.action";
	
	cf_delid="f_rycfid";
	//detailHtml="business/Ylfwzagl/rycfxxDetail.jsp";
	//detailid="rycfxx_detail";
	//detailUrl="ylfwzagl/query_rycfxx.action";
	//detailWidth="500";
	
	daggleDiv("rycfxx_detail");
	$("#hylbzfl").bind('propertychange',function(){hylbOnchangeMan();});
	cf_loadPage(cf_divnid);
	//行业类别	
//	$("#p_hylbdm").selectBoxhylb({code:"flgy"});
	$("#p_cflbbm").selectBox({code:"dm_jclb"});
	$("#p_jcmxlbdm").selectBox({code:"1"});//明细 处罚
	$("#p_cylb").click(function(){
	        getrylbTree("p_cylb","p_cylbdm","dm_cyrylb");
	 });
	$("#p_ryjcrqf").attr("readonly","true");
	$("#p_ryjcrqf").datepicker();
	$("#p_ryjcrqt").attr("readonly","true");
	$("#p_ryjcrqt").datepicker();
	hylbOnchangeMan();
	
}); 
function cf_loadPage(divpageid){
	cf_tables=$("#"+divpageid).html();
	$("#rycfxx_detail").hide(); 	
	//查轨迹信息 根据证件号码去查询下
		cf_setPageList(1,'#');//默认去查询下
}	

$("#p_gxdwmc").click(function(){  //治安管理机构
			getGxdwTree("p_gxdwmc","p_gxdwdm",'1');
		});
		
		
//服务场所筛选框
 $("#p_qymc").click(function(){
 	dataid=$("#p_hylbdm").val();
	getTy_item("p_qymc","p_qybm",'','','','','','',$('#p_allhylbdm').val());
});
function cf_setList(pageno,url){
	$("#rycfxxData").html(cf_tables);	
	createXML("p_");
	if (url==null || url=="undefined"){
		url=cf_pageUrl;
	}
	return url;
}	

function cf_setPageList(pageno,url){	
	if (manVerify()){
		url=cf_setList(pageno,url);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var mygrid1 = $("#"+cf_tableid).ingrid({ 
										url: url,
										ingridPageWidth: pageWidth,
										ingridPageParams:sXML,
										height: pageHeight - 285,
										pageNumber: pageno,
										onRowSelect: null,
										noSortColIndex:[10],
										ingridComplete:function(){
											$('#'+cf_divnid+' tbody tr').each(function(){
												var $tr = $(this);
												$tr.find('td:last a[title=详情]').each(function(){
													var $a = $(this);
													$a.get(0).onclick=null;
													$a.click(function(){
														setQueryRyjcxxmanGACX($a.parents('tr').eq(0).attr("id"));
													});
												});
											});
										},
										colWidths: ["6%","15%","15%","5%","8%","15%","10%","5%","6%","9%","6%"]									
									});		
		setTableText();		
		}
}	

function manVerify(){
	return true;
}
	

function setDetail_rycf(){
	setParams("q_");
	jQuery.post(cf_detailUrl,params,updatediv,"json");
}

function setQueryRyjcxxmanGACX(id){
	$("#"+cf_detailid).empty();
	dataid=id;
	//$("#"+cf_detailid).css("width",cf_detailWidth);
	$("#"+cf_detailid).css("left",300);
	setUrl(cf_detailid,cf_detailHtml);
}

function setUpdate_rycf(id){
	sFlag="false";
	dataid = id;
	$("#"+cf_detailid).css("width",cf_modWidth);
	$("#"+cf_detailid).css("left",100);
	setUrl(cf_detailid,cf_modHtml);
}

function setDelete_rycf(id){
	sFlag="false";
	jConfirm('确定删除吗？', '删除提示', function(r) {
    	if(r==true){
			$("#"+cf_delid).attr("value",id);
			setParams("f_");
	        jQuery.post(cf_delUrl,params,deleteback_rycf,"json");
		}else{
		   return false;
		}
	});
}

function deleteback_rycf(json){
	if  (json.result=="success"){
		jAlert(delMessage,'提示信息');
		var pageno=$("#pageNo").attr("value");
		if ($("#startno").html()==$("#endno").html()){
			if ($("#pageNo").attr("value")>1){
				pageno=""+(parseInt(pageno)-1);
			}
		}
		cf_setPageList(pageno);
	}else{
		jAlert(json.result,'错误信息');
	}	
}

$("#p_allhylbdm").selectBoxinhylb(); 
		$("#hylbzfl").click(function(){ 
			var hylbbz=$("#p_allhylbdm").val();
			getHylbzflTree("hylbzfl","p_hylbdm","p_hylb","p_qyzflbm","p_qyzflmc",hylbbz);
	});
	
	
function hylbOnchangeMan(){
		var hylb=$("#p_hylbdm").val();
		var csorqymc = "企业名称";
		if(hylb=='J'||hylb=='K'){
			csorqymc = "场所名称";
		}
		$('#qymc_man').text(csorqymc);
		setTableText();
	}
$("#p_cflbbm").change(function(){
			if($("#p_cflbbm").val()==0){
				$("#p_jcmxlbdm").selectBox({code:"dm_ryjllb"});//明细 奖励
			}
			if($("#p_cflbbm").val()==1){
				$("#p_jcmxlbdm").selectBox({code:"dm_rycflb"});//明细 处罚
			}
			if($("#p_cflbbm").val()==''){
				$("#p_jcmxlbdm").selectBox({code:"1"});//明细 处罚
			}
		});
	function setTableText(){
		var hylb=$("#p_hylbdm").val();
		var csorqymc = "企业名称";
		var csorqyzfl = "企业分类";
		if(hylb=='J'||hylb=='K'){
			csorqymc = "场所名称";
			csorqyzfl = "场所分类";
		}
		$('#rycfxxData').find('thead').find('th[@name=l_qymc]').find('DIV').html(csorqymc);
		$('#rycfxxData').find('thead').find('th[@name=l_qyzflmc]').find('DIV').html(csorqyzfl);
	}
</script>
<html>
	<body>
		<input type="hidden"  id="p_qyzflbm" >
		<input type="hidden" id="p_hylbdm" value="">  
		<input type="hidden" id="p_hylb" value="">  
		<input type="hidden" id="p_qyzflmc" value=""> 
		<div style="display:none;"><select id="p_allhylbdm"></select></div>
		<input type="hidden" id="f_rycfid" value="">
		<input type="hidden" id="p_ryid">
		<input type="hidden" id="p_qyid">
		<input type="hidden" id="p_qybm">
		<input type="hidden" id="p_gxdwdm" value=""/>
		<table width="100%" cellpadding="0" cellspacing="0"
			class="tableborder">
			<tr>
				<td colspan="2" class="queryfont">
					人员奖惩查询
				</td>
			</tr>
			<tr>
				<td class="tdbg">
					<table width="99%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="10%" class="pagedistd">
								行业分类
							</td>
							<td width="27%" class="pagetd">
<!--								<select name="cylb" id="p_hylbdm" onchange="hylbOnchangeMan();"></select>-->
								<input type="text" id="hylbzfl" class="inputstyle" value="" readonly="readonly">
							</td>
							<td width="10%" class="pagedistd" id="qymc_man">
								场所名称
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" readonly="readonly"
									id="p_qymc" value="">
							</td>
							 <td class="pagedistd" width="10%">从业人员类别</td>
							  <td class="pagetd" width="23%"><input type="hidden" id="p_cylbdm"/>
	  				<input type="text" id="p_cylb" class="inputstyle" readonly /></td>
					</tr>
					<tr>
							<td width="10%" class="pagedistd">
								从业人员编号
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_cyrybh" value="">
							</td>
							<td width="10%" class="pagedistd">
								姓名
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_xm" value="">
							</td>
							<td width="10%" class="pagedistd">
								证件号码
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle" id="p_zjhm" value="">
							</td>
					</tr>
						<tr>

							
							<td width="10%" class="pagedistd">
								奖惩日期
							</td>
							<td width="23%" class="pagetd">
								<input type="text" class="inputstyle3" style="width: 60px;" id="p_ryjcrqf" value="">
								至
								<input type="text" class="inputstyle3" style="width: 60px;" id="p_ryjcrqt" value="">
							</td>
							<td class="distd" width="10%">
								奖惩类别
								</td>
							<td class="detailtd" width="23%">
								<select type="select" id="p_cflbbm">
									<option></option>
								</select>
							</td>
							<td class="distd" width="10%">
								奖惩处理类型
								</td>
							<td class="detailtd" width="23%">
								<select type="select" id="p_jcmxlbdm">
									<option></option>
								</select>
							</td>
						</tr>
						<tr>
						 <td  class="pagedistd">管辖单位</td>
						<td  class="pagetd"><input type="text" class="inputstyle"id="p_gxdwmc" value="" readonly="readonly"></td>
							<td width="100%" colspan="4" class="pagetd">
								<table width="60" border="0" align="right" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="28px">
											<a href="#" class="searchbutton" id="querys"
												onClick="cf_setPageList(1);">查询</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="3"></td>
			</tr>
		</table>
		<div id="rycfxx_detail" class="page-layout" src="#"
			style="top: 80px; left: 200px; width: 500px;">
		</div>

		<div id="rycfxxData" style="width:100%;">
			<table id="rycfxxTable" width="100%">
				<thead>
					<tr>
						<th name="l_xm">
							姓名
						</th>
						<th name="l_cyrybh">
							从业人员编号
						</th>
						<th name="l_zjhm">
							证件号码
						</th>
						<th name="l_xb">
							性别
						</th>
						<th name="l_hylb">
							从业人员类别
						</th>
						<th name="l_qymc">
							场所名称
						</th>
						<th name="l_qyzflmc">
							场所分类
						</th>
						<th name="l_cflb">
							奖惩类别
						</th>
						<th name="l_jcmxlb">
							奖惩处理类型
						</th>
						<th name="l_ryjcrq">
							奖惩日期
						</th>
						<th name="">
							操作
						</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>
