<%@ page language="java" pageEncoding="UTF-8"
import="com.aisino2.sysadmin.domain.User,com.aisino2.sysadmin.Constants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%
	User user= (User)session.getAttribute(Constants.userKey);
	String deptCode = user.getDepartment().getDepartcode();
 %>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var otherTableHead="";
var publicHylbdm="";
	$(document).ready(function() {
		
		pageUrl="publicsystem/querylist_qyjcxx.action";
		divnid="QyjcxxData";
		tableid="QyjcxxTable";
		addUrl="publicsystem/insert_qyjcxx.action";
		addHtml="basic/publicsystem/QyjcxxAdd.jsp";
		addWidth="600";
		delUrl="publicsystem/delete_qyjcxx.action";
		delid="d_qycfid";
		modHtml="basic/publicsystem/QyjcxxModify.jsp";
		modUrl="publicsystem/modify_qyjcxx.action";
		modWidth="600";
		detailHtml="basic/publicsystem/QyjcxxDetail.jsp";
		detailid="qyjcxx_detail";
		detailUrl="publicsystem/query_qyjcxx.action";
		detailWidth="600";
		
		daggleDiv(detailid);
		
		searchLongUrl="publicsystem/queryqyjcxxForExport_qyjcxx.action";  //超长参数后台Action对应url
		excelUrl="publicsystem/exportqyjcxxExcel_qyjcxx.action";
		tabletitle = "";	 
	    geteExcelHead("QyjcxxData");
	    
		loadPage(divnid);
//		$("#p_hylbdm").selectBoxhylb({code:"flgy"});//行业类别	
		$("#p_cflbbm").selectBox({code:"dm_jclb"});
		$("#p_jcmxlbdm").selectBox({code:"1"});//明细 处罚
		
		$("#p_qyjcrq").attr("readonly","true");
		$("#p_qyjcrq").datepicker();
		$("#p_qyjcrqzhi").attr("readonly","true");
		$("#p_qyjcrqzhi").datepicker();
		$("#p_pzrq").attr("readonly","true");
		$("#p_pzrq").datepicker();
		$("#p_zxrq").attr("readonly","true");
		$("#p_zxrq").datepicker();
		
		$("#hylbzfl").bind('propertychange',function(){hylbOnchangeMan();});
		
		$("#p_cflbbm").change(function(){
			if($("#p_cflbbm").val()==0){
				$("#p_jcmxlbdm").selectBox({code:"dm_qyjllb"});//明细 奖励
			}
			if($("#p_cflbbm").val()==1){
				$("#p_jcmxlbdm").selectBox({code:"dm_qycflb(jxy)"});//明细 处罚
			}
			if($("#p_cflbbm").val()==''){
				$("#p_jcmxlbdm").selectBox({code:"1"});//明细 处罚
			}
		});
		$("#p_pzjg").click(function(){ //管辖单位
	//		getGxdw("p_pzjg","p_pzjgdm");
			getGxdwTree("p_pzjg","p_pzjgdm",'1');
		});
		
		hylbOnchangeMan();
		
		
	}); 
	//管辖单位所筛选框
 $("#p_gxdw").click(function(){
	getGxdwTree("p_gxdw","p_gxdwbm",'1');
});

	$("#p_allhylbdm").selectBoxinhylb();  // xxb add 20110506 
		$("#hylbzfl").click(function(){ 
			var hylbbz=$("#p_allhylbdm").val();
			getHylbzflTree("hylbzfl","p_hylbdm","p_hylb","p_qyzflbm","p_qyzflmc",hylbbz);
		});
	
	function setPageList(pageno,url){	
		url=setList(pageno,url);
		var mygrid1 = $("#"+tableid).ingrid({  
										loadAsync: false,		
										ingridPageWidth: pageWidth,
										url: url,	
										height: pageHeight-278,
										pageNumber: pageno,
										ingridPageParams: sXML,
										changeHref:function(table){
											if($(table).find("tr").length==0){
											    daochuNum = 0;
											}else{
											    daochuNum = 1;
											}	
										},
										colWidths: ["18%","8%","18%","9%","7%","7%","9%","7%","7%","10%"]									
									});
		setTableText();
	}
	 //企业筛选框
	$("#p_qymc").click(function(){
		dataid=$('#p_hylbdm').val();
		//getTy_item("p_qymc","","p_qyid");
		getTy_item("p_qymc","","p_qyid","",$("#p_gxdwbm").attr("value"),$('#p_allhylbdm').val());
	});
	
	function hylbOnchangeMan(){
//		alert($("#p_hylbdm").val());
		var hylb=$("#p_hylbdm").val();
		var csorqymc = "企业名称";
		var jcdjxh = "奖惩登记序号";
		var xzjcpwh = "行政奖惩决定书文号";
		var jclb = "奖惩类别";
		var jcmclb = "奖惩明细类别";
		var jcfd = "奖惩幅度";
		var qyjcrq = "企业奖惩日期";
		var yjly = "依据理由";
		if(hylb=='J'||hylb=='K'){
			csorqymc = "场所名称";
			jcdjxh = "处罚/奖励登记序号";
			xzjcpwh = "处罚/奖励行政决定书文号";
			jclb = "处罚/奖励类别";
			jcmclb = "处罚/奖励明细类别";
			jcfd = "处罚/奖励结果";
			qyjcrq = "处罚/奖励日期";
			yjly = "处罚/奖励依据";
		}
		$('#td_qymc').text(csorqymc);
		$('#jcdjxh-1').text(jcdjxh);
		$('#xzjcpwh-1').text(xzjcpwh);
		$('#jclb-1').text(jclb);
		$('#jcmclb-1').text(jcmclb);
		$('#qyjcrq-1').text(qyjcrq);
		setTableText();
	}

//导出Excel
function setExportExcel(){
	 var hylb=$("#p_hylbdm").val();
	 if(hylb=='J'||hylb=='K'){
		tabletitle=tabletitle.replace("企业分类","场所分类");
		tabletitle=tabletitle.replace("企业名称","场所名称");
	 }else{
	 	tabletitle=tabletitle.replace("场所分类","企业分类");
	 	tabletitle=tabletitle.replace("场所名称","企业名称");
	 }	
  	if(daochuNum==1){
  	    setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		alert('无查询结果不能导出！');
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="企业奖惩信息";
	//报表请求
	setExcelLong("spjksbxxexcel",bbmc);	
}

	function setTableText(){
		var hylb=$("#p_hylbdm").val();
		var csorqymc = "企业名称";
		var csorqyzfl = "企业分类";
		if(hylb=='J'||hylb=='K'){
			csorqymc = "场所名称";
			csorqyzfl = "场所分类";
		}
		$('#QyjcxxData').find('thead').find('th[@name=l_qymc]').find('DIV').html(csorqymc);
		$('#QyjcxxData').find('thead').find('th[@name=l_qyzflmc]').find('DIV').html(csorqyzfl);
	}
</script>

<body>
	
	<input type="hidden" id="d_qycfid">
	<input type="hidden" id="p_hylbdm" value="">   <!-- xxb add 20110506 --> 
	<input type="hidden" id="p_hylb" value="">   <!-- xxb add 20110506 --> 
	<input type="hidden" id="p_qyzflbm" value="">  <!-- xxb add 20110506 --> 
	<input type="hidden" id="p_qyzflmc" value=""> <!-- xxb add 20110506 --> 
	<div style="display:none;"><select id="p_allhylbdm"></select></div> <!-- xxb add 20110506 --> 
	<input type="hidden" id="p_qyid">
<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder">
  <tr>
    <td class="queryfont">企业奖惩查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id='tempTable' >
				<tr>
					<td width="15%" class="pagedistd">行业类别</td>
					<td width="18%" class="pagetd">
<!--					<select id="p_hylbdm" onchange="hylbOnchangeMan();"/>-->
						<input type="text" id="hylbzfl" class="inputstyle"  readonly="readonly">
					</td>
					<td width="15%" class="pagedistd" id="td_qymc">企业名称</td>
					<td width="19%" class="pagetd"><input type="text" class="inputstyle" id="p_qymc" readonly="readonly"></td>
					<td width="15%" class="pagedistd">批准机构</td>
					<td width="18%" class="pagetd"><input type="hidden" class="inputstyle" id="p_pzjgdm" >
					<input type="text"class="inputstyle" id="p_pzjg" readonly></td>
				</tr>
				<tr>
					<td class="pagedistd" id="jclb-1">奖惩类别</td>
					<td class="pagetd"><select id="p_cflbbm"><option></option></select></td>
					<td class="pagedistd" id="jcdjxh-1">处罚登记序号</td>
					<td class="pagetd"><input type="text"class="inputstyle" id="p_cfdjxh"></td>
    				<td class="pagedistd" id="xzjcpwh-1">行政奖惩决定书文号</td>
					<td class="pagetd"><input type="text"class="inputstyle" id="p_xzcfpzwh"></td>
				</tr>
    			<tr>
					<td class="pagedistd" id="jcmclb-1">奖惩明细类别</td>
					<td class="pagetd"><select id="p_jcmxlbdm"><option></option></select></td>
					<td class="pagedistd" id="qyjcrq-1">企业奖惩日期</td>
					<td class="pagetd"><input type="text"class="inputstyle3" id="p_qyjcrq" style="width:70px">至
					<input type="text"class="inputstyle3" id="p_qyjcrqzhi" style="width:70px"></td>
					<td class="pagedistd">管辖单位</td>
					<td class="pagetd"><input type="text" class="inputstyle" id="p_gxdw" readonly><input type="hidden" id="p_gxdwbm" value="<%=deptCode %>"></td>
    			</tr>
    			<tr>
					<td colspan="6">
	    				<table  border="0" align="right"  cellpadding="1"  cellspacing="0">
	    		    	<tr>
	    		    	  <td width="62"><a href="#" class="searchbutton" id="querys" onclick="setPageList(1);">查询</a></td>
	    		    	  <td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="spjksbxxexcel">导出</a></td>
	    		    	  <td width="62"><a href="#" class="addbutton" onclick='setAddPage()'>添加</a></td>
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
<div id="qyjcxx_detail" class="page-layout" src="#"
		style="top:30px; left:160px;">
</div>	

<div id="QyjcxxData" style="width:100%;">
	<table id="QyjcxxTable" width="100%">
	  <thead>
	    <tr>       
	     	<th name="l_cfdjxh" datatype="string" sumflag="0">奖惩登记序号</th>
	     	<th name="l_gxdwmc" datatype="string" sumflag="0">管辖单位</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="l_qyzflmc" datatype="string" sumflag="0">企业分类</th>
	     	<th name="l_cflb" datatype="string" sumflag="0">奖惩类别</th>
	     	<th name="l_jcmxlb" datatype="string" sumflag="0">奖惩明细类别</th>
	     	<th name="l_pzjg" datatype="string" sumflag="0">批准机构</th>
	     	<th name="l_qyjcrq" datatype="string" sumflag="0">奖惩日期</th>
	     	<th name="l_bjcr" datatype="string" sumflag="0">被奖惩人</th>
				<th name="">操作</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>



</body>
