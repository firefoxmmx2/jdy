var configtr1=new Array(1,'#',1,'#');
var configtr2=new Array(1,'#',1,'#');
var configtr3=new Array(1,'#',0,'#');
var configtr4=new Array(1,'#',0,'#');
var configtr5=new Array(0,'#');
var configtr6=new Array(1,'#',1,'#');
var configtr7=new Array(1,'#',0,'#');
var configtr8=new Array(1,'#');
var configtr9=new Array(1,'#');
var configtr10=new Array(1,'#',1,'#');
var configtr11=new Array(1,'#');
var configtr12=new Array(0,'#',0,'#');
var configtr13=new Array(1,'#',0,'#');
var configtr14=new Array(1,'#',0,'#');
var configtr15=new Array(0,'#',0,'#');
var configtr16=new Array(0,'#');
var configtr17=new Array(0,'#');
var configtable=new Array(configtr1,configtr2,configtr3,configtr4,configtr5,configtr6,configtr7,configtr8,configtr9,configtr10,configtr11,configtr12,configtr13,configtr14,configtr15,configtr16,configtr17);

$(document).ready(function(){
    configtdcolor("add",configtable);
	 bc_bottonMoveRight(23); 
	 $("#qyryxxTr5").hide();
	 $("#qyryxxTr8").hide();
	 $("#qyryxxTr13").hide();
	 $("#qyryxxTr16").hide();
		$("#a_csrq").attr("readonly","true");
		$("#a_csrq").datepicker();
		$("#a_rzrq").attr("readonly","true");
		$("#a_rzrq").datepicker();
		$("#a_lzrq").attr("readonly","true");
		$("#a_lzrq").datepicker();
		$("#a_zxsj").attr("readonly","true");
		$("#a_zxsj").datepicker();
		$("#a_hcsj").attr("readonly","true");
		$("#a_hcsj").datepicker();
		$("#a_bcsj").attr("readonly","true");
		$("#a_bcsj").datepicker();		
  		$("#a_whcddm").selectBox({code:"dm_xl"});
  		//$("#a_hyzkdm").selectBox({code:"dm_hyzk"});
  		//$("#a_xxdm").selectBox({code:"dm_xx"});
  		$("#a_xbdm").selectBox({code:"dm_xb"});
		//hy_gwselectBox("a_hylbdm","a_gwbh");
		// 行业类别	
	    $("#a_hylbdm").selectBoxhylb({code:"ggmk"});
	    if(publicHylbdm != ''){
	        $("#a_hylbdm").setValue(publicHylbdm);
	    }
	    if($('#a_hylbdm').val()=='D'){
	    	$("#whcd_title").removeClass();
	    	$("#whcd_title").addClass("red");
	    }
		if($('#a_hylbdm').val()=='E03'){// 典当业
	        selectHylbPage("basic/publicsystem/QyryxxAdd-gad-dd.jsp");
	    }else if($('#a_hylbdm').val()=='B'){// 印章业
	        selectHylbPage("basic/publicsystem/QyryxxAdd-gad-yz.jsp");
        }else if($('#a_hylbdm').val()=='N'){// 内保单位
         	selectHylbPage("basic/publicsystem/QyryxxAdd-gad-nb.jsp");
	    }else{
	        initPage();
	    }
		
	}).keydown(function(){
		if(event.keyCode == 13) event.keyCode = 9;
	});
	
	$("#a_cylb").click(function(){
	        getrylbTree("a_cylb","a_cylbdm","dm_cylb(jxy)");
	});
	
	$("#a_gz").click(function(){
	        getrylbTree("a_gz","a_gzdm","dm_gz(jxy)");
	    });
	
	$('#a_hylbdm').change(function(){
	    publicHylbdm = $('#a_hylbdm').val();
	    if(publicHylbdm == 'E03'){// 典当业
	        selectHylbPage("basic/publicsystem/QyryxxAdd-gad-dd.jsp");
	    }else if(publicHylbdm == 'B'){// 印章业
	        selectHylbPage("basic/publicsystem/QyryxxAdd-gad-yz.jsp");
         }else if(publicHylbdm == 'N'){ //内保单位
         	selectHylbPage("basic/publicsystem/QyryxxAdd-gad-nb.jsp");
	    }else{
	        initPage();
	    }
		//hy_gwselectBox("a_hylbdm","a_gwbh");
	});
	$("#a_qymc").click(function(){ //服务场所筛选框
	 	dataid=$('#a_hylbdm').val();
		getTy_item("a_qymc","a_qybm");
	});
	$("#a_minzu").click(function(){
		getDict_item("a_minzu","a_mzdm","dm_mz");
	});
	$("#a_hjdxzqh").click(function(){
		getDict_item("a_hjdxzqh","a_hjdxzqhdm","dm_xzqh");
	});
	$("#a_gwbh").change(function(){
		$("#a_gwmc").val($("#a_gwbh").attr('title'));
	});
	//$("#a_hyzkdm").change(function(){
  	//	$("#a_hyzk").val($("#a_hyzkdm").attr('title'));
	//});
	//$("#a_xxdm").change(function(){
	//	$("#a_xx").val($("#a_xxdm").attr('title'));
	//});
	$("#a_whcddm").change(function(){
		$("#a_whcd").val($("#a_whcddm").attr('title'));
	});
	$("#a_xbdm").change(function(){
		$("#a_xb").val($("#a_xbdm").attr("title"));
	});
	
	function initPage(){
	    if($('#a_hylbdm').val()=='C'){//机修业
		    //setRemoveObj("gwlb_");
		    //setRemoveObj("blank_");
		    //setBackRemoveObj("rylb_");
		    //setBackRemoveObj("gz_");
		    $("#qyryxxTr14").show();
		}else{
		    //setRemoveObj("rylb_");
		    //setRemoveObj("gz_");
		    //setBackRemoveObj("gwlb_");
		    //setBackRemoveObj("blank_");
		    $("#qyryxxTr14").hide();
		}
	}
	
	function addVerify(){
		if (!checkControlValue("a_hylbdm","Select",1,4,null,1,"行业类别"))
			return false;
		if (!checkControlValue("a_qymc","String",1,60,null,1,"企业名称"))
			return false;
		if (!checkControlValue("a_xm","String",1,100,null,1,"姓名"))
			return false;
		if(!isChinese("a_xm","姓名"))
			return false;
		if (!checkControlValue("a_xbdm","Select",1,2,null,1,"性别"))
			return false;
		if($('#a_hylbdm').val()=='D'){
			if (!checkControlValue("a_whcddm","Select",1,2,null,1,"文化程度"))
				return false;
		}else{
			if (!checkControlValue("a_whcddm","Select",1,2,null,0,"文化程度"))
				return false;
		}
		if (!checkControlValue("a_minzu","String",1,20,null,1,"民族"))
			return false;
		if (!checkControlValue("a_zjhm","String",1,30,null,1,"身份证号码"))
			return false;
		//if (!checkControlValue("a_bm","String",1,30,null,0,"别名"))
		//	return false;
		
		if (!checkControlValue("a_csrq","Date",null,null,null,1,"出生日期"))
			return false;
		
		var tenYearAgo = new Date();
		tenYearAgo.setYear(tenYearAgo.getYear() - 10);
		var tenYearAgoStr = tenYearAgo.getFullYear()+"-"+(tenYearAgo.getMonth()+1)+"-"+tenYearAgo.getDate();
		if(!checkTwoDateEarlier($("#a_csrq").val(),tenYearAgoStr)){
			jAlert("出生日期必须小于"+tenYearAgoStr+"！",'验证信息',null,"a_csrq");
			return false;
		}
		//if (!checkControlValue("a_hyzkdm","Select",1,4,null,0,"婚姻状况"))
		//	return false;
		if (!checkControlValue("a_hjdxzqh","String",1,200,null,1,"户籍省县"))
			return false;
		if (!checkControlValue("a_zzzhm","String",1,20,null,0,"暂住证号"))
			return false;
		if (!checkControlValue("a_hjdxz","String",1,200,null,1,"户籍地详址"))
			return false;
		if (!checkControlValue("a_zzdz","String",1,200,null,1,"现住址"))
			return false;
		if (!checkControlValue("a_shouji","String",1,20,null,1,"手机"))
			return false;
		if (!checkControlValue("a_zhiwu","String",1,20,null,1,"职务"))
			return false;
		if($('#a_hylbdm').val()=='C'){
		    if (!checkControlValue("a_gz","String",1,60,null,1,"工种"))
			return false;
		}
		if (!checkControlValue("a_jjlxr","String",1,30,null,0,"紧急联系人"))
			return false;
		if (!checkControlValue("a_jjlxrdh","String",1,20,null,0,"紧急联系电话"))
			return false;
		if (!checkControlValue("a_rzrq","Date",null,null,null,1,"入职日期"))
			return false;
		if (!checkControlValue("a_lzrq","Date",null,null,null,0,"离职日期"))
			return false;
		//if (!checkControlValue("a_xxdm","Select",1,200,null,1,"血型"))
			//return false;
		//if($('#a_hylbdm').val()=='C'){
		//    if (!checkControlValue("a_cylb","String",1,50,null,1,"人员类别"))
		//	    return false;
			
		//}else{
		//    if (!checkControlValue("a_gwbh","Select",1,50,null,1,"岗位类别"))
		//	return false;
		//}
		//if (!checkControlValue("a_shengao","Float",-999.99,999.99,2,0,"身高"))
		//	return false;
		//if (!checkControlValue("a_tizh","Float",-999.99,999.99,2,0,"体重"))
		//	return false;
		//if (!checkControlValue("a_gwzrms","String",1,2000,null,0,"岗位责任描述"))
		//	return false;
		if (!checkControlValue("a_bz","String",1,2000,null,0,"备注"))
			return false;
		
		var returnCardNo = checkIdCardNo("a_zjhm");
		if(returnCardNo){
			$("#a_zjzt").val(0);
		}else{
			$("#a_zjzt").val(1);
		}
		var rzrq = $("#a_rzrq").attr("value");
	    var lzrq = $("#a_lzrq").attr("value");
	    if(rzrq!=''&&lzrq!=''&&formatDate(rzrq)-formatDate(lzrq)>0){
		    jAlert("请正确选择入职和离职日期!","提示信息");
		    return false;
	    }
		//if($("#a_shengao").val()==""){ $("#a_shengao").val("0"); }
		//if($("#a_tizh").val()==""){ $("#a_tizh").val("0"); }
		return true;
	}   

	$("#a_zjhm").blur(function(){
		var returnCardNo = checkIdCardNo("a_zjhm");
		if(returnCardNo){
			var zjhm_csrq = getBirthday($(this).val());
			var zjhm_xb = getXb($(this).val());
			if(zjhm_csrq!=null && zjhm_csrq!=""){
				$("#a_csrq").val(zjhm_csrq);
			}
			if(zjhm_xb!=null && zjhm_xb!=""){
				$("#a_xbdm").setValue(zjhm_xb);
				$("#a_xb").val($("#a_xbdm").attr("title"));
			}
		}else{
			jAlert("身份证号码不正确","验证信息");
		}
		getHjsxDD($(this).val(),"dm_xzqh","a_hjdxzqhdm","a_hjdxzqh")
	});

	function setAdd_cyry(){
		if (addVerify()){
			setParams("a_");
			jQuery.post(addUrl,params,addback,"json");
		}	
	}	

	function clearAllFormElement(){
		var formDiv = $("#clearDiv").parent();
		formDiv.find("input[id!='a_csmc'][id!='a_csid']").val("");
		formDiv.find("input[type='checkbox']").attr("checked",false);
		formDiv.find("textarea").val("");
		formDiv.find("select").setValue("");
		ctlPicture1.InitPicture();
	}

	function deleteDate(y){
		$('#a_xm').val("");
		$('#a_zjhm').val("");
 	}
	function updatePicture(y){
		if(nationality != ''){
			$('#a_mzdm').val(x.ocrCNation);
			$('#a_minzu').val(nationality);
		}else{
			getMinZuCodeAndSetValue(x.ocrCNation,"dm_mz","a_mzdm","a_minzu")
		}
		$('#a_fileload').val(x.GetImage);
		$('#a_xm').val(x.ocrCName);
		$('#a_hjdxz').val(x.ocrAddR);
		$('#a_csrq').val(x.ocrBirth);
		$('#a_zjhm').val(x.ocrIdentityId);
		$('#a_xbdm').setValue(x.ocrCSex);
		$('#a_xb').val($('#a_xbdm').attr('title'));
		getHjsxDD(x.ocrIdentityId,"dm_xzqh","a_hjdxzqhdm","a_hjdxzqh")
		nationality = "";
	}
	
	function setPictureBack(x){
 	    $('#a_fileload').val(x.GetImage());
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