<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/public/user-info.jsp" %>

<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>
<script language="javascript" type="text/javascript" src="javascript/selectboxlink.js"></script><!-- 寄递物品类型联动的js -->

<script type="text/javascript">
	var lj_detail_div="pjjbxx_detail";
	var lj_detail_width=900;
	var lj_grid_div="pjjbxxDiv";
	var lj_grid_table = "pjjbxxTable";
	var lj_grid_table_html;
	var lj_page_url = "jdy/jdywxxquerylist_ljxx.action";
	$(function(){
		// 治安管理机构
		$("#lj_gxdwmc").click(function(){
			getGxdw("lj_gxdwmc","p_gxdwbm");
		});
		//寄件人证件类型
		$('#lj_jjr_zjlx').selectBox({code:'dm_zjlx'});
		//收件人证件类型
		$('#lj_sjr_zjlx').selectBox({code:'dm_zjlx'});
		//寄递物品联动下拉列表
		selectboxlink("jdwpdl","jdwpxl","dm_jdwpdl");
		
		loadPagePjxxQuery(lj_grid_div);
		
		daggleDiv(lj_detail_div);
	});
	
	function loadPagePjxxQuery(divpageid){
		lj_grid_table_html=$("#"+divpageid).html();
		jdywxxQueryPageList(1,'#');
	}
	
	function setPjxxQueryList(pageno,url){
	 	$("#"+lj_grid_div).html(lj_grid_table_html);
		params = getSubmitParams("#jdywxxcx_gyd [id*=lj_]",params);
		if (url==null || url=="undefined"){
			url=lj_page_url;
		}
		return url;
	 }
	//页面gird加载方法
	function jdywxxQueryPageList(pageno,url){	
		if (manVerify_pjxx()){
		    url=setPjxxQueryList(pageno,url);
			var mygrid1 = $("#"+lj_grid_table).ingrid({ 
											url: url,	
											onRowSelect:null,
											height: pageHeight-267,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											colIndex: [0],
											noSortColIndex:[8],
											//hideColIndex:[1],
											isHaveMorenPaixuClass: true, //加默认排序样式
											morenPaixuCol: 7, //第一默认排序	
											morenPaixuFangshi:'desc', //默认排序方式 
											alignCenterColIndex: [1,2,8],
											colWidths: ["11%","11%","9%","20%","11%","11%","11%","11%","11%"]									
										});				
			}
	}	
	//验证
	function manVerify_pjxx(){
		return true;
	}
	/**
	派件信息详情
	*/
	function setPjxxDetail(id) {
		dataid = id;
		detailDialog(lj_detail_div, lj_detail_width, lj_update_page_url, null,function(data){
			$('#pjjbxx_mod [id*=pjjbxxmod_]').attr("readOnly",true).addClass('readonly');
			$('#pjjbxx_mod .red').removeClass('red');
			$('#pjjbxx_mod_button').parent('td').remove();
			$('#pjjbxx_goback').attr('title','关闭').text('关闭');
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
			
		});
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0"  class="tableborder" id="jdywxxcx_gyd">
  <tr>
    <td class="queryfont">寄递业务信息查询</td>
  </tr>
  <tr>
    <td class="tdbg">
    	
    	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="baManTablebm">
    			<tr>
					<td width="10%" class="pagedistd">治安管理机构</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_gxdwmc" name="lj.gxdwmc" class="inputstyle" value="" readonly></td>
					<td width="10%" class="pagedistd">企业名称</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_qymc" name="lj.qymc" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">物流单号</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_wldh" name="lj.wldh" class="inputstyle" value=""></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">寄件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_jjr_xm" name="lj.jjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">寄件人证件类型</td>
					<td width="23%" class="pagetd"><select id="lj_jjr_zjlx" name="lj.jjr.zjlx" class="select1"><option></option></select></td>
					<td width="10%" class="pagedistd">寄件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_jjr_zjhm" name="lj.jjr.zjhm" class="inputstyle" value=""></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">收件人姓名</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_sjr_xm" name="lj.sjr.xm" class="inputstyle" value=""></td>
					<td width="10%" class="pagedistd">收件人证件类型</td>
					<td width="23%" class="pagetd"><select class="select1" id="lj_sjr_zjlx" name="lj.sjr.zjlx" ><option></option></select></td>
					<td width="10%" class="pagedistd">收件人证件号码</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_sjr_zjhm" name="lj.sjr.zjhm" class="inputstyle" value=""></td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">寄递品大类</td>
					<td width="23%" class="pagetd">
					  <select id="jdwpdl">
						<option></option>
					  </select>
					</td>
					<td width="10%" class="pagedistd">寄递品小类</td>
					<td width="23%" class="pagetd">
						 <select id="jdwpxl">
							<option></option>
						 </select>
					</td>
				</tr>
				<tr>
					<td width="10%" class="pagedistd">登记时间</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_pjtbsjf" name="pjtbsjf" class="inputstyle date" value=""></td>
					<td width="10%" class="pagedistd">至</td>
					<td width="23%" class="pagetd"><input type="text" id="lj_pjtbsjt" name="pjtbsjt" class="inputstyle date" value=""></td>
				</tr>
    		<tr>
    		  <td colspan="6">
    		  	<table  border="0" align="right"  cellpadding="2"  cellspacing="0">
    		    	<tr>
    		    	  <td ><a href="#" class="searchbutton" id="qu_erys" onclick="jdywxxQueryPageList(1);">查询</a></td>
    		    	  <td ><a href="#" class="addbutton" id="qu_erys" onclick='exportPjxx();'>导出</a></td>
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
<div id="pjjbxx_detail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;">
</div>	

<div id="pjjbxxDiv" style="width:100%;">
	<table id="pjjbxxTable" width="100%">
	  <thead>
	    <tr>       
	    	<th name="l_qymc">企业名称</th>
	    	<th name="l_wldh">物流单号</th>
	    	<th name="l_jjrxm">寄件人</th>
	    	<th name="l_jjrzjhm">寄件人证件号码</th>
	    	<th name="l_sjrxm">收件人姓名</th>
	    	<th name="l_jdpdlxmc">寄递品大类</th>
	    	<th name="l_jdplxmc">寄递品小类</th>
	    	<th name="l_ljtbsj">登记时间</th>
			<th name="">操作</th>
	    </tr>
	  </thead>
	</table>	
</div>