<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	//qybm = "T013306005003";
%>
<script type="text/javascript">
var trNum=0;
var dataid="";
var ljjdpxx = new Array();
$(document).ready(function() {	
	//添加寄递对象证件类型的提交名称
	$("#lj_jjrzjlx").attr("name","lj.jjr.zjlx");
	$("#lj_sjrzjlx").attr("name","lj.sjr.zjlx");
	//添加寄件地址、收件地址的提交名称
	$("#jjrssxmc").attr("name","lj.jjr.ssxmc");
	$("#sjrssxmc").attr("name","lj.sjr.ssxmc");
	//揽件时间选择
	$("#ljjbxx_add [id=lj_ljsj]").val('<%=dateNow%>').attr("readOnly",true).datepicker();
	//户籍省市县--寄件人
	$("#jjrssxmc").click( function() {
		getDict_item("jjrssxmc", "lj_jjrssx", "dm_xzqh");
	});
	//户籍省市县--收件人
	$("#sjrssxmc").click( function() {
		getDict_item("sjrssxmc", "lj_sjrssx", "dm_xzqh");
	});
	//证件类型--寄件人
	getDictItemBox("lj_jjrzjlx","lj_jjrzjlxdm","dm_zjlx");
	//证件类型--收件人
	getDictItemBox("lj_sjrzjlx","lj_sjrzjlxdm","dm_zjlx");
	//揽件人
	$('#lj_ljr_xm').attr('readOnly',true).click(function(){
		getTyRY_item('lj_ljr_xm','ljljradd_cyrybh',null,null,'<%=qybm%>');
	});
	
	daggleDiv("ljjbxxadd_detail");//div拖动
	dzcl_pageUrl="#";
	
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1);
}); 
//寄递品信息grid
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
										colWidths: ["0","30%","30%","20%","0","0","0","0","0","0","20%"]								
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
	var jdwp_jdpdl=$("#jdwp_jdpdl").val();//寄递品大类型
	var jdwp_jdmdlxmc=$("#jdwp_jdpdl option:selected").text();//寄递品大类型名称
	var jdwp_jdpxl=$("#jdwp_jdpxl").val();//寄递品小类型
	var jdwp_jdmlxmc=$("#jdwp_jdpxl option:selected").text();//寄递品大类型名称
	var jdwp_jdpmc=$("#jdwp_jdpmc").val();//寄递品名称
	var jdwp_jdpsm=$("#jdwp_jdpsm").val();//寄递品数量
	var jdwp_jdpzl=$("#jdwp_jdpzl").val();//寄递品重量
	var jdwp_jdptj=$("#jdwp_jdptj").val();//寄递品体积
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
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_sfscbz"+trNum+"'>0</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpmc"+trNum+"'>"+jdwp_jdpmc+"</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpsm"+trNum+"'>"+jdwp_jdpsm+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdplx"+trNum+"'>"+jdwp_jdpdl+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpzl"+trNum+"'>"+jdwp_jdpzl+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdptj"+trNum+"'>"+jdwp_jdptj+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpxlx"+trNum+"'>"+jdwp_jdpxl+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpdlxmc"+trNum+"'>"+jdwp_jdmdlxmc+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpxlxmc"+trNum+"'>"+jdwp_jdmlxmc+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' id='cz_"+trNum+"'>"
		+"<A id='delete_"+trNum+"' class=fontbutton title='删除' onclick=getObject(this) href='#'>删除</A>"
		+"</td>";
		addTableTr += "</tr>";
		if(addTableTr!=""){
			$("#YwwffzjlTable").append(addTableTr);
			//清空附件上传页面数据
			var jdwp_jdpmc=$("#jdwp_jdpmc").val("");
			var jdwp_jdpsm=$("#jdwp_jdpsm").val("");
			var jdwp_jdpzl=$("#jdwp_jdpzl").val("");//寄递品重量
			var jdwp_jdptj=$("#jdwp_jdptj").val("");//寄递品体积
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
		$(shanchuTr).find("td").eq(1).text("N");
		shanchuTr.remove();
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
$("#lj_jjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
	//如果身份证证号填写不为15或18位，则直接返回让他重新填写
	var zjhm = $("#lj_jjrzjhm").attr("value").toUpperCase();
	if($("#lj_jjrzjlx").val()=="11"){
		if(zjhm!=""){
			if(isIdCardNo_jdy(zjhm)==false){
				sFlag="false";
				jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
			    	if(r==true){
			    		
					}
					else{
						$("#lj_jjrzjhm").val("");
					}
				});
			}else{
				if(zjhm.length==15){
					valSfzCardIsRight_jdy("lj_jjrzjhm","请正证件号码!");
				}
			}
		}
	}
});
$("#lj_sjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
	//如果身份证证号填写不为15或18位，则直接返回让他重新填写
	var zjhm = $("#lj_sjrzjhm").attr("value").toUpperCase();
	if($("#lj_sjrzjlx").val()=="11"){
		if(zjhm!=""){
			if(isIdCardNo_jdy(zjhm)==false){
				sFlag="false";
				jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
			    	if(r==true){
			    		
					}
					else{
						$("#lj_sjrzjhm").val("");
					}
				});
			}else{
				if(zjhm.length==15){
					valSfzCardIsRight_jdy("lj_sjrzjhm","请正证件号码!");
				}
			}
		}
	}
});
//揽件信息添加页面验证方法
function addVerify(){
	if (!checkControlValue("lj_wldh","String",1,30,null,1,"物流单号"))
		return false;
	if (!checkControlValue("lj_jjrxm","String",1,30,null,1,"寄件人姓名"))
		return false;
	if (!checkControlValue("lj_jjrzjlx","Select",1,8,null,1,"寄件人证件类型"))
		return false;
	if (!checkControlValue("lj_jjrzjhm","String",1,18,null,1,"寄件人证件号码"))
		return false;
	if (!checkControlValue("jjrssxmc","String",1,70,null,1,"寄件地址"))
		return false;
	if (!checkControlValue("lj_jjrxxdz","String",1,70,null,1,"寄件人现住地详址"))
		return false;
	if (!checkControlValue("lj_jjrlxdh","String",1,20,null,1,"寄件人手机"))
		return false;
	if (!checkControlValue("lj_sjrxm","String",1,30,null,1,"收件人姓名"))
		return false;
	if (!checkControlValue("lj_sjrzjlx","Select",1,8,null,1,"收件人证件类型"))
		return false;
	if (!checkControlValue("lj_sjrzjhm","String",1,18,null,1,"收件人证件号码"))
		return false;
	if (!checkControlValue("sjrssxmc","String",1,70,null,1,"收件地址"))
		return false;
	if (!checkControlValue("lj_sjrxxdz","String",1,70,null,1,"收件人现住地详址"))
		return false;
	if (!checkControlValue("lj_sjrlxdh","String",1,20,null,1,"收件人手机"))
		return false;
	if (!checkControlValue("lj_ljr_xm","String",1,30,null,1,"揽件人"))
		return false;
	if (!checkControlValue("lj_ljsj","Date",null,null,null,1,"揽件日期"))
		return false;
	
    return true;
}
//揽件信息保存方法
function  ljxxbaocun(temp){
	//设置企业编码，之后要删除这里的设置
	//$("#lj_qyjbxx").val("0123456789")
	//alert("蓝贱人编码="+$("#lj_qyjbxx").val());
	//alert($("#ljljradd_cyrybh").val());
	//return;
	if (addVerify()){
		var params = getSubmitParams("#ljjbxx_add [name*=lj.]");
		//var params = getSubmitParams("#pjjbxx_add [name*=pjxx.]");
		var childList1 = new Array("YwwffzjlData");
		var jsjxsz = new Array();//保存解析之后返回的数组
		jsjxsz=createszff(childList1);//调用解析页面ingrid的方法
		//alert("最后的数组="+jsjxsz);
		if(jsjxsz!="" && jsjxsz.length>0){
			for (var i=0;i<jsjxsz.length;i++){
					params["lj.jdp_list["+i+"].jdplx"] = jsjxsz[i][7];
					params["lj.jdp_list["+i+"].jdpmc"] = jsjxsz[i][2];
					params["lj.jdp_list["+i+"].jdpsm"] = jsjxsz[i][3];
					params["lj.jdp_list["+i+"].sfscbz"] = jsjxsz[i][1];
					params["lj.jdp_list["+i+"].jdpzl"] = jsjxsz[i][5];
					params["lj.jdp_list["+i+"].jdptj"] = jsjxsz[i][6];
					params["lj.jdp_list["+i+"].jdpdlx"] = jsjxsz[i][4];
					params["lj.jdp_list["+i+"].jdpdlxmc"] = jsjxsz[i][8];
					params["lj.jdp_list["+i+"].jdplxmc"] = jsjxsz[i][9];
			}
		}else{
            jAlert("寄递品信息不能为空！",'验证信息');
            return false;
		}
		if(temp=="bc"){
			jQuery.post("jdy/insert_ljxx.action",params,addbackbc,"json");
		}
		if(temp=="bcxz"){
			jQuery.post("jdy/insert_ljxx.action",params,addbackbcxz,"json");
		}
		
	}
}
//提交方法回调函数
function addbackbc(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		$("#ljjbxxadd_detail").hideAndRemove("show");
		setPageListlj(1);
	}else{
		jAlert(json.result,'错误信息');
	}		
}
//提交方法回调函数
function addbackbcxz(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		//$("#ljjbxxadd_detail").hideAndRemove("show");
		//清空数据 
		$("#ljjbxx_add [id='lj_wldh']").val("");//物流单号
		$("#ljjbxx_add [id='lj_ljr_xm']").val("");//揽件人
		//$("#ljjbxx_add [id='YwwffzjlData']");//揽件人
		$('#YwwffzjlData tbody tr').remove();
		setPageListlj(1);
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="ljjbxx_add">
<input type="hidden" id="lj_jjrssx" name="lj.jjr.ssx" value="">
<input type="hidden" id="lj_sjrssx" name="lj.sjr.ssx" value="">
<input type="hidden" id="lj_qyjbxx" name="lj.qyjbxx.qybm" value="<%=qybm %>">
<input type="hidden" id="ljljradd_cyrybh" name="lj.ljr.cyrybh">
<tr>
  <td>
    <fieldset>
	<legend style="color: black;">业务基本信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">登记序号</td>
			<td class="detailtd"><input type="text" id="lj_djxh" class="readonly" value="" /></td>
			<td class="red">物流单号</td>
			<td class="detailtd"><input type="text" id="lj_wldh" name="lj.wldh" class="inputstyle" value="" /></td>
		</tr>
	</table>
	</fieldset>
	<table width="100%" border="0" cellSpacing="0" cellPadding="0" >
	   <tr>
	       <td>
	           <jsp:include page="../../business/jdyzagl/jjrxx.jsp"></jsp:include>
	       </td>
	       <td>
	       		&nbsp;
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
			     	<th id="lj_xh" name="lj_xh">序号</th>
			     	<th name="lj_sfscbz">标志位</th>
			     	<th name="lj_jdpmc">内件品名</th>
			     	<th name="lj_jdpsm">数量</th>
			     	<th name="lj_jdplx">大类型</th>
			     	<th name="lj_jdpzl">重量</th>
			     	<th name="lj_jdptj">体积</th>
			     	<th name="lj_jdpxlx">小类型</th>
			     	<th name="lj_jdpdlxmc">大类型名称</th>
			     	<th name="lj_jdpxlxmc">小类型名称</th>
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
			<td class="detailtd"><input type="text" id="lj_ljr_xm"   name="lj.ljr.xm" class="inputstyle" value=""></td>
			<td class="red">揽件时间</td>
			<td class="detailtd"><input type="text" id="lj_ljsj" name="lj.ljsj" class="inputstyle date"></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='ljxxbaocun("bc");'>保存</a></td>
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存新增" onclick='ljxxbaocun("bcxz");'>保存新增</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>返回</a></td>
</tr>
</table>

