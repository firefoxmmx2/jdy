<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.aisino2.sysadmin.domain.User"%>
<%@page import="com.aisino2.sysadmin.Constants"%>
<%
User user = (User)session.getAttribute(Constants.userKey);
String csbm_qyd = "";
if(user!=null){
	csbm_qyd = user.getSsdwbm();
}
%>
<HTML>
<script type="text/javascript">
	var qyjbxx_requestType="detail";
	var qyjbxx_dataid;
	var selHylb = "";
	var jsonResultMes = "";
	var qyjbxx_detailUrl = "publicsystem/query_qyjbxx.action";
	$(document).ready(function(){
		selHylb = "";
		$("#q_qybm").attr("value",'<%=csbm_qyd %>');
		qyjbxx_setDetail();
	});
	function qyjbxx_setDetail(){
		setParams("q_");
		jQuery.post(qyjbxx_detailUrl,params,qyjbxx_updatediv,"json");
	}
	function qyjbxx_updatediv(json){
		jsonResultMes = json;
		selHylb = setNull(json.LQyjbxx[0].hylbdm);
		qyjbxx_dataid = json.LQyjbxx[0].qyid;
		$("#f_jjlxbm").attr("value",setNull(json.LQyjbxx[0].jjlxbm));
		$("#s_qyid").attr("value",json.LQyjbxx[0].qyid);
		$("#p_qyid").attr("value",json.LQyjbxx[0].qyid);
		if(selHylb=="J"&&setNull(json.LQyjbxx[0].yyztdm)=="12"){ //娱乐业专属
			showOrHideYlQitaxxbq('tyrq_','block');
		}
		
		$("#qyjbxxXiangxi").load("basic/publicsystem/QyjbxxXiangXiDetail-gzth.jsp", {}, function(){
		});
	}
	function hyInit(){ //行业初始化
		if(selHylb=='J'){
			ylyInit();
		} else if(selHylb=='C') { //机修业
			jxyInit();
		} else if(selHylb=='E01') { //二手车
			ershoucInit();
		} else if(selHylb=='E02') { //二手机
			ershoushoujiInit();
		} else if(selHylb=='E04') { //废旧金属
			fjjsInit();
		} else if(selHylb=='F01') { //出租车
			czcInit();
		} else if(selHylb=='F02') { //汽车租赁
			qczlInit();
		} else if(selHylb=='B') { //印章行业
			yzyInit();
		} else if(selHylb=='E03') { //印章行业
			ddyInit();
		} else if(selHylb=='E07') { //委托寄卖业
			wtjmyInit();
		} else if(selHylb=='C01') { //机动车拆解业
			jdccjyInit();
		} else if(selHylb=='Z01') { //机动车拆解业
			ZjjgInit();
		} else if(selHylb=='D') { //印刷业
			ysyInit();
		}else if(selHylb=='Y01') { //开锁业
			ksyInit();
		} else if(selHylb=="Y") { //寄递业
			jdyInit();
		}
	}
	
	function jdyInit(){ //寄递业初始
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","block"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(400);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-jdy-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			jdyYqInit(); //页签初始化
		});
	}
	
	function ylyInit(){ //娱乐业初始
		jAlert("待开发",'系统提示');
	}
	function jxyInit(){ //机修业初始
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","block"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(400);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-jxy-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			jxyYqInit(); //页签初始化
		});
	}
	function ksyInit(){ //开锁业初始
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","block"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(400);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-ksy-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			ksyYqInit(); //页签初始化
		});
	}
	
	function ershoucInit(){ //二手车
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(360);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-esc-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			escYqInit(); //页签初始化
		});
	}
	function ershoushoujiInit(){ //二手机
		changeLableTitle('gxdw_title','治安管辖机构');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(360);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-esj-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			esjYqInit(); //页签初始化  - 修改于2011.07.28-添加页面客户端安保信息详情-陈勇荣
		});
	}
	function fjjsInit(){ //废旧金属
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-fjjs-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			fjjsYqInit(); //页签初始化
		});
	}
	function czcInit(){ //出租车
		changeLableTitle('gxdw_title','治安管辖机构');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(360);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-czc-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
		});
	}
	function qczlInit(){ //汽车租赁
		changeLableTitle('gxdw_title','治安管辖机构');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(340);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-qczl-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
		});
	}
	function yzyInit(){ //印章行业
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-yz-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			yzyYqInit();
		});
	}
	function ddyInit(){ //典当
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-ddy-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			ddyYqInit();
		});
	}
	function wtjmyInit(){ //委托寄卖
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-wtjm-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			wtjmYqInit();
		});
	}
	function jdccjyInit(){ //机动车拆解
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-jdccj-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			jdccjYqInit();
		});
	}
	function ZjjgInit(){ //中介机构
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-zjjg-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
		});
	}
	function ksyYqInit(){ //开锁业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-ksy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	function ysyInit(){ //印刷业
		changeLableTitle('gxdw_title','管辖单位');
		//$("#hqZhuFuType").css("display","none"); //当需要隐藏/显示企业主分类的时候 将此行回复注销
		$("#qyjbxxXiangxi").height(470);
		$("#QyJibenxiangmu").load("basic/publicsystem/QyjbxxJibenXiangMuDetail-ysy-gzth.jsp", {}, function(){
			qyjbxxXiangxi_updatediv();
			changeLableTitle('qyorcs_','企业');
			ysyYqInit();
		});
	}
	
	//---不同行业页签初始化(根据需求,不同行业可能需要不同的页签)
	function jdyYqInit(){ //寄递业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-jdy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	
	function jxyYqInit(){ //机修业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-jxy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	
	//---不同行业页签初始化(根据需求,不同行业可能需要不同的页签)
	function yzyYqInit(){ //印章业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-yzy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
		showOrHideYlQitaxxbq('small_zzcl','block'); //用到纸质材料页签则加载之,不需要则不用写本行和下两行
		$("#plant_zzcl").load("basic/publicsystem/Zzclxx-yzy-gzth.jsp");
	}
	function ddyYqInit(){ //典当业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-ddy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
		showOrHideYlQitaxxbq('small_zzcl','block'); //用到纸质材料页签则加载之,不需要则不用写本行和下两行
		$("#plant_zzcl").load("basic/publicsystem/Yqzzcl-ddy-gzth.jsp");
	}
	function fjjsYqInit(){ //废旧金属业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-fjjs-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	
	function esjYqInit(){ //二手机 - 修改于2011.07.28-添加页面客户端安保信息详情-陈勇荣
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-esj-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	
	function escYqInit(){ //二手车
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-esc-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	function wtjmYqInit(){ //委托寄卖
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-wtjm-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	function jdccjYqInit(){ //机动车拆解
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-jdccj-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	
	function ysyYqInit(){ //印刷业
		showOrHideYlQitaxxbq('small_abxx','block'); //用到安保信息页签则加载之,不需要则不用写本行和下两行
		$("#plant_abxx").load("basic/publicsystem/YqAbxx-ysy-gzth.jsp"); //安保信息页签需要有那些DIV 去加载不同的业务页面
	}
	//---不同行业页签点击事件初始化(根据需求,不同行业每个页签加载的内容可能不同：在这里做)
	function jdyOnloadbq(yqid){ //寄递业
		if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_jdy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow"); //加载保安人员信息
			$("#div_jdy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_jdy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_jdy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	function jxyOnloadbq(yqid){ //机修业
		if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_jxy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow"); //加载保安人员信息
			$("#div_jxy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_jxy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_jxy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	//---不同行业页签点击事件初始化(根据需求,不同行业每个页签加载的内容可能不同：在这里做)
	function yzhyOnloadbq(yqid){ //印章业
		if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_yzy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow"); //加载保安人员信息
			$("#div_yzy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_yzy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_yzy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
		if(yqid=='zzcl'&&yqstate==0){
			$("#div_yzy_zhiZhiCL").empty().load("basic/publicsystem/Yqzzcl-yzy-gzth.jsp").show("slow");//加载技防设备信息
		}
	}
	function ddyOnloadbq(yqid){ //典当业
		if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_ddy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_ddy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow");//加载保卫人员信息
			$("#div_ddy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow");//加载视频监控设备
			$("#div_ddy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow");//加载技防设备信息
		}
		if(yqid=='zzcl'&&yqstate==0){
			$("#div_ddy_zhiZhiCL").empty().load("basic/publicsystem/ZzclxxMan.jsp").show("slow");//加载技防设备信息
		}
	}
	function fjjsOnloadbq(yqid){ //废旧金属
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_fjjs_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_fjjs_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_fjjs_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_fjjs_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	function ershoushoujiOnloadbq(yqid){ //二手机 - 修改于2011.07.28-添加页面客户端安保信息详情-陈勇荣
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_esj_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_esj_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_esj_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_esj_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	function ershoucOnloadbq(yqid){ //二手车
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_esc_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_esc_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_esc_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_esc_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	function wtjmyOnloadbq(yqid){ //委托寄卖
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_wtjm_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_wtjm_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_wtjm_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_wtjm_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	function jdccjyOnloadbq(yqid){ //机动车拆解
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_jdccj_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_jdccj_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_jdccj_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_jdccj_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	function ksyOnloadbq(yqid){ //机动车拆解
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_ksy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_ksy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_ksy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_ksy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	
	function ysyOnloadbq(yqid){ //印刷业
	    if(yqid=='abxx'&&yqstate==0){ //保证加载一次
			$("#div_ysy_baoAnRY").empty().load("basic/publicsystem/BaryxxMan.jsp").show("slow");//加载保安人员信息
			$("#div_ysy_baoWeiRY").empty().load("basic/publicsystem/BwryxxDetailMan.jsp").show("slow"); //加载保卫人员信息
			$("#div_ysy_shiPinSB").empty().load("basic/publicsystem/BldsjksbDetailMan-gzth.jsp").show("slow"); //加载视频监控设备
			$("#div_ysy_jiFangSB").empty().load("basic/publicsystem/AqjcsbMan-gzth.jsp").show("slow"); //加载技防设备信息
		}
	}
	//---页签点击动作
	function show_biaoqian(yqid){ //点击页签时的动作
		$("#yqAndZt option").each(function(){
			var thisid =  $(this).attr("value");
			$("#"+thisid)[0].style.display='none';
			if(thisid==yqid){
				$("#"+thisid)[0].style.display='block';
			}
		});
		yqstate = getYqValueByKey(yqid);
		setYqValueByKey(yqid,'1');
		if(selHylb=='J'){ //娱乐业初始
		} else if(selHylb=='C') {
			jxyOnloadbq(yqid);
		} else if(selHylb=='E01') { //二手车
			ershoucOnloadbq(yqid);
		} else if(selHylb=='E02') { //二手机
			ershoushoujiOnloadbq(yqid);  //-修改于2011.07.28-添加页面客户端安保信息详情-陈勇荣
		} else if(selHylb=='E04') { //废旧金属
			fjjsOnloadbq(yqid);
		} else if(selHylb=='F01') { //出租车
			//czcOnloadbq(yqid);
		} else if(selHylb=='F02') { //汽车租赁
			//qczlOnloadbq(yqid);
		} else if(selHylb=='B') { //印章行业
			yzhyOnloadbq(yqid);
		} else if(selHylb=='E03') { //典当业
			ddyOnloadbq(yqid);
		} else if(selHylb=='E07') { //委托寄卖业
			wtjmyOnloadbq(yqid);
		} else if(selHylb=='C01') { //机动车拆解业
			jdccjyOnloadbq(yqid);
		} else if(selHylb=='D') { //机动车拆解业
			ysyOnloadbq(yqid);
		}else if(selHylb=='Y01') { //开锁业
			ksyOnloadbq(yqid);
		} else if(selHylb=='Y') { //寄递业
			jdyOnloadbq(yqid);
		}
	}
	
	//---------
	function getYqValueByKey(key){ //获取页签加载状态 0未加载 1已加载
		var result = "";
		$("#yqAndZt option").each(function(){
			if($(this).attr("value")==key){
				result =  $(this).text();
				return false;
			}
		});
		return result;
	}
	function setYqValueByKey(key,value){ //设置页签加载状态 0未加载 1已加载
		$("#yqAndZt option").each(function(){
			if($(this).attr("value")==key){
				$(this).html(value);
			}
		});
	}
	function showOrHideYlQitaxxbq(smallId,state){ //显示隐藏 TD 
		$("td[id^='"+smallId+"']").each(function(){
			$(this)[0].style.display=''+state;
		});
	}
	function changeLableTitle(smallId,content){ //设置lable内容 
		$("label[id^='"+smallId+"']").each(function(){
			$(this).html(content);
		});
	}
	function closeAllDiv(){ //关闭所有添加的页签
		$("#bafwht_detail").hide("slow");
		$("#pmt_detail").hide("slow");
		$("#bldsjksb_detail").hide("slow");
		$("#aqjcsb_detail").hide("slow"); 
		
		$("#wgtzrxx_detail").hide("slow");
		$("#yxyycs_detail").hide("slow");
	}
</script>
<BODY>
<!-- 页面的页签及加载状态 新加业-->
<select id="yqAndZt" style="DISPLAY:none">
<option value='qyxx'>0</option>
<option value='abxx'>0</option>
<option value='qtxx'>0</option>
<option value='zzcl'>0</option>
</select>

<input type="hidden" id="q_qyid">
<input type="hidden" id="q_qybm">
<input type="hidden" id="s_qyid">
<input type="hidden" id="p_qyid">
<input type="hidden" id="f_jjlxbm">
<!-- 企业信息开始 -->
<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="0" id="qyxx" style="DISPLAY: block">
<tr>
<td valign="top">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
	    <td width="100%" valign="top" >
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav11">
            		<tr><td><a href="#" onmousedown="show_biaoqian('qyxx')" class="navfont" hidefocus="true"><label id="qyorcs_title"></label>信息</a></td></tr>
            		</table>
            	</td>
        		<td width="78" id="small_abxx1" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1">
            		<tr><td align="center"><a href="#" onmousedown="show_biaoqian('abxx')" class="navfont" hidefocus="true">安保信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_xxqt1" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1">
            		<tr><td align="center" ><a href="#" onmousedown="show_biaoqian('qtxx')" class="navfont" hidefocus="true">其他信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_zzcl1" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1">
            		<tr><td align="center"><a href="#" onMouseDown="show_biaoqian('zzcl')" class="navfont" hidefocus="true">纸质材料</a></td></tr>
        			</table>
        		</td>
        		<td width="1048" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
        			</table>
        		</td>
      		</tr>
    		</table>
    	</td>
  		</tr>
	</table>
	<div id="qyjbxxXiangxi" class="scrollbarface" style="overflow-y:auto;overflow-x:hidden;height:490;width:100%;"></div>
</td>
</tr>
</table>
<!-- 企业信息结束 -->

<!-- 娱乐 其他开始 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="abxx"   style="DISPLAY:none">
<tr>
<td valign="top">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
	    <td width="100%" valign="top" >
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav1">
            		<tr><td><a  href="#" onmousedown="show_biaoqian('qyxx')" class="navfont" hidefocus="true"><label id="qyorcs_title"></label>信息</a></td></tr>
            		</table>
            	</td>
        		<td width="78" id="small_abxx2" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav11" >
            		<tr><td align="center"><a href="#" onmousedown="show_biaoqian('abxx')" class="navfont" hidefocus="true" >安保信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_xxqt2" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1" >
            		<tr><td align="center" ><a href="#" onmousedown="show_biaoqian('qtxx')" class="navfont" hidefocus="true" >其他信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_zzcl2" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1">
            		<tr><td align="center"><a href="#" onMouseDown="show_biaoqian('zzcl')" class="navfont" hidefocus="true">纸质材料</a></td></tr>
        			</table>
        		</td>
        		<td width="1048" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
        			</table>
        		</td>
      		</tr>
    		</table>
    	</td>
  		</tr>
	</table>
	<table width="100%" cellspacing="0" cellpadding="0" class="line" >
	<tr><td height="3"></td></tr>
	</table>
	<table width="100%"  cellspacing="0" cellpadding="0" class="line" >
		<tr><td valign="top" align="left">
			<span id="plant_abxx"></span>
		</td></tr>
	</table>
</td>
</tr>
</table>
<!-- 娱乐 其他结束 -->
<!-- 娱乐 其他信息开始 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="qtxx" style="DISPLAY:none">
<tr>
<td valign="top">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
	    <td width="100%" valign="top" >
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav1">
            		<tr><td><a  href="#" onmousedown="show_biaoqian('qyxx')" class="navfont" hidefocus="true"><label id="qyorcs_title"></label>信息</a></td></tr>
            		</table>
            	</td>
        		<td width="78" id="small_abxx3" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1" >
            		<tr><td align="center"><a href="#" onmousedown="show_biaoqian('abxx')" class="navfont" hidefocus="true" >安保信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_xxqt3" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav11" >
            		<tr><td align="center" ><a href="#" onmousedown="show_biaoqian('qtxx')" class="navfont" hidefocus="true" >其他信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_zzcl3" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1">
            		<tr><td align="center"><a href="#" onMouseDown="show_biaoqian('zzcl')" class="navfont" hidefocus="true">纸质材料</a></td></tr>
        			</table>
        		</td>
        		<td width="1048" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
        			</table>
        		</td>
      		</tr>
    		</table>
    	</td>
  		</tr>
	</table>
	<table width="100%"  cellspacing="0" cellpadding="0" class="line" >
		<tr><td></td></tr>
		<tr>
    	<td valign="top" align="left">
			<span id="plant_qtxx"></span>
		</td>
		</tr>
	</table>
</td>
</tr>
</table>

<!-- 其他信息结束 -->

<!-- 纸质材料开始 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="zzcl" height="520" style="DISPLAY:none">
<tr>
<td valign="top">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
	    <td width="100%" valign="top" >
	    	<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0">
	      	<tr>
        		<td width="25" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
            		</table>
            	</td>
       			<td width="78" valign="bottom">
       				<table width="100%" border="0"  align="right" cellpadding="0" cellspacing="0" class="nav1">
            		<tr><td><a  href="#" onMouseDown="show_biaoqian('qyxx')" class="navfont" hidefocus="true"><label id="qyorcs_title"></label>信息</a></td></tr>
            		</table>
            	</td>
        		<td width="78" id="small_abxx4" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1" >
            		<tr><td align="center"><a href="#" onMouseDown="show_biaoqian('abxx')" class="navfont" hidefocus="true" >安保信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_xxqt4" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav1" >
            		<tr><td align="center" ><a href="#" onMouseDown="show_biaoqian('qtxx')" class="navfont" hidefocus="true" >其他信息</a></td></tr>
        			</table>
        		</td>
        		<td width="78" id="small_zzcl4" style="display:none">
        			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0"  class="nav11">
            		<tr><td align="center"><a href="#" onMouseDown="show_biaoqian('zzcl')" class="navfont" hidefocus="true">纸质材料</a></td></tr>
        			</table>
        		</td>
        		<td width="1048" valign="bottom">
        			<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="navbg">
            		<tr><td></td></tr>
        			</table>
        		</td>
      		</tr>
    		</table>
    	</td>
  		</tr>
	</table>
	<table width="100%"  cellspacing="0" cellpadding="0" class="line" >
		<tr><td></td></tr>
		<tr>
    	<td valign="top" align="left">
			<span id="plant_zzcl"></span>
		</td>
		</tr>
	</table>
</td>
</tr>
</table>
<!-- 纸质材料结束 -->
</BODY>
</HTML>