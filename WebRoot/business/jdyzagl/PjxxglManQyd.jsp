<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>
<%@include file="/public/ImgerToBase64.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->
<script type="text/javascript" src="business/jdyzagl/js/gspicturejdy.js"></script><!-- 身份证扫描js -->

<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var pjxx_detail_div="pjjbxx_detail";
	var pjxx_detail_width=900;
	var pjxx_grid_div="pjjbxxDiv";
	var pjxx_grid_table = "pjjbxxTable";
	var pjxx_grid_table_html;
	var pjxx_page_url = "jdy/querylist_pjxx.action";
	var pjxx_add_page_url = "business/jdyzagl/PjxxAdd.jsp";
	var pjxx_update_page_url="business/jdyzagl/PjxxModify.jsp";
	var pjxx_delete_url="jdy/delete_pjxx.action";
	var pjxx_update_url="jdy/update_pjxx.action";
	var pjxx_detail_url="jdy/query_pjxx.action";
	var searchLongUrl="jdy/querycxForExport_pjxx.action";
	var excelUrl="jdy/exportExcel_pjxx.action";
	var pjxxImportUrl="jdy/importPjxx_pjxx.action";
	
	$(function(){
		
		$('#pjxx_sjr_zjlx').selectBox({code:'dm_zjlx'});
		//时间设置
		$('.datef').attr("readOnly",true).datepicker(true,'0');
		$('.datet').attr("readOnly",true).datepicker(true,'1');
		//寄递物品联动下拉列表
		selectboxlink("pjxx_jdpdlx","pjxx_jdplx","dm_jdwpdl");
		$('#pjxx_pjr_xm').click(function(){
			dataid=null;
			getTyRY_item('pjxx_pjr_xm','pjxx_pjr_cyrybh',null,'<%=gxdwbm%>',null,'<%=qybm%>');
		});
		//导出用到参数
		tabletitle = "";
		geteExcelHead("pjjbxxDiv");
		
		loadPagePjxxQuery(pjxx_grid_div);
		daggleDiv(pjxx_detail_div);
		
		daggleDiv('pjjbxxImportDialog');
	});
	
	function loadPagePjxxQuery(divpageid){
		pjxx_grid_table_html=$("#"+divpageid).html();
		pjxxQueryPageList(1,'#');
	}
	
	function setPjxxQueryList(pageno,url){
	 	$("#"+pjxx_grid_div).html(pjxx_grid_table_html);
		params = getSubmitParams("#pjjbxx_man_qyd [id*=pjxx_]",params);
		if (url==null || url=="undefined"){
			url=pjxx_page_url;
		}
		return url;
	 }
	//页面gird加载方法
	function pjxxQueryPageList(pageno,url){	
		if (manVerify_pjxx()){
		    url=setPjxxQueryList(pageno,url);
			var mygrid1 = $("#"+pjxx_grid_table).ingrid({ 
											url: url,	
											onRowSelect:null,
											height: pageHeight-286,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											//colIndex: [0],
											noSortColIndex:[11],
											hideColIndex:[8,9,10],
											isHaveMorenPaixuClass: true, //加默认排序样式
											//morenPaixuCol: 7, //第一默认排序	
											//morenPaixuFangshi:'desc', //默认排序方式
											changeHref:function($table){
												//判断是否有数据
												if($($table).find("tr").length==0){
												    daochuNum = 0;
												}else{
												    daochuNum = 1;
												}
												$('tr',$table).each(function(){
													var $tr=$(this);
													//派发控制
													var zt=$tr.find('td:nth(8)').text();
													if(zt=='Y'){
														$tr.find('td:last a[title=派发]').remove();
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
													}
														
													//修改删除的时间控制
													var overUpdateTime=$tr.find('td:nth(9)').text();
													if(overUpdateTime=='true'){
														$tr.find('td:last a[title=删除]').remove();
														$tr.find('td:last a[title=修改]').remove();
													}
													
													//可疑寄递控制，高亮显示
													var kybz=$tr.find('td:nth(10)').text();
													if(kybz=='Y'){
														$tr.find('td:last a[title=派发]').remove();
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
														$tr.addClass("red");
														$tr.attr('title',"该揽件包含可疑寄递物品");
													}
												});
											},
// 											ingridComplete:function(){
// 												$("#"+pjxx_grid_div+" tbody tr").each(function(){
// 													$tr = $(this);
// 													//可疑寄递控制，揽件信息被标记为可疑寄递的话，不能派发，删除，修改。
// 													var kybz=$tr.find('td:nth(10)').text();
// 													var id=$tr.attr('id');
// 													if(kybz=='Y'){
// 														var rowData={
// 																id:id,
// 																kybz:kybz
// 														};
// 														var deleteAction=$tr.find('td:last a[title=删除]');
// 														deleteAction.attr('rowData',$.toJSON(rowData));
// 														if(deleteAction.length)
// 															deleteAction.get(0).onclick=null;
// 														deleteAction.click(function(){
// 															var rowData = $(this).attr('rowData');
// 															if(rowData)
// 																rowData=$.evalJSON(rowData);
// 															setPjxxDelete(rowData.id,rowData.kybz);
// 															$(this).remove();
// 														});
														
// 														var updateAction = $tr.find('td:last a[title=修改]');
// 														updateAction.attr('rowData',$.toJSON(rowData));
// 														if(updateAction.length)
// 															updateAction.get(0).onclick=null;
// 														updateAction.click(function(){ 
// 															var rowData = $(this).attr('rowData');
// 															if(rowData)
// 																rowData=$.evalJSON(rowData);
// 															setPjxxUpdate(rowData.id,rowData.kybz);
// 															$(this).remove();
// 														});
														
// 														var sendAction = $tr.find('td:last a[title=派发]');
// 														sendAction.attr('rowData',$.toJSON(rowData));
// 														if(sendAction.length)
// 															sendAction.get(0).onclick=null;
// 														sendAction.click(function(){ 
// 															var rowData = $(this).attr('rowData');
// 															if(rowData)
// 																rowData=$.evalJSON(rowData);
// 															setPjxxSend(rowData.id,rowData.kybz);
// 															$(this).remove();
// 														});
// 													}
// 												});
// 											},
											alignCenterColIndex: [1,2,8],
											colWidths: ["11%","11%","11%","11%","11%","11%","11%","11%",'0%','0%','0%',"11%"]									
										});				
			}
	}	
	//新增派件信息方法
	function setPjxxAdd(){
		setWidth(pjxx_detail_div,pjxx_detail_width);
		setUrl(pjxx_detail_div,pjxx_add_page_url);
		bindDocument(pjxx_detail_div);
	}
	//验证
	function manVerify_pjxx(){
		var sj1;
		var sj2;
		
		sj1 = $("#pjxx_pjtbsjf").val();
		sj2 = $("#pjxx_pjtbsjt").val();
		if(sj1!=null && sj1!="" && sj2!=null && sj2!=""){
			if(sj1>sj2){
				jAlert('填报时间时间不能大于填报时间至','提示信息')
				return false;
			}
		}
		
		return true;
	}
	//派件信息修改
	function setPjxxUpdate(id){
		
		dataid = id;
		setWidth(pjxx_detail_div,pjxx_detail_width);
		setUrl(pjxx_detail_div,pjxx_update_page_url);
		bindDocument(pjxx_detail_div);
	} 
	//派件信息删除
	function setPjxxDelete(id) {
		//验证是否为可疑
		$.post(pjxx_detail_url,{"pjxx.id":id},function(json){
			if(json.pjxx.ljjbxx.kybz == 'Y'){
				jAlert("该条揽件信息存在可疑寄递物品，不能进行删除操作！","提示");
				return;
			}
			jConfirm("确定删除吗？","提示",function(r){
				if(r){
					$.post(pjxx_detail_url,{'pjxx.id':id},function(json){
						if(json.overUpdateTime){
							jAlert("已经超过了删除的时间！","提示");
							pjxxQueryPageList(1);
						}
						else{
							$.post(pjxx_delete_url,{'pjxx.id':id},function(json){ if(json.result == 'success') { pjxxQueryPageList(1); } },'json');
						}
					},'json');
					
				}
			});
			
		},'json');
			
	}
	/**
	派件信息详情
	*/
	function setPjxxDetail(id) {
		dataid = id;
		detailDialog(pjxx_detail_div, pjxx_detail_width, pjxx_update_page_url, null,function(data){
// 			修改标题
			$('#pjxx_title').text('寄递品派件信息详情');
			$('#pjjbxx_mod .red').removeClass('red');
			$('#pjjbxx_mod_button').parent('td').remove();
			$('#pjjbxx_mod [id*=pjjbxxmod_]').attr('readonly',true).addClass('readonly').attr('disabled',true);
			
			//去掉身份证扫描框
			$('#pjjbxx_mod a:contains("二代证读取")').each(function(){
				$(this).parents("table").eq(0).remove();
			});
			//去掉寄件人和收件人的选择器
			$('#pjjbxxmod_jjrssx').unbind('click');
			$('#pjjbxxmod_sjrssx').unbind('click');
			//去掉派件人的人员选择器
			$('#pjjbxxmod_pjr_xm').unbind('click');
			//去掉寄递品添加按钮
			$('#pjjbxx_mod a[id=addbutton]').remove();
			//去掉寄递品信息的操作动作
			function clear(){
				$('#YwwffzjlData tbody tr').each(function(){
					$(this).find('td:last').html('');
				})
			}
			
			setTimeout(clear,600);
			
		});
	}
	
	/***
	派送登记的派件信息。
	**/
	function setPjxxSend(id){
		
		//验证是否为可疑
		$.post(pjxx_detail_url,{"pjxx.id":id},function(json){
			if(json.pjxx.ljjbxx.kybz == 'Y'){
				jAlert("该条揽件信息存在可疑寄递物品，不能进行删除操作！","提示");
				return;
			}
			var djxh = json.pjxx.ljjbxx.djxh;
			var params={"pjxx.id":id,"pjxx.zt":'Y'};
			
			jConfirm("派发后不能修改或删除，您确认派发？","提示",function(r){
				if(r){
					$.post(pjxx_update_url,params,function(json){
						if(json.result == 'success'){
							pjxxQueryPageList(1);
							//修改揽件是否派件的标志为Y
							$.post("jdy/update_ljxx.action",{'lj.djxh':djxh,'lj.sfpjbz':"Y"});
						}
							
					},'json');
				}
			});
		},'json');
		
		
		
	}
	//导出Excel
	function exportPjxx(){	
	  	if(daochuNum==1){
	  	  //params = null
	  	  params = getSubmitParams("#pjjbxx_man_qyd [id*=pjxx_]",params);
	  	  jQuery.post(searchLongUrl,params,searchLongBack,"json");
	  	  //setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
	  	}else{
	  		jAlert("无查询结果不能导出！",'验证信息',null,null);
	  	}		
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){  
	    //报表标题
		var bbmc="派件信息";
		//报表请求
		setExcelLong("pjxxexcel",bbmc);	
	}
	
	function setImportPjxx() {
		detailDialog('pjjbxxImportDialog',300,'#',null,function(json){
			var html= '<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">'+
			'		    <tr>'+
			'		      <td align="left" class="title1">派件导入</td>'+
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
			'					<a href="#" class="addbutton" id="uploadbtn" onclick="importPjxx();">确认</a>'+
			'				</td>'+
			'			</tr>'+
			'		</table>';
			$('#pjjbxxImportDialog').html(html);
			$('#pjjbxxImportDialog').css('top',document.body.offsetHeight/2-30+'px');
		});
	}
	//揽件信息导入方法
	function importPjxx(){
		if($('#xlsFile').val()){
			$.post(pjxxImportUrl,{'uploadFile':$('#uploadFile').val()},function(json){
				if(json.result!="success"){
					alert(json.result);
				}
				else{
					alert("导入成功");
					$('#pjjbxxImportDialog').hideAndRemove("show");
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

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="pjjbxx_man_qyd">
  <tr>
    <td class="queryfont">派件信息管理</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<input type="hidden" name="pjxx.pjr.cyrybh" id="pjxx_pjr_cyrybh"/>
    	<input type="hidden" name="pjxx.ljjbxx.qyjbxx.qybm" id="pjxx_qyjbxx_qybm" value="<%=qybm %>" />
    	<input type="hidden" id="uploadFile" >
    	<%--是否删除标志 --%>
    	<input type="hidden" name="pjxx.sfscbz" id="pjxx_sfscbz" value="N"/>
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
				<tr>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_wldh" name="pjxx.ljjbxx.wldh" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">收件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_sjr_xm" name="pjxx.ljjbxx.sjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">收件人证件类型</td>
					<td width="23%" class="pagetd"><select id="pjxx_sjr_zjlx" name="pjxx.ljjbxx.sjr.zjlx" class="select1"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">收件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_sjr_zjhm" name="pjxx.ljjbxx.sjr.zjhm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd"><select id="pjxx_jdpdlx" name="pjxx.ljjbxx.jdpxx.jdpdlx" class="inputstyle"><option></option></select></td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd"><select id="pjxx_jdplx" name="pjxx.ljjbxx.jdpxx.jdplx" class="inputstyle" ><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">派件员</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjr_xm" name="pjxx.pjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">派件登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjtbsjf" name="pjtbsjf" class="inputstyle datef" value=""></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjtbsjt" name="pjtbsjt" class="inputstyle datet" value=""></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="pjxxQueryPageList(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="addbutton" onclick='setPjxxAdd();'>添加</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='setImportPjxx();'>导入</a></td>
    		    	  <td ><a href="#" class="addbutton" id="pjxxexcel" onclick='exportPjxx();'>导出</a></td>
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
<div id="pjjbxx_detail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

<div id="pjjbxxDiv" style="width:100%;">
	<table id="pjjbxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_djxh" datatype="string" sumflag="0">登记序号</th>
	    	<th name="l_wldh" datatype="string" sumflag="0">物流单号</th>
	    	<th name="l_sjr_xm" datatype="string" sumflag="0">收件人姓名</th>
	    	<th name="l_sjr_zjlx" datatype="string" sumflag="0">证件类型</th>
	    	<th name="l_sjr_zjhm" datatype="string" sumflag="0">证件号码</th>
	    	<th name="l_pjsj" datatype="string" sumflag="0">派件时间</th>
	    	<th name="l_pjr_xm" datatype="string" sumflag="0">派件员</th>
	    	<th name="l_pjtbsj" datatype="string" sumflag="0">登记时间</th>
	    	<th name="">状态</th>
	    	<th name="">修改状态</th>
	    	<th name="">可疑寄递标志</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>

<div id="pjjbxxImportDialog" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>