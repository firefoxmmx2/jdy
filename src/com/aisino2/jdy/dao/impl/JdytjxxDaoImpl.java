package com.aisino2.jdy.dao.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.jdy.dao.IJdytjxxDao;
import com.aisino2.jdy.domain.Jdytjxx;

/**
 *	寄递业统计
 * @author hooxin
 *
 */
public class JdytjxxDaoImpl extends BaseDao implements IJdytjxxDao {

	
	public List<Jdytjxx> getJjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.jjltj", map);
	}

	
	public List<Jdytjxx> getSjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.sjltj", map);
	}

	
	public List<Jdytjxx> getQyljltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.qyljltj", map);
	}

	
	public List<Jdytjxx> getQypjltj(Map<String, Object> map) {
		return queryForList("Jdytjxx.qypjltj", map);
	}

}
