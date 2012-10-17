<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script><!-- 寄递业公共js -->
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->

<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	var grpfghdwcx="grpfghdwcx";
	var grpfghdwcx_width=900;
	var grpfghdwcx_div="pjjbxxDiv";
	var grpfghdwcx_table = "pjjbxxTable";
	var grpfghdwcx_table_html;
	var rdrjbxx_page_url = "jdy/grpfghdwcx_rdrjbxx.action";
	$(document).ready(function() {
		//时间设置
		$('.datef').attr("readOnly",true).datepicker(true,'0');
		$('.datet').attr("readOnly",true).datepicker(true,'1');
		// 治安管理机构
		$("#rdrjbxx_gxdwmc").click(function(){
			getGxdwTree("rdrjbxx_gxdwmc","rdrjbxx_gxdwbm",null,"jdytjxx_departlevel");
		});
		//户籍省市县--寄件人
		$("#rdrjbxx_ssxmc").click( function() {
			getDict_item("rdrjbxx_ssxmc", "rdrjbxx_ssx", "dm_xzqh");
		});
		daggleDiv(grpfghdwcx);
		loadPagePjxxQuery(grpfghdwcx_div);
		
	});
	function loadPagePjxxQuery(divpageid){
		grpfghdwcx_table_html=$("#"+divpageid).html();
		jdywxxQueryPageList(1,'#');
	}
	function setPjxxQueryList(pageno,url){
	 	$("#"+grpfghdwcx_div).html(grpfghdwcx_table_html);
		params = getSubmitParams("#grpfghdwcx_gad [name*=rdrjbxx.]",params);
		if (url==null || url=="undefined"){
			url=rdrjbxx_page_url;
		}
		return url;
	}
	//页面gird加载方法
	function jdywxxQueryPageList(pageno,url){	
		//查询提交时：如果管辖单位编码为空，则必须赋上当前登录用户的管辖单位编码
		if($("#rdrjbxx_gxdwbm").val()==null || $("#rdrjbxx_gxdwbm").val()==""){
			$("#rdrjbxx_gxdwbm").val(<%=gxdwbm%>);
		}
		if (true){
		    url=setPjxxQueryList(pageno,url);
			var mygrid1 = $("#"+grpfghdwcx_table).ingrid({ 
											url: url,	
											onRowSelect:null,
											height: pageHeight-250,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											//colIndex: [0],
											noSortColIndex:[8],
											//hideColIndex:[1],
											isHaveMorenPaixuClass: true, //加默认排序样式
											morenPaixuCol: 7, //第一默认排序	
											morenPaixuFangshi:'desc', //默认排序方式 
											alignCenterColIndex: [1,2,8],
											changeHref:function(table){
												//$(table).find("tr").each(function(){
													//$(this).find("td:last").find("a[title='可疑']").remove();
												//});
												if($(table).find("tr").length==0){
												    daochuNum = 0;
												}else{
												    daochuNum = 1;
												}	
											},
											colWidths: ["10%","20%","15%","20%","15%","15%"]									
										});				
	    }
	}	
    //验证方法 
    function manVerify_grpfghdwcx(){
    	if (!checkControlValue("rdrjbxx_pjtbsjf1","String",1,30,null,1,"开始时间"))
			return false;
		if (!checkControlValue("rdrjbxx_pjtbsjt1","String",1,30,null,1,"结束时间"))
			return false;
		if (!checkControlValue("rdrjbxx_ghjjdwcs","Select",1,8,null,1,"更换寄件单位次数超过"))
			return false;
		if (!checkControlValue("rdrjbxx_gxdwmc","String",1,70,null,1,"治安管理机构"))
			return false;
		return true;
    }
</script>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="grpfghdwcx_gad">
   <input type="hidden" id="rdrjbxx_gxdwbm" name="rdrjbxx.gxdwbm" value="<%=gxdwbm%>"><!-- 管辖单位编码 -->
   <input type="hidden" id="jdytjxx_departlevel" value="<%=departlevel %>"><!-- 级别 -->
   <input type="hidden" id="rdrjbxx_ssx" name="rdrjbxx.ssx" value=""><!-- 省市县代码 -->
  <tr>
    <td class="queryfont">个人寄件时频繁更换单位统计</td>
  </tr>
  <tr>
    <td class="tdbg">
    	<table width="100%" border="0" cellspacing="0" cellpadding="2">
    			<tr>
				  <td width="7%" class="red">开始时间</td>
				  <td width="41%" class="pagetd"><input type="text" id="rdrjbxx_pjtbsjf1" name="rdrjbxx.kssj" class="inputstyle datef" value="">
			      	   <span class="red">结束时间<input  type="text" id="rdrjbxx_pjtbsjt1" name="rdrjbxx.jssj" class="inputstyle datet" value="" ></span>
				  </td>
				  <td width="7%" class="red">更换寄件单位次数超过</td>
				  <td width="41%" class="pagetd"><input type="text" class="inputstyle"  style="width: 5px;" id="rdrjbxx_ghjjdwcs" name="rdrjbxx.ghjjdwcs" value="">
			      	<span class="red">次</span>
				  </td>
				</tr>
    			<tr>
					<td width="10%" class="red">治安管理机构</td>
					<td width="23%" class="pagetd"><input type="text" id="rdrjbxx_gxdwmc" name="rdrjbxx.gxdwmc"  class="inputstyle" value="" readonly></td>
					<td width="30%" class="pagedistd">寄件目的地（省市县/区）</td>
					<td width="23%" class="detailtd"><input type="text" id="rdrjbxx_ssxmc"  name="rdrjbxx.ssxmc"  class="inputstyle" value=""/></td>
				</tr>
	    		<tr>
	    		  <td colspan="6">
	    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
	    		    	<tr>
	    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="jdywxxQueryPageList(1);">查询</a></td>
	    		    	  <td ><a href="#" class="addbutton" id="jdywxx" onclick='exportPjxx();'>导出</a></td>
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
<div id="grpfghdwcx" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

<div id="pjjbxxDiv" style="width:100%;">
	<table id="pjjbxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_xm" datatype="string" sumflag="0">姓名</th>
	    	<th name="l_kssj" datatype="string" sumflag="0">寄件起始时间</th>
	    	<th name="l_jssj" datatype="string" sumflag="0">寄件结束时间</th>
	    	<th name="l_gxdwmc" datatype="string" sumflag="0">所属辖区</th>
	    	<th name="l_ghjjdwcs" datatype="string" sumflag="0">寄递次数</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>