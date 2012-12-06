<%@page import="org.apache.poi.hssf.record.formula.functions.Call"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	String path_baybmxxtj=request.getContextPath();
%>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>

<script type="text/javascript">
	//揽件
	var ljxx_detail_div="ljxxDetailData";
	var ljxx_detail_page_url="business/jdyzagl/LjxxglManQyd.jsp";
	var ljxx_detail_width=1024;
	var ljxx_detail_dialog_div;
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
		
		$('#'+ljxx_detail_dialog_div).empty();
		detailDialog(ljxx_detail_dialog_div, ljxx_detail_width, ljxx_detail_page_url, null,function(data){
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
	
	var sjgl_div_detail="sjglDetailData";
	var sjgl_table_detail="sjglDetailTable";
	var sjgl_table_detaildata;
	var sjgl_page_url_detail = "jdy/slgjtjQuerylist_jdytjxx.action";
	var sjgl_detail_div_detail = "sjglDetail";
	var sjgl_detail_widh_detail= 1024;
	var sjgl_detail_page_url_detail = 'business/jdyzagl/jdysjgldfxDetail.jsp';
	var sjgl_excel_url = "jdy/exportSjgltj_jdytjxx.action";
	//动态创建查询条件
	var sjgl_search_condition = {
	                            	 '1':{tablename:'tysfxx',title:"同一身份信息使用不同联系方式查询"},
	                      	         '2':{tablename:'tylxfs',title:"同一联系方式出现不同身份信息查询"}
	                            };
	var validate_style=0;
	var sjgl_verify_url = 'jdy/verifySlgjtj_jdytjxx.action';
	
	function sjglDetail(param){
		detailDialog(sjgl_detail_div_detail,sjgl_detail_widh_detail,sjgl_detail_page_url_detail,param);
	}
	/**
	数据关联度查询
	*/
	function sjglPageQuery(pageno,url){
		if (manVerify_sjgl()){
			 $("#"+sjgl_div_detail).html(sjgl_table_detaildata);
				if (url==null || url=="undefined"){
					url=sjgl_page_url_detail;
				}
			
			var params = getSubmitParams('#baManTablebm_xx input');
			var mygrid1 = $("#"+sjgl_table_detail).ingrid({ 
											url: url,	
											height: pageHeight-286,
											ingridPageWidth:800,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											noSortColIndex:[5],	
// 											colIndex: [0,1,2],
											onRowSelect:null,
											isPlayResultNull: false,
											changeHref:function(table){
												//根据处理状态显示文本信息
												jtable = $(table);
												jtable.find('tr').each(function(idx){
													var jrow = $(this);
													jrow.attr('rowid',idx);
													var jcell = jrow.find('td:nth(5)');
													
													var xm = jrow.find('td:nth(0)').text();
													var lxdh = jrow.find('td:nth(1)').text();
													var xxdz = jrow.find('td:nth(2)').text();
													var rhlx = jrow.find('td:nth(4)').text();
													if(jcell.text() == '1')
														jcell.text('已核实不再预警');
													else{
														jcell.text('未核实');
														jrow.find('td:last').append('<a href="#" class="fontbutton" title="核实" onclick="verify(\''+xm+'\',\''+lxdh+'\',\''+xxdz+'\',\''+rhlx+'\',\''+jrow.attr('rowid')+'\');">核实</a>');
													}
														
												});
											},
											ingridComplete:function(){
												$('#'+sjgl_div_detail+" table tbody tr").each(function(){
													var row = $(this);
													if(row.find('a[title=详情]').length)
														row.find('a[title=详情]').get(0).onclick=null;
													row.find('a[title=详情]').click(function(){
														ljxx_detail_dialog_div = ljxx_detail_div;
														setLjxxDetailQuery(
																$(this).parents('tr').eq(0).find('td:nth(0)').text(),
																$(this).parents('tr').eq(0).find('td:nth(1)').text(),
																$(this).parents('tr').eq(0).find('td:nth(2)').text(),
																$(this).parents('tr').eq(0).find('td:nth(4)').text()
														);
													});
												});
												
											},
											hideColIndex:[4],
											colWidths: ['16.6%','16.6%','16.6%','16.6%','0%','16.6%','16.6%']								
										});				
			}
	}
	/***
	* 核实处理
	*/
	function verify(xm,lxdh,xxdz,rhlx,rowid){
		jConfirm("确定核实吗？","提示",function(r){
            if(r){
                var params = {
                        'rdrjbxx.xm':xm,
                        'rdrjbxx.lxdh':lxdh,
                        'rdrjbxx.xxdz':xxdz,
                        'rdrjbxx.jdrylx':rhlx
                };
                $.post(sjgl_verify_url,params,function(data){
                    if(data.result == 'success'){
                        var jrow = $('#'+sjgl_div+' tr[rowid="'+rowid+'"]');
                        jrow.find('td:nth(5)').text('已核实不再预警');
                        jrow.find('td:last a[title="核实"]').remove();
                    }
                    else{
                        jAlert(data.result,'提示');
                    }
                },'json');

            }
        });
		
	}
	//查询验证
	function manVerify_sjgl(){
		return true;
	}
	
	
	var datenow = '<%=dateNow%>';
	//载入后入口
	$(function(){
		sjgl_table_detaildata = $('#'+sjgl_div_detail).html();
		sjglPageQuery(1,"#");
		//第一次加载以后启用验证
		validate_style = 1;
		
		daggleDiv(ljxx_detail_div);
		daggleDiv(sjgl_detail_div_detail);

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

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1" id="sjgl_title">数据关联度查询</td>
      <td align="right"><a href="#" id="closeDiv" onclick='close_dialog(this);' class="close"></a></td>
    </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="sjgldfx_man">
  <tr>
    <td class="tdbg">
		<%
			//添加一个type开关,用于控制页面显示模式和提交参数
			//type = 1 表示  “同一身份信息使用不同联系方式”
			//type = 2 表示  “同一联系方式出现不同身份信息”
			String type = request.getParameter("type") == null? "1":request.getParameter("type");
			Calendar ljsjf = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			ljsjf.setTime(sdf.parse(dateNow));
			ljsjf.add(Calendar.MONTH, -1);
			
			String yjcs_cl = request.getParameter("yjcs_cl") == null? "1":request.getParameter("yjcs_cl");
			String cgcs = request.getParameter("cgcs") == null? "3":request.getParameter("cgcs");
		%>
		<input type="hidden" id="type" value="<%=type%>">
		<div id="baManTablebm_xx">
				<input type="hidden" name="ljjbxx.ljsjf" value="<%=sdf.format(ljsjf.getTime())%>">
   				<input type="hidden" name="ljjbxx.ljsjt" value="<%=datetime%>">
   				<input type="hidden" name="yjcs_cl" value="<%=yjcs_cl%>">
   				<input type="hidden" name="nosjjgdone" value="1">
   				<input type="hidden" name="tcwcl" value="1">
   				<input type="hidden" name="cgcs" value="<%=cgcs%>">
   				<input type="hidden" id="sjgl_xm" name="rdrjbxx.xm" class="inputstyle">
		</div>
<!-- 	    	<table width="100%" border="0" cellspacing="0" cellpadding="2"> -->
	    		
<!-- 	    		<tr height="30"> -->
<!-- 	    			<td width="100%" colspan="6" align="left"> -->
	    				
<!-- 	    				<table style="display: none;" id="tysfxx" border="0" cellspacing="0" cellpadding="2"> -->
<!-- 	    					<tr> -->
<!-- 	    						<td class="red">姓名:</td> -->
<!-- 	    						<td><input type="text" id="sjgl_xm" name="rdrjbxx.xm" class="inputstyle"></td> -->
<!-- 	    						<td>身份证号:</td> -->
<!-- 	    						<td><input type="text" id="sjgl_zjhm" name="rdrjbxx.zjhm" class="inputstyle"></td> -->
<!-- 	    					</tr> -->
<!-- 	    				</table> -->
<!-- 	    				<table style="display: none;" id="tylxfs"  border="0" cellspacing="0" cellpadding="2"> -->
<!-- 	    					<tr> -->
<!-- 	    						<td class="red">联系电话:</td> -->
<!-- 	    						<td><input type="text" id="sjgl_lxdh" name="rdrjbxx.lxdh" class="inputstyle"></td> -->
<!-- 	    					</tr> -->
<!-- 	    				</table> -->
<!-- 	    			</td> -->
<!-- 	    		</tr> -->
<!-- 	    		<tr> -->
<!-- 	    		  <td colspan="6"> -->
<!-- 	    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0"> -->
<!-- 	    		    	<tr> -->
<!-- 	    		    	  <td ><a href="#" class="highsearchbutton" id="sjglQueryButton" onclick="sjglPageQuery(1);">关联查询</a></td> -->
<!-- 	    		    	  <td ><a href="#" class="addbutton" id="sjglExportButton" onclick='exportSjgl();'>导出</a></td> -->
<!-- 	    		    	  <td ><a href="#" class="addbutton" id="test" onclick='func();'>弹出</a></td> -->
<!-- 	    		    	</tr> -->
<!-- 	    		  	</table> -->
<!-- 	    		  </td> -->
<!-- 	    		</tr> -->
<!-- 	    	</table>  -->
    	
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
</table>

<div id="sjglDetailData" style="width:100%;">
	<table id="sjglDetailTable" width="100%">
	  <thead>
	    <tr>       
	    	<th datafield="sjgl_xm">姓名</th>
	    	<th datafield="sjgl_lxdh">电话号码</th>
	    	<th datafield="sjgl_xxdz">地址</th>
	    	<th>业务类型</th>
	    	<th>类型实际值</th>
	    	<th>预警核实情况</th>
	    	<th>操作</th>
	    </tr>
	  </thead>
	</table>	
</div>

<div id="ljxxDetailData" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;">
</div>

<div id="sjglDetailDetail" class="page-layout" src="#"
		style="top:5px; left:160px; display: none;">
</div>