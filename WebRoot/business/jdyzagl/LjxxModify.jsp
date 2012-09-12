<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>
<%
	//qybm = "T013306005003";
%>
<script type="text/javascript">
var trNum=1;
var ljjdpxx = new Array();
$(document).ready(function() {	
	Modifyurl="jdy/query_ljxx.action";
	$('#ljjbxxmodif_id').val(dataid);
	//alert("是否有值="+dataid);
	var params = getSubmitParams("#ljjbxx_modify [name*=lj.]");
	jQuery.post("jdy/query_ljxx.action",params,modifyback,"json");
	
	//添加寄递对象证件类型的提交名称
	$("#lj_jjrzjlx").attr("name","lj.jjr.zjlx");
	$("#lj_sjrzjlx").attr("name","lj.sjr.zjlx");
	//添加寄件地址、收件地址的提交名称
	$("#jjrssxmc").attr("name","lj.jjr.ssxmc");
	$("#sjrssxmc").attr("name","lj.sjr.ssxmc");
	//揽件时间选择
	$("#ljjbxx_modify [id=lj_ljsj]").val('<%=dateNow%>').attr("readOnly",true).datepicker();
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
	$('#lj_ljrxm_mod').attr('readOnly',true).click(function(){
		dataid=null;//js中使用了次变量，且他原本传递过去的值为行业类别，所以会查询不出来东西
		getTyRY_item('lj_ljrxm_mod','lj_ljr_cyrybh_mod',null,null,'<%=qybm%>');
	});
	daggleDiv("ljjbxxadd_detail");//div拖动
	dzcl_pageUrl="#";
		
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1);
}); 
function modifyback(json){
	$("#ljjbxx_modify [id=lj_djxh]").val(json.lj.djxh);//登记序号
	$("#ljjbxx_modify [id=lj_wldh]").val(json.lj.wldh);//物流单号
	
	$("#ljjbxx_modify [id=lj_jjrxm]").val(json.lj.jjr.xm);//寄件人姓名
	$("#ljjbxx_modify [id=lj_jjrzjlx]").val(json.lj.jjr.zjlx);//寄件人证件类型
	$("#ljjbxx_modify [id=lj_jjrzjhm]").val(json.lj.jjr.zjhm);//寄件人证件号码
	$("#ljjbxx_modify [id=jjrssxmc]").val(json.lj.jjr.ssxmc);//寄件地址
	$("#ljjbxx_modify [id=lj_jjrssx]").val(json.lj.jjr.ssx);//寄件地址代码
	$("#ljjbxx_modify [id=lj_jjrxxdz]").val(json.lj.jjr.xxdz);//寄件人现住地详址
	$("#ljjbxx_modify [id=lj_jjrdw]").val(json.lj.jjr.dw);//寄件人单位
	$("#ljjbxx_modify [id=lj_jjrlxdh]").val(json.lj.jjr.lxdh);//寄件人手机
	$("#ljjbxx_modify [id=lj_jjrgddh]").val(json.lj.jjr.gddh);//固定电话
	
	$("#ljjbxx_modify [id=lj_sjrxm]").val(json.lj.sjr.xm);//收件人姓名
	$("#ljjbxx_modify [id=lj_sjrzjlx]").val(json.lj.sjr.zjlx);//收件人证件类型
	$("#ljjbxx_modify [id=lj_sjrzjhm]").val(json.lj.sjr.zjhm);//收件人证件号码
	$("#ljjbxx_modify [id=sjrssxmc]").val(json.lj.sjr.ssxmc);//收件地址
	$("#ljjbxx_modify [id=lj_sjrssx]").val(json.lj.sjr.ssx);//寄件地址代码
	$("#ljjbxx_modify [id=lj_sjrxxdz]").val(json.lj.sjr.xxdz);//收件人现住地详址
	$("#ljjbxx_modify [id=lj_sjrdw]").val(json.lj.sjr.dw);//收件人单位
	$("#ljjbxx_modify [id=lj_sjrlxdh]").val(json.lj.sjr.lxdh);//收件人手机
	$("#ljjbxx_modify [id=lj_sjrgddh]").val(json.lj.sjr.gddh);//固定电话
	
	$("#ljjbxx_modify [id=lj_ljrxm_mod]").val(json.lj.ljr.xm);//揽件人
	$("#ljjbxx_modify [id=lj_ljr_cyrybh_mod]").val(json.lj.ljr.cyrybh);//揽件人编码
	$("#ljjbxx_modify [id=lj_ljsj]").val(setNull(json.lj.ljsj));//揽件日期
	//针对寄件人、收件人修改操作时，还需要传递对应 的ID过去
	$("#ljjbxx_modify [id=lj_jjrid]").val(json.lj.jjr.id);//寄件人ID
	$("#ljjbxx_modify [id=lj_sjrid]").val(json.lj.sjr.id);//寄件人ID
	for(var i=0;i<json.lj.jdp_list.length;i++){
		//寄递物品信息保存时添加到列表---添加行的方法
		    var jdwp_id=json.lj.jdp_list[i].id;//寄递品类型
			var jdwp_jdplx=json.lj.jdp_list[i].jdplx;//寄递品类型
			var jdwp_jdpmc=json.lj.jdp_list[i].jdpmc;//寄递品名称
			var jdwp_jdpsm=json.lj.jdp_list[i].jdpsm;//寄递品数量
			var jdwp_jdpzl=json.lj.jdp_list[i].jdpzl;//寄递品重量
			var jdwp_jdptj=json.lj.jdp_list[i].jdptj;//寄递品体积
			
		
			
				var addTableTr1="";
				//获取行数
				var trLen1= $("#YwwffzjlTable").find("tr").length;
				//通过行数判断每行的css
				var tr_class1 = "grid-row-style1";//当为奇数时的css
				//当为偶数时的css
				if((trLen1-1)%2==1)
					tr_class1 = "grid-row-style2";
				//设置行的属性和样式	
				addTableTr1 += "<tr _selected='false' name='Tr' class='"+tr_class1+"' id='"+i+"'>";
				//设置每列的属性
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_xh"+i+"'>"+trNum+"</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_sfscbz"+i+"'>0</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_jdpmc"+i+"'>"+jdwp_jdpmc+"</td>";
			    addTableTr1 += "<td class='grid-col-style1' _colid='2' id='l_jdpsm"+i+"'>"+jdwp_jdpsm+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdplx"+i+"'>"+jdwp_jdplx+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpzl"+i+"'>"+jdwp_jdpzl+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdptj"+i+"'>"+jdwp_jdptj+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_id"+i+"'>"+jdwp_id+"</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpdlx"+i+"'>0</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpdlxmc"+i+"'>0</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpxlxmc"+i+"'>0</td>";
				addTableTr1 += "<td class='grid-col-style1' _colid='2' id='cz_"+i+"'>"
				+"<A id='delete_"+i+"' class=fontbutton title='删除' onclick=getObjectmod(this) href='#'>删除</A>"
				+"</td>";
				addTableTr1 += "</tr>";
				if(addTableTr1!=""){
					$("#YwwffzjlTable").append(addTableTr1);
					addTrEvent($("#YwwffzjlTable").find("tr:last"));
				}
				trNum++;
	}
}
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
										hideColIndex:[1,4,5,6,7,8,9,10],
										isPlayResultNull:false,
										onRowSelect:null,
										colWidths: ["40","0","40%","40%","0","0","0","0","0","0","0","20%"]								
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
	var jdwp_jdplx=$("#jdwp_jdpxl").val();//寄递品类型
	var jdwp_jdpmc=$("#jdwp_jdpmc").val();//寄递品名称
	var jdwp_jdpsm=$("#jdwp_jdpsm").val();//寄递品数量
	var jdwp_jdpzl=$("#jdwp_jdpzl").val();//寄递品重量
	var jdwp_jdptj=$("#jdwp_jdptj").val();//寄递品体积
	var jdwp_jdmdlxmc=$("#jdwp_jdpdl option:selected").text();//寄递品大类型名称
	var jdwp_jdpdl=$("#jdwp_jdpdl").val();//寄递品大类型
	var jdwp_jdmdxmc=$("#jdwp_jdpxl option:selected").text();//寄递品大类型名称
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
	    addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_sfscbz"+trNum+"'>N</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpmc"+trNum+"'>"+jdwp_jdpmc+"</td>";
	    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_jdpsm"+trNum+"'>"+jdwp_jdpsm+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdplx"+trNum+"'>"+jdwp_jdplx+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpzl"+trNum+"'>"+jdwp_jdpzl+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdptj"+trNum+"'>"+jdwp_jdptj+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_id"+trNum+"'></td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpdlx"+trNum+"'>"+jdwp_jdpdl+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpdlxmc"+trNum+"'>"+jdwp_jdmdlxmc+"</td>";
		addTableTr += "<td class='grid-col-style1' _colid='2' style='display:none' id='l_jdpxlx"+trNum+"'>"+jdwp_jdmdxmc+"</td>";
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
		trNum++;
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
//查询出来的寄递品列表删除操作
function getObjectmod(obj){
	sFlag="false";
	var str=$(obj).attr("id").split("_");
	dataid = str[1];
	if(str[0] == "delete"){
		var shanchuTr = $(obj).parent().parent();
		var shanchuTrParent = shanchuTr.parent();
		//标志位修改成1表示新添加之后又做了删除，2表示已经做了录入需要对数据库进行删除
		$(shanchuTr).find("td").eq(1).text("Y");
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
	if (!checkControlValue("lj_ljrxm_mod","String",1,30,null,1,"揽件人"))
		return false;
	if (!checkControlValue("lj_ljsj","Date",null,null,null,1,"揽件日期"))
		return false;
	
    return true;
}
//揽件信息保存方法
function  ljxxmod(){
	//设置企业编码，之后要删除这里的设置
	//$("#lj_qyjbxx").val("0123456789")
	//alert("寄件地址="+$("#lj_jjrssx").val());
	//alert("收件地址="+$("#lj_sjrssx").val());
	//alert("蓝贱人="+$("#ljjbxx_modify [id=lj_ljr_cyrybh_mod]").val());
	//return;
	if (addVerify()){
		var params = getSubmitParams("#ljjbxx_modify [name*=lj.]");
		//var params = getSubmitParams("#pjjbxx_add [name*=pjxx.]");
		var childList1 = new Array("YwwffzjlData");
		var jsjxsz = new Array();//保存解析之后返回的数组
		jsjxsz=createszff(childList1);//调用解析页面ingrid的方法
		//alert("最后的数组="+jsjxsz);
		if(jsjxsz!="" && jsjxsz.length>0){
			for (var i=0;i<jsjxsz.length;i++){
					params["lj.jdp_list["+i+"].jdplx"] = jsjxsz[i][4];
					params["lj.jdp_list["+i+"].jdpmc"] = jsjxsz[i][2];
					params["lj.jdp_list["+i+"].jdpsm"] = jsjxsz[i][3];
					params["lj.jdp_list["+i+"].sfscbz"] = jsjxsz[i][1];
					params["lj.jdp_list["+i+"].jdpzl"] = jsjxsz[i][5];
					params["lj.jdp_list["+i+"].jdptj"] = jsjxsz[i][6];
					params["lj.jdp_list["+i+"].id"] = jsjxsz[i][7];
					params["lj.jdp_list["+i+"].jdpdlx"] = jsjxsz[i][8];
					params["lj.jdp_list["+i+"].jdpdlxmc"] = jsjxsz[i][9];
					params["lj.jdp_list["+i+"].jdplxmc"] = jsjxsz[i][10];
			}
		}else{
            jAlert("寄递品信息不能为空！",'验证信息');
            return false;
		}
		jQuery.post("jdy/update_ljxx.action",params,addback,"json");
	}
}
//提交方法回调函数
function addback(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		$("#ljjbxxadd_detail").hideAndRemove("show");
		setPageListlj(1);
	}else{
		jAlert(json.result,'错误信息');
	}		
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递品信息修改</td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="ljjbxx_modify">
<input type="hidden" id="lj_jjrssx" name="lj.jjr.ssx" value="">
<input type="hidden" id="lj_sjrssx" name="lj.sjr.ssx" value="">
<input type="hidden" id="lj_qyjbxx" name="lj.qyjbxx.qybm" value="<%=qybm %>">
<input type="hidden" id="lj_ljr_cyrybh_mod" name="lj.ljr.cyrybh">
<input type="hidden" id="ljjbxxmodif_id" name="lj.djxh" value=""><!-- 修改传递过来的ID号 -->
<input type="hidden" id="lj_jjrid" name="lj.jjr.id"><!-- 揽件修改、寄件人、收件人时还需传递对应ID过去，才能唯一标示出每一条数据 -->
<input type="hidden" id="lj_sjrid" name="lj.sjr.id"><!-- 揽件修改、寄件人、收件人时还需传递对应ID过去，才能唯一标示出每一条数据 -->
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
	<div id="zxzybaydwdzcl_detail" style="display: none;"></div>
		<div id="YwwffzjlData" style="width:100%;">
			<table id="YwwffzjlTable"  width="100%">
			  <thead>
			    <tr>       
			     	<th id="lj_xh" name="lj_xh">序号</th>
			     	<th name="lj_sfscbz">标志位</th>
			     	<th name="lj_jdpmc">内件品名</th>
			     	<th name="lj_jdpsm">数量</th>
			     	<th name="lj_jdplx">类型</th>
			     	<th name="lj_jdpzl">重量</th>
			     	<th name="lj_jdptj">体积</th>
			     	<th name="lj_id">ID</th>
			     	<th name="lj_jdptj">大类型</th>
			     	<th name="lj_jdptj">大类型名称</th>
			     	<th name="lj_jdptj">小类型名称</th>
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
			<td class="detailtd"><input type="text" id="lj_ljrxm_mod"   name="lj.ljr.xm" class="inputstyle" value=""></td>
			<td class="red">揽件时间</td>
			<td class="detailtd"><input type="text" id="lj_ljsj" name="lj.ljsj" class="inputstyle" value=""></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td  colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="保存" onclick='ljxxmod();'>保存</a></td>
	<td colspan="6"><a href="#" id="addbutton" hidefocus="true" class="submitbutton" title="返回" onclick='$("#ljjbxxadd_detail").hideAndRemove("show");'>返回</a></td>
</tr>
</table>

