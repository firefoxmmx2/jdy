package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Pjjbxx;

public interface IPjjbxxDao {
	Pjjbxx insert(Pjjbxx pjjbxx);
	void update(Pjjbxx pjjbxx);
	void delete(Pjjbxx pjjbxx);
	
	Pjjbxx get(Pjjbxx pjjbxx);
	List<Pjjbxx> findPjjbxxs(Pjjbxx pjjbxx);
	Page findPjjbxxsForPage(Map<String, Object> map,int pageno,int pagesize,String dir,String sort);
}
