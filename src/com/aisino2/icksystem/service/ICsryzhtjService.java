package com.aisino2.icksystem.service;

import java.util.Map;

import com.aisino2.core.dao.Page;

public interface ICsryzhtjService {
	/** @param 场所人员综合统计(t_csryzhtj) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);
}
