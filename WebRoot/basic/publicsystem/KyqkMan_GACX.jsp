<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<script type="text/javascript">
var daochuNum = 0;//是否可以导出Excle标志，0-无法导出，1-可以导出
var lvguanbianm;
$(document).ready(function() {
	searchLongUrl="publicsystem/queryForExportKYCX_kyqk.action";//行业类别部位旅馆业时 到处的action
	searchLongUrllg="publicsystem/lgqueryForExportKYCX_kyqk.action";
	pageUrl="publicsystem/Gaquerylist_kyqk.action";
	//行业类别为旅馆业时 调用不懂的 方法 
	pageUrl_hylb="publicsystem/hylbwlg_kyqk.action";
	divnid="tabledata";
	tableid="table1";
	addUrl="publicsystem/insert_kyqk.action";
	addHtml="basic/publicsystem/KyqkAdd.jsp";
	addWidth="600";
	delUrl="publicsystem/delete_kyqk.action";
	delid="d_kyqkid";
	modHtml="basic/publicsystem/KyqkModify-gad.jsp";
	modUrl="publicsystem/modify_kyqk.action";
	modWidth="700";
	detailHtml="basic/publicsystem/KyqkDetail-gad.jsp";
	//跳转到旅馆详情页面的路径
	detailHtmlqy="business/Lgyzagl/Kyqk_LvguanDetail.jsp";
	//跳转到娱乐业详情页面的路径
	QyHtml="business/Ylfwzagl/YlcsjbxxDetail.jsp";
	//div弹出框
	detailid="kyqk_detail";
	
	detailUrl="publicsystem/query_kyqk.action";
	
	kyqkdetailUrl="lgyzagl/query_lvguan.action";
	detailWidth="700";
	//调用企业详情需要
	qycx_timeFlag = true;
	//在本页面，显示在那个div里
	qyjbxx_detailid_kyqk="kyqk_detail";
	//设置显示详情页面的路径
	qyjbxx_detailHtml_kyqk="basic/publicsystem/QyjbxxDetail-gzth.jsp";
	qyjbxx_detailWidthkk="1000";
	qyjbxx_requestType="";
	//////////////////////////
	tabletitle = "";
	geteExcelHead("tabledata");
	excelUrl = "publicsystem/getExcelCreateKYCX_kyqk.action";
	kyqk_loadPage("tabledata");
	
	//$("#p_hylbdm").selectBoxhylb({code:"flgy"});//行业类别	
	$("#p_hylbdmall").selectBoxinhylb();//行业类别	
	$("#p_tbsj").attr("readonly","true");
	$("#p_tbsj").datepicker();
	$("#p_tbsjzhi").attr("readonly","true");
	$("#p_tbsjzhi").datepicker();
	$("#p_kyqklxbm").selectBox({code:"dm_kyqklx"});
	daggleDiv("kyqk_detail");
	$("#p_gxdw").click(function(){ //管辖单位
	//	getGxdw("p_gxdw","p_gxdwbh");
		getGxdwTree("p_gxdw","p_gxdwbh");
	});
	setHyxx();
}); 
//============加载网格的方法==========
function kyqk_loadPage(divpageid){
	tables=$("#"+divpageid).html();
	$("#"+detailid).hide(); 
	if(dataid=="J"){
	    dataid="";
	    $('#p_hydm').val('J');
	    $('#p_jjrxm').val('1');
	    setPageList(1);
	    $('#p_hydm').val('');
	    $('#p_jjrxm').val('');
	}else{
	    setPageList(1,'#');
	}
}
function setPageList(pageno,url){	
	if (manVerify()){
		//判断执行查询。将企业ID赋值为空
		if($("#p_qyid").val()!=""){
			$("#p_qyid").val("");
		}
		
		var hylbAA=$("#p_hylbdmall").val();//行业类别代码未“A”表示为旅馆业
		if(hylbAA!=null && hylbAA!=""){
			if(hylbAA.trim()=="'A'"){
				url=setList(pageno,"publicsystem/hylbwlg_kyqk.action");
			}else{
				url=setList(pageno,"publicsystem/Gaquerylist_kyqk.action");
			}
		}
		rows = Math.ceil((pageHeight-225-25-23)/20);
		// create the grid
		// returns a jQ object with a 'g' property - that's ingrid
		var mygrid1 = $("#"+tableid).ingrid({ 
										ingridPageWidth: pageWidth,
										url: url,	
										height: pageHeight-250,
										pageNumber: pageno,
										ingridPageParams: sXML,
										tableid:'bayjbxxTable',//表格属性 
										hideColIndex:[1,5],//隐藏grid中的某些列
										colIndex: [0],//添加超链接
										colWidths: ["28%","20%","20%","20%","20%","1%","9%"],
										//onRowSelect:false,//这个属性表示去掉单击事件
										onTdSelect: function(tr){
								            $(tr).find("td").click(function(){
								                var tdnum = $(tr).find("td").index(this);
								                if (tdnum == 0) {
								                	//此ID表示的是该行的逐渐列
								                	var id =$(tr).attr("id");
								                	var hdqyid=$("#bayjbxxTable #"+id).find("td:nth(5)").text();
								                	//通过gird的tableid属性+主键列，获取到第N的值
									       	        var hylbdm=$("#p_hylbdmall").val();
								                	//alert("行业类别代码="+hylbdm);
												       	 if(hylbdm.trim()=="'A'"){
												       	    //这个变量是控制列点击时间不执行用的
															if(sFlag=="true"){
																    sFlag="false";
																    setQuery(hdqyid,detailHtmlqy,detailWidth); 	
															}else{
																sFlag="true";
															}
												       	 }else if(hylbdm.trim()=="'J'"||hylbdm.trim()=="'K'"){
												       	 if(sFlag=="true"){
																    sFlag="false";
												       	    setCsDetail(hdqyid);
												       	    }else{
																sFlag="true";
												       	 }
												       	 }else{//"行业类别"不是旅馆业 所掉的页面
												       		if (sFlag=="true"){
												       		    //这个变量是控制列点击时间不执行用的
													       		sFlag="false";
																if(tdnum!=$(tr).find("td").length-1){
																	if(qycx_timeFlag){
															       		qycx_timeFlag = false;
															 			qyjbxx_requestType="detail";
															 			qyjbxx_dataid=hdqyid;
															 			//alert("企业ID="+qyjbxx_dataid);
															 			setWidth(qyjbxx_detailid_kyqk,qyjbxx_detailWidthkk);
															 			setUrl(qyjbxx_detailid_kyqk,qyjbxx_detailHtml_kyqk);
															 			bindDocument(qyjbxx_detailid_kyqk);
															 			setTimeout(function(){qycx_timeFlag = true;},1000);
																	}
																}
															}
												       		
												       	 }	
								                }
								            });
								        },
										changeHref:function(table){//若表格无数据，则点击导出不起作用
											//alert($(table).find("tr").length);
												$("#gnlkexcel").unbind("click");
												if($(table).find("tr").length==0){
														daochuNum = 0;
													}else{
														daochuNum = 1;
													}	
											}
										});	
		onRowSelect:true,//这个属性表示去掉单击事件
								
		setHyxx();
		}
}	

//场所详细查询
var qyjbxx_requestType;
var qyjbxx_dataid;
var qyjbxx_detailWidth="998";

function setCsDetail(obj){
	qyjbxx_requestType="detail";
	qyjbxx_dataid=obj;
	setWidth("kyqk_detail",qyjbxx_detailWidth);
	yly_detailUrl="publicsystem/query_qyjbxx.action";
	setUrl("kyqk_detail",QyHtml);
	sFlag="false";
	bindDocument("kyqk_detail");
}

    //加载主页面执行的方法
	function manVerify(){
		if (!checkControlValue("p_tbrxm","String",1,100,null,0,"填报人姓名"))
			return false;	
		if (!checkControlValue("p_kyqklxbm","String",1,100,null,0,"可疑情况类型"))
			return false;
		return true;
	}
	
	////可疑情况查询，执行的方法
	function querykyqk(){
		
	  if (!checkControlValue("p_tbrxm","String",1,100,null,0,"填报人姓名"))
			return false;	
	  if (!checkControlValue("p_kyqklxbm","String",1,100,null,0,"可疑情况类型"))
			return false;
	  if (!checkDateEarlier("p_tbsj","开始时间","p_tbsjzhi","结束时间","DATE"))
		    return false;
	  setPageList(1);
	}
 //企业筛选框
 $("#p_qymc").click(function(){
     //dataid=$('#p_hylbdm').val();
     var hylbAA=$("#p_hylbdmall").val();//行业类别代码未“A”表示为旅馆业
     if(hylbAA.trim()=="'A'"){//表示为旅馆业
    	 glevel=null;
    	 getLg_item("p_qymc","p_qybm","1");
     }else{//表示不为旅馆业
    	 dataid="";
    	 getTy_item("p_qymc","","p_qyid","","",$('#p_hylbdmall').val());
     }
	 
  });
  //设定行业信息表示
    function setHyxx(){
        var hylb=$("#p_hylbdmall").val();//行业类别代码未“A”表示为旅馆业
		if(hylb=="'J'"||hylb=="'K'"){
			$('#td_qymc').text('场所名称');
			$('#td_qybm').text('场所备案编号');
			$('#tabledata').find('thead').find('th[@name=l_qymc]').find('DIV').html('场所名称');
		}else{
		    $('#td_qymc').text('企业名称');
		    $('#td_qybm').text('企业编号');
			$('#tabledata').find('thead').find('th[@name=l_qymc]').find('DIV').html('企业名称');
		}
    }
    //如下两个方法可以删除
    //点击企业名称超链接 执行的方法
    function getObject(obj){
    	sFlag="false";
    	if($(obj).text()=="处理"){
    		doWithKyqk($(obj).attr("id").split("_")[1]);
    	}
    }
   
    function doWithKyqk(id){
        sFlag=false;
        dataid=id;
	    setWidth(detailid,modWidth);
	    setUrl(detailid,modHtml);
	    bindDocument(detailid);
    }
	//导出Excel
    function setExportExcel(){	
      	if(daochuNum==1){
    		if (manVerify()){
    			
    			var hylbkk=$("#p_hylbdmall").val();//行业类别代码未“A”表示为旅馆业
    				if(hylbkk.trim()=="'A'"){
    					//更改企业名称属性 
    				    //var obj= document.getElementByName("l_qymc");
    				    //obj.setAttribute("name","l_qiyemc");
    					setParams("p_");
    					jQuery.post(searchLongUrllg,params,searchLongBack,"json");
    				}else{
    					if($("#p_qyid").val()!=""){
    						$("#p_qyid").val("");
    					}
    					setParams("p_");
    					jQuery.post(searchLongUrl,params,searchLongBack,"json");
    				}
      			//setSearchLong(); //传全部参数将查询结果放入json，对应后台Action方法中将结果集放入session，用于处理超长参数的数据导出
      		}
      	}else{ 
      		jAlert('无查询结果不能导出！','错误！');
      	}		
    }


    //导出前对应setSearchLong()的回调方法  由于执行查询时候有延迟，故将导出放入回调函数
    function searchLongBack(json){   
    		//报表标题 
    			var bbmc="可疑情况查询";
    		//报表请求
    			//setExcel("gnlkexcel",bbmc);	
    		var hylbAA=$("#p_hylbdmall").val();//行业类别代码未“A”表示为旅馆业
    		//得到网格的值
    		var gridtab=tabletitle;
    		//如果说是旅馆业，则要进行替换
    		if(hylbAA.trim()=="'A'"){
    			//var temp="abcdef";
    			//var temp1=temp.replace("c","5");
    			//alert(temp1);
    			gridtab=tabletitle.replace("l_qymc","l_qiyemc");
    			
			}
    			var surl=excelUrl+"?tabletitle="+gridtab+"&bbmc="+bbmc;
    			//alert(surl);
    			//alert(surl);
    			surl=encodeURI(surl);
    			//surl=encodeURI(surl);
    			location.href = surl;
    }
</script>

<body>
    <input type="hidden" id="p_jjrxm">
    <input type="hidden" id="p_hydm" value="">
	<input type="hidden" id="d_csid" value="">
	<input type="hidden" id="d_kyqkid" value="">
	<table width="100%" cellpadding="0" cellspacing="0" class="tableborder">
		<tr>
			<td class="queryfont">
				可疑情况管理
			</td>
		</tr>
		<tr>
			<td class="tdbg">
				<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="10%" class="pagedistd">
							行业类别
						</td>
						<td width="23%" class="pagetd">
							<select id="p_hylbdmall" onchange="setHyxx();">
							</select>
						</td>
						<td width="10%" class="pagedistd" id="td_qymc">
							企业名称
						</td>
						<td width="23%" class="pagetd"">
							<input type="text" class="inputstyle" id="p_qymc" value=""
								readonly="readonly">
						</td>
						<td width="10%" class="pagedistd" id="td_qybm">
							企业编号
						</td>
						<td width="23%" class="pagetd">
							<input type="text" class="inputstyle" id="p_qybm" value="">
						</td>
					</tr>
					<tr>
						<td class="pagedistd">
							填报时间
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_tbsj" value="">
						</td>
						<td class="pagedistd">
							至
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_tbsjzhi" value="">
						</td>
						<td class="pagedistd">
							填报人
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_tbrxm" value="">
						</td>
					</tr>
					<tr>
						<td class="pagedistd">
							管辖单位
						</td>
						<td class="pagetd">
							<input type="text" class="inputstyle" id="p_gxdw" value=""
								readonly="readonly">
							<input type="hidden" id="p_gxdwbh">
						</td>
						<td class="pagedistd">
							可疑情况类型
						</td>
						<td class="pagetd">
							<select type="select" id="p_kyqklxbm" value="">
								<option value=""></option>
							</select>
						</td>
						<td class="pagedistd">
							&nbsp;
						</td>
						<td width="13%">
							<table width="124" border="0" align="right" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="52%"></td>
								<td width="48%">
										<a href="#" class="searchbutton" id="querys"
											onClick="querykyqk();">查询</a>
									</td>
										<td width="55%" >
											&nbsp;<!-- <a href="#" class="submitbutton" onclick=''>高级查询</a> -->
										</td>
								
									<td width="25%" >
											<a href="#" class="exceldcbutton" id='kyqkExcel' onclick='setExportExcel();'>导出</a>
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
	<div id="kyqk_detail" class="page-layout" src="#"
		style="top: 30px; left: 160px; width: 100px;">
	</div>
	
	<div id="tabledata" style="width: 100%;">
		<table id="table1" width="100%">
			<thead>
				<tr>
					<th name="l_qymc"  datatype="string" sumflag="0">
						企业名称
					</th>
					<th name="">
						登记序号
					</th>
					<th name="l_kyqklx" datatype="string" sumflag="0">
						可疑情况类型
					</th>
					<th name="l_tbrxm" datatype="string" sumflag="0">
						填报人姓名
					</th>
					<th name="l_tbsj" datatype="string" sumflag="0">
						填报时间
					</th>
					<th name="">
						企业ID
					</th>
					<th name="">
						操作
					</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
