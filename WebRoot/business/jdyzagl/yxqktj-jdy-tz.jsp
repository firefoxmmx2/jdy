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
	
	$(document).ready( function() {
		QyjbxxList_Html="business/jdyzagl/jdytjxxQyjbxxList.jsp";
		QyjbxxListWidth="800";
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
		setPageListX(1);
	});

	function setPageListX(pageno, url) {

		$("#XtyxqkylData").html(tablesX);
		createXML("y_");

		var params = {'gxdwbm':'<%=gxdwbm%>','departlevel':'<%=departlevel%>'};
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
						queryQyjbxxList(tr.attr('id'));
					});
					
					//装机企业查询
					tr.find("td:nth(2)").click(function(){
						queryQyjbxxList(tr.attr("id"),'1');
					});
					
					//昨日揽件派件情况
					tr.find("td").slice(4,6).click(function(){
						var id = tr.attr("id");
						if($('#XtyxqkylData tbody tr').index(this)==0){
							while(/00$/.exec(id)){
								id = id.replace(/00$/,'','g');
							}
						}
						queryJdyLjxxList(id);
					});
					
					tr.find("td:nth(6)").click(function(){
						var id = tr.attr("id");
						if($('#XtyxqkylData tbody tr').index(this)==0){
							while(/00$/.exec(id)){
								id = id.replace(/00$/,'','g');
							}
							
							queryQyjbxxList(id,null,true);
						}
					});
				});
			},
			colIndex:[1,2,4,5,6],
			colWidths : [ "30%", "11.6%", "11.6%", "11.6%", "11.6%","11.6%","11.6%"]
		});

	}

	//展开企业列表	
	function queryQyjbxxList(gxdwbm,zjztdm,isWscqycx){
		var params = {};
		if(gxdwbm == '')
			gxdwbm = currentGxdwbm
		params['gxdwbm'] = gxdwbm;
		if(zjztdm)
			params.zjztdm = zjztdm;
		
		detailDialog(yxqk_jdy_detailid, jdyxxListWidth, QyjbxxList_Html, params,function(data){
			if(isWscqycx){
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
  		if(daochuNum_Dryxtj==1){
			setSearchLong_Dryxtj(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出

	  	}else{
	  		alert('无查询结果不能导出！');
	  	}		
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
						<td width="90%">&nbsp;</td>
<!-- 						<td width="10%"><a href="#" class="exceldcbutton" onclick='setExportExcel_jdyyxtj();' id="dryxtjexcel">导出</a></td> -->
					</table>
				</td>
			</tr>
			<tr>
				<td class="tdbg">
					<div id="XtyxqkylData" style="width: 100%;">
						<table id="XtyxqkylTable" width="100%">
							<thead>
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
							</thead>
						</table>
					</div>
				</td>
			</tr>
		</table>
<div id="jdccjTj_detail"  class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>