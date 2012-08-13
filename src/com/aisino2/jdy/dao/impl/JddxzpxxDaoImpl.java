package com.aisino2.jdy.dao.impl;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.jdy.dao.IJddxzpxxDao;
import com.aisino2.jdy.domain.Jddxzpxx;

public class JddxzpxxDaoImpl extends BaseDao implements IJddxzpxxDao {

	public Jddxzpxx insert(Jddxzpxx jddxzpxx) {
		jddxzpxx.setId(getNextID("jddxzpxx_id"));
		insert("jddxzpxx.insert",jddxzpxx);
		return jddxzpxx;
	}

	public void delete(Jddxzpxx jddxzpxx) {
		delete("jddxzpxx.delete", jddxzpxx);
	}

	public Jddxzpxx get(Jddxzpxx jddxzpxx) {
		return (Jddxzpxx) queryForObject("jddxzpxx.get", jddxzpxx);
	}

}
