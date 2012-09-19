<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	String path_baybmxxtj=request.getContextPath();
%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>

<script type="text/javascript">

	//揽件
	var ljxx_div="ljxxData";
	var ljxx_page_url="business/jdyzagl/LjxxglManQyd.jsp";
	var ljxx_width=1024;
	var ljxx_dialog_div;
	function close_ljxx_dialog(){
		$('#'+ljxx_dialog_div).hideAndRemove("show");
	}
	/**
	揽件详情方法
	*/
	function setLjxxDetailQuery(xm,lxdh,xxdz,jdrylx){
		var detailBussTitle = "业务详情展示";
		if(!xm){
			jAlert(detailBussTitle + "姓名不能为空","提示");
			return;
		}
		if(!lxdh){
			jAlert(detailBussTitle + "电话号码不能为空","提示");
			return;
		}
		if(!xxdz){
			jAlert(detailBussTitle + "地址不能为空","提示");
			return;
		}
		
		if(!jdrylx){
			jAlert(detailBussTitle + "寄递人员类型不能为空","提示");
			return;
		}
		
		$('#'+ljxx_dialog_div).empty();
		detailDialog(ljxx_dialog_div, ljxx_width, ljxx_page_url, null,function(data){
			$('<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">'+
				    '<tr>'+
				      '<td align="left" class="title1">揽件信息</td>'+
				      '<td align="right"><a href="#" id="closeDiv" onclick="close_ljxx_dialog();" class="close"></a></td>'+
				    '</tr>'+
				'</table>').insertBefore($('#ljjbxx_man_qyd'));
			
			$('#ljjbxx_man_qyd').hide();
			$('#ljjbxx_man_qyd :input').attr("value","");
			//根据寄递人员类型代码，设置揽件参数查询 ， 最大限度复用已有的部件。
			if(jdrylx == '10'){
				$('#ljxx_jjrxm').val(xm);
				$('#lj_jjr_lxdh').val(lxdh);
				$('#lj_jjr_xxdz').val(xxdz);
			}
			else if(jdrylx == '20') {
				$('#lj_sjr_lxdh').val(lxdh);
				$('#lj_sjr_xxdz').val(xxdz);
				$('#lj_sjr_xm').val(xm);
			}
			else{
				jAlert('此处不应该具有代收类型的人员,请联系管理人员分析解决这个问题','提示');
				return;
			}
			
			//覆盖原有揽件查询的函数
			setPageListlj = function(pageno,url){	
				if (manVerify_bm()){
				    $("#"+divnid).html(tables);
					params =getSubmitParams("#ljjbxx_man_qyd [name*=lj.]");
					params['lj.jdpxx.jdpdlx'] = undefined;
					params['lj.jdpxx.jdplx'] = undefined;
					params['lj.jjr.zjlx'] = undefined;
					params['lj.scbzw'] = 'y';
					if (url==null || url=="undefined"){
						url=pageUrl;
					}
					var mygrid1 = $("#LjjbxxTable").ingrid({ 
													url: url,	
													height: pageHeight-286,
			                                        ingridPageParams:sXML,
			                                        ingridExtraParams:params,
													pageNumber: pageno,
													noSortColIndex:[7],	
													onRowSelect:null,
													hideColIndex:[7,8,9],
													changeHref:function(table){
														$('tr',table).each(function(){
															var $tr=$(this);
// 															无论怎么样都把 修改和删除屏蔽了
															$tr.find('td:last a[title=修改]').remove();
															$tr.find('td:last a[title=删除]').remove();
														});
													},
													colWidths: ["25%","12%","10%","10%","20%","10%","15%","0","2","2","15%"]									
												});				
					}
			}
			
			
			//查询
			setPageListlj(1);
		});
	}
	
	var sjgl_div="sjglData";
	var sjgl_table="sjglTable";
	var sjgl_tabledata;
	var sjgl_page_url = "jdy/slgjtjQuerylist_jdytjxx.action";
	var sjgl_detail_div = "sjglDetail";
	var sjgl_detail_widh= 1024;
	var sjgl_detail_page_url = 'business/jdyzagl/jdysjgldfxDetail.jsp';
	var sjgl_excel_url = "jdy/exportSjgltj_jdytjxx.action";
	
	function sjglDetail(param){
		detailDialog(sjgl_detail_div,sjgl_detail_widh,sjgl_detail_page_url,param);
	}
	/**
	数据关联度查询
	*/
	function sjglPageQuery(pageno,url){
		if (manVerify_sjgl()){
			 $("#"+sjgl_div).html(sjgl_tabledata);
				params =getSubmitParams("#sjgldfx_man [name*=rdrjbxx.]");
				if (url==null || url=="undefined"){
					url=sjgl_page_url;
				}
			var mygrid1 = $("#"+sjgl_table).ingrid({ 
											url: url,	
											height: pageHeight-286,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											noSortColIndex:[5],	
											colIndex: [0,1,2],
											onRowSelect:null,
											ingridComplete:function(){
												$('#'+sjgl_div+" table tbody tr").each(function(){
													var row = $(this);
													if(row.find('a[title=详情]').length)
														row.find('a[title=详情]').get(0).onclick=null;
													row.find('a[title=详情]').click(function(){
														ljxx_dialog_div = ljxx_div;
														setLjxxDetailQuery(
																$(this).parents('tr').eq(0).find('td:nth(0)').text(),
																$(this).parents('tr').eq(0).find('td:nth(1)').text(),
																$(this).parents('tr').eq(0).find('td:nth(2)').text(),
																$(this).parents('tr').eq(0).find('td:nth(4)').text()
														);
													});
													
													row.find('td').each(function(idx){
														var datafield = $(this).parents('table').eq(0)
															.find('thead tr th:nth('+idx+')')
															.attr('datafield');
														if(datafield){
															$(this).click(function(){
																var param = {};
																param[datafield] = $(this).text();
																sjglDetail(param);
															})
														}
													});
												});
												
											},
											hideColIndex:[4],
											colWidths: ['20%','20%','20%','20%','0%','20%']								
										});				
			}
	}
	
	function manVerify_sjgl(){
		return true;
	}
	
	$(function(){
		sjgl_tabledata = $('#'+sjgl_div).html();
		sjglPageQuery(1,"#");
		
		daggleDiv(ljxx_div);
		daggleDiv(sjgl_detail_div);
	})
	
	/**
	导出数据关联度数据
	*/
	function exportSjgl(){
		//设置分页信息
		alert($('#'+sjgl_div).find('.grid-page-viewing-records-info').length);
		$('#'+sjgl_div).find('.grid-sort-desc','.grid-sort-asc').each(function(){
			th = $(this);
			var sort = th.parent().index(th);
			var dir = th.hasClass('grid-sort-desc') ? 'desc' : 'asc';
			
			$('#excelSjglForm input:hidden[name=sort]').val(sort);
			$('#excelSjglForm input:hidden[name=dir]').val(dir);
		});
		//当前页数
		$('#excelSjglForm input:hidden[name=pagesize]').val($('#pageNo',$('#'+sjgl_div)).val());
		//总页数
		$('#'+sjgl_div).find('.grid-page-viewing-records-info').each(function(){
			var pageinfo = $(this).text();
			var pagerow = 20;
			var group = /^([\d]+)[u4e00-u9fa5|\w]$/.exec(pageinfo.split(" ")[1].split("/")[0])
			if(group){
				pagerow = group[1];
			}
			alert(pagerow)
			$('#excelSjglForm input:hidden[name=pagerow]').val(pagerow);
		});
		$('#excelSjglForm').attr('action',sjgl_excel_url)
			.attr("target","_blank")
			.attr('type','post')
			.submit();
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="sjgldfx_man">
  <tr>
    <td class="queryfont">数据关联度查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<form action="" id="excelSjglForm">
    		<input type="hidden" name="pagesize">
    		<input type="hidden" name="pagerow">
    		<input type="hidden" name="sort">
    		<input type="hidden" name="dir">
	    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
					<tr>
						<td width="10%" class="pagedistd">姓名</td>
						<td width="23%" class="pagetd"><input type="text" id="sjgl_xm" name="rdrjbxx.xm" class="inputstyle"></td>
						<td width="10%" class="pagedistd">联系电话</td>
						<td width="23%" class="pagetd"><input type="text" id="sjgl_lxdh" name="rdrjbxx.lxdh" class="inputstyle"></td>
						<td width="10%" class="pagedistd">地址</td>
						<td width="23%" class="pagetd"><input type="text" id="sjgl_xxdz" name="rdrjbxx.xxdz" class="inputsytle"></td>
					</tr>
	    		<tr>
	    		  <td colspan="6">
	    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
	    		    	<tr>
	    		    	  <td ><a href="#" class="highsearchbutton" id="sjglQueryButton" onclick="sjglPageQuery(1);">关联查询</a></td>
	    		    	  <td ><a href="#" class="addbutton" id="sjglExportButton" onclick='exportSjgl();'>导出</a></td>
	    		    	</tr>
	    		  	</table>
	    		  </td>
	    		</tr>
	    	</table> 
    	</form>
    	
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>

<div id="sjglData" style="width:100%;">
	<table id="sjglTable" width="100%">
	  <thead>
	    <tr>       
	    	<th datafield="sjgl_xm">姓名</th>
	    	<th datafield="sjgl_lxdh">电话号码</th>
	    	<th datafield="sjgl_xxdz">地址</th>
	    	<th>业务类型</th>
	    	<th>类型实际值</th>
	    	<th>业务详情</th>
	    </tr>
	  </thead>
	</table>	
</div>

<div id="ljxxData" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;">
</div>

<div id="sjglDetail" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;">
</div>