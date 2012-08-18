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