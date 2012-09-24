<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
	var	tablesX = $("#XtyxqkylData").html();
	var daochuNum_Dryxtj = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var QyjbxxList_Html;
	var QyjbxxListWidth;
	var HsclxxList_Html;
	var HsclxxListWidth;
	var yxqk-jdy-detailid;
	$(document).ready( function() {
		QyjbxxList_Html="business/jdyzagl/jdytjxxQyjbxxList.jsp";
		QyjbxxListWidth="800";
		HsclxxList_Html="";
		HsclxxListWidth="800";
		yxqk-jdy-detailid='jdccjTj_detail';
		
		//*****导出Excel 
		searchLongUrl_Dryxtj="jdccjzagl/queryForExportDryxtj_jdytjxx.action";  //超长参数后台Action对应url
		tabletitle_Dryxtj = "";
		geteExcelHead_Dryxtj("XtyxqkylData");		 
		excelUrl_Dryxtj="jdccjzagl/getExcelCreateDryxtj_jdccjTj.action";
		
		daggleDiv(yxqk-jdy-detailid);
		var currDate = new Date();
		$("#y_jzsj").val(getDate(currDate,"-"));
		currDate.setDate(currDate.getDate()-1);
		$("#y_qssj").val(getDate(currDate,"-"));
		setPageListX(1);
	});

	function setPageListX(pageno, url) {

		$("#XtyxqkylData").html(tablesX);
		createXML("y_");

		var mygrid1 = $("#XtyxqkylTable").ingrid( {
			onRowSelect :null,
			tableid:'XtyxqkylGnrid',
			url :"jdccjzagl/querylistYxtj_jdytjxx.action",
			height :pageHeight - 320,
			pageNumber :pageno,
			ingridPageWidth :mainPageWidthright,
			isPlayResultNull :false,
			ingridPageParams :sXML,
			sumFlag :true,
			sorting :false,
			changeHref:function(table){//若表格无数据，则点击导出不起作用
			if($(table).find("tr").length==0){
				daochuNum_Dryxtj = 0;
			}else{
				daochuNum_Dryxtj = 1;
			}	
			},
			colWidths : [ "30%", "15%", "15%", "20%", "20%" ]

		});

	}

	//展开企业列表	
	function queryQyjbxxList(gxdwdm){
		dataid=gxdwdm;
		detailDialog(yxqk-jdy-detailid, HsclxxListWidth, QyjbxxLQyjbxxListWidthist_Html, null,function(data){
			
		});
	}
	
	//展开寄递业揽件信息
	function queryJdyLjxxList(gxdwdm){
		dataid=gxdwdm;
		detailDialog(yxqk-jdy-detailid, HsclxxListWidth, HsclxxList_Html, null,function(data){
			
		});
	}
	//展开寄递业派件信息
	function queryJdyLjxxList(gxdwdm){
		dataid=gxdwdm;
		detailDialog(yxqk-jdy-detailid, HsclxxListWidth, HsclxxList_Html, null,function(data){
			
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
	
	function setSearchLong_Dryxtj(){
		setParams("y_");
		jQuery.post(searchLongUrl_Dryxtj,params,searchLongBack_Dryxtj,"json");
	}

	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack_Dryxtj(json){  
		//报表标题
		var bbmc="运行情况";
		//报表请求
		setExcelLong_Dryxtj("dryxtjexcel",bbmc);	
	}
	
	function setExcelLong_Dryxtj(excelid,bbmc){
		//setParams("p_");
		var surl=excelUrl_Dryxtj+"?tabletitle="+tabletitle_Dryxtj+"&bbmc="+bbmc;
		//alert(surl);
		surl=encodeURI(surl);
		//surl=encodeURI(surl);
		location.href = surl;
	}
	
	function geteExcelHead_Dryxtj(divid){
		var theadHtml = $("#"+divid).find("table:first").find("thead:first");
		theadHtml.find("td").remove();
		tabletitle_Dryxtj=theadHtml.html();
	}
</script>
		<input type="hidden" id="y_qssj" />
		<input type="hidden" id="y_jzsj" />
		<!-- 管辖单位 -->
		<table width="100%" cellpadding="0" cellspacing="0"
			class="tableborder">
			<tr>
				<td class="queryfont" width='88%'>
					<table>
						<td width="90%">运行情况</td>
						<td width="10%"><a href="#" class="exceldcbutton" onclick='setExportExcel_jdyyxtj();' id="dryxtjexcel">导出</a></td>
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
								<th name="l_wscqyzs" datatype="number" sumflag="1">
									未上传企业数
								</th>
								<th name="l_hsclzs" datatype="number" sumflag="1">
									回收车辆总数
								</th>
							</thead>
						</table>
					</div>
				</td>
			</tr>
		</table>
