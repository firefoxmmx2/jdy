<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>
<script type="text/javascript">
	var	tablesX = $("#XtyxqkylData").html();
	var daochuNum_Dryxtj = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var QyjbxxList_Html;
	var QyjbxxListWidth;
	var jdyxxList_Html;
	var jdyxxListWidth;
	var yxqk_jdy_detailid;
	var searchUrl_jdytjxx;
	var currentGxdwbm = '<%=gxdwbm%>';
	var myTableDataBmXxtz="";
	var xgd="";
	//------物品类别分类展示所添加
	var jdytjxx_wp_queryTable;
	var jdytjxx_pageUrl;
	var jdytjxx_divnid;
	var jdytjxx__table_id;
	var jdytjxx_tabletitle;
	var jdytjxx_excel_url;
	var jdytjxx_tables;
	var myTableDataBmXxtzh="";
	$(document).ready( function() {
		QyjbxxList_Html="business/jdyzagl/jdytjxxQyjbxxList.jsp";
		QyjbxxListWidth="1000";
		jdyxxList_Html = "business/jdyzagl/qyljpjqktj-tz.jsp";
		jdyxxListWidth="800";
		yxqk_jdy_detailid='jdccjTj_detail';
		
		//*****导出Excel 
		searchUrl_jdytjxx="jdccjzagl/queryForExportJdyxtj_jdytjxx.action";  //超长参数后台Action对应url
		
		daggleDiv(yxqk_jdy_detailid);
		var currDate = new Date();
		$("#y_jzsj").val(getDate(currDate,"-"));
		currDate.setDate(currDate.getDate()-1);
		$("#y_qssj").val(getDate(currDate,"-"));
		
		$("#yxqklb").hide();//隐藏运行情况列表
		$("#jdytjxx_data_wp_div").hide();//隐藏物品类别显示列表
		$("#jdytjxx_tx_div").hide();//隐藏运行情况图形
		$("#dryxtjexcel").hide();//默认隐藏导出按钮
		xgd=document.body.clientHeight-pageHeight/2-90;
		
		
		wpfltj_loadPage("jdytjxx_table_wp");
		setPageListX(1);//运行情况查询函数
	});

	function setPageListX(pageno, url) {
		$("#XtyxqkylData").html(tablesX);
		createXML("y_");
		var params = getYxqkQueryParams();
		var mygrid1 = $("#XtyxqkylTable").ingrid( {
			onRowSelect :null,
			tableid:'XtyxqkylGnrid',
			url :"jdy/querylistYxqk_jdytjxx.action",
			height :pageHeight/2-140,
			pageNumber :pageno,
			ingridPageWidth :1000,
			isPlayResultNull :false,
			ingridPageParams :sXML,
			ingridExtraParams:params,
			sorting :false,
			ingridComplete:function(){
				$('#XtyxqkylData tbody tr').each(function(idx){
					var tr = $(this);
					//企业总数列表
					tr.find('td:nth(1)').click(function(){
						var id = tr.attr("id");
						if(idx==0){
							id = rrTrim(currentGxdwbm,'00');
						}
						queryQyjbxxList(id);
					});
					
					//装机企业查询
					tr.find("td:nth(2)").click(function(){
						var id = tr.attr("id");
						if(idx==0){
							id = rrTrim(currentGxdwbm,'00');
						}
						queryQyjbxxList(id,'1');
					});
					
					//昨日揽件派件情况
					tr.find("td").slice(4,6).click(function(){
						var id = tr.attr("id");
						if(idx==0){
							id = rrTrim(currentGxdwbm,'00');
						}
						queryJdyLjxxList(id);
					});
					
					//昨日未上传企业情况
					tr.find("td:nth(6)").click(function(){
						var id = tr.attr("id");
						if(idx==0){
							id = rrTrim(currentGxdwbm,'00');
						}
						queryQyjbxxList(id,null,true);
					});
					
				});
			},
			changeHref:function(table){
            	try{
            		myTableDataBmXxtz=null;
                	var $chart_table = $(table).clone();
                	myTableDataBmXxtz= $(tablesX).clone().append($chart_table.find('tbody').html());
					if(myTableDataBmXxtz){
						displayWpflTjImage();
					}else{
						$('#jdytjxx_tx_div').text('没有统计数据');
					}
            	}catch(e){
            		$('#jdytjxx_tx_div').text('没有统计数据');
            	}
        	},
			colIndex:[1,2,4,5,6],
			colWidths : [ "30%", "11.6%", "11.6%", "11.6%", "11.6%","11.6%","11.6%"]
		});

	}
	/**
	 * 运行情况统计图
	 */
	function displayWpflTjImage(){
		$("#jdytjxx_tx_div").empty();
		$('<div id="jdytjxx_tx_bar" style="float:left;"></div>').appendTo("#jdytjxx_tx_div");
		$('<div id="jdytjxx_tx_pie" style="float:right;"></div>').appendTo('#jdytjxx_tx_div');
		if(myTableDataBmXxtz!=null&&myTableDataBmXxtz!=""){
			$("#jdytjxx_tx_bar").fusionChart({
				prefix:'ddd',
				type:'bar',
				columns:[1],
				data:myTableDataBmXxtz,
				title:'运行情况',
				width:505,
				height:xgd,//pageHeight-390,
				isTotal:true
			});
			$("#jdytjxx_tx_pie").fusionChart({
				prefix:'ddd',
				type:'pie',
				columns:[1],
				data:myTableDataBmXxtz,
				title:'运行情况',
				width:505,
				height:xgd,
				isTotal:true
			});
			
		}
	}
	//展开企业列表	
	function queryQyjbxxList(gxdwbm,zjztdm,isWscqycx){
		var params = {};
		if(gxdwbm == '')
			gxdwbm = currentGxdwbm
		params['gxdwbm'] = gxdwbm;
		if(zjztdm)
			params.zjztdm = zjztdm;
		detailDialog(yxqk_jdy_detailid, QyjbxxListWidth, QyjbxxList_Html, params,function(data){
			if(isWscqycx){
				querylistQyjbxxtz(1,'jdy/querylistWscqycx_jdytjxx.action');
				exportExcelWscqyqk = function(){
					var url = "jdy/exportExcelWscqy_jdytjxx.action";
					var params = getWscqyParams();
					var form = $('<form></form>').attr("action",url)
									.attr("target","_blank")
									.append("<input type='hidden' name='qyjbxx.gxdwbm' value='"+params['qyjbxx.gxdwbm']+"'>")
									.append("<input type='hidden' name='qyjbxx.hylbdm' value='"+params['qyjbxx.hylbdm']+"'>")
									.append("<input type='hidden' name='qyjbxx.zjztdm' value='"+params['qyjbxx.zjztdm']+"'>")
									.append("<input type='hidden' name='qyjbxx.scbz' value='"+params['qyjbxx.scbz']+"'>")
									.appendTo('body');
					form.submit();
					
					form.remove();
				};
				
				$('<div><a onclick="exportExcelWscqyqk();" class="exceldcbutton" href="#">导出</a></div>').css('padding-left','85%').insertAfter('#'+qyjbxxlist_div);
			}
			else{
				querylistQyjbxxtz(1,'jdy/querylistQyjbxx_jdytjxx.action');
			}
		});
	}
	
	//展开寄递业揽件派件信息
	function queryJdyLjxxList(gxdwbm){
		var params = {};
		if(gxdwbm == '')
			gxdwbm = currentGxdwbm
		params.gxdwbm = gxdwbm;
		detailDialog(yxqk_jdy_detailid, jdyxxListWidth, jdyxxList_Html,params,function(data){
			
		});
	}
	
	//导出Excel
	function setExportExcel_jdyyxtj(){
		var url = "jdy/exportExcelYxqk_jdytjxx.action";
		var params = getYxqkQueryParams();
		var form = $('<form></form>').attr("action",url)
						.attr("target","_blank")
						.append("<input type='hidden' name='gxdwbm' value='"+params.gxdwbm+"'>")
						.append("<input type='hidden' name='departlevel' value='"+params.departlevel+"'>")
						.appendTo('body');
		form.submit();
		
		form.remove();
	}

	function closeYxqkDetailDialog(){
		$('#'+yxqk_jdy_detailid).hideAndRemove("show");		
	}
	
	function getYxqkQueryParams(){
		return {'gxdwbm':'<%=gxdwbm%>','departlevel':'<%=departlevel%>'};
	}
	//辖区内物品分类统计
	function wpfltj_loadPage(divpageid){
		jdytjxx_pageUrl="jdy/queryJdyWpfltj_jdytjxx.action";
		jdytjxx_divnid="jdytjxx_data_wp_div";
		jdytjxx__table_id="jdytjxx_table_wp";
		jdytjxx_tabletitle="物品分类统计";
		jdytjxx_excel_url="jdy/exportJdyWpfltj_jdytjxx.action";
		if(!jdytjxx_wp_queryTable)
			jdytjxx_wp_queryTable=$("#"+jdytjxx__table_id);
		jdytjxx_tables=$("#"+divpageid).html();
		wpfltj_page_query(1,'#');
		myTableDataBmXxtz=null;
	}
	/**
	 * 物品分类排名查询
	 */
	function wpfltj_page_query(pageno,url){
		if (true){
			var aybmxxtj_gxdwbm=$("#jdytjxx_gxdwbm").val();
			if(aybmxxtj_gxdwbm==''||aybmxxtj_gxdwbm==null){
				$("#jdytjxx_gxdwbm").val(<%=gxdwbm%>);
				$("#jdytjxx_departlevel").val(<%=departlevel%>);
			} 
			if($('#'+jdytjxx__table_id).length == 0){
				$('#'+jdytjxx_divnid).html(jdytjxx_wp_queryTable);
			}
			url=jdytjxx_pageUrl;
			params.show_number = undefined;
			var mygrid1 = $("#"+jdytjxx__table_id).ingrid({
											paging:false,	 
											url: url,	
											height: pageHeight-263,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
	                                        onRowSelect:null,
	                                        changeHref:function(table){
	                                        	try{
	                                        		myTableDataBmXxtzh=null;
	    	                                    	var $chart_tableh = $(table).clone();
	    	                                    	myTableDataBmXxtzh= $(jdytjxx_wp_queryTable).clone().append($chart_tableh.find('tbody').html()).hide();
	    	                                    	if(myTableDataBmXxtzh)
	    												displayWpflTjImageh();
													else
														$('#jdytjxx_tx_divh').text('没有统计数据');
	                                        	}catch(e){
	                                        		$('#jdytjxx_tx_divh').text('没有统计数据');
	                                        	}
	                                    },
											pageNumber: pageno,
											sorting: false,
											isPlayResultNull:false,
											colWidths: ["50%","50%"]									
										});				
			}
	}	
	/**
	 * 物品分类统计图
	 */
	function displayWpflTjImageh(){
		$("#jdytjxx_tx_divh").empty();
		$('<div id="jdytjxx_tx_barh" style="float:left;"></div>').appendTo("#jdytjxx_tx_divh");
		$('<div id="jdytjxx_tx_pieh"></div>').appendTo('#jdytjxx_tx_divh');
		
		if(myTableDataBmXxtzh!=null&&myTableDataBmXxtzh!=""){
			$("#jdytjxx_tx_barh").fusionChart({
				prefix:'dddd',
				type:'bar',
				columns:[1],
				data:myTableDataBmXxtzh,
				title:jdytjxx_tabletitle,
				width:505,
				height:xgd,//pageHeight-390,
				isTotal:true
			});
			$("#jdytjxx_tx_pieh").fusionChart({
				prefix:'dddd',
				type:'pie',
				columns:[1],
				data:myTableDataBmXxtzh,
				title:jdytjxx_tabletitle,
				width:505,
				height:xgd,
				isTotal:true
			});
			
		}
	}
	//判断图标展示和列表展示
	function tbzslbzs1(){
    	$("#yxqklb").hide();//隐藏运行情况列表
    	$("#jdytjxx_tx_divh").hide();//隐藏物品分类图形
    	$("#jdytjxx_tx_div").show();//显示运行情况图形
    	$("#dryxtjexcel").show();//显示运行情况导出按钮
    	
	}
	//判断图标展示和列表展示
	function tbzslbzs2(){
    	$("#jdytjxx_tx_div").hide();//隐藏运行情况图形
    	$("#jdytjxx_tx_divh").hide();//隐藏物品分类图形
    	$("#yxqklb").show();//显示列表
    	$("#dryxtjexcel").show();//显示运行情况导出按钮
	}
	//判断图标展示和列表展示
	function tbzslbzs3(){
    	$("#yxqklb").hide();//隐藏运行情况列表
    	$("#jdytjxx_tx_div").hide();//隐藏运行情况图形
    	$("#dryxtjexcel").hide();//隐藏运行情况导出按钮
    	$("#jdytjxx_tx_divh").show();//显示物品分类图形
	}
</script>
		<input type="hidden" id="y_qssj" />
		<input type="hidden" id="y_jzsj" />
		<!-- 管辖单位 -->
		<table width="100%" cellpadding="0" cellspacing="0"
			class="tableborder">
			<tr>
				<td class="queryfont" width='88%'>
					<table width="100%" cellpadding="0" cellspacing="0">
						<td width="90%">&nbsp;
						<label><input type="radio" name="chartType" id="chartType3" onclick="tbzslbzs3()" value="3" checked="checked">物品分类统计</label>
						<label><input type="radio" name="chartType" id="chartType1" onclick="tbzslbzs1()" value="1">运行情况:图表</label>
						<label><input type="radio" name="chartType" id="chartType2" onclick="tbzslbzs2()" value="2">运行情况:列表展示</label>
						</td>
						<td width="10%"><a href="#" class="exceldcbutton" onclick='setExportExcel_jdyyxtj();' id="dryxtjexcel">导出</a></td>
					</table>
				</td>
			</tr>
			<tr id="yxqklb">
				<td class="tdbg">
					<div id="XtyxqkylData" style="width: 100%;">
						<table id="XtyxqkylTable" width="100%">
							<thead>
							<tr>
								<th name="l_gxdwmc" datatype="string" sumflag="0">
									公安机关
								</th>
								<th name="l_qyzs" datatype="number" sumflag="1">
									企业总数
								</th>
								<th name="l_zjzs" datatype="number" sumflag="1">
									装机总数
								</th>
								<th name="l_hsclzs" datatype="number" sumflag="1">
									从业人员数
								</th>
								<th name="l_hsclzs" datatype="number" sumflag="1">
									昨日揽件数
								</th>
								<th name="l_hsclzs" datatype="number" sumflag="1">
									昨日派件数
								</th>
								<th name="l_wscqyzs" datatype="number" sumflag="1">
									昨日未上传企业数
								</th>
<!-- 								<th> -->
<!-- 									机构级别 -->
<!-- 								</th> -->
								</tr>
							</thead>
						</table>
					</div>
				</td>
			</tr>
		</table>
<%--物品分类统计数据表格--%>
<div id="jdytjxx_data_wp_div" style="width: 100%;" class="listdata">
	<table id="jdytjxx_table_wp" width="100%">
				<thead>
  				<tr>       
   					<th name="l_wpzlmc" datatype="String" sumflag="0">物品种类</th>
   					<th name="l_cs" datatype="Integer" sumflag="0">数目</th>
  				</tr>
				</thead>
	</table>	
</div>
<div id="jdccjTj_detail"  class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>
<div>
	<div id="jdytjxx_tx_div"></div>
</div>
<div>
	<div id="jdytjxx_tx_divh"></div>
</div>