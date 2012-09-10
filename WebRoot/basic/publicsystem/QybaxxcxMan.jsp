<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
	var ylcsjbxx_detailidTopOffset=0;
	var ylcsjbxx_detailidLeftOffset=0;
	var ylcsjbxx_requestType=""; //添加、查看、修改
	var ylcsjbxx_dataid="";
	var ylcsjbxx_tables = "";
	var ylcsjbxx_divnid="tabledata";
	var ylcsjbxx_tableid="table1";
	var ylcsjbxx_pageUrl="publicsystem/queryCsbeianList_qybaxx.action";
	var ylcsjbxx_detailid="ylcsjbxx_detail";
	var ylcsjbxx_detailHtml="basic/publicsystem/QyjbxxDetail.jsp";
	var ylcsjbxx_detailUrl="publicsystem/query_qyjbxx.action";
	var ylcsjbxx_detailWidth="990";
	var ylcsjbxx_csbeianHtml="basic/publicsystem/QybaxxMan.jsp";
	var ylcsjbxx_cscyryWidth="840";
	var qyjbxx_dataid="";
	var dangQianHylbdm="";
	var qyjbxx_requestType="";
	$(document).ready(function() {
		ylcsjbxx_loadPage("tabledata");
		//$("#manbq_ylcsfl").selectBox({code:"dm_ylcsfl"});
		$("#manbq_yyzt").selectBox({code:"dm_yyzt(bzhylcs)"});
		$("#manbq_relation").selectBox({state:"temp",width:"80px"});
		$("#p_gxdwmc").click(function(){ //管辖单位
//			getGxdw("p_gxdwmc","p_gxdwbm");
			getGxdwTree("p_gxdwmc","p_gxdwbm",'1');
		});
//		 hylbLinkQyzfl("p_hylbdm","p_qyzflbm2","J");
//		changeZfldm();
//		setHangYeTitle();
//	 	$("#p_hylbdm").selectBoxhylb();//行业类别	
		
		$("#hylbzfl").bind('propertychange',function(){setHangYeTitle();});
		
		 daggleDiv("ylcsjbxx_detail");
		 
	});
	function changeZfldm(){//更改主分类代码
		if($('#p_hylbdm').val()=='K'){
			$('#div_p_qyzflbm2').hide();
			$('#p_qyzflbm').val('');
			$('#p_qyzflmc').show();
			$('#p_qyzflmc').click(function(){
				getrylbTree("p_qyzflmc","p_qyzflbm","dm_cslb");
			});
		}else{
			$('#div_p_qyzflbm2').show();
			$('#p_qyzflbm').val('');
			$('#p_qyzflmc').val('');
			$('#p_qyzflmc').hide();
			//hylbLinkQyzfl("p_hylbdm","p_qyzflbm2");
		}
	}
	function mancsflOnchange(){ //企业分类
		var csflkey = $("#manbq_ylcsfl").attr("value");
		$("#p_qyzflbm").attr("value",csflkey);
	}
	function mancsztOnchange(){ //营业状态
		var csztkey = $("#manbq_yyzt").attr("value");
		$("#p_yyztdm").attr("value",csztkey);
	}
	function relationChange(){ //大于等于
		var relation = $("#manbq_relation").attr("value");
		$("#p_relation").attr("value",relation);
	}
	function ylcsjbxx_loadPage(divpageid){
		ylcsjbxx_tables=$("#"+divpageid).html();
		$("#"+ylcsjbxx_detailid).hide();
		ylcsjbxx_setPageList(1,'#');
	}
	function ylcsjbxx_setList(pageno,url){	
		$("#"+ylcsjbxx_divnid).html(ylcsjbxx_tables);	
		createXML("p_");
		if (url==null || url=="undefined"){
			url=ylcsjbxx_pageUrl;
		}
		return url;
	}
	function ylcsjbxx_setPageList(pageno,url){	
		if (manVerify()){
			url=ylcsjbxx_setList(pageno,url);
			var mygrid1 = $("#"+ylcsjbxx_tableid).ingrid({ 
										tableid:'table1',
										url: url,
										ingridPageParams:sXML,
										height: pageHeight-258,
										pageNumber: pageno,
										//colClasses: ['grid-col-style2','grid-col-style2'],
										//colIndex: [0,1],
										onRowSelect: function(tr, selected){
										},
										onTdSelect: function(tr){
											$(tr).find("td").click(function(){
												if (sFlag=="true"){
													var tdnum = $(tr).find("td").index(this);
													if(tdnum!=$(tr).find("td").length-1){
														ylcshc_setQuery($(tr).attr("id"));
													}
												}else{
													sFlag="true";
												}
											});	
										},
										noSortColIndex:[7],
										colWidths: ["19%","10%","25%","6%","16%","7%","15%","7%"]									
									});				
		}
	}
	var csbn_timeFlag = true;
	function ylcshc_setQuery(id){
		if(csbn_timeFlag){
			csbn_timeFlag = false;
			ylcsjbxx_requestType="detail";
			qyjbxx_requestType="detail";
			qyjbxx_dataid=id;
			setWidth(ylcsjbxx_detailid,ylcsjbxx_detailWidth);
			setUrl(ylcsjbxx_detailid,ylcsjbxx_detailHtml);
			//var ylcsjbxx_detailidOffset = $("#"+ylcsjbxx_detailid).offset();
			//ylcsjbxx_detailidTopOffset=ylcsjbxx_detailidOffset.top;
			//ylcsjbxx_detailidLeftOffset=ylcsjbxx_detailidOffset.left;
			bindDocument(ylcsjbxx_detailid);
			setTimeout(function(){csbn_timeFlag = true;},1000);
		}
	}
	function ylcsjbxx_setDetail(){
		setParams("q_");
		jQuery.post(ylcsjbxx_detailUrl,params,ylcsjbxx_updatediv,"json");
	}
	
	$("#p_allhylbdm").selectBoxinhylb(); 
		$("#hylbzfl").click(function(){ 
			var hylbbz=$("#p_allhylbdm").val();
			getHylbzflTree("hylbzfl","p_hylbdm","p_hylb","p_qyzflbm","p_qyzflmc",hylbbz);
		});
		
		
	function ylcsba_setBeian(id){ //备案
		if(csbn_timeFlag){
			csbn_timeFlag = false;
			ylcsjbxx_dataid=id;
			setWidth(ylcsjbxx_detailid,ylcsjbxx_cscyryWidth);
			setUrl(ylcsjbxx_detailid,ylcsjbxx_csbeianHtml);
			bindDocument(ylcsjbxx_detailid);
			setTimeout(function(){csbn_timeFlag = true;},1000);
		}
	}
	function csba_setWidth(divid,sWidth){
		$("#"+divid).css("width",sWidth+"px");
		$("#"+divid).css("left","0px");
	}
	function manVerify(){
		return true;
	}
	function gaojichaxun_csba(){
		gaojichaxun("44,46",ylcsjbxx_detailid,"ylcsjbxx_setPageList");
	}
	
	function setHangYeTitle(){
		dangQianHylbdm = $("#p_hylbdm").val();
		if(dangQianHylbdm=="J"||dangQianHylbdm=="K"){
			$("#td_baqycxTitle").text("备案场所查询");
			$("#qyfl").text("场所分类");
			$("#td_qybm").text("场所编码");
			$("#td_qymc").text("场所名称");
			ylcsjbxx_tables = ylcsjbxx_tables.replace(new RegExp("企业","gm"),"场所");
			$("#table1").find("th[name='l_csbm']").find("div").text("场所编码");
			$("#table1").find("th[name='l_csmc']").find("div").text("场所名称");
			$("#table1").find("th[name='l_cszflmc']").find("div").text("场所类别");   
		}else{
			$("#td_baqycxTitle").text("备案企业查询");
			$("#qyfl").text("企业分类");
			$("#td_qybm").text("企业编码");
			$("#td_qymc").text("企业名称");
			ylcsjbxx_tables = ylcsjbxx_tables.replace(new RegExp("场所","gm"),"企业");
			$("#table1").find("th[name='l_csbm']").find("div").text("企业编码");
			$("#table1").find("th[name='l_csmc']").find("div").text("企业名称");
			$("#table1").find("th[name='l_cszflmc']").find("div").text("企业类别");   
		}
	}
	
	function setXuanZeHylbdm(){
		setHangYeTitle();
		changeZfldm();
	}
	
	//服务场所筛选框
	$("#p_qymc").click(function(){
	// 	dataid="J";
		var hylbbz=$('#p_allhylbdm').val();
		dataid=$('#p_hylbdm').val();
		getTy_item_super("p_qymc","p_qybm",'',"kcyzx",'','1','','',hylbbz);
	});
</script>

</head>
<body>
<input type="hidden"  id="p_qyzflbm" >

<input type="hidden" id="p_hylbdm" value="">   <!-- xxb add 20110506 --> 
<input type="hidden" id="p_hylb" value="">   <!-- xxb add 20110506 --> 
<input type="hidden" id="p_qyzflmc" value=""> <!-- xxb add 20110506 --> 
<div style="display:none;"><select id="p_allhylbdm"></select></div> <!-- xxb add 20110506 -->

<input type="hidden" id="d_csflid" value="">
<input type="hidden" id="p_yyztdm" value=""/>
<input type="hidden" id="p_zabdm" value=""/>
<input type="hidden" id="p_gxdwbm" value=""/>
<input type="hidden" id="p_relation" value=""/>
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont" id="td_baqycxTitle">备案企业查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
				 	<td width="11%" class="pagedistd">场所分类</td>
					<td width="22%" class="pagetd" >
<!--					<select  id="p_hylbdm" onchange="setXuanZeHylbdm();"></select>-->
						<input type="text" id="hylbzfl" class="inputstyle" value="" readonly="readonly">
					</td>
<!--					<td width="11%"  class="pagedistd" ><div id="qyfl">企业分类</div></td>-->
<!--					<td width="22%" class="pagetd" ><div id="qyflt"><select name="select" id="p_qyzflbm2">-->
<!--			        <option></option></select>-->
<!--			         <input type="text" class="inputstyle"  id="p_qyzflmc" readonly style='display: none;' value="">-->
<!--			        </div>   </td>-->
				    <td width="11%" class="pagedistd">治安管辖机构</td>
					<td width="22%" class="pagetd"><input type="text" id="p_gxdwmc" class="inputstyle" value="" readonly></td>
					<td width="11%" class="pagedistd" id="td_qymc">企业名称</td>
				    <td class="pagetd"><input type="hidden" id="p_qybm" /><input type="text" class="inputstyle" id="p_qymc" readonly /></td>
				</tr>
				<tr>
					<td class="pagedistd">营业执照编号</td>
				    <td class="pagetd"><input type="text" class="inputstyle"  id="p_zjbh" value=""></td>
					<td class="pagedistd">营业状态</td>
				    <td class="pagetd" ><select id="manbq_yyzt" onChange="mancsztOnchange();">
				    <option></option></select></td>
				    <td  class="pagedistd">从业人员数量</td>
				    <td  class="pagetd">
				    <table><tr><td><select style="width:60px;" id="manbq_relation" onChange="relationChange();">
                    <option></option>
                    <option value="3">等于</option>
                    <option value="4">大于</option>
                    <option value="5">小于</option>
                    <option value="1">大于等于</option>
                    <option value="2">小于等于</option>
                    </select></td>
                    <td><input type="text" class="inputstyle" style="width:56px;" id="p_zrs" ></td>
                    </tr></table></td>
		 		 </tr>
		 		 <tr>
				    <td colspan="7">
                    <table width="124" border="0" align="right" cellpadding="0" cellspacing="0">
	                    <tr>
	                      <td><a href="#" class="searchbutton" id="querys" onClick="ylcsjbxx_setPageList(1);">查询</a></td>
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
<div id="ylcsjbxx_detail" class="page-layout" src="#" style="z-index:2000; top:10px; left:0px;">
</div>
<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead> 
	    <tr>
	    	<th name="l_gxdwmc">管辖单位</th>
	     	<th name="l_csbm">企业编码</th>
	     	<th name="l_csmc">企业名称</th>
	     	<th name="l_zrs">总人数</th>
	     	<th name="l_cszflmc">企业类别</th>
	     	<th name="l_frdb">法人代表</th>
	     	<th>营业状态</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>
</body>
</html>