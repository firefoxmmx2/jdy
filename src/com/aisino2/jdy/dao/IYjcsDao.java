package com.aisino2.jdy.dao;

import java.util.List;
import java.util.Map;

import com.aisino2.jdy.domain.Yjcs;

public interface IYjcsDao {
	Yjcs insert(Yjcs yjcs);
	void remove(Yjcs yjcs);
	void update(Yjcs yjcs);
	
	List<Yjcs> query(Map<String, Object> param);
	Map<String, Object> querySQL(String sql);
}
