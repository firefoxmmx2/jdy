/**
 * 获取一个用于提交的对象 
 * @param {} expr
 */
function getSubmitParams(expr,params){
	var allfields=[];
	var fields;
	var $expr;
	if(typeof expr == 'string')
		$expr=$(expr);
	else
		$expr = expr;
	// 过滤非单选复选
	fields=$expr.filter(function(idx){ return $(this).attr("name") != null 
				&& $(this).attr("type") != 'checkbox'
				&& $(this).attr("type") != 'radio';});
	
	for(var i=0;i<fields.length;i++){
		allfields.push(fields.eq(i));
	}
	//过滤单选复选
	fields = $expr.filter(function(idx){ return $(this).attr("name") != null && $(this).attr("checked") == true});
	for(var i=0;i<fields.length;i++){
		allfields.push(fields.eq(i));
	}
	//设置对象
	if(!params)
		var params = {};
	for(var i=0;i<allfields.length;i++){
		params[allfields[i].attr('name')] = allfields[i].val();
	}
	
	return params;
}

/**
 * 获取字典项信息
 * 
 * @param config
 *            {url:'字典后台服务地址', dictcode:'字典代码', value:'真实值'}
 * @return 符合条件的字典项对象[数组]
 */
function getDictitem(config) {
	var _config = {
		url : 'sysadmin/queryChSelDict_dict_item.action',
		dictcode : '',
		value : ''
	};
	var url_query = "sysadmin/query_dict_item.action";
	var _ret;
	var _param = {};
	// <Params>
	// <Param name="item_id">31433</Param>
	// </Params>
	var dataxml = "<Params>";

	$.extend(_config, config);

	if (!_config.url)
		throw new Error("参数config {url}信息为空");
	if (!_config.dictcode)
		throw new Error("参数config {dictcode}信息为空");

	_param['dict_code'] = _config.dictcode;

	dataxml += '<Param name="dict_code">' + _config.dictcode + '</Param>';
	if (_config.value) {
		_param['fact_value'] = _config.value;
		_param['query_simplepin'] = _config.value;
		_config.url = url_query;
		dataxml += '<Param name="fact_value">' + _config.value + '</Param>';
		dataxml += '<Param name="query_simplepin">' + _config.value
				+ '</Param>';
	}

	dataxml += "</Params>";
	_param['dataxml'] = dataxml;
	$.ajax({
				async : false,
				type : 'post',
				url : _config.url,
				data : _param,
				dataType : 'json',
				success : function(json) {

					if (json.LDict_item && json.LDict_item.length > 0) {
						_ret = json.LDict_item;
					} else if (json.ldata && json.ldata.length > 0) {
						_ret = json.ldata;
					}

				}
			});
	return _ret;
}
/*
 *将前台ingrid组合成数组的方法
 *
 */
function createszff(childList){
	var degsz = new Array();//第二个数组
	if (childList!=null && childList.length>0){
		var thNameArr = new Array();
		var listTrId;
		var isObject = (dataid!=null && typeof(dataid)=="object");
	    var deg="";
		for (var i=0;i<childList.length;i++){
			var oThead=$("#"+childList[i]).find("THEAD");
			var oTbody=$("#"+childList[i]).find("TBODY");
			if (oTbody.length>0){
				oThead.find("TR").find("TH").each(function(indexTH, domEleTH) {
					var colName = $(domEleTH).attr("name");
					thNameArr[indexTH] = colName.substr(2);
				});
				if(isObject){
					listTrId = dataid[i];
				}else{
					listTrId = dataid;
				}
				var decdd=-1;
				oTbody.find("TR").each(function(indexTR, domEleTR) {
					decdd++;
					var dyg="";
					var dygsz = new Array();//数组
					var dicdd=-1;
					$(domEleTR).find("TD").each(function(indexTD, domEleTD) {
						dicdd++;
						if(thNameArr[indexTD]!=null&&thNameArr[indexTD]!='null'
							&&thNameArr[indexTD]!=''&&thNameArr[indexTD]!='undefined'){
							var colName;
							if($(domEleTD).find("div").length==0){
								colName = $(domEleTD).html();
							}else{
								colName = $(domEleTD).find("div").html();
							}
							//dyg+=colName+"#";
							dygsz[dicdd]=colName;
						}
					});
					//deg+=dyg+"*";
					degsz[decdd]=dygsz;
					//alert(degsz[decdd]);
				});
			}
			
		}
		//alert("最后的值="+deg);
		//alert("最后的数组="+degsz);
	}
	return degsz;
}

/**
 * 弹出窗口
 * 
 * @param detailid
 *            对话框容器ID
 * @param width
 *            对话框的宽度
 * @param url
 *            对话框加载的内容地址
 * @param config
 *            需要传递给对话框的参数，使用JSON格式
 * @param callback
 * 			  运行结束后回调
 */
function detailDialog(detailid, width, url, config,callback) {
	setWidth(detailid, width);
	$("#" + detailid).empty();
	$("#" + detailid).load(url, config,callback);
	$("#" + detailid).show("slow");
	upAllPage(detailid);
	bindDocument(detailid);
}
/***
 * 验证揽件信息的物流单号是否可用（物流单号在揽件信息中必须唯一，
 * 如果存在返回false，否则true）
 */
function validateWldh(wldh,successFunc,beforeSuccessFunc){
	if(!wldh)
		throw "被要求验证的物流单号不能为空";
	
	$.aajx({
		url:'jdy/wldhsfcf_ljxx.action',
		type:'post',
		data:{'lj.wldh':wldh},
		dataType:'json',
		success:function(data,xhr){
			if(successFunc)
				successFunc(data);
		},
		beforeSend:function(xhr){
			if(beforeSuccessFunc)
				beforeSuccessFunc();
		}
	});
	
}
//重写身份证号验证方法
function isIdCardNo_jdy(num) 
{ 
	
	num = num.toUpperCase(); 
	//身份证号码不允许为111111111111111或将111111191111111113.20100817修改
	if(num=='111111111111111'||num=='111111191111111113')
	{
		return false; 
	}
	//身份证号码为15位,17位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。 
	if (!(/(^\d{17}$)|(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) 
	{ 
		return false; 
	} 
	//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
	//下面分别分析出生日期和校验位 
	var len, re; 
	len = num.length; 
	//如果是17位的，则先把年份的前面2个去掉，变成15位
	if(len == 17){
		num = num = num.substr(0, 6) +  num.substr(8, num.length - 8);
		len = num.length;
	}
	if (len == 15) 
	{ 
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
		var arrSplit = num.match(re); 
	
		//检查生日日期是否正确 
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay) 
		{ 
			return false; 
		} 
		else 
		{ 
			//将15位身份证转成18位 
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i; 
			num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6); 
			for(i = 0; i < 17; i ++) 
			{ 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			} 
			num += arrCh[nTemp % 11]; 
			return num; 
		} 
	} 
	if (len == 18) 
	{ 
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
		var arrSplit = num.match(re); 
	
		//检查生日日期是否正确 
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay) 
		{ 
			return false; 
		} 
		else 
		{ 
			//检验18位身份证的校验码是否正确。 
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
			var valnum; 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i; 
			for(i = 0; i < 17; i ++) 
			{ 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			} 
			valnum = arrCh[nTemp % 11]; 
			if (valnum != num.substr(17, 1)) 
			{ 
				return false; 
			} 
			return num; 
		} 
	} 
	return false; 
} 