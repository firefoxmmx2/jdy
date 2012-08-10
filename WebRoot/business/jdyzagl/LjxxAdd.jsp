<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<script type="text/javascript">
var trNum=0;
$(document).ready(function() {	
	daggleDiv("ljjbxxadd_detail");//div拖动
	dzcl_pageUrl="";
	
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1);
}); 
//有无违法犯罪记录grid
function setPageList_ywwffzjlzmfj(pageno,url){	
	if (true){
		$("#"+dzcl_divnid).html(dzcl_tables);	
		createXML("ywwffzjlfj_");
		if (url==null || url=="undefined"){
			url=dzcl_pageUrl;
		}
		var mygrid1 = $("#"+dzcl_tableid).ingrid({ 
										url: url,
										height: 40,
										ingridPageWidth : 945,		
						               	ingridPageParams:sXML,
						               	tableid:dzcl_tableid,
										pageNumber: pageno,
										sorting: false,
										paging: false,	
										//havaWaiDivGunDong: true,//控制不能出现滚动条
										//hideColIndex:[0,4,5],
										isPlayResultNull:false,
										onRowSelect:null,
										colWidths: ["0","30%","30%","20%","0","20%"]								
									});				
		}
}
//添加物品执行方法
function tianJiaZxzybaydwDzcl(cllb){
	setWidth("zxzybaydwdzcl_detail",300);
	setUrl("zxzybaydwdzcl_detail","business/jdyzagl/tjwp.jsp");
	bindDocument("zxzybaydwdzcl_detail");
}
//寄递物品信息保存时添加到列表---添加行的方法
function jdwpxxadd(){ 
	var jdwp_jdplx=$("#jdwp_jdplx").val();
	var jdwp_jdpmc=$("#jdwp_jdpmc").val();
	var jdwp_jdpsm=$("#jdwp_jdpsm").val();
	trNum++;
		var addTableTr="";
		//获取行数
		var trLen= $("#YwwffzjlTable").find("tr").length;
		//通过行数判断每行的css
		var tr_class = "grid-row-style1";//当为奇数时的css
		//当为偶数时的css
		if((trLen-1)%2==1)
			tr_class = "grid-row-style2";
		//设置行的属性和样式	
		addTableTr += "<tr _selected='false' name='Tr' class='"+tr_class+"' id='"+trNum+"'>";
		//设置每列的属性
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_xh"+trNum+"'>"+trNum+"</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_bzw"+trNum+"'>0</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_njpm"+trNum+"'>"+jdwp_jdpmc+"</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_sl"+trNum+"'>"+jdwp_jdpsm+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_lx"+trNum+"'>"+jdwp_jdplx+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='cz_"+trNum+"'>"
		+"<A id='delete_"+trNum+"' class=fontbutton title='删除' onclick=getObject(this) href='#'>删除</A>"
		+"</td>";
		addTableTr += "</tr>";
		if(addTableTr!=""){
			$("#YwwffzjlTable").append(addTableTr);
			//清空附件上传页面数据
			var jdwp_jdpmc=$("#jdwp_jdpmc").val("");
			var jdwp_jdpsm=$("#jdwp_jdpsm").val("");
			addTrEvent($("#YwwffzjlTable").find("tr:last"));
		}
}
//处理鼠标悬停是的页面样式
function addTrEvent(tr){
	var currTrClass;
	jQuery(tr).hover(
		function() { 
		currTrClass = $(tr).attr("class");
		if (jQuery(this).attr('_selected') != 'true')
			jQuery(this).removeClass(currTrClass).addClass("grid-row-hover") ; 
		},
		function() { if (jQuery(this).attr('_selected') != 'true') jQuery(this).removeClass("grid-row-hover").addClass(currTrClass); }	
	);
	
	jQuery(tr).click(function(event){
		var tr_class;
		var target = (event.target) ? event.target : event.srcElement;
		var parents = $(target).parents();
		var ishave = true;
		for(var i=0;i<parents.length;i++){
			if(parents.eq(i).attr("id")==("divs_fjxx_wpzl")||
					$(target).attr("id")==("divs_fjxx_wpzl")){
				ishave = false;
				break;
			}
		}
		if(ishave){
			jQuery(this).parent().find("tr").each(function(i){
				if(i%2==1)
					tr_class = "grid-row-style2";
				else
					tr_class = "grid-row-style1";
					
				jQuery(this).removeClass("grid-row-sel").removeClass("grid-row-hover").addClass(tr_class).attr("_selected","false");
			});
			jQuery(this).removeClass("grid-row-hover").addClass("grid-row-sel").attr("_selected","true");
		}
	});
}
//删除动态增加的附件列
function getObject(obj){
	sFlag="false";
	var str=$(obj).attr("id").split("_");
	dataid = str[1];
	if(str[0] == "delete"){
		var shanchuTr = $(obj).parent().parent();
		var shanchuTrParent = shanchuTr.parent();
		//标志位修改成1表示新添加之后又做了删除，2表示已经做了录入需要对数据库进行删除
		$(shanchuTr).find("td").eq(1).text("1");
		shanchuTr.hide();
		$("shanchuTrParent td:nth-child(2)").text();
		var tr_class;
		shanchuTrParent.find("tr").each(function(i){
				if(i%2==1)
					tr_class = "grid-row-style2";
				else
					tr_class = "grid-row-style1";
					
				jQuery(this).attr("class",tr_class);
			});
	}
}
//揽件信息添加页面验证方法
function addVerify(){
	
    return true;
}
//揽件信息保存方法
function  ljxxbaocun(){
	if (addVerify()){
		var params = getSubmitParams("[name*=lj.]");
		jQuery.post("jdy/insert_ljxx.action",params,addback,"json");
	}
}
//提交方法回调函数
function addback(){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		parent.parent.setPageListLjxx($("#pageNo").attr("value"));
		location.reload();
	}else{
		jAlert(json.result,'错误信息');
	}		
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递品信息登记</td>
      <td align="right"><a href="#" id="closeDiv" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");' class="close"></a></td>
    </tr>
</table>
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav33"  id="table_jbxx">
            		<tr><td><a href="#" id="ljxx_a" onMouseDown="show_ljxx(this,'ljxx')" cliNum="0"  class="navfont" hidefocus="true">寄递品信息</a></td></tr>
            		</table>
            	</td>
        		<td width="800" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>         
      		</tr>
    		</table>
</td>
</tr>
<tr>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="add">
<tr>
  <td>
    <fieldset>
	<legend style="color: black;">业务基本信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">登记序号</td>
			<td class="detailtd"><input type="text" id="l" name="lj.djxh" class="inputstyle" value="" /></td>
			<td class="red">物流单号</td>
			<td class="detailtd"><input type="text" id="lj.wldh" class="inputstyle" value="" /></td>
		</tr>
	</table>
	</fieldset>
	<table>
	   <tr>
	       <td>
	            <jsp:include page="../../business/jdyzagl/jjrxx.jsp"></jsp:include>
	       </td>
	       <td>
	            <jsp:include page="../../business/jdyzagl/sjrxx.jsp"></jsp:include>
	       </td>
	   </tr>
	</table>
	<fieldset>
	<legend>寄递品信息</legend>
	<table width="100%" >
		<tr height="20">
   	  		<td width="60%" align="right"><a href="#" class="addbutton" id="addbutton" onclick="tianJiaZxzybaydwDzcl()">添加</a></td>
		</tr>
	</table>
	<div id="zxzybaydwdzcl_detail" class="page-layout" src="#" style="top:180px; left:160px;"></div>
		<div id="YwwffzjlData" style="width:100%;">
			<table id="YwwffzjlTable"  width="100%">
			  <thead>
			    <tr>       
			     	<th name="jdwp_xh">序号</th>
			     	<th name="jdwp_bzw">标志位</th>
			     	<th name="jdwp_jdpmc">内件品名</th>
			     	<th name="jdwp_jdpmc">数量</th>
			     	<th name="jdwp_jdplx">类型</th>
					<th name="">操作</th>
			    </tr>
			  </thead>
			</table>	
		</div>
	</fieldset>
	<fieldset>
	<legend>揽件人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="red">揽件人</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzbm" class="inputstyle" value=""></td>
			<td class="red">揽件时间</td>
			<td class="detailtd"><input type="text" id="a_gwyqcqzqxdm" class="inputstyle" value=""></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='ljxxbaocun();'>保存</a></td>
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存新增" onclick='valadateCode();'>保存新增</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>返回</a></td>
</tr>
</table>

