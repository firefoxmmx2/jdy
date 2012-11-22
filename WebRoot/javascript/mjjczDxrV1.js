/**
*
*	配合 business/Ylfwzagl/DxrMan.jsp 完成电写入
*	配合 business/Ylfwzagl/DxrMan-bx.jsp 完成-补写-电写入
*	配合 business/Ylfwzagl/DxrMan-pxr.jsp 完成-批写入-电写入
*
**/	
	var dxr_querysnAndWcUrl_mjjcz = "mjjczsystem/querySnAndWc_mjjczzb.action"; //获取开始顺序号和写卡数量 url
	var dxr_backWriteIckhUrl_mjjcz = "mjjczsystem/backWriteIckh_mjjczzb.action"; //将ic卡号(芯片号)写到数据库
	var dxr_queryMjjczxxMesUrl = "mjjczsystem/queryMjjczxxMes_mjjczzb.action"; //url
	var dxr_queryMjjczxxMesByMjjczbhUrl = "mjjczsystem/queryMjjczxxMesByMjjczbh_mjjczzb.action"; //url
	
	var isCanStart_mjjcz = false; //是否可以开始
	var isCanTiaog_mjjcz = false; //是否可以跳过
	
	var startNum_mjjcz = 0; //开始顺序号
	var maxNum_mjjcz = 0; //本次最大顺序号
	var writeCount_mjjcz = 0; //本次电写入数量
	
	var bpcWriteCount_mjjcz = 0; //本次最终写入数量
	var bpcDxrSuccess_mjjcz = 0; //本次成功写入数量
	var bpcDxrTiaog_mjjcz = 0; //本次跳过写入数量
	var bpcDxrErr_mjjcz = 0; //本次写入失败数量
	
	var pxrStart_mjjcz = false; //批写入开始
	
	var jsonLMjjczb = null; //[0]：数据库中的值(待显示的) [1]：待写入卡的内容
	var thePlayRow_mjjcz = 0; //当前活动的行
	
	function queryStartNumAndWriteCount_mjjcz(){ //根据批次号获取(开始顺序号 和 本次写卡数量) 前提是  radio 为批写入
		var pxr_check = $("#pxr").attr("checked");
		if(pxr_check==true){ //批写入
			var pch = $("#p_pch").attr("value");
			if(pch.length==18){
				huoquMess_mjjcz();
			}else{
				$("#p_kssxh").attr("value","");
				$("#p_bcdxrsl").attr("value","");
				isCanStart_mjjcz = false;
			}
		}
	}
	function huoquMess_mjjcz(){ //同步 获取从业人员信息 准备电写入
		setParams("p_");
		jQuery.ajax({
			type: 'POST',
			url: dxr_querysnAndWcUrl_mjjcz,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){
				var rows  = eval(result);
				backHuoquMess_mjjcz(rows);
			}
		});
	}
	function backHuoquMess_mjjcz(json){
		$("#p_kssxh").attr("value","");
		$("#p_bcdxrsl").attr("value","");
		$('span[@id^="ic_"]').html("").end();
		if(json.result=="success"){
			if(json.LMjjczzb[0]=='1'){ //是否查到了数据
				$("#p_kssxh").attr("value",json.LMjjczzb[1]);
				$("#p_bcdxrsl").attr("value",json.LMjjczzb[3]);
				startNum_mjjcz = json.LMjjczzb[1];
				maxNum_mjjcz = json.LMjjczzb[2];
				writeCount_mjjcz = json.LMjjczzb[3];
				isCanStart_mjjcz = true;
			}else{
				isCanStart_mjjcz = false;
			}
		}else{
			jAlert("错误信息","提示");
			isCanStart_mjjcz = false;
		}
	}
	
	function startDxrIckBon_mjjcz(){ //开始 按钮事件
		initParms_mjjcz();
		var pxr_check = $("#pxr").attr("checked");
		var zdyxr_check = $("#zdyxr").attr("checked");
			if(pxr_check==true){ //批写入
				if(isCanStart_mjjcz==true&&startVerify_mjjcz()){ //可以开始,验证批写入
					pxrStart_mjjcz = true;
					queryMjjczxxMes();
				} else { //不可以开始
					jAlert("错误的条件,不可以开始电写入!","提示");
				}
			} else { //自定义
				if (!checkControlValue("c_mjjczbh","String",1,50,null,1,"民警检查证编号"))
					return false;
				queryMjjczxxMesByMjjczbh();
			}
	}
	function initParms_mjjcz(){ //初始化参数
		bpcWriteCount_mjjcz = 0; //本次最终写入数量
	    bpcDxrSuccess_mjjcz = 0; //本次成功写入数量
		bpcDxrTiaog_mjjcz = 0; //本次跳过写入数量
		bpcDxrErr_mjjcz = 0; //本次写入失败数量
		pxrStart_mjjcz = false; //批写入开始
		jsonLMjjczb = null; //[0]：数据库中的值(待显示的) [1]：待写入卡的内容
		thePlayRow_mjjcz = 0; //当前活动的行
	}
	function startVerify_mjjcz(){ //验证批写入
		if (!checkControlValue("p_pch","String",1,20,null,1,"批次号"))
			return false;
		if (!checkControlValue("p_kssxh","Integer",-9999999999,9999999999,null,0,"开始顺序号"))
			return false;
		if (!checkControlValue("p_bcdxrsl","Integer",-9999999999,9999999999,null,0,"本次电写入数量"))
			return false;
		if(($("#p_kssxh").attr("value")-startNum_mjjcz)<0){
			jAlert("当前批次,最小开始顺序号为:"+startNum_mjjcz+".请正确填写开始顺序号","提示",null,"p_kssxh");
			return false;
		}
		if((maxNum_mjjcz-$("#p_kssxh").attr("value"))<0){
			jAlert("当前批次,最大顺序号为:"+maxNum_mjjcz+".请正确填写开始顺序号","提示",null,"p_kssxh");
			return false;
		}
		if((writeCount_mjjcz-$("#p_bcdxrsl").attr("value"))<0){
			jAlert("当前批次,最大电写入数量为:"+writeCount+".请正确填写本次电写入数量","提示",null,"p_bcdxrsl");
			return false;
		}
		return true;
	}
	
	function queryMjjczxxMes(){ //同步 获取从业人员信息 准备电写入
		setParams("p_");
		jQuery.ajax({
			type: 'POST',
			url: dxr_queryMjjczxxMesUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){
				var rows  = eval(result);
				backMjjczxxMes(rows);
			}
		});
	}
	function backMjjczxxMes(json){ //获取从业人员信息 - 回调
		if(json.result=="success"){
			jsonLMjjczzb = json.LMjjczzb; //将回调信息 放到页面临时变量
			if(jsonLMjjczzb.length>0){ //有数据
				thePlayRow_mjjcz = 0;
				bpcWriteCount_mjjcz = jsonLMjjczzb[0].length;
				startDxr_mjjcz(); //开始电写入
			} else {
				jAlert("没有可电写入数据","提示");
			}
		}else{
			jAlert("错误信息","提示");
		}
	}
	function queryMjjczxxMesByMjjczbh(){ //同步 获取从业人员信息(自定义写入) 准备电写入
		setParams("c_");
		jQuery.ajax({
			type: 'POST',
			url: dxr_queryMjjczxxMesByMjjczbhUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){
				var rows  = eval(result);
				backQueryMjjczxxMesByMjjczbh(rows);
			}
		});
	}
	function backQueryMjjczxxMesByMjjczbh(json){ //获取从业人员信息 - 回调
		if(json.result=="success"){
			jsonLMjjczzb = json.LMjjczzb; //将回调信息 放到页面临时变量
			if(jsonLMjjczzb.length>0){ //有数据
				thePlayRow_mjjcz = 0;
				bpcWriteCount_mjjcz = jsonLMjjczzb[0].length;
				startDxr_mjjcz(); //自定义电写入
			} else {
				jAlert("没有可电写入数据","提示");
			}
		}else{
			jAlert("错误信息","提示");
		}
	}
	
	function tiaoGuoIckBon_mjjcz(){ //跳过按钮事件
		if(pxrStart_mjjcz==true){
			thePlayRow_mjjcz += 1;
			bpcDxrTiaog_mjjcz += 1;
			if(!isFinash_mjjcz("")){ //没有结束
				nowState_mjjcz(""); //刷卡情况
				startDxr_mjjcz(); //继续刷卡
			}
		}
	}
	function startDxr_mjjcz(){ //[0]：数据库中的值(待显示的) [1]：待写入卡的内容
		if(jsonLMjjczzb.length>0){
			showMesToPage_mjjcz(); //页面下方显示
			ickOpenWrite_mjjcz();//刷卡(OpenWrite())
		}
	}
	
	function isFinash_mjjcz(obj){ //刷卡是否结束 //当最后一次失败的时候 拼提示信息
		if(bpcWriteCount_mjjcz==thePlayRow_mjjcz){
			pxrStart_mjjcz = false;
			nowState_mjjcz(obj+"刷卡结束！");
			$('span[@id^="ic_"]').html("").end();
			return true;
		}
		return false;
	}
	function nowState_mjjcz(mess){ //刷卡情况
	    isPlayChengGong = true;
		jAlert(mess+"共有可写卡 "+bpcWriteCount_mjjcz+" 张，写入成功 "+bpcDxrSuccess_mjjcz+" 张，跳过 "+bpcDxrTiaog_mjjcz+" 张，失败 "+bpcDxrErr_mjjcz+" 张。","提示");//提示   可写卡N张，写入成功N张，跳过N张。
	}
	
	function showMesToPage_mjjcz(){ //显示信息到页面
		var theNowRow = jsonLMjjczzb[0][thePlayRow_mjjcz];
		$('span[@id^="ic_"]').html("").end();
		$("#ic_orderNum").append(setNull(theNowRow.sxh));
		$("#ic_gajgbm").append(setNull(theNowRow.gajgbm));
		$("#ic_mjjczbh").append(setNull(theNowRow.mjjczbh));
		$("#ic_gajgmc").append(setNull(theNowRow.gajgmc));
		$("#ic_xm").append(setNull(theNowRow.xm)); 
		$("#ic_lxdz").append(setNull(theNowRow.lxdz));
		$("#ic_jyh").append(setNull(theNowRow.jyh));
		$("#ic_lxdh").append(setNull(theNowRow.lxdh)); //注销
		$("#ic_zw").append(setNull(theNowRow.zw));
		$("#ic_sfzx").append(setNull(theNowRow.sfzxmc));
		$("#ic_icklx").append(setNull(theNowRow.icklxString));
	}
	
	//写卡及写卡回调
	function ickOpenWrite_mjjcz(){ //将数据写入卡内
		//下面是的链接是给控件用的，控件通过他来拼url然后跟数据库进行交互，根据卡号查数据库，看是否电写入过。
		var ickContent = jsonLMjjczzb[1][thePlayRow_mjjcz];
		document.getElementById('ctlICCard').URL= $("#projectUrl").attr("value")+"mjjczkjdy/kongJianDiaoYong.action";
		document.getElementById('ctlICCard').ConnJava=content_connJava;
		document.getElementById('ctlICCard').ICCardDevice=content_deviceType; //旧设备
		document.getElementById('ctlICCard').OpenWrite(ickContent);
	}
	function WritePoliceICCardFinish(backIckh){ //读卡结束回调函数
		backWriteIckh_mjjcz(backIckh); //将IC卡号 写到数据库 ajax同步 参数 IC卡号
	}
	function backWriteIckh_mjjcz(ickh){ //同步 将ic卡号(芯片号)写到数据库
		$("#b_mjjczid").attr("value",jsonLMjjczzb[0][thePlayRow_mjjcz].mjjczid);
		$("#b_ickh").attr("value",ickh); //
		setParams("b_");
		jQuery.ajax({
			type: 'POST',
			url: dxr_backWriteIckhUrl_mjjcz,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){
				var rows  = eval(result);
				backBackWriteIckh_mjjcz(rows);
			}
		});
	}
	function backBackWriteIckh_mjjcz(json){ //将ic卡号(芯片号)写到数据库 - 回调
		thePlayRow_mjjcz += 1;
		var resMes = "";
		if(json.result=="success"){
			if(json.LMjjczzb=='1'){ //回写成功
				bpcDxrSuccess_mjjcz += 1;
				isPlayChengGong = true;
				resMes = "本次电写入成功！";
			} else {
				bpcDxrErr_mjjcz += 1;
				resMes = "本次电写入失败！";
			}
		} else {
			bpcDxrErr_mjjcz += 1;
			resMes = "本次电写入失败！";
		}
		if(pxrStart_mjjcz==true){ //批写入
			if(!isFinash_mjjcz(resMes)){ //没有结束
				nowState_mjjcz(resMes); //刷卡情况
				startDxr_mjjcz(); //继续刷卡
			}else{
				$("#p_kssxh").val("");
				$("#p_bcdxrsl").val("");
			}
		} else { //自定义写入
			jAlert(resMes,"提示");
			$('span[@id^="ic_"]').html("").end();
			$("#tpnrImg").attr("src","images/pic.gif");
			var bxrflag = $("#bxrflag").attr("value");
			if(bxrflag=='1'){
				dxrbxColse(); //关闭补写页面
				setPageList($("#pageNo").attr("value"));
			}
		}
	}
	//读卡及读卡回调PoliceICCardInfoReadFinish
	function OpenRead_mjjcz_sjjy(){
	document.getElementById('ctlICCard').ConnJava=content_connJava;
	document.getElementById('ctlICCard').ICCardDevice=content_deviceType;
	document.getElementById('ctlICCard').OpenGetPoliceCard("MJJCZBH,GAJGBM,MJXM,KLX,JYH,ZW,LXDH,LXDZ,GAJGMC");
	}
	
	function OpenRead_mjjcz_rcjc(){
	document.getElementById('ctlICCard').ConnJava=content_connJava;
	document.getElementById('ctlICCard').ICCardDevice=content_deviceType;
	document.getElementById('ctlICCard').OpenGetPoliceCard("MJJCZBH,MJXM,JYH,ZW,GAJGBM,GAJGMC");
	}
	
// ********** end **********