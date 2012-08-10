package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Ljjbxx;

public interface ILjjbxxDao {
	Ljjbxx insert(Ljjbxx ljjbxx);
	void update(Ljjbxx ljjbxx);
	void delete(Ljjbxx ljjbxx);
	
	
	List<Ljjbxx> findLjjbxxs(Ljjbxx ljjbxx);
	
	Page findLjjbxxsForPage(Map<String, Object> map,int pageno ,int pagesize,String dir, String sort);
	
	String generateDjxh(String qybm);
	
}
