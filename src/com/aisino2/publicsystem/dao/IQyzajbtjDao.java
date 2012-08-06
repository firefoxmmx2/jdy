package com.aisino2.publicsystem.dao;

import java.util.Map;

import com.aisino2.core.dao.Page;

public interface IQyzajbtjDao {
	public Page getQyzajbtjList(Map map, int pageNo, int pageSize, String sort,
			String desc);
	public Page getQyzajbbgtjList(Map map, int pageNo, int pageSize, String sort,
			String desc);
	public Page getQyzabgListForPage(Map map,int pageNo,int pageSize,String sort,String desc);
	public Page getListForPageQyjbxx(Map map,int pageNo,int pageSize,String sort,String desc);
}
