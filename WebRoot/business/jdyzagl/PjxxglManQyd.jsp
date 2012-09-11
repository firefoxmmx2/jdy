<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>

<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>

<script type="text/javascript">
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
	
	$(function(){
		
		$('#pjxx_jjr_zjlx').selectBox({code:'dm_zjlx'});
		$('.date').attr("readOnly",true).datepicker();
		$('#pjxx_pjr_xm').click(function(){
			dataid=null;
			getTyRY_item('pjxx_pjr_xm','pjxx_pjr_cyrybh',null,'<%=gxdwbm%>',null,'<%=qybm%>');
		});
		loadPagePjxxQuery(pjxx_grid_div);
		
		daggleDiv(pjxx_detail_div);
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
											height: pageHeight-267,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											colIndex: [0],
											noSortColIndex:[8],
											hideColIndex:[8],
											isHaveMorenPaixuClass: true, //加默认排序样式
											morenPaixuCol: 7, //第一默认排序	
											morenPaixuFangshi:'desc', //默认排序方式
											changeHref:function($table){
												$('tr',$table).each(function(){
													var $tr=$(this);
													var zt=$tr.find('td:nth(8)').text();
													if(zt=='Y')
														$tr.find('td:last a[title=派件]').remove();
												});
											},
											alignCenterColIndex: [1,2,8],
											colWidths: ["11%","11%","11%","11%","11%","11%","11%","11%",'0%',"11%"]									
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
		var sj1 = $("#pjxx_pjsjf").val();
		var sj2 = $("#pjxx_pjsjt").val();
		if(sj1!=null && sj1!="" && sj2!=null && sj2!=""){
			if(sj1>sj2){
				jAlert('派件时间不能大于派件时间至','提示信息')
				return false;
			}
		}
		
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
		if(confirm("是否决定删除该派件登记信息"))
			$.post(pjxx_delete_url,{'pjxx.id':id},function(json){ if(json.result == 'success') { pjxxQueryPageList(1); } },'json');
	}
	/**
	派件信息详情
	*/
	function setPjxxDetail(id) {
		dataid = id;
		detailDialog(pjxx_detail_div, pjxx_detail_width, pjxx_update_page_url, null,function(data){
			$('#pjjbxx_mod [id*=pjjbxxmod_]').attr("readOnly",true).addClass('readonly');
			$('#pjjbxx_mod .red').removeClass('red');
			$('#pjjbxx_mod_button').parent('td').remove();
			$('#pjjbxx_goback').attr('title','关闭').text('关闭');
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
		var params={"pjxx.id":id,"pjxx.zt":'Y'};
		
		$.post(pjxx_update_url,params,function(json){
			if(json.result == 'success')
				pjxxQueryPageList(1);
		},'json');
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
    	<%--是否删除标志 --%>
    	<input type="hidden" name="pjxx.sfscbz" id="pjxx_sfscbz" value="N"/>
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
				<tr>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_wldh" name="pjxx.ljjbxx.wldh" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">收件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_jjr_xm" name="pjxx.ljjbxx.jjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">收件人证件类型</td>
					<td width="23%" class="pagetd"><select id="pjxx_jjr_zjlx" name="pjxx.ljjbxx.jjr.zjlx" class="select1"><option></option></select></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">收件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_jjr_zjhm" name="pjxx.ljjbxx.jjr.zjhm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">派件时间</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjsjf" name="pjsjf" class="inputstyle date" value=""></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjsjt" name="pjsjt" class="inputstyle date" value=""></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">派件员</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjr_xm" name="pjxx.pjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">派件登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjtbsjf" name="pjtbsjf" class="inputstyle date" value=""></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="pjxx_pjtbsjt" name="pjtbsjt" class="inputstyle date" value=""></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="pjxxQueryPageList(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="addbutton" onclick='setPjxxAdd();'>添加</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='importPjxx();'>导入</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='exportPjxx();'>导出</a></td>
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
	    	<th name="l_djxh">登记序号</th>
	    	<th name="l_wldh">物流单号</th>
	    	<th name="l_jjrxm">收件人姓名</th>
	    	<th name="l_zjlx">证件类型</th>
	    	<th name="l_zjhm">证件号码</th>
	    	<th name="l_jdpdl">派件时间</th>
	    	<th name="l_ljy">派件员</th>
	    	<th name="l_ljsj">登记时间</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>