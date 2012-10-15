<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>

<script type="text/javascript">
var trNum=0;
$(function() {	
	$('#pjjbxxmod_id').val(dataid);
	$('.readonly').attr('readOnly',true);
	//修改页面所有原有揽件信息元素
	$('#pjjbxx_mod [id*=lj_]').each(function(idx){
		var $this = $(this);
		var id = $this.attr('id');
		var name = $this.attr('name');
		$this.attr("id", id.replace('lj_','pjjbxxmod_','g') );
		if(name)
			$this.attr("name", "pjxx."+name.replace("lj\.","ljjbxx\.","g"));
		$this.removeAttr("value");
	});
	
	$('#jjrssxmc').attr('id','pjjbxxmod_jjrssx');
	$('#sjrssxmc').attr('id','pjjbxxmod_sjrssx');
	$('#pjjbxxmod_jjrssx').attr("name","pjxx.ljjbxx.jjr.ssxmc");
	$('#pjjbxxmod_sjrssx').attr("name","pjxx.ljjbxx.sjr.ssxmc");
	//添加寄递对象证件类型的提交名称
	$("#pjjbxxmod_jjrzjlx").attr("name","pjxx.ljjbxx.jjr.zjlx");
	$("#pjjbxxmod_sjrzjlx").attr("name","pjxx.ljjbxx.sjr.zjlx");
	//派件时间选择
	$("#pjjbxxmod_pjsj").attr("readOnly",true).datepicker(true).val('<%=datetime%>');
	//
	$('#pjjbxxmod_pjr_xm').attr("readOnly",true).click(function(){
		dataid=null;
		getTyRY_item('pjjbxxmod_pjr_xm','pjjbxxmod_pjr_cyrybh',null,'<%=gxdwbm%>',null,'<%=qybm%>');
	});
	//户籍省市县--寄件人
	$("#pjjbxxmod_jjrssx").click( function() {
		getDict_item("pjjbxxmod_jjrssx", "pjjbxxmod_jjrssxdm", "dm_xzqh");
	});
	//户籍省市县--收件人
	$("#pjjbxxmod_sjrssx").click( function() {
		getDict_item("pjjbxxmod_sjrssx", "pjjbxxmod_sjrssxdm", "dm_xzqh");
	});
	//代收人的证件类型
	getDictItemBox("pjjbxxmod_dsrzjlx","","dm_zjlx");
	//证件类型--寄件人
	getDictItemBox("pjjbxxmod_jjrzjlx","","dm_zjlx");
	//证件类型--收件人
	getDictItemBox("pjjbxxmod_sjrzjlx","","dm_zjlx");
	
	
	dzcl_pageUrl="jdy/queryListjdp_ljxx.action";
	
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	
	$("#pjjbxxmod_jjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		//如果身份证证号填写不为15或18位，则直接返回让他重新填写
		var zjhm = $("#pjjbxxmod_jjrzjhm").attr("value").toUpperCase();
		if(zjhm!=""){
			if(isIdCardNo_jdy(zjhm)==false){
				sFlag="false";
				jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
			    	if(r==true){
			    		
					}
					else{
						$("#pjjbxxmod_jjrzjhm").val("");
					}
				});
			}else{
				if(zjhm.length==15){
					valSfzCardIsRight_jdy("pjjbxxmod_jjrzjhm","请正证件号码!");
				}
			}
		}
	});
	$("#pjjbxxmod_sjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		//如果身份证证号填写不为15或18位，则直接返回让他重新填写
		var zjhm = $("#pjjbxxmod_jjrzjhm").attr("value").toUpperCase();
		if(zjhm!=""){
			if(isIdCardNo_jdy(zjhm)==false){
				sFlag="false";
				jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
			    	if(r==true){
			    		
					}
					else{
						$("#pjjbxxmod_sjrzjhm").val("");
					}
				});
			}else{
				if(zjhm.length==15){
					valSfzCardIsRight_jdy("pjjbxxmod_sjrzjhm","请正证件号码!");
				}
			}
		}
	});
	
	
	$("#pjjbxxmod_dsrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		if($('#pjjbxxmod_dsrzjlx').val() == '11'){
			//如果身份证证号填写不为15或18位，则直接返回让他重新填写
			var zjhm = $("#pjjbxxmod_dsrzjhm").attr("value").toUpperCase();
			if(zjhm!=""){
				if(isIdCardNo_jdy(zjhm)==false){
					sFlag="false";
					jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
				    	if(r==true){
				    		
						}
						else{
							$("#pjjbxxmod_dsrzjhm").val("");
						}
					});
				}else{
					if(zjhm.length==15){
						valSfzCardIsRight_jdy("pjjbxxmod_dsrzjhm","请正证件号码!");
					}
				}
			}
		}
	});
	
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1,'#');
	
	
	loadData();
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
										height: 50,
										ingridPageWidth : 880,		
						               	ingridPageParams:sXML,
						               	tableid:dzcl_tableid,
										pageNumber: pageno,
										sorting: false,
										paging: false,	
										//havaWaiDivGunDong: true,//控制不能出现滚动条
										hideColIndex:[1],
										isPlayResultNull:false,
										onRowSelect:null,
										colWidths: ["5%","15%","30%","10%","10%","20%","20%","10%"]								
									});				
		}
}
//添加物品执行方法
function tianJiaZxzybaydwDzcl(cllb){
	setWidth("zxzybaydwdzcl_detail",300);
	setUrl("zxzybaydwdzcl_detail","business/jdyzagl/tjwp.jsp");
	bindDocument("zxzybaydwdzcl_detail");
}
/**
 * 寄递物品信息保存时添加到列表---添加行的方法
 * @recode jdpxx 对象
 */
function jdwpxxadd(record){
	
	var jdwp_jdplx_mc;//寄递品类型名称
	
	var rowData = {};
	if(record){
		rowData.id = record.id;
		rowData.jdplx = setNull(record.jdplx);
		rowData.jdpmc= setNull(record.jdpmc);
		rowData.jdpsm= setNull(record.jdpsm);
		rowData.jdpzl= setNull(record.jdpzl);
		rowData.jdptj= setNull(record.jdptj);
		rowData.jdplxmc= setNull(record.jdplxmc);
		rowData.jdpdlx= setNull(record.jdpdlx);
		rowData.jdpdlxmc= setNull(record.jdpdlxmc);
		rowData.sfscbz= setNull(record.sfscbz);
	}
	else{
		rowData.jdplx=setNull($("#jdwp_jdpxl").val());//寄递品类型
		rowData.jdpmc=setNull($("#jdwp_jdpmc").val());//寄递品名称
		rowData.jdpsm=setNull($("#jdwp_jdpsm").val());//寄递品数量
		rowData.jdpzl=setNull($('#jdwp_jdpzl').val());//重量
		rowData.jdptj=setNull($('#jdwp_jdptj').val());//体积
		rowData.jdplxmc=setNull($("#jdwp_jdpxl").attr("title"));//寄递品类型名称
		rowData.jdpdlx=setNull($('#jdwp_jdpdl').val());
		rowData.jdpdlxmc=setNull($('#jdwp_jdpdl').attr('title'));
		rowData.sfscbz='N';
	}
	
	
	
	
	var rowDataStr = $.toJSON(rowData);
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
	if(record)
		addTableTr += "<tr _selected='false' name='Tr' database='1' class='"+tr_class+"' id='"+trNum+"' rowData='"+rowDataStr+"'>";
	else
		addTableTr += "<tr _selected='false' name='Tr' class='"+tr_class+"' id='"+trNum+"' rowData='"+rowDataStr+"'>";
	//设置每列的属性
    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_xh"+trNum+"'>"+trNum+"</td>";
    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_bzw"+trNum+"'>"+rowData.jdpmc+"</td>";
    addTableTr += "<td class='grid-col-style1' _colid='2' id='l_sl"+trNum+"'>"+rowData.jdpsm+"</td>";
	addTableTr += "<td class='grid-col-style1' _colid='2' id='l_lx"+trNum+"'>"+rowData.jdplxmc+"</td>";
	addTableTr += "<td class='grid-col-style1' _colid='2' id='l_njpm"+trNum+"'>"+rowData.jdpzl+"</td>";
	addTableTr += "<td class='grid-col-style1' _colid='2' id='l_zl"+trNum+"'>"+rowData.jdptj+"</td>";
	addTableTr += "<td class='grid-col-style1' _colid='2' id='cz_"+trNum+"'>"
	+"<A id='delete_"+trNum+"' class=fontbutton title='删除' onclick=getObject(this) href='#'>删除</A>"
	+"</td>";
	addTableTr += "</tr>";
	if(addTableTr!=""){
		$("#YwwffzjlTable").append(addTableTr);
		//清空附件上传页面数据
		if(!record){
			$("#jdwp_jdpmc").removeAttr("value");
			$("#jdwp_jdpsm").removeAttr("value");
			$('#jdwp_jdpzl').removeAttr("value");//重量
			$('#jdwp_jdptj').removeAttr("value");//体积
		}
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
		//如果为数据库记录就隐藏该行，否则删除
		if($(shanchuTr).attr("database")){
			$(shanchuTr).hide();
			var rowData=$.evalJSON($(shanchuTr).attr("rowData"));
			rowData['sfscbz'] = "Y";
			$(shanchuTr).attr("rowData",$.toJSON(rowData));
		}
		else
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

//揽件信息添加页面验证方法
function pjxx_mod_verify(){
	if (!checkControlValue("pjjbxxmod_wldh","String",1,30,null,1,"物流单号"))
		return false;
	if (!checkControlValue("pjjbxxmod_jjrxm","String",1,30,null,1,"寄件人姓名"))
		return false;
	if (!checkControlValue("pjjbxxmod_jjrzjlx","Select",1,8,null,1,"寄件人证件类型"))
		return false;
	//if (!checkControlValue("pjjbxxmod_jjrzjhm","String",1,18,null,1,"寄件人证件号码"))
		//return false;
	if (!checkControlValue("pjjbxxmod_jjrssx","String",1,70,null,1,"寄件地址"))
		return false;
	if (!checkControlValue("pjjbxxmod_jjrxxdz","String",1,70,null,1,"寄件人现住地详址"))
		return false;
	if (!checkControlValue("pjjbxxmod_jjrlxdh","String",1,20,null,1,"寄件人手机"))
		return false;
	if (!checkControlValue("pjjbxxmod_sjrxm","String",1,30,null,1,"收件人姓名"))
		return false;
	if (!checkControlValue("pjjbxxmod_sjrzjlx","Select",1,8,null,1,"收件人证件类型"))
		return false;
	//if (!checkControlValue("pjjbxxmod_sjrzjhm","String",1,18,null,1,"收件人证件号码"))
		//return false;
	if (!checkControlValue("pjjbxxmod_sjrssx","String",1,70,null,1,"收件地址"))
		return false;
	if (!checkControlValue("pjjbxxmod_sjrxxdz","String",1,70,null,1,"收件人现住地详址"))
		return false;
	if (!checkControlValue("pjjbxxmod_sjrlxdh","String",1,20,null,1,"收件人手机"))
		return false;
	if (!checkControlValue("pjjbxxmod_pjr_xm","String",1,20,null,1,"派件人"))
		return false;
	if (!checkControlValue("pjjbxxmod_pjsj","String",1,20,null,1,"派件日期"))
		return false;
	if(!$('#YwwffzjlData tbody tr:visible').length){
		jAlert("寄递品信息不能为空","提示");
		return false;
	}
	
    return true;
}
//揽件信息保存方法
function  modify_pjxx(){
	if (pjxx_mod_verify()){
		var params = getSubmitParams("#pjjbxx_mod [name*=pjxx.]");
		$('#YwwffzjlData tbody tr').each(function(idx){
			var $tr = $(this);
			var rowData = $.evalJSON($tr.attr("rowData"));
			if($tr.attr('database')){
				if(rowData['sfscbz'] == 'Y'){
					for(var key in rowData){
						params["pjxx.ljjbxx.jdp_list["+idx+"]."+key] = rowData[key];
					}
				}
			}
			else{
				rowData['sfscbz']='N'; //修正
				for(var key in rowData){
					params["pjxx.ljjbxx.jdp_list["+idx+"]."+key] = rowData[key];
				}
			}
			
			
		});
		jQuery.post(pjxx_update_url,params,modify_pjxx_back,"json");
	}
}
//提交方法回调函数
function modify_pjxx_back(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
// 		parent.parent.setPageListLjxx($("#pageNo").attr("value"));
// 		location.reload();
		pjxxQueryPageList();
		close_pjxx_mod_page();
	}else{
		jAlert(json.result,'错误信息');
	}		
}

function close_pjxx_mod_page(){
	$('#'+pjxx_detail_div).hideAndRemove("show");
}

function loadData(){
	var url='jdy/query_pjxx.action';
	var params = {'pjxx.id':$('#pjjbxxmod_id').val()};
	
	$.post(url,params,function(data){
		if(data.pjxx){
			//初始化数据
			$('#pjjbxx_mod [name*=pjxx.]').each(function(idx){
				$this = $(this);
				if($this.attr("tagName").toLowerCase() == 'select'){
					try{
						$this.setValue(setNull(eval("data." + $this.attr("name"))));
					}catch (e) {
						//alert($this.attr("name"));
						//alert(eval("data." + $this.attr("name")))
						//return;
					}
					
				}
				else{
					try{
						$this.val(setNull(eval("data." + $this.attr("name"))));
					}catch (e) {
						//alert($this.attr("name"));
						//alert(eval("data." + $this.attr("name")))
						//return;
					}
					
				}
				//显示收件人照片
				if(data.pjxx.ljjbxx.jjr.zpxx!=null &&data.pjxx.ljjbxx.jjr.zpxx!=""){
					if(data.pjxx.ljjbxx.jjr.zpxx.id!=null && data.pjxx.ljjbxx.jjr.zpxx.id!=""){
						try{
							$("#pjjbxxmod_jjr_zpxx_zpid").val(data.pjxx.ljjbxx.jjr.zpxx.id);
							showImage("img_picControlscrjjr",data.pjxx.ljjbxx.jjr.zpxx.id);
							$("#pjjbxxmod_jjrzpdata").val(data.pjxx.ljjbxx.jjrzpxx);
						}catch (e) {
							
						}
					}
				}
				//显示收件人照片
				if(data.pjxx.ljjbxx.sjr.zpxx!=null && data.pjxx.ljjbxx.sjr.zpxx!=""){
					if(data.pjxx.ljjbxx.sjr.zpxx.id!=null && data.pjxx.ljjbxx.sjr.zpxx.id!=""){
						try{
							$("#pjjbxxmod_sjr_zpxx_zpid").val(data.pjxx.ljjbxx.sjr.zpxx.id);
							showImage("img_picControlscr",data.pjxx.ljjbxx.sjr.zpxx.id);
							$("#pjjbxxmod_sjrzpdata").val(data.pjxx.ljjbxx.sjrzpxx);
						}catch(e){
							
						}
					}
				}	
				
			});
			//初始化寄递品信息
			if(data.pjxx.ljjbxx.jdp_list && data.pjxx.ljjbxx.jdp_list.length>0){
				var jdp_list=data.pjxx.ljjbxx.jdp_list;
				for(var i=0;i<jdp_list.length;i++){
					jdwpxxadd(jdp_list[i]);
				}
			}
			
			//给物流单号添加改变事件绑定，当物流单号的值发生改变的话，立刻做一次物流单号唯一性的验证。
			$('#pjjbxxmod_wldh').change(function(){
				var wldh=$(this).val();
				var qybm='<%=qybm%>';
				
				//验证物流单号唯一性
				validateWldh(wldh,qybm,function(json){
					$('#pjjbxx_mod_button').attr('disabled',false);
				},function(){
					$('#pjjbxx_mod_button').attr('disabled',true);
				});
			});
			//修改时间限定
			if(data.overUpdateTime){
				//只读化数据
				$('#pjjbxx_mod [id*=pjjbxxmod_]').attr("readOnly",true).addClass('readonly');
				$('#pjjbxx_mod .red').removeClass('red');
				$('#pjjbxx_mod_button').parent('td').remove();
				//去掉身份证扫描框
				$('#pjjbxx_mod a:contains("二代证读取")').each(function(){
					$(this).parents("table").eq(0).remove();
				});
				//去掉寄件人和收件人的选择器
				$('#pjjbxxmod_jjrssx').unbind('click');
				$('#pjjbxxmod_sjrssx').unbind('click');
				//去掉派件人的人员选择器
				$('#pjjbxxmod_pjr_xm').unbind('click');
				//去掉寄递品添加按钮
				$('#pjjbxx_mod a[id=addbutton]').remove();
				//去掉寄递品信息的操作动作
				function clear(){
					$('#YwwffzjlData tbody tr').each(function(){
						$(this).find('td:last').html('');
					})
				}
				
				setTimeout(clear,600);
			}
		}
		else{
			jAlert('该派件信息已经不存在','提示');
		}
		
	}, 'json');
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1" id="pjxx_title">寄递品派件信息修改</td>
      <td align="right"><a href="#" id="closeDiv" onclick='close_pjxx_mod_page();' class="close"></a></td>
    </tr>
</table>

<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="pjjbxx_mod">
<tr>
<td>
<input type="hidden" name="pjxx.pjr.cyrybh" id="pjjbxxmod_pjr_cyrybh">
<input type="hidden" name="pjxx.ljjbxx.jjr.ssx" id="pjjbxxmod_jjrssxdm">
<input type="hidden" name="pjxx.ljjbxx.sjr.ssx" id="pjjbxxmod_sjrssxdm">
<input type="hidden" name="pjxx.id" id="pjjbxxmod_id">
<%-- 修正寄件人和收件人没用ID的问题 --%>
<input type="hidden" name="pjxx.ljjbxx.jjr.id" id="pjjbxxmod_jjrid">
<input type="hidden" name="pjxx.ljjbxx.sjr.id" id="pjjbxxmod_sjrid">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
  	
    <fieldset>
	<legend style="color: black;">业务基本信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="distd">登记序号</td>
			<td class="detailtd"><input type="text" id="lj_djxh" name="lj.djxh" class="readonly"/></td>
			<td class="red">物流单号</td>
			<td class="detailtd"><input type="text" id="lj_wldh" name="lj.wldh" class="inputstyle readonly"  /></td>
		</tr>
	</table>
	</fieldset>
	<table width="100%" border="0" cellSpacing="0" cellPadding="0" >
	   <tr>
	       <td>
	            <jsp:include page="../../business/jdyzagl/jjrxx.jsp?pdbzw=pjjbxxmod"></jsp:include>
	       </td>
	       <td>
	       		&nbsp;
	       </td>
	       <td>
	            <jsp:include page="../../business/jdyzagl/sjrxx.jsp?pdbzw=pjjbxxmod"></jsp:include>
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
			     	<th name="xh">序号</th>
			     	<th name="sfscbz">标志位</th>
			     	<th name="jdpmc">内件品名</th>
			     	<th name="jdpsm">数量</th>
			     	<th name="jdplx">类型</th>
			     	<th name="jdpzl">重量</th>
			     	<th name="jdptj">体积</th>
					<th name="">操作</th>
			    </tr>
			  </thead>
			</table>	
		</div>
	</fieldset>
	<fieldset>
	<legend>代收人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td >代收人</td>
			<td class="detailtd"><input type="text" id="pjjbxxmod_dsr_xm"   name="pjxx.dsr.xm" class="inputstyle" ></td>
			<td >证件类型</td>
			<td class="detailtd"><select id="pjjbxxmod_dsrzjlx" name="pjxx.dsr.zjlx"><option></option> </select></td>
			<td >证件号码</td>
			<td class="detailtd"><input type="text" id="pjjbxxmod_dsrzjhm" name="pjxx.dsr.zjhm" class="inputstyle" ></td>
		</tr>
	</table>
	</fieldset>
	<fieldset>
	<legend>派件人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="red">派件人</td>
			<td class="detailtd"><input type="text" id="pjjbxxmod_pjr_xm" name="pjxx.pjr.xm" class="inputstyle" ></td>
			<td class="red">派件时间</td>
			<td class="detailtd"><input type="text" id="pjjbxxmod_pjsj" name="pjxx.pjsj" class="inputstyle" ></td>
		</tr>
	</table>
	</fieldset>
  </td>
</tr>
</table>
</td>
</tr>
<tr><td height="3"></td></tr>
<tr height="25" align="center">
	<td>
		<table ALIGN="center" >
			<tr>
				<td ><a href="#" id="pjjbxx_mod_button" hidefocus="true" class="submitbutton" title="保存" onclick='modify_pjxx();'>保存</a></td>
				<td ><a href="#" id="pjjbxx_goback" hidefocus="true" class="submitbutton" title="返回" onclick='close_pjxx_mod_page();'>返回</a></td>			
			</tr>
		</table>
	</td>
	
</tr>
</table>

