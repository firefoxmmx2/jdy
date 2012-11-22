<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	String path_baybmxxtj=request.getContextPath();
%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>

<script type="text/javascript">
	var ljxx_sub_div = "ljxxSubData";
	var sjgl_sub_div="sjglSubData";
	var sjgl_sub_table="sjglSubTable";
	var sjgl_sub_tabledata;
	/**
	数据关联度查询
	*/
	function sjglSubPageQuery(pageno,url){
		if (true){
			 $("#"+sjgl_sub_div).html(sjgl_sub_tabledata);
				params =getSubmitParams("#subSjglDiv [name*=rdrjbxx.]");
				if (url==null || url=="undefined"){
					url=sjgl_page_url;
				}
			var mygrid1 = $("#"+sjgl_sub_table).ingrid({ 
											url: url,	
											height: pageHeight-286,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											noSortColIndex:[5],	
											colIndex: [0,1,2],
											onRowSelect:null,
											ingridComplete:function(){
												$('#'+sjgl_sub_div+" table tbody tr").each(function(){
													var row = $(this);
													if(row.find('a[title=详情]').length)
														row.find('a[title=详情]').get(0).onclick=null;
													row.find('a[title=详情]').click(function(){
														ljxx_dialog_div = ljxx_sub_div;
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
																$('#subSjglDiv :input').val('');
																$('#'+datafield,$('#subSjglDiv')).val($(this).text());
																sjglSubPageQuery(1);
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
		sjgl_sub_tabledata = $('#'+sjgl_sub_div).html();
		sjglSubPageQuery(1);
		
		daggleDiv(ljxx_sub_div);
		$('#bottomButtonbar').css('paddingLeft','85%');
	})
	
	/**
	导出数据关联度数据
	*/
	function exportSubSjgl(){
		//设置分页信息
		$('#'+sjgl_sub_div).find('.grid-sort-desc','.grid-sort-asc').each(function(idx){
			th = $(this);
			var sort = idx;
			var dir = th.hasClass('grid-sort-desc') ? 'desc' : 'asc';
			$('#excelSjglForm input:hidden[name=sort]',$('#subSjglDiv')).val(sort);
			$('#excelSjglForm input:hidden[name=dir]',$('#subSjglDiv')).val(dir);
		});
		//当前页数
		$('#excelSjglForm input:hidden[name=pagesize]',$('#subSjglDiv')).val($('#pageNo',$('#subSjglDiv')).val());
		//每页数
		$('#'+sjgl_sub_div).find('.grid-page-viewing-records-info').each(function(){
			var pageinfo = $(this).text();
			var pagerow = 20;
			var group = /^([\d]+)[\u4e00-\u9fa5|\w]*$/.exec(pageinfo.split(" ")[1].split("/")[0])
			if(group){
				pagerow = group[1];
			}
			$('#excelSjglForm input:hidden[name=pagerow]',$('#subSjglDiv')).val(pagerow);
		});
		$('#excelSjglForm',$('#subSjglDiv')).attr('action',sjgl_excel_url)
			.attr("target","_blank")
			.attr('type','post')
			.submit();
	}
	
	function closeSubSjglDetail(){
		$('#subSjglDiv').parent().hideAndRemove("show");
	}
</script>
<div id="subSjglDiv">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
	    <tr>
	      <td align="left" class="title1" id="pjxx_title">数据关联分析</td>
	      <td align="right"><a href="#" id="closeDiv" onclick='closeSubSjglDetail();' class="close"></a></td>
	    </tr>
	</table>
	<%
		String xm = request.getParameter("sjgl_xm");
		if(xm==null)
			xm = "";
		String lxdh = request.getParameter("sjgl_lxdh");
		if(lxdh==null)
			lxdh = "";
		String xxdz = request.getParameter("sjgl_xxdz");
		if(xxdz==null)
			xxdz = "";
	%>
	<form action="" id="excelSjglForm">
		<input type="hidden" name="pagesize">
   		<input type="hidden" name="pagerow">
   		<input type="hidden" name="sort">
   		<input type="hidden" name="dir">
		<input type="hidden" id="sjgl_xm" name="rdrjbxx.xm" value="<%=xm%>">
		<input type="hidden" id="sjgl_lxdh" name="rdrjbxx.lxdh" value="<%=lxdh%>">
		<input type="hidden" id="sjgl_xxdz" name="rdrjbxx.xxdz" value="<%=xxdz%>">
	</form>
	
	<div id="sjglSubData" style="width:100%;">
		<table id="sjglSubTable" width="100%">
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
	
</div>
<div id="bottomButtonbar">
	<a href="#" class="addbutton" id="sjglExportButton" onclick='exportSubSjgl();'>导出</a>
</div>

<div id="ljxxSubData" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;">
</div>