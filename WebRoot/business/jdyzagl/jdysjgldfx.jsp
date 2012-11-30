<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	String path_baybmxxtj=request.getContextPath();
%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>

<script type="text/javascript">
	//揽件
	var ljxx_div="ljxxData";
	var ljxx_page_url="business/jdyzagl/LjxxglManQyd.jsp";
	var ljxx_width=1024;
	var ljxx_dialog_div;
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
				      '<td align="right"><a href="#" id="closeDiv" onclick="close_dialog(this);" class="close"></a></td>'+
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
	//动态创建查询条件
	var sjgl_search_condition = {
	                            	 '1':{tablename:'tysfxx',title:"同一身份信息使用不同联系方式查询"},
	                      	         '2':{tablename:'tylxfs',title:"同一联系方式出现不同身份信息查询"}
	                            };
	var validate_style=0;
	
	function sjglDetail(param){
		detailDialog(sjgl_detail_div,sjgl_detail_widh,sjgl_detail_page_url,param);
	}
	/**
	数据关联度查询
	*/
	function sjglPageQuery(pageno,url){
		if (manVerify_sjgl()){
			 $("#"+sjgl_div).html(sjgl_tabledata);
				if (url==null || url=="undefined"){
					url=sjgl_page_url;
				}
// 			var params = getSubmitParams($('input:checked[name="paramType"]').parent().find(':input[name!="paramType"]'));
			
			var params = getSubmitParams('#baManTablebm input[name*=rdrjbxx.]');
			var mygrid1 = $("#"+sjgl_table).ingrid({ 
											url: url,	
											height: pageHeight-286,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											noSortColIndex:[5],	
// 											colIndex: [0,1,2],
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
// 													@fixed 根据最新的需求去掉点击弹出子窗口查询
// 													row.find('td').each(function(idx){
// 														var datafield = $(this).parents('table').eq(0)
// 															.find('thead tr th:nth('+idx+')')
// 															.attr('datafield');
// 														if(datafield){
// 															$(this).click(function(){
// 																var param = {};
// 																param[datafield] = $(this).text();
// 																sjglDetail(param);
// 															})
// 														}
// 													});
												});
												
											},
											hideColIndex:[4],
											colWidths: ['20%','20%','20%','20%','0%','20%']								
										});				
			}
	}
	
	//查询验证
	function manVerify_sjgl(){
// 		var paramTypeVal = $('input[name=paramType]:checked').val();
// 		if(paramTypeVal=='xm' && !$('#sjgl_xm').val()){
// 			jAlert('姓名必须填写','警告');
// 			return false;
// 		}
// 		if(paramTypeVal=='lxdh' && !$('#sjgl_lxdh').val()){
// 			jAlert('联系电话必须填写','警告');
// 			return false;
// 		}
// 		if(paramTypeVal=='xxdz' && !$('#sjgl_xxdz').val()){
// 			jAlert("地址必须填写","警告");
// 			return false;
// 		}
		if(validate_style){
			//类型显示
			var type = $('#type').val();
			//个人身份查询验证
			if(type == "1" && !$('#sjgl_xm').val()){
				jAlert('姓名必须填写','警告');
				return false;
			}
			//联系电话查询验证
			if(type == '2' && !$('#sjgl_lxdh').val() ){
				jAlert("联系电话必须填写","警告");
				return false;
			}
		}
		
		return true;
	}
	

	
	/**
	导出数据关联度数据
	*/
	function exportSjgl(){
		if(manVerify_sjgl()){
			//设置分页信息
			$('#'+sjgl_div).find('.grid-sort-desc','.grid-sort-asc').each(function(idx){
				th = $(this);
				var sort = idx;
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
				var group = /^([\d]+)[\u4e00-\u9fa5|\w]*$/.exec(pageinfo.split(" ")[1].split("/")[0])
				if(group){
					pagerow = group[1];
				}
				$('#excelSjglForm input:hidden[name=pagerow]').val(pagerow);
			});
			
			$('#excelSjglForm input').val('');
			$('#baManTablebm input[name*=rdrjbxx.]').each(function(){
				$('#excelSjglForm input[name='+$(this).attr('name')+']').val(this.value);
			});
			$('#excelSjglForm').attr('action',sjgl_excel_url)
				.attr("target","_blank")
				.submit();
		}
		
	}
	
	//载入后入口
	$(function(){
		sjgl_tabledata = $('#'+sjgl_div).html();
		sjglPageQuery(1,"#");
		//第一次加载以后启用验证
		validate_style = 1;
		
		daggleDiv(ljxx_div);
		daggleDiv(sjgl_detail_div);

// 		$('#sjgl_ssxmc').attr('readonly',true);
		//提交数据选择
// 		$('input[name=paramType]').each(function(){
// 			var paramType = $(this);
// 			paramType.parent().find('input[name!="paramType"]').click(function(){
// 				paramType.click();
// 			});
			
// 			paramType.click(function(){
// 				$('input[name=paramType]').each(function(){
// 					if(paramType.val()!=$(this).val())
// 						$(this).parent().find('input[name!="paramType"]').val('')
// 				});
// 			});
// 		});
// 		//默认选择第一个查询条件
// 		$('input[name=paramType]').eq(0).click();
		//构建查询条件
		var type = $('#type').val();
		buildSearch(type);
	});
	
	/***
	* 构建查询条件
	*/
	function buildSearch(type){
		if(!type)
			throw("构建查询条件type不能为空");
		var use_search_cond = sjgl_search_condition[type];
		$('#'+use_search_cond.tablename).show();
		$("#sjgl_title").text(use_search_cond.title);
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="sjgldfx_man">
  <tr>
    <td id="sjgl_title" class="queryfont">数据关联度查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<form action="" id="excelSjglForm" method="post">
    		<input type="hidden" name="pagesize">
    		<input type="hidden" name="pagerow">
    		<input type="hidden" name="sort">
    		<input type="hidden" name="dir">
    		<input type="hidden" name="rdrjbxx.xm">
    		<input type="hidden" name="rdrjbxx.lxdh">
    		<input type="hidden" name="rdrjbxx.xxdz">
    		<input type="hidden" name="rdrjbxx.zjhm">
		</form>
		<%
			//添加一个type开关,用于控制页面显示模式和提交参数
			//type = 1 表示  “同一身份信息使用不同联系方式”
			//type = 2 表示  “同一联系方式出现不同身份信息”
			String type = request.getParameter("type") == null? "1":request.getParameter("type");
		%>
		<input type="hidden" id="type" value="<%=type%>">
	    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
	    		<tr height="30">
	    			<td width="100%" colspan="6" align="left">
	    				<table style="display: none;" id="tysfxx" border="0" cellspacing="0" cellpadding="2">
	    					<tr>
	    						<td class="red">姓名:</td>
	    						<td><input type="text" id="sjgl_xm" name="rdrjbxx.xm" class="inputstyle"></td>
	    						<td>身份证号:</td>
	    						<td><input type="text" id="sjgl_zjhm" name="rdrjbxx.zjhm" class="inputstyle"></td>
	    					</tr>
	    				</table>
	    				<table style="display: none;" id="tylxfs"  border="0" cellspacing="0" cellpadding="2">
	    					<tr>
	    						<td class="red">联系电话:</td>
	    						<td><input type="text" id="sjgl_lxdh" name="rdrjbxx.lxdh" class="inputstyle"></td>
	    					</tr>
	    				</table>
	    			</td>
	    		</tr>
<!-- 					<tr height="30"> -->
<!-- 						<td width="25%" > -->
<!-- 							<div> -->
<!-- 								<label> -->
<!-- 									<input type="radio" name="paramType" value="xm"><span>姓名</span> -->
<!-- 									<input type="text" id="sjgl_xm" name="rdrjbxx.xm" class="inputstyle"> -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 						<td width="25%" > -->
<!-- 							<div> -->
<!-- 								<label> -->
<!-- 									<input type="radio" name="paramType" value="lxdh"><span>联系电话</span> -->
<!-- 									<input type="text" id="sjgl_lxdh" name="rdrjbxx.lxdh" class="inputstyle"> -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<div style="padding-left: 10px;text-align: left;"> -->
<!-- 								<label> -->
<!-- 									<input type="radio" name="paramType" value="xxdz"><span>地址</span> -->
<!-- 									<input type="text" id="sjgl_xxdz" name="rdrjbxx.xxdz" class="inputstyle"> -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
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