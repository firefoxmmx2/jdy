<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/public/user-info.jsp" %>
<script type="text/javascript" src="business/jdyzagl/js/jdycomm.js"></script>
<script type="text/javascript" src="business/jdyzagl/js/jquery.json-2.3.min.js"></script>
<script type="text/javascript">
	//揽件
	var ljxx_div="ljxxData";
	var ljxx_table="ljxxTable";
	var ljxx_page_url="jdy/queryListlj_ljxx.action";
	var ljxx_detail_div='ljjbxxadd_detail';
	var ljxx_detail_width=950;
	var ljxx_detail_page_url="business/jdyzagl/LjxxDetail.jsp";
	var ljxx_tabledata;
	//派件
	var pjxx_div='pjxxData';
	var pjxx_table="pjxxTable";
	var pjxx_page_url="jdy/querylist_pjxx.action";
	var pjxx_detail_div="pjxxDetail";
	var pjxx_detail_width=900;
	var pjxx_detail_page_url="business/jdyzagl/PjxxModify.jsp";
	var pjxx_tabledata;
	//协查通报
	var xctb_div="xctbData";
	var xctb_table="xctbTable";
	var xctb_page_url="basicsystem/querylistcs_xctb.action";
	var xctb_detail_div="xctbDetail";
	var xctb_detail_width=686;
	var xctb_detail_page_url="basic/basicsystem/XctbDetail.jsp";
	var xctb_tabledata;
	var detailUrl="basicsystem/query_xctb.action";
	
	var qybm='<%=qybm%>';
	var gxdwbm="<%=gxdwbm%>";
	/**
	派件信息详情
	*/
	function setPjxxDetail(id) {
		dataid = id;
		detailDialog(pjxx_detail_div, pjxx_detail_width, pjxx_detail_page_url, null,function(data){
// 			修改标题
			$('#pjxx_title').text('寄递品派件信息详情');
			$('#pjjbxx_mod [id*=pjjbxxmod_]').attr('readonly',true).addClass('readonly').attr('disabled',true);
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
			
		});
	}
	
	/**
	揽件详情方法
	*/
	function setLjxxDetail(id){
		$("#"+ljxx_detail_div).empty();
		dataid = id;
		setWidth(ljxx_detail_div,ljxx_detail_width);
		setUrl(ljxx_detail_div,ljxx_detail_page_url);
		bindDocument(ljxx_detail_div);
	}
	/**
	揽件信息查询
	*/
	function setPageListlj(pageno,url){	
		if (true){
		    $("#"+ljxx_div).html(ljxx_tabledata);
			//alert($("#ljxx_ljrxm").val());
			//alert($("#lj_ljr_cyrybh").val());
			//alert($("#ljxx_ljsjf").val());
			params = {'lj.qyjbxx.qybm':qybm};
			if (url==null || url=="undefined"){
				url=ljxx_page_url;
			}
			var mygrid1 = $("#"+ljxx_table).ingrid({ 
											url: url,
											ingridPageWidth:1000,
											height: pageHeight/5,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											//colIndex: [0],
											noSortColIndex:[7],	
											//noSortColIndex:[11],
											onRowSelect:function(row){
												setLjxxDetail($(row).attr('id'));
											},
											hideColIndex:[7,8,9,10],
											//isHaveMorenPaixuClass: true, //加默认排序样式
											//morenPaixuCol: 8, //第一默认排序	
											//morenPaixuFangshi:'desc', //默认排序方式 
											//alignCenterColIndex: [1,2,8],
											changeHref:function(table){
												//$(table).find("tr").each(function(){
													//$(this).find("td:last").find("a[title='可疑']").remove();
												//});
												$('tr',table).each(function(){
													var $tr=$(this);
													//可疑寄递物品标志
													var kyzt=$tr.find('td:nth(7)').text();
													if(kyzt=='Y'){
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
														$tr.addClass("red");
													}
													//超时标志
													var cjbz=$tr.find('td:nth(8)').text();
													if(cjbz=='Y'){
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
													}
													//已派件标志
													var ypj=$tr.find('td:nth(9)').text();
													if(ypj=='Y'){
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
													}
												});
											},
											colWidths: ["25%","15%","15%","10%","15%","10%","15%","0","2","2","0%"]									
										});				
			}
	}
	/**
	初始化派件表格
	*/
	function loadPagePjxxQuery(divpageid){
		pjxx_tabledata=$("#"+divpageid).html();
		pjxxQueryPageList(1,'#');
	}
	function setPjxxQueryList(pageno,url){
	 	$("#"+pjxx_div).html(pjxx_tabledata);
		params = {'pjxx.ljjbxx.qyjbxx.qybm':qybm};
		if (url==null || url=="undefined"){
			url=pjxx_page_url;
		}
		return url;
	 }
	//页面gird加载方法
	function pjxxQueryPageList(pageno,url){	
		if (true){
		    url=setPjxxQueryList(pageno,url);
			var mygrid1 = $("#"+pjxx_table).ingrid({ 
											url: url,
											ingridPageWidth:1000,
											onRowSelect:function(row){
												setPjxxDetail($(row).attr('id'));
											},
											height: pageHeight/5,
	                                        ingridPageParams:sXML,
	                                        ingridExtraParams:params,
											pageNumber: pageno,
											//colIndex: [0],
											noSortColIndex:[11],
											hideColIndex:[8,9,10,11],
											isHaveMorenPaixuClass: true, //加默认排序样式
											morenPaixuCol: 7, //第一默认排序	
											morenPaixuFangshi:'desc', //默认排序方式
											changeHref:function($table){
												$('tr',$table).each(function(){
													var $tr=$(this);
													//派发控制
													var zt=$tr.find('td:nth(8)').text();
													if(zt=='Y'){
														$tr.find('td:last a[title=派发]').remove();
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
													}
														
													//修改删除的时间控制
													var overUpdateTime=$tr.find('td:nth(9)').text();
													if(overUpdateTime=='true'){
														$tr.find('td:last a[title=删除]').remove();
														$tr.find('td:last a[title=修改]').remove();
													}
													
													//可疑寄递控制，高亮显示
													var kybz=$tr.find('td:nth(10)').text();
													if(kybz=='Y'){
														$tr.find('td:last a[title=派发]').remove();
														$tr.find('td:last a[title=修改]').remove();
														$tr.find('td:last a[title=删除]').remove();
														$tr.addClass("red");
														$tr.attr('title',"该揽件包含可疑寄递物品");
													}
												});
											},
											alignCenterColIndex: [1,2,8],
											colWidths: ["17.5%","12.5%","10%","10%","12.5%","12.5%","12.5%","12.5%",'0%','0%','0%',"0%"]									
										});				
			}
	}
	/**
	协查通报查询
	*/
	function setPageList(pageno,url){	
		if (true){
			$("#"+xctb_div).html(xctb_tabledata);	
			createXML("p_");
			if (url==null || url=="undefined"){
				url=xctb_page_url;
			}
			var mygrid1 = $("#"+xctb_table).ingrid({ 
					url: url,	
					height: pageHeight/5,
					ingridPageWidth:1000,
					pageNumber: pageno,
					ingridPageParams: sXML,
					morenPaixuFangshi:'desc', //默认排序方式
					onRowSelect: function(row){
						setXiangQing($(row).attr('id'));
					},
					isHaveMorenPaixuClass: true, //加默认排序样式,
					isPlayResultNull:false,
					noSortColIndex:[4],
					hideColIndex:[4],
					colWidths: ["10%","30%","37%","23%","0%"]							
			});				
		}
	}
	
	function setXiangQing(id){
		sFlag="false";
		dataid=id;
		setQuery_xctbcx(dataid,xctb_detail_page_url,xctb_detail_width); 
  }

  //重写查询的方法
  var timeFlag=true;
  var xctb_detailidTopOffset;
  var xctb_detailidLeftOffset;
	function setQuery_xctbcx(id,url){
	 if(timeFlag){
	    timeFlag = false;
		dataid=id;
		setWidth(xctb_detail_div,xctb_detail_width);
		setUrl(xctb_detail_div,url);
		bindDocument(xctb_detail_div);
		var xctb_detailidOffset = $("#"+xctb_detail_div).offset();
		xctb_detailidTopOffset=xctb_detailidOffset.top;
		xctb_detailidLeftOffset=xctb_detailidOffset.left;
	  	setTimeout(function(){timeFlag = true;},800);
	   }
	 }
  
	$(function(){
		
		xctb_tabledata=$("#"+xctb_div).html();
		setPageList(1);
		
		ljxx_tabledata=$("#"+ljxx_div).html();
		setPageListlj(1);
		
		loadPagePjxxQuery(pjxx_div);
		pjxxQueryPageList(1);
		
		daggleDiv(xctb_detail_div);
		daggleDiv(ljxx_detail_div);
		daggleDiv(pjxx_detail_div);
	});
</script>
<!-- 主体容器 -->
<div>
	<fieldset>
		<legend>通知通报</legend>
		<div id="xctbData">
			<table id="xctbTable">
				<thead>
					<tr>
						<th>发布时间</th>
						<th>发布单位</th>
						<th>标题</th>
						<th>发布人</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="xctbDetail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>
	</fieldset>
	
	
	<fieldset>
		<legend>揽件信息</legend>
		<div id="ljxxData">
			<table id="ljxxTable">
				<thead>
					<tr>
						<th>登记序号</th>
						<th>物流单号</th>
						<th>寄件人名称</th>
						<th>证件类型</th>
						<th>证件号码</th>
						<th>揽件员</th>
						<th>揽件登记时间</th>
						<th name="l_kybz">可疑标志</th>
				    	<th name="l_sjkzbz">时间可疑标志</th>
				    	<th name="l_sfpjbz">是否派发标志</th>
				    	<th>操作</th>
					</tr>
					
			    	
				</thead>
			</table>
		</div>
		<div id="ljjbxxadd_detail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>
	</fieldset>
	
	<fieldset>
		<legend>派件信息</legend>
		<div id="pjxxData">
			<table id="pjxxTable">
				<thead>
					<tr>
						<th>登记序号</th>
						<th>物流单号</th>
						<th>收件人姓名</th>
						<th>证件类型</th>
						<th>证件号码</th>
						<th name="l_jdpdl">派件时间</th>
						<th>派件员</th>
						<th>派件登记时间</th>
						<th name="l_zt">状态</th>
				    	<th>修改状态</th>
				    	<th>可疑寄递标志</th>
				    	<th>操作</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="pjxxDetail" class="page-layout" src="#"
		style="top:5px; left:160px;display: none;"></div>
	</fieldset>
</div>