<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
<script type="text/javascript">
var detailidTopOffset,detailidLeftOffset;
var ylcsjbxx_detailidOffset = $("#divs_" + gmcId).offset();		
detailidTopOffset=ylcsjbxx_detailidOffset.top;
detailidLeftOffset=ylcsjbxx_detailidOffset.left;

pageUrld="<%=request.getContextPath() %>/sysadmin/queryForDict_dict_item.action";
divnidd="tabledatt";
//tableidd="dictTable";
//loadPage("tabledatt");
tabled=$("#tabledatt").html();


//从url中获得值 paramName-参数名称
 function getQueryStringRegExp(paramName) 
 {     var reg = new RegExp("(^|\\?|&)"+ paramName +"=([^&]*)(\\s|&|$)", "i");
       if (reg.test(location.href)) 
       		return unescape(RegExp.$2.replace(/\+/g, " "));
       return ""; 
 };

function setList1(pageno,url){	
	$("#"+divnidd).html(tabled);	
	//createXML("p_");
	if (url==null || url=="undefined"){
		url=pageUrld;
	}
	return url;
}	

$(document).ready(function() {
	if(gcodeValue!=null && gcodeValue!=""){
		$("#t_query_simplepin").val(gcodeValue);
	}
	if(gtreeParentId!=null && gtreeParentId!=""){
		$("#t_super_item_id").val(gtreeParentId);
    }
    
	$("#t_append_value").val(glevel);
	setPageList1(1);	
	$("#t_query_simplepin").val('');
	//点击清除按钮，清除调用框及相应隐藏框的值
	$("#b_clear").click(function(){
        mcId = gmcId;
		dmId = gdmId;
		
 		if(gitemid!=null && gitemid!=""){
	        $("#" + gitemid).val("");
        }
 		$("#" + mcId).val("");
 		$("#" + dmId).val("");
 		emptyWpxlAndWpxil2();
    });
	   
    //回车键查询，选项上下移动
    var trIndex = 0;
    var keydownCode = 0;
    var tableIsFocus = 0;
	$("#mybody_dictItemDrop").keydown(function(event){
   		 var trList = $("#dictItemTable").find("tbody").find("tr");
		if(event.keyCode == 13){//回车键
			if($("#dictItemTable").find("tbody").find("tr[sel='true']").length>0){
				xuanzhongzhi($("#dictItemTable").find("tbody").find("tr[sel='true']"));
				$("#divs_" + mcId).remove();
			}else{
				//if($("#t_query_simplepin").val()!="")
					setPageList1(1);
			}
			event.stopPropagation();
		}else if(event.keyCode == 38){//向上键
			if(tableIsFocus == 0){
				$("#dictItemTable").focus();
				tableIsFocus = 1;
			}
				if(keydownCode ==40)
					trIndex--;
				keydownCode = 38;
				trList.eq(trIndex).removeClass("grid-row-sel");
				trList.eq(trIndex).attr("sel",'false');
				if(trIndex!=-1){
					trList.eq(trIndex-1).addClass("grid-row-sel");
					trList.eq(trIndex-1).attr("sel",'true');
				}
				if(trIndex>0){
					trIndex--;
				}else if(trIndex==0){
					$("#t_query_simplepin").focus();
					tableIsFocus = 0;
					trIndex--;
				}
				
		}else if(event.keyCode == 40){//向下键
			
			if(tableIsFocus == 0){
				$("#dictItemTable").focus();
				tableIsFocus = 1;
			}
				if(keydownCode ==38)
					trIndex++;
				keydownCode = 40;
				trList.eq(trIndex-1).removeClass("grid-row-sel");
				trList.eq(trIndex-1).attr("sel",'false');
				trList.eq(trIndex).addClass("grid-row-sel");
				trList.eq(trIndex).attr("sel",'true');
				if(trList.length>=trIndex)
					trIndex++;
		}
	}); 

}); 

var mygrid1d;
function setPageList1(pageno,url){	
		url=setList1(pageno,url);
		$("#t_dict_code").val(gdictCode);
		createXML("t_");
		mygrid1d = $("#dictTable").ingrid({ 
										ingridPageParams:sXML, 
										tableid:"dictItemTable",
										prefix:"t_",
										ingridPageWidth:440,
										barTopOffset:-(detailidTopOffset),
										barLeftOffset:-(detailidLeftOffset),
										url:url,	
										height: 250,
										sorting: false,
										pageNumber: pageno,
										isPlayResultNull:false,//查询结果为空时不提示
										onRowSelect:function(tr){
											xuanzhongzhi(tr);
											$("#divs_" + mcId).remove();
										},
										changeHref:function(table){
											$("#t_query_simplepin").focus();
											var trLength = table.find("tr").length;
											if(trLength==1){
												xuanzhongzhi(table.find("tr"));
											}
										},
										colWidths: ["36%","18%","36%","10%"]
									});		
}	

//选中值
function xuanzhongzhi(tr){
	mcId = gmcId;
	dmId = gdmId;
	if(gitemid!=null && gitemid!=""){
	    $("#" + gitemid).attr("value",$(tr).attr("id"));
	}
	mcva=$(tr).find("td").eq(0).text();
	dmva=$(tr).find("td").eq(3).text();
	$("#" + dmId).attr("value",dmva);
	$("#" + mcId).attr("value",mcva);
	emptyWpxlAndWpxil();
	loadWpxx(dmva);
}
//典当物品大类改变时 load相应页面
function loadWpxx(dmva) {
	if(gdictCode == 'dm_ddwpzl' && gtreeParentId == 0) {
		$('#ddwpxxdiv').empty();
		if(mcId.substring(0,2) == "a_") {
			if(dmva=='1'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpsjxx.jsp');
			}else if(dmva=='2'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpclxx.jsp');
			}else if(dmva=='3'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpfdcxx.jsp');
			}else{
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpjbxx.jsp');
			}
		} 
	   if(mcId.substring(0,2) == "m_") {
		   if(dmva=='1'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpsjxxModify.jsp');
			}else if(dmva=='2'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpclxxModify.jsp');
			}else if(dmva=='3'){
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpfdcxxModify.jsp');
			}else{
				$('#ddwpxxdiv').load('business/Ddhyzagl/wpjbxxModify.jsp');
			}
		} 
	}
}
//清空典当物品信息相应的大类、小类的值
function emptyWpxlAndWpxil()  {
	if((gdictCode == 'dm_ddwpzl' || gdictCode == 'dm_ddwp(ccql)' || gdictCode == 'dm_ddwp(fdc)') && gtreeParentId == 0) {//如果选中的是大类
		$("#a_wpxl2").val("");
		$("#a_wpxl").val("");
		$("#a_wpxldm").val("");
		$("#a_wpxlid").val("");
		$("#a_wpxil").val("");
		$("#a_wpxil2").val("");
		$("#a_wpxildm").val("");
		$("#a_wpdl").val($("#a_wpdl2").val());
		$("#m_wpxl2").val("");
		$("#m_wpxl").val("");
		$("#m_wpxldm").val("");
		$("#m_wpxlid").val("");
		$("#m_wpxil").val("");
		$("#m_wpxil2").val("");
		$("#m_wpxildm").val("");
		$("#m_wpdl").val($("#m_wpdl2").val());
		$("#t_wpxl2").val("");
		$("#t_wpxl").val("");
		$("#t_wpxldm").val("");
		$("#t_wpxlid").val("");
		$("#t_wpxil").val("");
		$("#t_wpxil2").val("");
		$("#t_wpxildm").val("");
	}
	if((gdictCode == 'dm_ddwpzl' || gdictCode == 'dm_ddwp(ccql)' || gdictCode == 'dm_ddwp(fdc)') && gtreeParentId != 0) {//如果是选中小类或者细类
		var superId;
		params={super_id:gtreeParentId};
		//$.post("sysadmin/query_dict_item.action",params,function(json){
	//		superId = setNull(json.LDict_item[0].super_item_id);
	//		alert(superId);
	//	},"json");
		$.ajax({
			type:'POST',
			url:'sysadmin/query_dict_item.action',
			data:params,
			async:false,
			dataType:'json',
			success:function(json){
					superId = setNull(json.LDict_item[0].super_item_id);
			}
		});
		if(superId == 0) {
			$("#a_wpxil").val("");
			$("#a_wpxil2").val("");
			$("#a_wpxildm").val("");
			$("#a_wpxl").val($("#a_wpxl2").val());
			$("#m_wpxil").val("");
			$("#m_wpxil2").val("");
			$("#m_wpxildm").val("");
			$("#m_wpxl").val($("#m_wpxl2").val());
			$("#t_wpxil").val("");
			$("#t_wpxil2").val("");
			$("#t_wpxildm").val("");
		} else {
			$("#a_wpxil").val($("#a_wpxil2").val());
			$("#m_wpxil").val($("#m_wpxil2").val());
		}
	}
}
//清空典当物品信息相应的大类、小类的值(清除连接用)
function emptyWpxlAndWpxil2()  {
	if((gdictCode == 'dm_ddwpzl' || gdictCode == 'dm_ddwp(ccql)' || gdictCode == 'dm_ddwp(fdc)') && gtreeParentId == 0) {//如果选中的是大类
		$("#a_wpdl").val("");
		$("#a_wpxl2").val("");
		$("#a_wpxl").val("");
		$("#a_wpxldm").val("");
		$("#a_wpxil").val("");
		$("#a_wpxil2").val("");
		$("#a_wpxildm").val("");
		$("#m_wpdl").val("");
		$("#m_wpxl2").val("");
		$("#m_wpxl").val("");
		$("#m_wpxldm").val("");
		$("#m_wpxil").val("");
		$("#m_wpxil2").val("");
		$("#m_wpxildm").val("");
		$("#t_wpxl2").val("");
		$("#t_wpxl").val("");
		$("#t_wpxldm").val("");
		$("#t_wpxil").val("");
		$("#t_wpxil2").val("");
		$("#t_wpxildm").val("");
	}
	if((gdictCode == 'dm_ddwpzl' || gdictCode == 'dm_ddwp(ccql)' || gdictCode == 'dm_ddwp(fdc)') && gtreeParentId != 0) {//如果是选中小类或者细类
		var superId;
		params={super_id:gtreeParentId};

		$.ajax({
			type:'POST',
			url:'sysadmin/query_dict_item.action',
			data:params,
			async:false,
			dataType:'json',
			success:function(json){
					superId = setNull(json.LDict_item[0].super_item_id);
			}
		});
		if(superId == 0) {
			$("#a_wpxl").val("");
			$("#a_wpxil").val("");
			$("#a_wpxil2").val("");
			$("#a_wpxildm").val("");
			$("#m_wpxl").val("");
			$("#m_wpxil").val("");
			$("#m_wpxil2").val("");
			$("#m_wpxildm").val("");
			$("#t_wpxil").val("");
			$("#t_wpxil2").val("");
			$("#t_wpxildm").val("");
		} else {
			$("#a_wpxil").val("");
		} 
		
	}
}

</script>
</head>
<body>
<div id="mybody_dictItemDrop">
<input id='t_super_item_id' type='hidden' />
<input id='t_append_value' type='hidden' />
<table width="100%" border="0" cellpadding="0" cellspacing="0"  background="images/toolbar.gif">
    <tr>
    	<td width="85%"  style="text-align:left"><input id='t_query_simplepin' class="inputstyle3" type='text' style="width:98%" /></td>
    	<td width="15%" style="text-align:center"><img src="images/clear.gif" width="16" height="16" /><a href="#" id='b_clear' class="fontbutton1">[清除]</a></td>
   	</tr>
</table> 
<div id="tabledatt" style="width:100%;">
	<table id="dictTable" width="100%" border="1">
	  <thead>
	    <tr>       
	     	<th name="">名称</th>
	     	<th name="">简拼</th>
	     	<th name="">全拼</th>
	     	<th name="">代码</th>
	    </tr>
	  </thead>
	  
	</table>	
</div>
</div>
</body>
</html>