<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
    
    var timeFlag = true;
    var xctbglDaochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
	$(document).ready(function() {
		//导出功能
		tabletitle = "";
		geteExcelHead("XctbData");
		
		pageUrl="basicsystem/querylist_xctb.action";
		divnid="XctbData";
		tableid="XctbTable";
		addUrl="basicsystem/insert_xctb.action";
		addHtml="basic/basicsystem/XctbAdd.jsp";
		addWidth="720";
		delUrl="basicsystem/delete_xctb.action";
		delid="d_tbid";
		modHtml="basic/basicsystem/XctbModify.jsp";
		modUrl="basicsystem/modify_xctb.action";
		modWidth="720";
		detailHtml="basic/basicsystem/XctbDetail.jsp";
		detailid="xctb_detail";
		detailUrl="basicsystem/query_xctb.action";
		detailWidth="686";
		bc_bottonMoveRight(5,"查询");
		bc_bottonMoveRight(5,"添加");
		loadPage(divnid);
		$("#p_fbkssj").attr("readonly","true");
		$("#p_fbkssj").datepicker();
		$("#p_jzrq").attr("readonly","true");
		$("#p_jzrq").datepicker();
		$("#p_fbjssj").attr("readonly","true");
		$("#p_fbjssj").datepicker();
        $("#gqbs").selectBox({state:"dm_hyzk"});        
		$("#p_sxhylbdmall").selectBoxinhylb();
		$("#p_gajgcheck").attr("value","Y");
		daggleDiv("xctb_detail");
	}); 
	
	//选择行业类别 
	function changehylb(){
	   if($("#p_sxhylbdmall").attr("title")==""){  
		  $("#p_gajgcheck").attr("value","Y");
		}else{
		  if($("#p_gajg").val()!=""){
	        jAlert("已选择公安机关！","提示信息");
	      }
		  $("#p_gajgcheck").attr("value","N");
		}	
	}
	
	function setPageList(pageno,url){
		if($("#p_sxhylbdmall").attr("title")!=""&&$("#p_gajg").val()!=""){
		  jAlert("'行业类别'和'公安机关'不能同时选择！","提示信息");
		}else{
		if (manVerify()){
			url=setList(pageno,url);
			rows = Math.ceil((pageHeight-230-25-23)/20);
			// create the grid
			// returns a jQ object with a 'g' property - that's ingrid
			var mygrid1 = $("#"+tableid).ingrid({ 
				url: url,	
				height: pageHeight-275,
				pageNumber: pageno,
				alignCenterColIndex: [0],
				onRowSelect: null,
				noSortColIndex:[5],
				hideColIndex : [4],
			  	ingridPageParams: sXML,
				changeHref:function(table){//若表格无数据，则点击导出不起作用
					if($(table).find("tr").length==0){
						xctbglDaochuNum = 0;
					}else{
						xctbglDaochuNum = 1;
					}	
				},
			  	colWidths: ["10%","25%","32%","23%","%0","10%"]
			});			
		}
	  }
	}
	
	function getObject(obj){
		sFlag="false";
		if($(obj).attr("id").split("_")[0]=="setModifyQueryxctb"){
			 setModifyQueryxctb($(obj).attr("id").split("_")[1]);
		}else if($(obj).attr("id").split("_")[0]=="setXiangQing"){
		     setXiangQing($(obj).attr("id").split("_")[1]);
		}else if($(obj).attr("id").split("_")[0]=="setDelete"){
			setDelete($(obj).attr("id").split("_")[1]);
		}	
	}
	
	////重写查询的方法
	function setQuery_xctbgl(id,url){
	 
	 if(timeFlag){
	  timeFlag = false;
	 
		dataid=id;
		setWidth(detailid,detailWidth);
		setUrl(detailid,url);
		bindDocument(detailid);
		var xctb_detailidOffset = $("#"+detailid).offset();
		xctb_detailidTopOffset=xctb_detailidOffset.top;
		xctb_detailidLeftOffset=xctb_detailidOffset.left;
	
	  setTimeout(function(){timeFlag = true;},800);
      }
    }
	//重写修改的方法
	function setModifyQueryxctb(id){
	 if(timeFlag){
	  timeFlag = false;
	  
		dataid=id;
		sFlag="false";
		setWidth(detailid,modWidth);
		setUrl(detailid,modHtml);
		bindDocument(detailid);
		var xctb_detailidOffset = $("#"+detailid).offset();
		xctb_detailidTopOffset=xctb_detailidOffset.top;
		xctb_detailidLeftOffset=xctb_detailidOffset.left;
		
		setTimeout(function(){timeFlag = true;},800);
      }
	}	
	function manVerify(){
		if (!checkControlValue("p_bt","String",1,100,null,0,"标题"))
			return false;
		if (!checkControlValue("p_fbkssj","Date",null,null,null,0,"发布开始时间"))
			return false;
		if (!checkControlValue("p_fbjssj","Date",null,null,null,0,"发布结束时间"))
			return false;
		if (!checkControlValue("p_fbr","String",1,100,null,0,"发布人"))
			return false;
		if (!checkControlValue("p_fbdw","String",1,200,null,0,"发布单位"))
			return false;
		//if (!checkControlValue("p_hylx","String",1,100,null,0,"行业类型"))
			//return false;
		if (!checkDateEarlier("p_fbkssj","发布开始时间","p_fbjssj","发布结束时间","DATE")){
			return false;
		}
		return true;
	}
  $("#p_fbdw").click(function(){
		//getGxdwTree("p_fbdw","p_fbdwbm",'0');
		//getGxdw("p_fbdw","p_fbdwbm");
		//getGxdwTree("p_fbdw","p_fbdwbm",null,null,null,null,null,null);
		getGxdwTree("p_fbdw", null, "p_fbdwbm", "p_fbdwLevel", null, null, null, null);	
  });
  
  //点击公安机关查询条件 
   $("#p_gajg").click(function(){
        if($("#p_sxhylbdmall").attr("title")==""){
		   getGxdwTree("p_gajg", "p_gajgbm", null, "p_gajgLevel", null, null, null, null);
		}else{
		   jAlert("已选择行业类别！","提示信息");
		   
		}
		
  });
  
  /////select表单 赋值
  function changegqbs(){
     $("#p_gqbs").attr("value",$("#gqbs").attr("value"));
  }
  
  function readstatus(id){
    sFlag = "false";
    var readHtml = "basic/basicsystem/XctbjsdwMan.jsp";
    setWidth(detailid,addWidth);
	setUrl(detailid,readHtml);
	bindDocument(detailid);
    
  }
  function replaystatus(id){
    sFlag = "false";
     alert("2");
  }
  
	///////重写协查通报的添加方法
	function setAddPagexctb(){
		setClearxctb();
		if(timeFlag){
			timeFlag = false;
			setWidth(detailid,addWidth);
			setUrl(detailid,addHtml);
			setTimeout(function(){timeFlag = true;},1200);
		 }
	}
 
 	/////清除session
	function setClearxctb(){
		jQuery.post("basicsystem/clearQiye_xctb.action",null,null,"json");	
    }

	function setXiangQing(id){
		sFlag="false";
		dataid=id;
		setQuery_xctbgl(dataid,detailHtml,detailWidth); 
	}
	
	var excelUrl="basicsystem/getExcelCreateXctb_xctb.action";
	var searchLongUrl="basicsystem/queryForExportXctb_xctb.action";
	//导出Excel
	function setExportExcel(){	
	  	if(xctbglDaochuNum==1){
			if (manVerify()){
	  			setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
	  		}
	  	}else{
			jAlert("无查询结果不能导出！","提示信息");
	  	}		
	}
	
	//导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
	function searchLongBack(json){  
		//报表标题
		var bbmc="通知通告管理";
		//报表请求	
		setExcelLong("xctbglExcel",bbmc);	
	}
</script>

<body>
    <input type="hidden" id="p_gajgcheck">
    <input type="hidden" id="p_sxhylbdm">
	<input type="hidden" id="p_gqbs">
	<input type="hidden" id="p_fbdwLevel" value="">
	<input type="hidden" id="p_gajgLevel" value="">
	<input type="hidden" id="d_tbid" value="">
	<table width="100%" cellpadding="0" cellspacing="0" class="tableborder">
		<tr>
			<td class="queryfont">
				通知通告管理
			</td>
		</tr>
		<tr>
			<td class="tdbg">
				<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="11%" class="pagedistd">
							发布时间
						</td>
						<td width="22%" class="pagetd">
							<input type="text" class="inputstyle" id="p_fbkssj" />
						</td>
						<td width="11%" class="pagedistd">
							至
						</td>
						<td width="22%" class="pagetd">
							<input type="text" class="inputstyle" id="p_fbjssj" />
						</td>
						<td width="11%" class="pagedistd">
							发布单位
						</td>
						<td width="22%" class="pagetd">
							<input type="text" class="inputstyle" id="p_fbdw" readonly />
							<input type="hidden" id="p_fbdwbm" />
						</td>
					</tr>
					<tr>
						<td class="pagedistd">
							标题
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_bt" value="">
						</td>
						<td class="pagedistd">
							发布人
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_fbr" value="">
						</td>
						<td class="pagedistd">
							是否撤销
						</td>
						<td class="pagetd">
							<select id="gqbs" onChange="changegqbs();">
								<option value=""></option>
								<option value="0">
									未撤销
								</option>
								<option value="1">
									已撤销
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="10%" class="pagedistd">
							行业类别
						</td>
						<td width="23%" class="pagetd">
							<select type="select" id="p_sxhylbdmall" value="" onChange="changehylb();">
							</select>
						</td>
						<td width="10%" class="pagedistd">
							公安机关
						</td>
						<td width="23%" class="pagetd">
							<input type="text" class="inputstyle" id="p_gajg" readonly />
							<input type="hidden" id="p_gajgbm" />
						</td>
					</tr>
					<tr>
						<td colspan="5"></td>
						<td colspan="2">
							<table width="124" border="0" align="right" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="36%">
										<a href="#" class="searchbutton" id="querys"
											title="查询" onClick="setPageList(1);">查询</a>
									</td>
									<td width="25%">
										<a href="#" class="addbutton" id="addbutton" title="添加" onclick='setAddPagexctb();'>添加</a>
									</td>
									<td width="25%" >
											<a href="#" class="exceldcbutton" id='xctbglExcel' onclick='setExportExcel();'>导出</a>
									</td>
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
	<div id="xctb_detail" class="page-layout" src="#"
		style="top: 30px; overflowY: scroll;">
	</div>

	<div id="XctbData" style="width: 100%;">
		<table id="XctbTable" width="100%">
			<thead>
				<tr>
					<th name="l_fbsj" datatype="string" sumflag="0">
						发布时间
					</th>
					<th name="l_fbdw" datatype="string" sumflag="0">
						发布单位
					</th>
					<th name="l_bt" datatype="string" sumflag="0">
						标题
					</th>
					<th name="l_fbr" datatype="string" sumflag="0">
						发布人
					</th>
					<th name="">
						
					</th>
					<th name="">
						操作
					</th>
				</tr>
			</thead>

		</table>
	</div>
</body>
