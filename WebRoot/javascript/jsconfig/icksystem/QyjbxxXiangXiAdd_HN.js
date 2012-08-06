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


function qyjbxx_addVerify(){ //验证
		//企业基本信息验证开始
		if (!checkControlValue("a_gxdwmc","String",1,60,null,1,"治安管理机构"))
			return false;
		if (!checkControlValue("a_qyzflbm","String",1,30,null,1,"场所主分类"))
			return false;
		if (!checkControlValue("a_qymc","String",1,120,null,1,'娱乐场所名称'))
			return false;
		if (!checkControlValue("a_qyjc","String",1,120,null,1,'娱乐场所简称'))
			return false;
		if (!htjdOnBlurNotOnlyZfVal('a_qyzzjgdm','jyxk','0','‘组织机构代码’','1','0')){
			return false;
		}
		if (!checkControlValue("a_qyzzjgdm","String",1,10,null,0,"组织机构代码"))
			return false;
		if (!checkControlValue("a_lxdh","String",1,30,null,1,"联系电话"))
			return false;
		if (!checkControlValue("a_yzbm","String",1,6,null,0,"邮政编码")) //4.27 罗波提 所有非必填
			return false;
		if (!checkControlValue("a_chzh","String",1,30,null,0,"传真"))
			return false;
		if (!checkControlValue("a_jjlxmc","String",1,100,null,1,"经济类型"))
			return false;
		if (!checkControlValue("a_zczj","Float",-99999999.99,99999999.99,2,0,'注册资金(万元)'))
			return false;
		if (!checkControlValue("a_jyfwzy","String",1,200,null,1,'经营范围(主营)'))
			return false;
		if (!checkControlValue("a_jyfwjy","String",1,200,null,0,"经营范围(兼营)"))
			return false;
		if (!checkControlValue("a_jymj","Float",-99999999.99,99999999.99,2,1,'经营面积(平米)'))
			return false;
		if (!checkControlValue("a_jydz","String",1,200,null,1,'经营地址'))
			return false;
		if (!checkControlValue("a_frdb","String",1,30,null,1,"法定代表人姓名"))
			return false;
		if (!checkControlValue("a_frdbzjhm","String",1,30,null,1,"法人证件号码"))
			return false;
		if($("#a_frdbzjlb").attr("value")=='居民身份证'||$("#a_frdbzjlb").attr("value")=='临时居民身份证'){
			if(!valSfzCardIsRight("a_frdbzjhm","请正确填写法人证件号码!"))
				return false;
		}
		if (!checkControlValue("a_frdblxfs","String",1,30,null,1,"法人联系方式"))
			return false;
		if (!checkControlValue("a_kyrq","Date",null,null,null,1,"开业日期"))
			return false;
		if (!checkControlValue("a_yysj","String",1,20,null,0,"营业时间"))
			return false;
		if (!checkControlValue("a_dwfzr","String",1,30,null,1,"单位负责人"))
			return false;
		if (!checkControlValue("a_dwfzrlxfs","String",1,30,null,1,"单位负责人联系方式"))
			return false;
		if (!checkControlValue("a_dwfzrzjhm","String",1,30,null,1,"单位负责人身份证号"))
			return false;
		if(!valSfzCardIsRight("a_dwfzrzjhm","请正确填写单位负责人身份证号!"))
			return false;
		if (!checkControlValue("a_yyzzZjbh","String",1,60,null,0,"营业执照编号"))
			return false;
		if (!checkControlValue("a_yyzzFzjg","String",1,60,null,0,"营业执照发证机关"))
			return false;
		if (!checkControlValue("a_yyzzQsrq","Date",null,null,null,0,"营业执照起始日期"))
			return false;
		if (!checkControlValue("a_yyzzJzrq","Date",null,null,null,0,"营业执照截止日期"))
			return false;
		if (!checkControlValue("a_djrq","Date",null,null,null,0,"营业执照登记日期"))
			return false;
		if (!checkControlValue("a_jyxkZjbh","String",1,60,null,1,"娱乐经营许可证号"))
			return false;
		if (!checkControlValue("a_jyxkFzjg","String",1,60,null,1,"娱乐经营许可证发证机关"))
			return false;
		if (!checkControlValue("a_jyxkQsrq","Date",null,null,null,0,"娱乐经营许可证起始日期"))
			return false;
		if (!checkControlValue("a_jyxkJzrq","Date",null,null,null,0,"娱乐经营许可证截止日期"))
			return false;
		if (!checkControlValue("a_gdxx","String",1,2000,null,0,"股东信息"))
			return false;
		if (!checkControlValue("a_bz","String",1,2000,null,1,"娱乐项目内容"))
			return false;
		if (!checkControlValue("a_xfhgzh","String",1,20,null,1,"消防合格证号"))
			return false;
		if (!checkControlValue("a_xfshdw","String",1,200,null,1,"消防审核单位"))
			return false;
		if (!checkControlValue("a_jwdzb","String",1,100,null,0,"经纬度坐标"))
			return false;
		if (!checkControlValue("a_hdrs","Integer",0,999999,null,0,"核定消费者数量(人)"))
			return false;
		if (!checkControlValue("a_cksl","Integer",0,999999,null,1,"安全出口数量(个)"))
			return false;
		if (!checkControlValue("a_bxbjsl","Integer",0,999999,null,1,"包厢包间数量(间)"))
			return false;
		if (!checkControlValue("a_bafzrxm","String",1,30,null,1,"治安负责人"))
			return false;
		if (!checkControlValue("a_bars","Integer",0,999999,null,0,"保安人数(人)"))
			return false;
		if (!checkControlValue("a_jgpxrs","Integer",0,999999,null,0,"经岗位培训人数(人)"))
			return false;
		if (!checkControlValue("a_bagsyj","String",1,2000,null,0,"保安公司意见"))
			return false;
		
		//详细验证开始
		var a_yyzzQsrq = $("#a_yyzzQsrq").attr("value");
		var a_yyzzJzrq = $("#a_yyzzJzrq").attr("value");
		if(formatDate(a_yyzzQsrq)>formatDate(a_yyzzJzrq)){
			jAlert("请正确选择‘营业执照’起始和截止日期!","提示信息",null,'a_yyzzQsrq');
			return false;
		}
		var a_jyxkQsrq = $("#a_jyxkQsrq").attr("value");
		var a_jyxkJzrq = $("#a_jyxkJzrq").attr("value");
		if(formatDate(a_jyxkQsrq)>formatDate(a_jyxkJzrq)){
			jAlert("请正确选择‘娱乐经营许可证’起始和截止日期!","提示信息",null,'a_jyxkQsrq');
			return false;
		}
		
		valadateYyzz();
		if(!canCommit)
			return false;
		return true;
	}
$(document).ready(function() {
		configtdcolor("tableid",configtable);
		configtdcolor("tableid1",configtable1);
		$("#a_zdskb").attr("value",zdskb); //最低刷卡比
		$("#bq_hylb").selectBoxhylb({code:"J",width:"118px"});
		$("#bq_frdbzj").selectBox({code:"dm_frdbzjlb(ylcs)",width:"118px"});
		$("#bq_frdbzj").setValue("111",115);//默认赋值
		$("#bq_frdbzj").setText("居民身份证",115);//默认赋值
		$("#a_frdbzjlb").attr("value","居民身份证");//默认赋值
		
		$("#bq_ylcsfl").selectBox({state:"1",width:"118px"}); //动态
		$("#bq_yyzt").selectBox({state:"1",width:"118px"}); //动态
		$("#bq_zajb").selectBox({state:"1",width:"118px"}); //动态
		$("#a_gxdwmc").click(function(){ //管辖单位
			getGxdw("a_gxdwmc","a_gxdwbm");
		});
		$("#a_thbajg").click(function(){ //特行备案机构
			getGxdw("a_thbajg","a_thbajgdm");
		});
		$("#a_jjlxmc").click(function(){ //经济类型筛选
			getDict_item("a_jjlxmc","a_jjlxbm","dm_jjlx");
		});
		
		$("#a_kyrq").attr("readonly","true").datepicker();
		$("#a_barq").attr("readonly","true");
		$("#a_yyzzQsrq").attr("readonly","true").datepicker();
		$("#a_yyzzJzrq").attr("readonly","true").datepicker();
		$("#a_jyxkQsrq").attr("readonly","true").datepicker();
		$("#a_jyxkJzrq").attr("readonly","true").datepicker();
		$("#a_thxkQsrq").attr("readonly","true").datepicker();
		$("#a_thxkJzrq").attr("readonly","true").datepicker();
		$("#a_swdjQsrq").attr("readonly","true").datepicker();
		$("#a_swdjJzrq").attr("readonly","true").datepicker();
		$("#a_tyrq").attr("readonly","true").datepicker();
		$("#a_djrq").attr("readonly","true").datepicker();
	}).keydown(function(){
		var srcObj = $(event.srcElement);
		if(event.keyCode == 13){
			event.keyCode = 9;
			alert(srcObj.attr("readonly"));
			if(srcObj.attr("readonly")){
				alert();
			}
		}
		event.stopPropagation();
	});	
	function frzjhmBlurVali(){
		if($("#a_frdbzjlb").attr("value")=='居民身份证'||$("#a_frdbzjlb").attr("value")=='临时居民身份证'){
			if($("#a_frdbzjhm").attr("value")!=''){
				if(!valSfzCardIsRight("a_frdbzjhm","请正确填写法人证件号码!",0))
					return false;
			}
		}
	}
	function dwfzrzjhmBlurVali(){
		if($("#a_dwfzrzjhm").attr("value")!=''){
			if(!valSfzCardIsRight("a_dwfzrzjhm","请正确填写单位负责人公民身证号!",0))
				return false;
		}
	}
	function valadateYyzz(){ //营业执照编号
		//var yyzzZjbh = $("#a_yyzzZjbh").attr("value");
		//if(yyzzZjbh==''){
		//	canCommit=false;
		//	jAlert('请正确输入营业执照编号!','验证信息',null,'a_yyzzZjbh');
		//	return;
		//}
		setParams("a_");
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
				jAlert('此营业执照编号已存在!','验证信息',null,'a_yyzzZjbh');
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
		if($("#a_frdbzjlb").attr("value")=='居民身份证'||$("#a_frdbzjlb").attr("value")=='临时居民身份证'){
			if($("#a_frdbzjhm").attr("value")!=''){
				if(!valSfzCardIsRight("a_frdbzjhm","请正确填写法人证件号码!",0))
					return false;
			}
		}
	}
	function dwfzrzjhmBlurVali(){ //负责人身份证 失去焦点验证
		if($("#a_dwfzrzjhm").attr("value")!=''){
			if(!valSfzCardIsRight("a_dwfzrzjhm","请正确填写单位负责人身份证号!",0))
				return false;
		}
	}
function tdconfig(tableid){
    var table=$("#"+tableid);
   var tr=null;
   var length=configtable.length;
   for(tr=table.find('tr'),index=0;index<length;index++)
   {
      var configtr = configtable[index];
      var td=tr.find('td');
      var i=0;      
      while(td.html()!=null&&configtr[i]!=null){ 
        //alert(configtr[i]+"&&"+td.html());        
            if(configtr[i]=='1'){
                td.attr("class","red");
            }else if(configtr[i]=='0'){
                td.attr("class","pagedistd1");
            }else if(configtr[i]=='#'){
                td.attr("class","pagetd1");
            }
          // alert("第"+index+"行"+i+"***"+td.html());
            td=td.next();
            i++;          
      }
      //alert(tr.html());
      if(tr.next().html()!=null){
         tr=tr.next();
      }else{
         //alert("第"+index+"个tr结束");
         return;
      }    
   }
}

