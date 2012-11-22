<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html> 
	<head>
		<script type="text/javascript">
	var qyjbxx_requestType=""; //添加、查看、修改
	var qyjbxx_dataid="";
	var qyjbxx_tables = "";
	var qyjbxx_divnid="QyjbxxData";
	var qyjbxx_tableid="QyjbxxTable";
	var qyjbxx_pageUrl="publicsystem/queryQyyyrzList_qyyyrz.action";
	var qyjbxx_detailid="qyyyrz_detail";
	var delid="d_yyrzid";
	var qyjbxx_detailHtml="basic/publicsystem/QyyyrzDetail.jsp";
	var qyjbxx_detailUrl="publicsystem/query_qyyyrz.action";
	var qyjbxx_detailWidth="380";
	var qyjbxx_qycyryHtml="business/Ylfwzagl/Cscx-cyryxxMan-gn.jsp";
	var qyjbxx_qycyryWidth="800";
	var qyjbxx_modHtml="business/Ylfwzagl/Ylcszjztbg.jsp";
	var qyjbxx_modUrl="ylfwzagl/zjztbg_ylcs.action"; 
	var qyjbxx_modUrl1="publicsystem/queryOne_qyjbxx.action"; //只请求娱乐场所信息
	var qyjbxx_modWidth="450";
	var qycx_timeFlag = true;
	
	$(document).ready(function() {
		//导出功能
		tabletitle = "";
		geteExcelHead("QyjbxxData");
	
		qyjbxx_loadPage(qyjbxx_divnid);
		
		$("#p_zabdm").selectBox({code:"dm_zajb(bzhylcs)"});// 娱乐服务场所治安级别
		$("#p_yyztdm").selectBox({code:"dm_yyzt(bzhylcs)"});// 娱乐服务场所状态
		$("#p_zjztdm").selectBox({code:"dm_yyzt"});// 装机状态
		
	//	$("#p_gxdwmc").click(function(){ //治安管理机构
	//		getGxdw("p_gxdwmc","p_gxdwbm");
	//	});
		$("#p_gxdwmc").click(function(){  //治安管理机构
			getGxdwTree("p_gxdwmc","p_gxdwbm",'1');
		});
		

	    // 加载企业主分类
//	    $("#p_qyzflbm").selectBox({code:"dm_ylcsfl(bzh)"});   20110506
	    ///恢复成娱乐业专用，全部相关代码去除
		///hylbLinkQyzfl("p_hylbdm","p_qyzflbm2","J");
	    ///changeZfldm();
	    
	    $("#p_riqif").datepicker();
		$("#p_riqit").datepicker();
	    $("#p_ksyysj").datepicker(true);
		$("#p_jsyysj").datepicker(true);
		daggleDiv("qyyyrz_detail");
		if(dataid.indexOf('tzCsfltjFlag_')>=0){ //标准化台帐跳进来到
			$("#p_qyzflbm").setValue(dataid.replace('tzCsfltjFlag_',''));
			qyjbxx_setPageList(1);
		}
	});
	
	
	$("#p_allhylbdm").selectBoxinhylb({code:"J"});//行业类别
		$("#hylbzfl").click(function(){ 
			var hylbbz=$("#p_allhylbdm").val();
			getHylbzflTree("hylbzfl","p_hylbdm","p_hylb","p_qyzflbm","p_qyzflmc",hylbbz);
		});
	
	function qyjbxx_loadPage(divpageid){
		qyjbxx_tables=$("#"+divpageid).html();
		$("#"+qyjbxx_detailid).hide();
		qyjbxx_setPageList(1,'#');
	}
	function qyjbxx_setList(pageno,url){	
		$("#"+qyjbxx_divnid).html(qyjbxx_tables);	
		createXML("p_");
		if (url==null || url=="undefined"){
			url=qyjbxx_pageUrl;
		}
		return url;
	}
	function qyjbxx_setPageList(pageno,url){	
		if (manVerify()){
			url=qyjbxx_setList(pageno,url);
			var mygrid1 = $("#"+qyjbxx_tableid).ingrid({
										url: url,
										ingridPageParams:sXML,
										height: pageHeight-300,
										pageNumber: pageno,
										
										//thBhuanhKg: false,
										//colClasses: ['grid-col-style2','grid-col-style2'],
										//colIndex: [0,1],
									//	onRowSelect: function(tr, selected){

										//},
										onTdSelect: function(tr){
											$(tr).find("td").click(function(){
												if (sFlag=="true"){
													var tdnum = $(tr).find("td").index(this);
													if(tdnum!=$(tr).find("td").length-1){
														qyhc_setQuery($(tr).attr("id"));
													}
												}else{
													sFlag="true";
												}
											});	
										},
										colWidths: ["10%","12%","10%","7%","10%","7%","11%","11%","12%","7%","7%"]									
									});
		}
	}
	
	function qyjbxx_setPageList_gengxin(){
		qycx_timeFlag = true;
		qyjbxx_setPageList(1);
	}
	function qyhc_setQuery(id){
		if(qycx_timeFlag){
			qycx_timeFlag = false;
			qyjbxx_requestType="detail";
			qyjbxx_dataid=id;
			setWidth(qyjbxx_detailid,qyjbxx_detailWidth);
			setUrl(qyjbxx_detailid,qyjbxx_detailHtml);
			bindDocument(qyjbxx_detailid);
			setTimeout(function(){qycx_timeFlag = true;},1000);
		}
	}
//	function qyjbxx_setDetail(){
//		setParams("q_");
//		jQuery.post(qyjbxx_detailUrl,params,yyrz_updatediv,"json");
//	}
	function qyjbxx_setDetail(id){
		alert();
		dataid=id;
		setWidth(qyjbxx_detailid,qyjbxx_detailWidth);
		setUrl(qyjbxx_detailid,qyjbxx_detailHtml);
		bindDocument(qyjbxx_detailid);
	}

	function qyhc_setCongye(id){ //从业人员
		if(qycx_timeFlag){
			qycx_timeFlag = false;
			qyjbxx_dataid=id;
			setWidth(qyjbxx_detailid,qyjbxx_qycyryWidth);
			setUrl(qyjbxx_detailid,qyjbxx_qycyryHtml);
			bindDocument(qyjbxx_detailid);
			setTimeout(function(){qycx_timeFlag = true;},800);
		}
	}
	function qycx_setWidth(divid,sWidth){
		$("#"+divid).css("width",sWidth+"px");
		$("#"+divid).css("left","0px");
	}
	function manVerify(){
		if (!checkControlValue("p_qymc","String",1,120,null,0,"场所名称"))
			return false;
		if (!checkControlValue("p_gxdwmc","String",1,60,null,0,"治安管理机构名称"))
			return false;
		if (!checkControlValue("p_qybm","String",1,20,null,0,"场所备案编码"))
			return false;
		if (!checkControlValue("p_zjbh","String",1,60,null,0,"营业执照号"))
			return false;
		if(!checkTwoDateEarlier($("#p_riqif").val(),$("#p_riqit").val())){
			jAlert("登记日期必须小于登记日期至！","验证信息",null,"p_riqif");
			return false;
		}
		
		var ksyysj = $("#p_ksyysj").attr("value");
		var jsyysj = $("#p_jsyysj").attr("value");

		
		ksyysj = new Date(ksyysj.replace(/-/g, "/")); 
		jsyysj = new Date(jsyysj.replace(/-/g, "/")); 
		if (Date.parse(ksyysj) - Date.parse(jsyysj)<=0) { 
			if((Date.parse(jsyysj) - Date.parse(ksyysj))/1000/60/60>24){
				jAlert("营业结束时间不能超过营业开始时间一天!","提示信息");
				return false;
			} 
		}
		else if (Date.parse(ksyysj) - Date.parse(jsyysj)>=0) {
			jAlert("营业开始时间必须小于营业结束时间！","验证信息",null,"p_ksyysj");
		return false;
		}
		return true;
	}
	function gaojichaxun_qycx(){
		gaojichaxun("44,46",qyjbxx_detailid,"qyjbxx_setPageList");
	}
	
	function ylcshc_setCongye(id){ //从业人员
		if(qycx_timeFlag){
			qycx_timeFlag = false;
			qyjbxx_dataid=id;
			setWidth(qyjbxx_detailid,qyjbxx_qycyryWidth);
			setUrl(qyjbxx_detailid,qyjbxx_qycyryHtml);
			var qyjbxx_detailidOffset = $("#"+qyjbxx_detailid).offset();
			qyjbxx_detailidTopOffset=qyjbxx_detailidOffset.top;
			qyjbxx_detailidLeftOffset=qyjbxx_detailidOffset.left;
			bindDocument(qyjbxx_detailid);
			setTimeout(function(){qycx_timeFlag = true;},800);
		}
	}
	
	function ylcshc_setYyrz(id){ //营业日志页面加载
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,"760");
		setUrl(qyjbxx_detailid,"basic/publicsystem/QyyyrzManlist.jsp");
		bindDocument(qyjbxx_detailid);
	}
	function ylcshc_setSkjl(id){ //刷卡记录
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,'990');
		setUrl(qyjbxx_detailid,"basic/icksystem/QyryskjlMan-ga.jsp");
		bindDocument(qyjbxx_detailid);
	}
	function ylcshc_setZjzt(id){ //装机状态
		qyjbxx_dataid=id;
		setWidth(qyjbxx_detailid,qyjbxx_modWidth);
		setUrl(qyjbxx_detailid,qyjbxx_modHtml);
		//var qyjbxx_detailidOffset = $("#"+qyjbxx_detailid).offset();
		//qyjbxx_detailidTopOffset=qyjbxx_detailidOffset.top;
		//qyjbxx_detailidLeftOffset=qyjbxx_detailidOffset.left;
		bindDocument(qyjbxx_detailid);
	}
	
	function qyjbxx_zjztsetDetail(){
		setParams("q_");
		jQuery.post(qyjbxx_modUrl1,params,qyjbxx_zjztupdatediv,"json");
	}
	
	function qyjbxx_zjztbg(){ //装机状态变更
		if (qyjbxx_zjztmodifyVerify()){
			setParams("m_");
			jQuery.post(qyjbxx_modUrl,params,qyjbxx_zjztbgback,"json"); 
		}
	}
	function qyjbxx_zjztbgback(json){
		if  (json.result=="success"){
			jAlert('操作成功','保存信息');
			qyjbxx_setPageList_gengxin(1);
			$("#"+qyjbxx_detailid).hideAndRemove("slow"); 
		}else{
			jAlert(json.result,'错误信息');
		}
	}
	//服务场所筛选框
	$("#p_qymc").click(function(){
	 	dataid="J";
		getTy_item_super("p_qymc","p_qybm",'','','','1');
	});

	
	
	var excelUrl="publicsystem/excelCreateQyyyrz_qyyyrz.action";
	var searchLongUrl="publicsystem/excelCreateQyyyrzTemp_qyyyrz.action";
	
	/*
	不分页传参数将结果集返回，用于长参数导出前的查询
	*/
	function setSearchLongQyxx(){
		setParams("p_");
		jQuery.post(searchLongUrl,params,searchLongBack,"json");
	}
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){
		//报表标题
		var bbmc="营业日志信息";
		//报表请求
		setExcelLong("gadExlQyjbxxs",bbmc);
	}
	/*setExcel 生成EXCEL,不传参数，防止超长
	 * excelid 链接id
	 * bbmc：报表标题
	 */
	function setExcelLong(excelid,bbmc){
		var surl=excelUrl+"?tabletitle="+tabletitle+"&bbmc="+bbmc;
		surl=encodeURI(surl);
		location.href = surl;
	}
</script>

	</head>
	<body>
		<input type="hidden" id="d_yyrzid" value="">
		<input type="hidden" id="p_yyrzid" value="">


		<input type="hidden" id="p_gxdwbm" value="" />
		<input type="hidden" id="p_jjlxbm" value="" />

		<input type="hidden" id="p_hylbdm" value="">
		<!-- xxb add 20110506 -->
		<input type="hidden" id="p_hylb" value="">
		<!-- xxb add 20110506 -->
		<table width="100%" cellpadding="0" cellspacing="0"
			class="tableborder">
			<tr>
				<td class="queryfont">
					营业日志查询
				</td>
			</tr>
			<tr>
				<td class="tdbg">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="11%" class="pagedistd">
								行业类别
							</td>
							<td width="22%" class="pagetd">
								<select type="select" id="p_allhylbdm" value="">
								</select>
							</td>
							<td width="11%" class="pagedistd">
								治安管理机构
							</td>
							<td width="22%" class="pagetd">
								<input type="text" id="p_gxdwmc" class="inputstyle" value=""
									readonly="readonly">
							</td>
							<td width="11%" class="pagedistd">
								场所名称
							</td>
							<td class="pagetd" width="22%">
								<input type="hidden" id="p_qybm" />
								<input type="text" class="inputstyle" id="p_qymc" readonly />
							</td>
						</tr>
						<tr>
							<td class="pagedistd">
								法人姓名
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle" id="p_frdb" value="">
							</td>
							<td class="pagedistd">
								经营地址
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle" id="p_jydz" value="">
							</td>
							<td class="pagedistd">
								营业执照号
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle" id="p_zjbh" value="">
							</td>
						</tr>
						<tr>
							<td class="pagedistd">
								场所状态
							</td>
							<td class="pagetd">
								<select id="p_yyztdm">
									<option></option>
								</select>
							</td>
							<td class="pagedistd">
								装机状态
							</td>
							<td class="pagetd">
								<select id="p_zjztdm">
									<option></option>
								</select>
							</td>
							<td class="pagedistd">
								场所治安级别
							</td>
							<td class="pagetd">
								<select id="p_zabdm">
									<option></option>
								</select>
							</td>
						</tr>

						<tr>
							<td class="pagedistd">
								登记日期
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle1" id="p_riqif"
									readonly="readonly">
								至
								<input type="text" class="inputstyle1" id="p_riqit"
									readonly="readonly">
							</td>

							<td class="pagedistd">
								营业时间
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle" id="p_ksyysj"
									readonly="readonly" width="30">
							</td>
							<td class="pagedistd">
								至
							</td>
							<td class="pagetd">
								<input type="text" class="inputstyle" id="p_jsyysj"
									readonly="readonly" width="30">
							</td>
							

						</tr>
						<tr>
							<td colspan="6">
								<table border="0" align="right" cellpadding="0" cellspacing="0">
									<tr>
										<td width="62px">
											<a href="#" class="searchbutton" id="querys"
												onClick="qyjbxx_setPageList(1);">查询</a>
										</td>
										<td width="92px">
											<a href="#" class="submitbutton"
												onClick="setSearchLongQyxx()" title="导出查询结果"
												id="gadExlQyjbxxs">导出</a>
										</td>
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
		<div id="qyyyrz_detail" class="page-layout" src="#"
			style="top:180px; left:160px;">
		</div>	
		<div id="QyjbxxData" style="width: 100%;">
			<table id="QyjbxxTable" width="100%">
				<thead>
					<tr>
						<th name="l_qybm" datatype="string" sumflag="0">
							场所备案编号
						</th>
						<th name="l_qymc" datatype="string" sumflag="0">
							场所名称
						</th>
						<th name="l_qyzflmc" datatype="string" sumflag="0">
							场所类别
						</th>
						<th name="l_yyztmc" datatype="string" sumflag="0">
							场所状态
						</th>
						<th name="l_zjztmc" datatype="string" sumflag="0">
							装机状态
						</th>
						<th name="l_zajbmc" datatype="string" sumflag="0">
							治安级别
						</th>
						<th name="l_riqi" datatype="string" sumflag="0">
							登记日期
						</th>
						<th name="l_ksyysj" datatype="string" sumflag="0">
							营业开始时间
						</th>
						<th name="l_jsyysj" datatype="string" sumflag="0">
							营业结束时间
						</th>
						<th name="l_sffsaj" datatype="string" sumflag="0">
							治安、刑事或事故
						</th>
						<th name="l_sfglbmjc" datatype="string" sumflag="0">
							管理部门检查
						</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>