package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.jdy.domain.Jdpxx;

public interface IJdpxxDao {
	Jdpxx insert(Jdpxx jdpxx);
	void update(Jdpxx jdpxx);
	void delete(Jdpxx jdpxx);
	
	Jdpxx get(Jdpxx jdpxx);
	
	List<Jdpxx> findJdpxxs(Jdpxx jdpxx);
	Page findJdpxxsForPage(Map<String, Object> map, int pageno, int pagesize, String dir, String sort);
}
