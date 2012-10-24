<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@include file="../../public/common.jsp" %>
<%@include file="../../public/user-info.jsp" %>

<script type="text/javascript">
var trNum=0;
var invaildCard={ //无效证件集合
		'jjr':{"name":'寄件人',status:0},
		'sjr':{'name':'收件人',status:0},
		'dsr':{'name':'代收人',status:0}
};
$(function() {	
	//修改页面所有原有揽件信息元素
	$('#pjjbxx_add [id*=lj_]').each(function(idx){
		var $this = $(this);
		var id = $this.attr('id');
		var name = $this.attr('name');
		$this.attr("id", id.replace('lj_','pjxxadd_','g') );
		if(name)
			$this.attr("name", "pjxx."+name.replace("lj\.","ljjbxx\.","g"));
		$this.removeAttr("value");
	});
	//$('#jjrssxmc').attr('id','pjxxadd_jjrssx');
	//$('#sjrssxmc').attr('id','pjxxadd_sjrssx');
	//$('#pjxxadd_jjrssx').attr("name","pjxx.ljjbxx.jjr.ssxmc");
	//$('#pjxxadd_sjrssx').attr("name","pjxx.ljjbxx.sjr.ssxmc");
	//添加寄递对象证件类型的提交名称
	$("#pjxxadd_jjrzjlx").attr("name","pjxx.ljjbxx.jjr.zjlx");
	$("#pjxxadd_sjrzjlx").attr("name","pjxx.ljjbxx.sjr.zjlx");
	
	//派件人
	$('#pjxxadd_pjr_xm').attr('readOnly',true).click(function(){
		dataid=null;
		getTyRY_item('pjxxadd_pjr_xm','pjxxadd_pjr_cyrybh',null,'<%=gxdwbm%>',null,'<%=qybm%>');
	});
	//派件时间选择
	$("#pjxxadd_pjsj").val('<%=dateNow%>').attr("readOnly",true).datepicker(true).val('<%=datetime%>');
	
	//户籍省市县--寄件人
	//$("#pjxxadd_jjrssx").click( function() {
	//	getDict_item("pjxxadd_jjrssx", "pjxxadd_jjrssxdm", "dm_xzqh");
	//});
	//户籍省市县--收件人
	//$("#pjxxadd_sjrssx").click( function() {
	//	getDict_item("pjxxadd_sjrssx", "pjxxadd_sjrssxdm", "dm_xzqh");
	//});
	//证件类型--寄件人
	getDictItemBox("pjxxadd_jjrzjlx","","dm_zjlx");
	//证件类型--收件人
	getDictItemBox("pjxxadd_sjrzjlx","","dm_zjlx");
	//代收人的证件类型
	getDictItemBox("pjxxadd_dsr_zjlx","","dm_zjlx");
	dzcl_pageUrl="jdy/queryListjdp_ljxx.action";
	
	detailid="zxzybaydwdzcl_detail";
	daggleDiv(detailid);
	$("#"+detailid).hide();
	
	$("#pjxxadd_jjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		if($('#pjxxadd_jjrzjlx').val() == '11'){
			//如果身份证证号填写不为15或18位，则直接返回让他重新填写
			var zjhm = $("#pjxxadd_jjrzjhm").attr("value").toUpperCase();
			if(zjhm!=""){
				if(isIdCardNo_jdy(zjhm)==false){
					sFlag="false";
					jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
				    	if(r==true){
				    		
						}
						else{
							$("#pjxxadd_jjrzjhm").val("");
						}
					});
				}else{
					if(zjhm.length==15){
						valSfzCardIsRight_jdy("pjxxadd_jjrzjhm","请正证件号码!");
					}
				}
			}
		}
		
	});
	$("#pjxxadd_sjrzjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		if($('#pjxxadd_sjrzjlx').val()=='11'){
			//如果身份证证号填写不为15或18位，则直接返回让他重新填写
			var zjhm = $("#pjxxadd_jjrzjhm").attr("value").toUpperCase();
			if(zjhm!=""){
				if(isIdCardNo_jdy(zjhm)==false){
					sFlag="false";
					jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
				    	if(r==true){
				    		
						}
						else{
							$("#pjxxadd_jjrzjhm").val("");
						}
					});
				}else{
					if(zjhm.length==15){
						valSfzCardIsRight_jdy("pjxxadd_jjrzjhm","请正证件号码!");
					}
				}
			}
		}
		
	});
	
	$("#pjxxadd_dsr_zjhm").blur(function(){//当填写身份号码失去焦点后，去判断身份号码
		if($('#pjxxadd_dsr_zjlx').val() == "11"){
			//如果身份证证号填写不为15或18位，则直接返回让他重新填写
			var zjhm = $("#pjxxadd_dsr_zjhm").attr("value").toUpperCase();
			if(zjhm!=""){
				if(isIdCardNo_jdy(zjhm)==false){
					sFlag="false";
					jConfirm('该人员身份证号码错误，确定继续保存？', '确认提示', function(r) {
				    	if(r==true){
				    		
						}
						else{
							$("#pjxxadd_dsr_zjhm").val("");
						}
					});
				}else{
					if(zjhm.length==15){
						valSfzCardIsRight_jdy("pjxxadd_dsr_zjhm","请正证件号码!");
					}
				}
			}
		}
		
	});
	
	dzcl_divnid="YwwffzjlData";
	dzcl_tableid="YwwffzjlTable";
	dzcl_tables=$("#"+dzcl_divnid).html();
	setPageList_ywwffzjlzmfj(1,'#');
	//物流单号查询
	
	$('#pjxxadd_wldh').change(function(){
		if(!$(this).val())
			return;
		wldh_completion($(this).val(),'<%=qybm%>');
	});
	
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
		//标志位修改成1表示新添加之后又做了删除，2表示已经做了录入需要对数据库进行删除
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
function pjxx_add_verify(){
	if (!checkControlValue("pjxxadd_wldh","String",1,30,null,1,"物流单号"))
		return false;
	if (!checkControlValue("pjxxadd_jjrxm","String",1,30,null,1,"寄件人姓名"))
		return false;
	// if (!checkControlValue("pjxxadd_jjrzjlx","Select",1,8,null,1,"寄件人证件类型"))
	// 	return false;
	//if (!checkControlValue("pjxxadd_jjrzjhm","String",1,18,null,1,"寄件人证件号码"))
		//return false;
	//if (!checkControlValue("pjxxadd_jjrssx","String",1,70,null,1,"寄件地址"))
	//	return false;
	if (!checkControlValue("pjxxadd_jjrxxdz","String",1,70,null,1,"寄件人现住地详址"))
		return false;
	if (!checkControlValue("pjxxadd_jjrlxdh","String",1,20,null,1,"寄件人手机"))
		return false;
	if (!checkControlValue("pjxxadd_sjrxm","String",1,30,null,1,"收件人姓名"))
		return false;
	//if (!checkControlValue("pjxxadd_sjrzjlx","Select",1,8,null,1,"收件人证件类型"))
	//	return false;
	//if (!checkControlValue("pjxxadd_sjrzjhm","String",1,18,null,1,"收件人证件号码"))
		//return false;
	//if (!checkControlValue("pjxxadd_sjrssx","String",1,70,null,1,"收件地址"))
	//	return false;
	if (!checkControlValue("pjxxadd_sjrxxdz","String",1,70,null,1,"收件人现住地详址"))
		return false;
	if (!checkControlValue("pjxxadd_sjrlxdh","String",1,20,null,1,"收件人手机"))
		return false;
	if (!checkControlValue("pjxxadd_pjr_xm","String",1,20,null,1,"派件人"))
		return false;
	if (!checkControlValue("pjxxadd_pjsj","String",1,20,null,1,"派件日期"))
		return false;
	
	if(!$('#YwwffzjlData tbody>tr:visible').length){
		jAlert("寄递品信息不能为空","提示");
		return false;
	}
  return true;
}
//揽件信息保存方法
function add_pjxx(mode){
	if (pjxx_add_verify()){
		var params = getSubmitParams("#pjjbxx_add [name*=pjxx.]");
		$('#YwwffzjlData tbody tr').each(function(idx){
			var $tr = $(this);
			var rowData = $.evalJSON($tr.attr("rowData"));
			for(var key in rowData){
				params["pjxx.ljjbxx.jdp_list["+idx+"]."+key] = rowData[key];
			}
			
		});
		
		if(mode == 'again')
			jQuery.post("jdy/insert_pjxx.action",params,add_pjxx_again_callback,"json");
			//add_pjxx_again_callback({result:"success"})
		else
			jQuery.post("jdy/insert_pjxx.action",params,add_pjxx_back,"json");
	}
}
//提交方法回调函数
function add_pjxx_back(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		//parent.parent.setPageListLjxx($("#pageNo").attr("value"));
		//location.reload();
		pjxxQueryPageList();
		close_pjxx_add_page();
	}else{
		jAlert(json.result,'错误信息');
	}		
}
//保存并且新增的回调
function add_pjxx_again_callback(json){
	if  (json.result=="success"){
		jAlert(addMessage,'提示信息');
		
		//清楚所有揽件信息
		$('#pjjbxx_add [name*=pjxx.ljjbxx.]').each(function(){
			$this = $(this);
			if($this.attr('tagName').toLowerCase() == 'select'){
				$this.setValue('');
			}
			else
				$this.removeAttr("value");
		});
		//$('#pjxxadd_jjrssx').removeAttr('value');
		//$('#pjxxadd_sjrssx').removeAttr('value');
		$('#YwwffzjlData tbody tr').remove();
		$('#pjxxadd_dsr_xm').removeAttr('value');
		$('#pjxxadd_dsr_zjhm').removeAttr('value');
		$('#pjxxadd_dsr_zjlx').setValue('');
		
	}else{
		jAlert(json.result,'错误信息');
	}		
}
function close_pjxx_add_page(){
	$('#'+pjxx_detail_div).hideAndRemove("show");
}

/*
* 物流单号补全揽件信息
*/
function wldh_completion(wldh,qybm){
	var url='jdy/query_ljxx.action';
	var params = {'lj.wldh':wldh,'lj.qyjbxx.qybm':qybm,'lj.scbzw':'0'};
	
	$.post(url,params,function(data){
		if(data.lj){
			$('#pjjbxx_add [name*=pjxx.ljjbxx.]').each(function(idx){
				$this = $(this);
				var value;
				try{
					value= setNull(eval("data.lj." + $this.attr("name").split("pjxx.ljjbxx.")[1]));
				}catch(e){
					value="";
				}
				
				if(value){
					if($this.attr("tagName").toLowerCase() == 'select'){
						$this.setValue(value);
					}
					else{
						$this.val(value);
					}
				}
				//显示收件人照片
				if(data.lj.jjr.zpxx!=null && data.lj.jjr.zpxx!=""){
					if(data.lj.jjr.zpxx.id!=null && data.lj.jjr.zpxx.id!=""){
						try{
							$("#pjxxadd_jjr_zpxx_zpid").val(data.lj.jjr.zpxx.id);
							showImage("img_picControlscrjjr",data.lj.jjr.zpxx.id);
							$("#pjxxadd_jjrzpdata").val(data.lj.jjrzpxx);
						}catch (e) {
							
						}
					}
				}
				//显示收件人照片
				if(data.lj.sjr.zpxx!=null && data.lj.sjr.zpxx!=""){
					if(data.lj.sjr.zpxx.id!=null && data.lj.sjr.zpxx.id!=""){
						try{
							$("#pjxxadd_sjr_zpxx_zpid").val(data.lj.sjr.zpxx.id);
							showImage("img_picControlscr",data.lj.sjr.zpxx.id);
							$("#pjxxadd_sjrzpdata").val(data.lj.sjrzpxx);
						}catch(e){
							
						}
					}
				}
					
			});
			
			//初始化寄递品信息
			//修正每次初始化寄递品信息重复添加寄递品信息
			$('#YwwffzjlData tbody tr').remove();
			if(data.lj.jdp_list && data.lj.jdp_list.length>0){
				var jdp_list=data.lj.jdp_list;
				for(var i=0;i<jdp_list.length;i++){
					jdwpxxadd(jdp_list[i]);
				}
			}
			
			//如果揽件信息为可疑的话，不准派件
			if(data.lj.kybz && data.lj.kybz=="Y"){
				$('#pjjbxx_add_button').parent('td').hide();
				$('#pjjbxx_add_again_button').parent('td').hide();
				
				jAlert("该揽件信息包含可疑物品，无法派件","提示");
			}
			
			$('#pjjbxx_add_button').attr('disabled',false);
			$('#pjjbxx_add_again_button').attr('disabled',false);
		}
		else{
			$('#pjjbxx_add [name*=pjxx.ljjbxx.][name!=pjxx.ljjbxx.wldh]').each(function(){
				if($(this).attr('tagName').toLowerCase()=='select')
					$(this).setValue("");
				else
					$(this).removeAttr('value');
			});
			//默认当前企业编码
			$('input:hidden[name=pjxx.ljjbxx.qyjbxx.qybm]').val('<%=qybm%>');
			$('#YwwffzjlData tbody tr').remove();
			
			$('#pjjbxx_add_button').parent('td').show();
			$('#pjjbxx_add_again_button').parent('td').show();
			$('#pjjbxx_goback').attr('title','返回').text('返回');
			//验证物流单号唯一性
			validateWldh(wldh,qybm,function(json){
				$('#pjjbxx_add_button').attr('disabled',false);
				$('#pjjbxx_add_again_button').attr('disabled',false);
			},function(){
				$('#pjjbxx_add_button').attr('disabled',true);
				$('#pjjbxx_add_again_button').attr('disabled',true);
			});
		}
		
	}, 'json');
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td align="left" class="title1">寄递品信息登记</td>
      <td align="right"><a href="#" id="closeDiv" onclick='close_pjxx_add_page();' class="close"></a></td>
    </tr>
</table>

<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="pjjbxx_add">
<tr>
<td>
<input type="hidden" name="pjxx.ljjbxx.qyjbxx.qybm" value="<%=qybm%>">
<input type="hidden" name="pjxx.pjr.cyrybh" id="pjxxadd_pjr_cyrybh">
<!--<input type="hidden" name="pjxx.ljjbxx.jjr.ssx" id="pjxxadd_jjrssxdm">-->
<!--<input type="hidden" name="pjxx.ljjbxx.sjr.ssx" id="pjxxadd_sjrssxdm">-->
<%-- 修正在新增派件信息的时候，寄件人和收件人的ID为空的问题 --%>
<input type="hidden" name="pjxx.ljjbxx.jjr.id" id="pjxxadd_jjrid">
<input type="hidden" name="pjxx.ljjbxx.sjr.id" id="pjxxadd_sjrid">
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
			<td class="detailtd">
				<input type="text" id="pjxxadd_wldh" name="pjxx.ljjbxx.wldh" class="inputstyle"  />
				<span style="margin-left: 15px;">
					<a id="scan_wldh_btn" href="#" class="submitbutton">扫描</a>
				</span>
			</td>
		</tr>
	</table>
	</fieldset>
	<table width="100%" border="0" cellSpacing="0" cellPadding="0" >
	   <tr>
	       <td>
	            <jsp:include page="../../business/jdyzagl/jjrxx.jsp?pdbzw=pjxxadd"></jsp:include>
	       </td>
	       <td>
	       		&nbsp;
	       </td>
	       <td>
	            <jsp:include page="../../business/jdyzagl/sjrxx.jsp?pdbzw=pjxxadd"></jsp:include>
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
			<td class="detailtd"><input type="text" id="pjxxadd_dsr_xm"   name="pjxx.dsr.xm" class="inputstyle" ></td>
			<td >证件类型</td>
			<td class="detailtd"><select id="pjxxadd_dsr_zjlx" name="pjxx.dsr.zjlx"></select></td>
			<td >证件号码</td>
			<td class="detailtd"><input type="text" id="pjxxadd_dsr_zjhm" name="pjxx.dsr.zjhm" class="inputstyle" ></td>
		</tr>
	</table>
	</fieldset>
	<fieldset>
	<legend>派件人信息</legend>
	<table width="100%" >
		<tr height="20">
			<td class="red">派件人</td>
			<td class="detailtd"><input type="text" id="pjxxadd_pjr_xm" name="pjxx.pjr.xm" class="inputstyle" ></td>
			<td class="red">派件日期</td>
			<td class="detailtd"><input type="text" id="pjxxadd_pjsj" name="pjxx.pjsj" class="inputstyle" ></td>
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
				<td ><a href="#" id="pjjbxx_add_button" hidefocus="true" class="submitbutton" title="保存" onclick='add_pjxx();'>保存</a></td>
				<td ><a href="#" id="pjjbxx_add_again_button" hidefocus="true" class="submitbutton" title="保存新增" onclick='add_pjxx("again");'>保存新增</a></td>
				<td ><a href="#" id="pjjbxx_goback" hidefocus="true" class="submitbutton" title="返回" onclick='close_pjxx_add_page();'>返回</a></td>			
			</tr>
		</table>
	</td>
	
</tr>
</table>

