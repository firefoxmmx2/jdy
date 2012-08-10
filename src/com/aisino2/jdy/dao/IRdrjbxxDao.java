package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Rdrjbxx;

public interface IRdrjbxxDao {
	Rdrjbxx insert(Rdrjbxx rdrjbxx);
	void update(Rdrjbxx rdrjbxx);
	void delete(Rdrjbxx rdrjbxx);
	Rdrjbxx get(Rdrjbxx rdrjbxx);
	
	List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx);
	List<Rdrjbxx> findRdrjbxxs(Rdrjbxx rdrjbxx,String dir,String sort);
	Page findRdrjbxxsForPage(Map<String, Object> map,int pageno, int pagesize,String dir,String sort);
	
}
