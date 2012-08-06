var configtr1=new Array(1,'#',1,'#');
var configtr2=new Array(1,'#',1,'#');
var configtr3=new Array(0,'#',1,'#');
var configtr4=new Array(0,'#',1,'#');
var configtr5=new Array(0,'#');

var configtr6=new Array(1,'#',1,'#');
var configtr7=new Array(0,'#');
var configtr8=new Array(1,'#');
var configtr9=new Array(1,'#');
var configtr10=new Array(1,'#',1,'#');

var configtr11=new Array(1,'#',0,'#');
var configtr12=new Array(0,'#',0,'#');
var configtr13=new Array(0,'#',0,'#');
var configtr14=new Array(1,'#',0,'#');
var configtr15=new Array(0,'#');
var configtr16=new Array(0,'#');
var configtr17=new Array(0,'#');
var configtable=new Array(configtr1,configtr2,configtr3,configtr4,configtr5,configtr6,configtr7,configtr8,configtr9,configtr10,configtr11,configtr12,configtr13,configtr14,configtr15,configtr16,configtr17);

var fileData,fileId;
var hylbdm;
	$(document).ready(function() {
	  configtdcolor("modify",configtable);
	  bc_bottonMoveRight(28);
	  $("#tr_zpwtgyy").hide(); 
	  $("#qyryxxTr5").hide();
	  $("#qyryxxTr13").hide();
	  $("#qyryxxTr15").hide();
		$("#wtgyy_detail").hide();
		$("#m_csrq").attr("readonly","true");
		$("#m_csrq").datepicker();
		$("#m_rzrq").attr("readonly","true");
		$("#m_rzrq").datepicker();
		$("#m_lzrq").attr("readonly","true");
		$("#m_lzrq").datepicker();
		$("#m_zxsj").attr("readonly","true");
		$("#m_zxsj").datepicker();
		$("#m_hcsj").attr("readonly","true");
		$("#m_hcsj").datepicker();
		$("#m_bcsj").attr("readonly","true");
		$("#m_bcsj").datepicker();
		$("#s_ryid").attr("value",dataid);
		$("#q_ryid").attr("value",dataid);
		$("#m_ryid").attr("value",dataid);
		$("#ryid").attr("value",dataid);
		//gy_getselectBox("m_gwbh");
		//$("#m_xxdm").selectBox({code:"dm_xx"});
		$("#m_whcddm").selectBox({code:"dm_xl"});
		//$("#m_gwbh").change(function(){
		//	$("#m_gwmc").val($("#m_gwbh").attr('title'));
		//});
		$("#m_whcddm").change(function(){
			$("#m_whcd").val($("#m_whcddm").attr('title'));
		});
		//$("#m_xxdm").change(function(){
  		//	$("#m_xx").val($("#m_xxdm").attr('title'));
  		//});
		//$("#m_hyzk").selectBox({code:"dm_hyzk"});
		$("#m_xbdm").selectBox({code:"dm_xb"});
		//$("#m_xbdm2").selectBox({code:"dm_cyrylb"});//
  		fileId = "m_fileload";
		setDetail();	
	}).keydown(function(){
		if(event.keyCode == 13)
			event.keyCode = 9;
	}); 
	
	function updatediv (json) { 
	    hylbdm = setNull(json.LQyryxx[0].hylbdm);
		$("#m_whcddm").setValue(setNull(json.LQyryxx[0].whcddm));
		$("#m_whcd").val(setNull(json.LQyryxx[0].whcd));
		if(hylbdm=='D'){
			$("#whcd_title").removeClass();
			$("#whcd_title").addClass("red");
		}
		$("#m_cyrybh").val(setNull(json.LQyryxx[0].cyrybh));
		$("#m_xm").val(setNull(json.LQyryxx[0].xm));
		//$("#m_xx").val(setNull(json.LQyryxx[0].xx));
		//$("#m_xxdm").setValue(setNull(json.LQyryxx[0].xxdm));
		//$("#m_bm").val(setNull(json.LQyryxx[0].bm));
		$("#m_minzu").val(setNull(json.LQyryxx[0].minzu));
		$("#m_mzdm").val(setNull(json.LQyryxx[0].mzdm));
		if(json.LQyryxx[0].csrq!=null)
			$("#m_csrq").val(setNull(json.LQyryxx[0].csrq.substr(0,10)));
		$("#m_hjdxzqh").val(setNull(json.LQyryxx[0].hjdxzqh));
		$("#m_hjdxzqhdm").val(setNull(json.LQyryxx[0].hjdxzqhdm));
		$("#m_hjdxz").val(setNull(json.LQyryxx[0].hjdxz));
		$("#m_zjhm").val(setNull(json.LQyryxx[0].zjhm));
		$("#m_zzzhm").val(setNull(json.LQyryxx[0].zzzhm));
		$("#m_zzdz").val(setNull(json.LQyryxx[0].zzdz));
		$("#m_shouji").val(setNull(json.LQyryxx[0].shouji));
		$("#m_jjlxrdh").val(setNull(json.LQyryxx[0].jjlxrdh));
		$("#m_jjlxr").val(setNull(json.LQyryxx[0].jjlxr));
		$("#m_zhiwu").val(setNull(json.LQyryxx[0].zhiwu));
		if(json.LQyryxx[0].rzrq!=null)
			$("#m_rzrq").val(setNull(json.LQyryxx[0].rzrq.substr(0,10)));
		if(json.LQyryxx[0].lzrq!=null)
			$("#m_lzrq").val(setNull(json.LQyryxx[0].lzrq.substr(0,10)));
		$("#m_zxr").val(setNull(json.LQyryxx[0].zxr));
		if(json.LQyryxx[0].zxsj!=null)
			$("#m_zxsj").val(setNull(json.LQyryxx[0].zxsj.substr(0,10)));
		if(json.LQyryxx[0].cjsj!=null)
			$("#m_cjsj").val(setNull(json.LQyryxx[0].cjsj.substr(0,10)));
		$("#m_cjr").val(setNull(json.LQyryxx[0].cjr));
		$("#m_hcdw").val(setNull(json.LQyryxx[0].hcdw));
		$("#m_zxyy").val(setNull(json.LQyryxx[0].zxyy));
		$("#m_cyryzt").val(setNull(json.LQyryxx[0].cyryzt));
		$("#m_zjzt").val(setNull(json.LQyryxx[0].zjzt));
		$("#m_scbz").val(setNull(json.LQyryxx[0].scbz));
		$("#m_qyid").val(setNull(json.LQyryxx[0].qyid));
		$("#m_xb").val(setNull(json.LQyryxx[0].xb));
		$("#m_cyrylbmc").val(setNull(json.LQyryxx[0].cyrylbmc));
		$("#m_csmc").val(setNull(json.LQyryxx[0].csmc));
		//$("#m_shengao").val(setNull(json.LQyryxx[0].shengao));
		//$("#m_tizh").val(setNull(json.LQyryxx[0].tizh));
		$("#m_bz").val(setNull(json.LQyryxx[0].bz));
		$("#m_cyrylbdm").val(setNull(json.LQyryxx[0].cyrylbdm));
		//$("#m_hyzk").setValue(setNull(json.LQyryxx[0].hyzk));
		$("#m_xbdm").setValue(setNull(json.LQyryxx[0].xbdm));
		$("#m_fileload").val(setNull(json.LQyryxx[0].fileload));
		//$("#m_gwmc").val(setNull(json.LQyryxx[0].gwmc));
		//$("#m_gwzrms").val(setNull(json.LQyryxx[0].gwzrms));
		$("#m_hylb").val(setNull(json.LQyryxx[0].hylb));
		$("#m_hylbdm").val(setNull(json.LQyryxx[0].hylbdm));
		//$("#m_gwbh").setValue(setNull(json.LQyryxx[0].gwbh));
		//$("#m_cylbdm").val(setNull(json.LQyryxx[0].cylbdm));
		//$("#m_cylb").val(setNull(json.LQyryxx[0].cylb));
		$("#m_gz").val(setNull(json.LQyryxx[0].gz));
		$("#m_gzdm").val(setNull(json.LQyryxx[0].gzdm));
		initPage();
		$("#img_picControlscr").attr('src','publicsystem/queryTp_qyryxx.action?ryId='+json.LQyryxx[0].ryid+'&aa=' + lo);
		//fileData = setNull(json.LQyryxx[0].fileload);
		//setFile();
		
		
		$("#zpwtgyy").append(setNull(json.LQyryxx[0].zpwtgyy));
		
		var zkzt = setNull(json.LQyryxx[0].zkzt);
		if(zkzt==11)
			$("#tr_zpwtgyy").show();
			
		var zt = setNull(json.LQyryxx[0].shenhe_cyryzt);
		if(zt=='11'){ //显示 未通过原因 按钮
		//	$("#but").attr("width",124);
			document.getElementById('wtgyy').style.display='block';
		}
	}	
function modifyVerify(){
		if($("#m_zjzt").val()==null||$("#m_zjzt").val()=="")
			$("#m_zjzt").val("0");
		if (!checkControlValue("m_xm","String",1,100,null,1,"姓名"))
			return false;
		if(!isChinese("m_xm","姓名")	)
			return false;
		if (!checkControlValue("m_xbdm","Select",1,2,null,1,"性别"))
			return false;
		if(hylbdm=='D'){
			if (!checkControlValue("m_whcddm","Select",1,2,null,1,"文化程度"))
			return false;
		}else{
			if (!checkControlValue("m_whcddm","Select",1,2,null,0,"文化程度"))
			return false;
		}
		if (!checkControlValue("m_minzu","String",1,20,null,1,"民族"))
			return false;
		if (!checkControlValue("m_cyrybh","String",1,30,null,0,"从业人员编号"))
			return false;
		if (!checkControlValue("m_zjhm","String",1,30,null,1,"身份证号码"))
			return false;
		if (!checkControlValue("m_csrq","String",null,null,null,1,"出生日期"))
			return false;
				
		var tenYearAgo = new Date();
		tenYearAgo.setYear(tenYearAgo.getYear() - 10);
		var tenYearAgoStr = tenYearAgo.getFullYear()+"-"+(tenYearAgo.getMonth()+1)+"-"+tenYearAgo.getDate();
		if(!checkTwoDateEarlier($("#m_csrq").val(),tenYearAgoStr)){
			
			jAlert("出生日期必须小于"+tenYearAgoStr+"！",'验证信息',null,"m_csrq");
			return false;
		}
		if (!checkControlValue("m_hjdxzqh","String",1,200,null,1,"户籍省县"))
			return false;
		//if (!checkControlValue("m_bm","String",1,30,null,0,"别名"))
		//	return false;
		if (!checkControlValue("m_zzzhm","String",1,20,null,0,"暂住证号"))
			return false;
	    if (!checkControlValue("m_hjdxz","String",1,200,null,1,"户籍地详址"))
			return false;
		if (!checkControlValue("m_zzdz","String",1,200,null,1,"现住址"))
			return false;
		if (!checkControlValue("m_shouji","String",1,20,null,1,"手机"))
			return false;
		if (!checkControlValue("m_zhiwu","String",1,20,null,1,"职务"))
			return false;
		if(hylbdm=='C'){
		     if (!checkControlValue("m_gz","String",1,60,null,1,"工种"))
			    return false;
		}
		if (!checkControlValue("m_jjlxr","String",1,30,null,0,"紧急联系人"))
			return false;
		if (!checkControlValue("m_jjlxrdh","String",1,20,null,0,"紧急联系电话"))
			return false;
		//if (!checkControlValue("m_hyzk","String",1,4,null,0,"婚姻状况"))
		//	return false;
		//if (!checkControlValue("m_shengao","Float",-999.99,999.99,2,0,"身高"))
		//	return false;
		//if (!checkControlValue("m_tizh","Float",-999.99,999.99,2,0,"体重"))
		//	return false;
		//if (!checkControlValue("m_xx","String",1,200,null,1,"血型"))
		//	return false;
		if (!checkControlValue("m_rzrq","String",null,null,null,1,"入职日期"))
			return false;
		if (!checkControlValue("m_lzrq","Date",null,null,null,0,"离职日期"))
			return false;
		//if(hylbdm=='C'){
		//    if (!checkControlValue("m_cylb","String",1,50,null,1,"人员类别"))
		//	    return false;
		//}else{
		//    if (!checkControlValue("m_gwmc","String",1,50,null,1,"岗位类别"))
		//	    return false;
	    //}
		//if (!checkControlValue("m_gwzrms","String",1,2000,null,0,"岗位责任描述"))
		//	return false;
		if (!checkControlValue("m_bz","String",1,2000,null,0,"备注"))
			return false;
				
		var returnCardNo = checkIdCardNo("m_zjhm");
		if (returnCardNo)
			$("#m_zjzt").val(0);
		else
			$("#m_zjzt").val(1);	
			
		$("#m_xb").val($("#m_xbdm").attr("title"));
		
		//if($("#m_shengao").val()=="")
		//	$("#m_shengao").val("0");
		//if($("#m_tizh").val()=="")
		//	$("#m_tizh").val("0");
		var rzrq = $("#m_rzrq").attr("value");
	    var lzrq = $("#m_lzrq").attr("value");
	    if(rzrq!=''&&lzrq!=''&&formatDate(rzrq)-formatDate(lzrq)>0){
		    jAlert("请正确选择入职和离职日期!","提示信息");
		    return false;
	    }
		return true;
	}
$("#m_cylb").click(function(){
	        getrylbTree("m_cylb","m_cylbdm","dm_cylb(jxy)");
	});
	
	$("#m_gz").click(function(){
	        getrylbTree("m_gz","m_gzdm","dm_gz(jxy)");
	    });
	    
$("#m_cyrylbdm").change(function(){
	$("#m_cyrylbmc").val($(this).attr("title"));
});

$("#m_xbdm").change(function(){
	$("#m_xb").val($(this).attr("title"));
});


$("#m_minzu").click(function(){
	getDict_item("m_minzu","m_mzdm","dm_mz");
});  

$("#m_hjdxzqh").click(function(){
	getDict_item("m_hjdxzqh","m_hjdxzqhdm","dm_xzqh");
});

 $("#m_csmc").click(function(){
	getYlcs_item("m_csmc","m_csid","kcyzx");
});

$("#m_zjhm").blur(function(){
	var returnCardNo = checkIdCardNo("m_zjhm");
	if(returnCardNo){
		$("#m_csrq").val(getBirthday($(this).val()));
		$("#m_xbdm").setValue(getXb($(this).val()));
	}else{
		jAlert("身份证号码不正确","验证信息");
	}
	//getHjsx($(this).val(),"m_hjdxzqhdm","m_hjdxzqh");
	getHjsxDD($(this).val(),"dm_xzqh","m_hjdxzqhdm","m_hjdxzqh")
});


function updateAll(){
	//getFile();
	setUpdate_cyry();
}	
	
function setUpdate_cyry(){
	if (modifyVerify()){
		setParams("m_");
		jQuery.post(modUrl,params,updateback,"json"); 
	}else{
		return modifyVerify();
	}		
}
function updatecyryback(json){
	json.result = json.LQyryxx[0];
	if  (json.result=="success"){
		jAlert(modMessage,'保存信息');
		setPageList($("#pageNo").attr("value"));
		$("#"+detailid).hideAndRemove("slow"); 
	}else if(json.result=="toicksl"){
		detailUrl="ylfwzagl/query_icksl.action";
		dataid=json.cyryxx.ryid;
		sFlag="false";
		$("#"+detailid).hideAndRemove("slow"); 
		setWidth("icksl_detail",modWidth);
		setUrl("icksl_detail","business/Ylfwzagl/IckslgnDetail.jsp");
		setPageList($("#pageNo").attr("value"));
	}else{
		jAlert(json.result,'错误信息');
	}		
}

$("#m_gwmc").click(function(){
	//getrylbTree("m_gwmc","m_gwbh","dm_cyrylb");
});


	function shhistroy(){ //公安局审核未通过 可以查看审核记录
		$("#wtgyy_detail").empty();
		$("#wtgyy_detail").load("business/Ylfwzagl/ShenHeHistory-cyry.jsp");
		$("#wtgyy_detail").show();
		$("#wtgyy_detail").css("width",520);
	}
		function  deleteDate(y){
	 		 $('#m_xm').val("");
		     $('#m_zjhm').val("");
 	}
 		function updatePicture(y){
			if(nationality != ''){
				$('#m_mzdm').val(x.ocrCNation);
				$('#m_minzu').val(nationality);
			}else{
				getMinZuCodeAndSetValue(x.ocrCNation,"dm_mz","m_mzdm","m_minzu")
			}
	 		 $('#m_fileload').val(x.GetImage());
	 		 $('#m_xm').val(x.ocrCName);
		     $('#m_zjhm').val(x.ocrIdentityId);
		     $('#m_hjdxz').val(x.ocrAddR);
		     $('#m_xbdm').setValue(x.ocrCSex);
		     $('#m_xb').val($('#m_xbdm').attr('title'));
		     var birthday=getBirthday($('#m_zjhm').val());
				if(birthday!=null&&birthday!=''){
					$("#m_csrq").val(birthday);
				}
		     getHjsxDD(x.ocrIdentityId,"dm_xzqh","m_hjdxzqhdm","m_hjdxzqh");
			 nationality = "";
 		}
 		
function initPage(){
	    if(hylbdm=='C'){//机修业
		    setBackRemoveObj("blank_");
		    setBackRemoveObj("gz_");
		}else{
		    $("#qyryxxTr11").hide();		    
		}
	}
	
	function setPictureBack(x){
 	    $('#m_fileload').val(x.GetImage());
 	}
	
	function setTrAppendTd(trid,smallId){
		$("td[id^='"+smallId+"']").each(function(){
			$(this).appendTo($("#"+trid));
		});
	}
	function setRemoveObj(removeid){
		$("td[id^='"+removeid+"']").each(function(){
			$(this).hide();
		});
	}
	function setBackRemoveObj(removeid){
		$("td[id^='"+removeid+"']").each(function(){
			$(this).show();
		});
	}
	// 转换成日期格式
    function formatDate(strDate){ 
	    var riqi = strDate.split("-");
	    return new Date(riqi[0],(riqi[1]-1),riqi[2]);
    }