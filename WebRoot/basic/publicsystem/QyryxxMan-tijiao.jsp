<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>
<%
	String userName = "";
	String userbm = "";
	User user= (User)session.getAttribute(Constants.userKey);
	if(user!=null&&user.getSsdwbm()!=null&&!"".equals(user.getSsdwbm())){
		userName = user.getSsdwmc();
		userbm = user.getSsdwbm();
	}
	//判断是否省级采集点
	int cjd=0;
	String departCode = user.getDepartment().getDepartcode();
	if(departCode.contains("CJD")){
		if(departCode.length()==5){
			cjd=1;
		}
	}
	String usertype = user.getUsertype();
%>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var qymc="<%=userName %>";
var qybm="<%=userbm %>";
var cjd='<%=cjd%>';//判断是否是省级采集点
var checkedRyTable =  $("<tr></tr>");
$(document).ready(function() {
	usertype='<%=usertype%>';
	//隐藏操作
	if(cjd==1){
		$('#qbtj').hide();
		$('#tj').hide();
	}
	
	
	//pageUrl="ylfwzagl/querylistTj_cyryxx.action";
	pageUrl="publicsystem/querylistWtjry_qyryxx.action";
	divnid="tabledata";
	tableid="table1";
	addUrl="publicsystem/insert_qyryxx.action";
	addHtml="basic/publicsystem/QyryxxAdd.jsp";
	addWidth="800";
	delUrl="publicsystem/delete_qyryxx.action";
	delid="d_ryid";
	modHtml="basic/publicsystem/QyryxxModify.jsp";
	modUrl="publicsystem/modify_qyryxx.action";
	modWidth="800";
	detailHtml="basic/publicsystem/QyryxxDetail.jsp";
	detailid="cyryxx_detail";
	detailUrl="publicsystem/query_qyryxx.action";
	detailWidth="800";
	
	searchLongUrl="publicsystem/querytjForExport_qyryxx.action";  //超长参数后台Action对应url
	excelUrl="publicsystem/exportExcel_qyryxx.action";
	tabletitle = "";	 
    geteExcelHead("tabledata");	
	
	$("#table1").find("thead").find("tr").find("th:first").append("<input type='checkbox' id='daiguanlian' onclick='checkOrNot(this);' />");
	daggleDiv("cyryxx_detail");
	cyrytj_loadPage("tabledata");
	$("#p_lrsjf").attr("readonly","true").datepicker();
	$("#p_lrsjt").attr("readonly","true").datepicker();
	
	$("#p_hylbdm").selectBoxhylb({code:"ggmk"});
	
  	$("#p_xbdm").selectBox({code:"dm_xb"});
	$("#bq3_cyzjdm").selectBox({code:"dm_rycyzj"});
	
}); 
function cyrytj_loadPage(divpageid){
    tables=$("#"+divpageid).html();
	$("#"+detailid).hide(); 	
	if(dataid=="tzxxFlag"){
	    dataid="";
	    setPageList(1);
	}else{
	    setPageList(1,'#');
	}
}
function setPageList(pageno,url){	
	if (manVerify()){
		url=setList(pageno,url);
		$("#q_chaXunTiaoJian").val(sXML);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var hideCol=[];
		var colWidth= ["5%","14%","10%","14%","5%","16%","13%","12%","10%"];
		if(cjd==1){
			hideCol=[0];
			colWidth= ["0%","14%","10%","14%","5%","21%","13%","12%","10%"];
		}
		var mygrid1 = $("#"+tableid).ingrid({ 
										alignCenterColIndex: [0,1,4,6],
										headAlignCenter: true,
										ingridPageParams:sXML,
										ingridPageWidth: pageWidth,
										tableid:"cyryTjTable",
										url: url,	
										height: pageHeight-280,
										noSortColIndex:[0],	
										onRowSelect:null,
										
										changeHref:function(table){
											if($(table).find("tr").length==0){
											    daochuNum = 0;
											}else{
											    daochuNum = 1;
											}	
											var addTdHtml,currTdId,isChecked;
											$("#daiguanlian").attr("checked",false);
											table.find("tr").each(function(){
												isChecked = "";
												currTdId = $(this).attr("id");
												var cyrybh = $(this).find("td:first").html();
													if(checkedRyTable.find("td[name="+currTdId+"]").length==1)
														isChecked = "checked";
													addTdHtml = "<td><input type='checkbox' onclick='checkOneRy(this)' "+isChecked+" name='"+ currTdId +"'/></td>";
												$(this).find("td:first").before($(addTdHtml));
												
											});
										},
										onTdSelect:function(tr){
											$(tr).find("td:not(td:first)").click(function(){
												chaKanRyXx(tr);
											});
										},		
										pageNumber: pageno,
										hideColIndex:hideCol,
										colWidths: colWidth									
									});				
		}
}	
	function manVerify(){
		var lrsjf = $("#p_lrsjf").val();
		var lrsjt = $("#p_lrsjt").val();
		if(lrsjf!=null && lrsjf!="" && lrsjt!=null && lrsjt!=""){
			if(lrsjf>lrsjt){
				jAlert("采集时间必须大于采集时间至","验证信息",null,"p_lrsjf");
				return false;
			}
		}
		return true;
	}

//从业人员详情
function setCyryXq(id){
	dataid=id;
	setWidth(detailid,detailWidth);
	setUrl(detailid,detailHtml);
	bindDocument(detailid);
}

//是否选中所有项	
function checkOrNot(obj){
	var checkBoxList = $("#cyryTjTable").find("input[type='checkbox']:not(input[type='checkbox']:first)");
	checkBoxList.attr("checked",$(obj).attr("checked"));
	checkBoxList.each(function(){
		checkOneRy(this);
	});
}

//选中一个复选框
function checkOneRy(checkObj){
	var isChecked = $(checkObj).attr("checked");
	var checkRyId = $(checkObj).attr("name");
	if(isChecked){
		if(checkedRyTable.find("td[name="+checkRyId+"]").length==0){
			checkedRyTable.append("<td name='"+checkRyId+"'></td>");
		}
	}else{
		//alert(checkedRyTable.html());
		checkedRyTable.find("td[name="+checkRyId+"]").remove();
		//alert(checkedRyTable.html());
	}
}

//提交全部
function tiJiaoQuanBu(){
	if($("#cyryTjTable").find("tr").length>1){
		jConfirm('确定全部提交吗？', '提示信息', function(r) {
	    	if(r==true){
				jQuery.post("publicsystem/modifyRyTjQb_qyryxx.action",{dataxml:$("#q_chaXunTiaoJian").val()},rytjback,"json");
			}
		});
	}else{
		jAlert("没有可供提交的数据！","提示信息");
	}
}

//提交选中项
function tiJiaoXuanZhong(){
	if($("#cyryTjTable").find("tr").length>1 && checkedRyTable.find("td").length>0){
		var ryidSetStr = "";
		checkedRyTable.find("td").each(function(){
			ryidSetStr += $(this).attr("name") + ",";
		});
		$("#t_ryidSet").val(ryidSetStr);
		checkedRyTable.find("td").remove();
		setParams("t_");
		jQuery.post("publicsystem/modifyRyTj_qyryxx.action",params,rytjback,"json");
	}else{
		jAlert("没有选择要提交的数据！","提示信息");
	}
}

function rytjback(json){
	if(json.result=="success"){
		jAlert("提交成功",'提示信息');
		var pageno=$("#pageNo").attr("value");
		if ($("#startno").html()==$("#endno").html()){
			if ($("#pageNo").attr("value")>1){
				pageno=""+(parseInt(pageno)-1);
			}
		}
		setPageList(pageno);
	}else{
		jAlert(json.result,'提示信息');
	}	
}	
	function zjlxChanges(){
		$("#p_cyzj").val($("#bq3_cyzjdm").attr("title"));
		$("#p_cyzjdm").val($("#bq3_cyzjdm").attr("value"));
	}

//查看人员详细信息（国内和国外从业人员）
function chaKanRyXx(obj){
	dataid=$(obj).attr("id");
	var cyrylb = $(obj).find("input:hidden").val();
	setWidth(detailid,detailWidth);
	tj_tcryxx = null;
	if(cyrylb=="0"){
		detailUrl="publicsystem/query_qyryxx.action";
		setUrl(detailid,"basic/publicsystem/QyryxxDetail.jsp");
	}else{
		detailUrl="publicsystem/query_publicwgcyryxx.action";
		setUrl(detailid,"basic/publicsystem/WgcyryxxDetail.jsp");
	}
	bindDocument(detailid);
}

//导出Excel
function setExportExcel(){	
  	if(daochuNum==1){
  	    setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
  	}else{
  		alert('无查询结果不能导出！');
  	}		
}
//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
function searchLongBack(json){  
    //报表标题
	var bbmc="从业人员提交信息";
	//报表请求
	setExcelLong("qyryexcel",bbmc);	
}
</script>
<body>
<input type="hidden" id="p_cyzj"/>
<input type="hidden" id="p_cyzjdm"/>
<input type="hidden" id="q_chaXunTiaoJian"/>
<input type="hidden" id="t_ryidSet"/>
<input type="hidden" id="p_cylbdm" value="">
<table width="100%" cellpadding="0" cellspacing="0" class="tableborder">
  <tr>
    <td class="queryfont">从业人员提交</td>
  </tr>
  <tr>
    <td valign="top" class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		  <tr>
	  			  <td width="10%" class="pagedistd">行业类别</td>
				  <td width="22%" class="pagetd"><select type="select" id="p_hylbdm"></select></td>
				  <td width="12%" class="pagedistd">姓名</td>
			      <td width="23%" class="pagetd"><input type="text" class="inputstyle" id="p_xm" /></td>
			      <td width="10%" class="pagedistd">证件类型</td>
				  <td width="23%" class="pagetd"><select name="select" id="bq3_cyzjdm" onchange="zjlxChanges();"><option></option></select></td>
		  </tr>
				<tr>
				  <td class="pagedistd">证件号码</td>
				  <td class="pagetd"><input type="text" class="inputstyle" id="p_zjhm" /></td>
				  <td class="pagedistd">采集时间</td>
				  <td class="pagetd"><input type="text" class="inputstyle1" id="p_lrsjf">至<input type="text" class="inputstyle1" id="p_lrsjt"></td>
				  <td class="pagedistd">性别</td>
				  <td class="pagetd"><select name="select" id="p_xbdm"><option></option>
                  </select></td>
		  </tr>
				<tr>
				  <td class="pagedistd">人员编号</td>
				  <td class="pagetd"><input type="text" class="inputstyle" id="p_cyrybh" /></td>
		          <td class="pagedistd">英文姓</td>
				  <td class="pagetd"><input type="text" class="inputstyle" id="p_ywx" /></td>
				  <td class="pagedistd">英文名</td>
				  <td class="pagetd"><input type="text" class="inputstyle" id="p_ywm" /></td>
		  </tr>
		  <tr>
			  <td align ="right" colspan="6">
			  	<table border="0" cellpadding="2" cellspacing="0">
                    <tr>
                      <td width="62"><a href="#" class="searchbutton"id="querys2" onClick="setPageList(1);">查询</a></td>
                      <td width="62" id="qbtj"><div id="qbtj"><a href="#" class="submitbutton" id="querys3" onClick="tiJiaoQuanBu();">全部提交</a></div></td>
                      <td width="62" id="tj"><div id="tj"><a href="#" class="submitbutton" id="querys4" onClick="tiJiaoXuanZhong();">提交</a></div></td>
                      <td width="61px"><a href="#" class="exceldcbutton" onclick='setExportExcel();' id="qyryexcel">导出</a></td>
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
<div id="cyryxx_detail"  class="page-layout" src="#"
		style="top:20px; left:160px; width:500px;">
</div>	

<div id="tabledata" style="width:100%;">
	<table id="table1" width="100%">
	  <thead>
	    <tr>       
	     	<th name="">选择</th>
	     	<th name="l_cyrybh" datatype="string" sumflag="0">人员编号</th>
	     	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	     	<th name="l_zjhm" datatype="string" sumflag="0">证件号码</th>
	     	<th name="l_xb" datatype="string" sumflag="0">性别</th>
	     	<th name="l_qymc" datatype="string" sumflag="0">企业名称</th>
	     	<th name="l_lrsj" datatype="string" sumflag="0">采集时间</th>
	     	<th name="l_cylb" datatype="string" sumflag="0">人员类别</th>
	     	<th name="l_zt" datatype="string" sumflag="0">状态</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
</body>