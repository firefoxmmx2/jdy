//页面配置文件 'configtr'+i表示第i行的配置，其中1:表示对应的td为必填项前一个td 加载'red';
//'#'对应带<input>框的td，该td加载"pagetd1";
//'0'：表示对应的td为必填项前一个td 加载'pagedistd1';
//第一个表格 
var configtr1 =new Array(1,'#',1,'#',1,'#',0,'#'); 
var configtr2 =new Array(1,'#',0,'#',0,'#',1,'#'); 
var configtr3 =new Array(0,'#',1,'#',0,'#'); 
var configtr4 =new Array(1,'#',1,'#',1,'#'); 
var configtr5 =new Array(1,'#',1,'#',1,'#',1,'#');
var configtr6 =new Array(1,'#',0,'#',1,'#',1,'#');
var configtr7 =new Array(1,'#',1,'#',0,'#',0,'#');
var configtr8 =new Array(0,'#',0,'#',0,'#',1,'#');
var configtr9 =new Array(1,'#',0,'#',0,'#');
var configtr10 =new Array(0,'#',1,'#');

var configtable= new Array(configtr1,configtr2,configtr3,configtr4,configtr5,configtr6,configtr7,configtr8,configtr9,configtr10);
//configtable 存放配置字段颜色的数据
//第二个表格
var configtr11 =new Array(1,'#',1,'#',0,'#',0,'#'); 
var configtr12 =new Array(1,'#',1,'#',0,'#',1,'#'); 
var configtr13 =new Array(0,'#',0,'#'); 
var configtr14 =new Array(0,'#'); 

var configtable1= new Array(configtr11,configtr12,configtr13,configtr14);
//configtable 存放配置字段颜色的数据


	function qyjbxx_modifyVerify(){ //验证

		//企业基本信息验证开始
		if (!checkControlValue("m_gxdwmc","String",1,60,null,1,"治安管理机构"))
			return false;
		if (!checkControlValue("m_qyzflbm","String",1,30,null,1,"场所主分类"))
			return false;
		if (!checkControlValue("m_qymc","String",1,120,null,1,'娱乐场所名称'))
			return false;
		if (!checkControlValue("m_qyjc","String",1,120,null,1,'娱乐场所简称'))
			return false;
		if (!htjdOnBlurNotOnlyZfVal('m_qyzzjgdm','jyxk','0','‘组织机构代码’','1','0')){
			return false;
		}
		if (!checkControlValue("m_qyzzjgdm","String",1,10,null,0,"组织机构代码"))
			return false;
		if (!checkControlValue("m_lxdh","String",1,30,null,1,"联系电话"))
			return false;
		if (!checkControlValue("m_yzbm","String",1,6,null,0,"邮政编码")) //4.27 罗波提 所有非必填
			return false;
		if (!checkControlValue("m_chzh","String",1,30,null,0,"传真"))
			return false;
		if (!checkControlValue("m_jjlxmc","String",1,100,null,1,"经济类型"))
			return false;
		if (!checkControlValue("m_zczj","Float",-99999999.99,99999999.99,2,0,'注册资金(万元)'))
			return false;
		if (!checkControlValue("m_jyfwzy","String",1,200,null,1,'经营范围(主营)'))
			return false;
		if (!checkControlValue("m_jyfwjy","String",1,200,null,0,"经营范围(兼营)"))
			return false;
		if (!checkControlValue("m_jymj","Float",-99999999.99,99999999.99,2,1,'经营面积(平米)'))
			return false;
		if (!checkControlValue("m_jydz","String",1,200,null,1,'经营地址'))
			return false;
		if (!checkControlValue("m_frdb","String",1,30,null,1,"法定代表人姓名"))
			return false;
		if (!checkControlValue("m_frdbzjhm","String",1,30,null,1,"法人证件号码"))
			return false;
		if($("#m_frdbzjlb").attr("value")=='居民身份证'||$("#m_frdbzjlb").attr("value")=='临时居民身份证'){
			if(!valSfzCardIsRight("m_frdbzjhm","请正确填写法人证件号码!"))
				return false;
		}
		if (!checkControlValue("m_frdblxfs","String",1,30,null,1,"法人联系方式"))
			return false;
		if (!checkControlValue("m_kyrq","Date",null,null,null,1,"开业日期"))
			return false;
		if (!checkControlValue("m_yysj","String",1,20,null,0,"营业时间"))
			return false;
		if (!checkControlValue("m_dwfzr","String",1,30,null,1,"单位负责人"))
			return false;
		if (!checkControlValue("m_dwfzrlxfs","String",1,30,null,1,"单位负责人联系方式"))
			return false;
		if (!checkControlValue("m_dwfzrzjhm","String",1,30,null,1,"单位负责人身份证号"))
			return false;
		if(!valSfzCardIsRight("m_dwfzrzjhm","请正确填写单位负责人身份证号!"))
			return false;
		if (!checkControlValue("m_yyzzZjbh","String",1,60,null,0,"营业执照编号"))
			return false;
		if (!checkControlValue("m_yyzzFzjg","String",1,60,null,0,"营业执照发证机关"))
			return false;
		if (!checkControlValue("m_yyzzQsrq","Date",null,null,null,0,"营业执照起始日期"))
			return false;
		if (!checkControlValue("m_yyzzJzrq","Date",null,null,null,0,"营业执照截止日期"))
			return false;
		if (!checkControlValue("m_djrq","Date",null,null,null,0,"营业执照登记日期"))
			return false;
		if (!checkControlValue("m_jyxkZjbh","String",1,60,null,1,"娱乐经营许可证号"))
			return false;
		if (!checkControlValue("m_jyxkFzjg","String",1,60,null,1,"娱乐经营许可证发证机关"))
			return false;
		if (!checkControlValue("m_jyxkQsrq","Date",null,null,null,0,"娱乐经营许可证起始日期"))
			return false;
		if (!checkControlValue("m_jyxkJzrq","Date",null,null,null,0,"娱乐经营许可证截止日期"))
			return false;
		if (!checkControlValue("m_gdxx","String",1,2000,null,0,"股东信息"))
			return false;		
		if (!checkControlValue("m_bz","String",1,2000,null,1,"娱乐项目内容"))
			return false;
		if (!checkControlValue("m_xfhgzh","String",1,20,null,1,"消防合格证号"))
			return false;
		if (!checkControlValue("m_xfshdw","String",1,200,null,1,"消防审核单位"))
			return false;
		if (!checkControlValue("m_jwdzb","String",1,100,null,0,"经纬度坐标"))
			return false;
		if (!checkControlValue("m_hdrs","Integer",0,999999,null,0,"核定消费者数量(人)"))
			return false;
		if (!checkControlValue("m_cksl","Integer",0,999999,null,1,"安全出口数量(个)"))
			return false;
		if (!checkControlValue("m_bxbjsl","Integer",0,999999,null,1,"包厢包间数量(间)"))
			return false;
		if (!checkControlValue("m_bafzrxm","String",1,30,null,1,"治安负责人"))
			return false;
		if (!checkControlValue("m_bars","Integer",0,999999,null,0,"保安人数(人)"))
			return false;
		if (!checkControlValue("m_jgpxrs","Integer",0,999999,null,0,"经岗位培训人数(人)"))
			return false;
		if (!checkControlValue("m_bagsyj","String",1,2000,null,0,"保安公司意见"))
			return false;
		
		//详细验证开始
		var m_yyzzQsrq = $("#m_yyzzQsrq").attr("value");
		var m_yyzzJzrq = $("#m_yyzzJzrq").attr("value");
		if(formatDate(m_yyzzQsrq)>formatDate(m_yyzzJzrq)){
			jAlert("请正确选择‘营业执照’起始和截止日期!","提示信息",null,'m_yyzzQsrq');
			return false;
		}
		var m_jyxkQsrq = $("#m_jyxkQsrq").attr("value");
		var m_jyxkJzrq = $("#m_jyxkJzrq").attr("value");
		if(formatDate(m_jyxkQsrq)>formatDate(m_jyxkJzrq)){
			jAlert("请正确选择‘娱乐经营许可证’起始和截止日期!","提示信息",null,'m_jyxkQsrq');
			return false;
		}
		
		valadateYyzz();
		if(!canCommit)
			return false;
		if(qyjbxx_requestType=='biangeng'){
			if (!checkControlValue("m_bgyy","String",1,2000,null,1,"变更原因"))
				return false;
		}
		return true;
	}
	
	$(document).ready(function() {
		configtdcolor("tableid",configtable);
		configtdcolor("tableid1",configtable1);
		if(qyjbxx_requestType=='biangeng'){
			document.getElementById("bgqyxx").style.display='block';
			//$("#m_bz").attr("rows",1);
			//$("#m_bagsyj").attr("rows",1);
		}
		$("#bq_ylcsfl").selectBox({state:"1",width:"118px"}); //动态
		$("#bq_yyzt").selectBox({state:"1",width:"118px"}); //动态
		$("#bq_zajb").selectBox({state:"1",width:"118px"}); //动态
		$("#bq_hylb").selectBoxhylb({code:"J",width:"118px"});
		$("#bq_frdbzj").selectBox({code:"dm_frdbzjlb(ylcs)",width:"118px"});
		frdbzjOnchange();
		zajbOnchange();
		
		$("#m_gxdwmc").click(function(){ //管辖单位
			getGxdw("m_gxdwmc","m_gxdwbm");
		});
		$("#m_thbajg").click(function(){ //特行备案机构
			getGxdw("m_thbajg","m_thbajgdm");
		});
		$("#m_jjlxmc").click(function(){ //经济类型筛选
			getDict_item("m_jjlxmc","m_jjlxbm","dm_jjlx");
		});
		
		$("#m_kyrq").attr("readonly","true").datepicker();
		$("#m_barq").attr("readonly","true");
		$("#m_yyzzQsrq").attr("readonly","true").datepicker();
		$("#m_yyzzJzrq").attr("readonly","true").datepicker();
		$("#m_jyxkQsrq").attr("readonly","true").datepicker();
		$("#m_jyxkJzrq").attr("readonly","true").datepicker();
		$("#m_djrq").attr("readonly","true").datepicker();
		hyInit();
		qyjbxxXiangxi_updatediv();
	});
	
	function valadateYyzz(){ //营业执照编号
		//var yyzzZjbh = $("#m_yyzzZjbh").attr("value");
		//if(yyzzZjbh==''){
		//	canCommit=false;
		//	jAlert('请正确输入营业执照编号!','验证信息',null,'m_yyzzZjbh');
		//	return;
		//}
		setParams("m_");
		var sUrl="publicsystem/valadateYyzz_qyjbxx.action";
		jQuery.ajax({
			type: 'POST',
			url: sUrl,
			data: params,
			async: false,
			dataType: 'json',
			success: function(result){						
				var rows  = eval(result);
				valadateYyzzBack(rows);
			}
		});
	}
	function valadateYyzzBack(json){
		if(json.result=="success"){
			if(json.valiResult=="1"){
				jAlert('此营业执照编号已存在!','验证信息',null,'m_yyzzZjbh');
				canCommit=false;
			}else{
				canCommit=true;
			}
		}else{
			jAlert('error!','提示信息');
			canCommit=false;
		}
	}
	var canCommit = true;
	function frzjhmBlurVali(){ //法人身份证 失去焦点验证
		if($("#m_frdbzjlb").attr("value")=='居民身份证'||$("#m_frdbzjlb").attr("value")=='临时居民身份证'){
			if($("#m_frdbzjhm").attr("value")!=''){
				if(!valSfzCardIsRight("m_frdbzjhm","请正确填写法人证件号码!",0))
					return false;
			}
		}
	}
	function dwfzrzjhmBlurVali(){ //负责人身份证 失去焦点验证
		if($("#m_dwfzrzjhm").attr("value")!=''){
			if(!valSfzCardIsRight("m_dwfzrzjhm","请正确填写单位负责人身份证号!",0))
				return false;
		}
	}
function qyjbxxXiangxi_updatediv(){
		$("#m_hylbdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].hylbdm));
		$("#m_qyzflbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzflbm));
		$("#m_qyzflmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzflmc));
		$("#m_zabdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].zabdm));
		$("#m_zajbmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].zajbmc));
		$("#m_yyztdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].yyztdm));
		$("#m_yyztmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].yyztmc));
		$("#m_frdbzjlb").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdbzjlb));
		
		$("#m_qyfflbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyfflbm));
		$("#m_qyfflmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyfflmc));
		
		$("#m_zjztmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].zjztmc));
		$("#m_zjztdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].zjztdm));
		
		
		$("#m_qyid").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyid));
		$("#m_qybm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qybm));
		$("#m_qymc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qymc));
		$("#m_qyjc").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyjc));
		$("#m_gxdwmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].gxdwmc));
		$("#m_gxdwbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].gxdwbm));
		$("#m_qyzzjgdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].qyzzjgdm));
		$("#m_lxdh").attr("value",setNull(jsonResultMes.LQyjbxx[0].lxdh));
		$("#m_yzbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].yzbm));
		$("#m_chzh").attr("value",setNull(jsonResultMes.LQyjbxx[0].chzh));
		$("#m_jwdzb").attr("value",setNull(jsonResultMes.LQyjbxx[0].jwdzb));
		$("#m_jjlxmc").attr("value",setNull(jsonResultMes.LQyjbxx[0].jjlxmc));
		$("#m_jjlxbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].jjlxbm));
		$("#m_jyfwzy").attr("value",setNull(jsonResultMes.LQyjbxx[0].jyfwzy));
		$("#m_zczj").attr("value",setNull(jsonResultMes.LQyjbxx[0].zczj));
		$("#m_jymj").attr("value",setNull(jsonResultMes.LQyjbxx[0].jymj));
		$("#m_jyfwjy").attr("value",setNull(jsonResultMes.LQyjbxx[0].jyfwjy));
		$("#m_frdb").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdb));
		$("#m_frdbzjhm").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdbzjhm));
		$("#m_frdblxfs").attr("value",setNull(jsonResultMes.LQyjbxx[0].frdblxfs));
		$("#m_kyrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].kyrq));
		$("#m_yysj").attr("value",setNull(jsonResultMes.LQyjbxx[0].yysj));
		$("#m_babh").attr("value",setNull(jsonResultMes.LQyjbxx[0].babh));
		$("#m_barq").attr("value",setNull(jsonResultMes.LQyjbxx[0].barq));
		$("#m_jydz").attr("value",setNull(jsonResultMes.LQyjbxx[0].jydz));
		$("#m_dwfzrzjhm").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzrzjhm));
		$("#m_dwfzr").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzr));
		$("#m_dwfzrlxfs").attr("value",setNull(jsonResultMes.LQyjbxx[0].dwfzrlxfs));
		$("#m_xfshdw").attr("value",setNull(jsonResultMes.LQyjbxx[0].xfshdw));
		$("#m_xfhgzh").attr("value",setNull(jsonResultMes.LQyjbxx[0].xfhgzh));
		$("#m_gdxx").attr("value",setNull(jsonResultMes.LQyjbxx[0].gdxx));
		$("#m_zdskb").attr("value",setNull(jsonResultMes.LQyjbxx[0].zdskb));
		
		$("#m_jqbm").attr("value",setNull(jsonResultMes.LQyjbxx[0].jqbm));
		$("#m_tyrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].tyrq));
		$("#m_djrq").attr("value",setNull(jsonResultMes.LQyjbxx[0].djrq));
		
		var zt = setNull(jsonResultMes.LQyjbxx[0].zt);
		$("#s_zt").attr("value",zt);
		if(zt=='11'){ //显示 未通过原因 按钮
			$("#but").attr("width",124);
			document.getElementById('wtgyy').style.display='block';
		}
		
		$("#m_bwbmdh").attr("value",setNull(jsonResultMes.LQyjbxx[0].bwbmdh));
		$("#m_thbajgdm").attr("value",setNull(jsonResultMes.LQyjbxx[0].thbajgdm));
		$("#m_thbajg").attr("value",setNull(jsonResultMes.LQyjbxx[0].thbajg));
		$("#m_azsxtsl").attr("value",setNull(jsonResultMes.LQyjbxx[0].azsxtsl));
		$("#m_sfazsxt").setValue(setNull(jsonResultMes.LQyjbxx[0].sfazsxt),115);
		$("#m_jyxkFzjgdm").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkFzjgdm));
		
		//营业执照、经营许可证
		$("#m_yyzzZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzZjbh));
		$("#m_yyzzFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzFzjg));
		$("#m_yyzzQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzQsrq));
		$("#m_yyzzJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].yyzzJzrq));
		
		$("#m_jyxkZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkZjbh));
		$("#m_jyxkFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkFzjg));
		$("#m_jyxkQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkQsrq));
		$("#m_jyxkJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].jyxkJzrq));
		
		$("#m_thxkZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkZjbh));
		$("#m_thxkFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkFzjg));
		$("#m_thxkQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkQsrq));
		$("#m_thxkJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].thxkJzrq));
		
		$("#m_swdjZjbh").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjZjbh));
		$("#m_swdjFzjg").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjFzjg));
		$("#m_swdjQsrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjQsrq));
		$("#m_swdjJzrq").attr("value",setNull(jsonResultMes.LQyjbxx[1].swdjJzrq));
		
		//人员信息
		$("#m_zrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].zrs));
		$("#m_hdrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].hdrs));
		$("#m_bafzrxm").attr("value",setNull(jsonResultMes.LQyjbxx[0].bafzrxm));
		$("#m_bars").attr("value",setNull(jsonResultMes.LQyjbxx[0].bars));
		$("#m_jgpxrs").attr("value",setNull(jsonResultMes.LQyjbxx[0].jgpxrs));
		$("#m_cksl").attr("value",setNull(jsonResultMes.LQyjbxx[0].cksl));
		$("#m_bxbjsl").attr("value",setNull(jsonResultMes.LQyjbxx[0].bxbjsl));
		$("#m_bagsyj").attr("value",setNull(jsonResultMes.LQyjbxx[0].bagsyj));
		$("#m_bz").attr("value",setNull(jsonResultMes.LQyjbxx[0].bz));
		
		//默认赋值
		$("#bq_hylb").setValue(setNull(jsonResultMes.LQyjbxx[0].hylbdm),115); //value：根据代码赋下拉框值 text：是根据内容赋下拉框值
		$("#bq_ylcsfl").setValue(setNull(jsonResultMes.LQyjbxx[0].qyzflbm),115);
		$("#bq_zajb").setValue(setNull(jsonResultMes.LQyjbxx[0].zabdm),115);
		$("#bq_frdbzj").setText(setNull(jsonResultMes.LQyjbxx[0].frdbzjlb),115);
		$("#bq_yyzt").setValue(setNull(jsonResultMes.LQyjbxx[0].yyztdm),115);
		$("#bq_hylb").setAttr("readonly","true"); //除了添加都需锁定行业类别
	}