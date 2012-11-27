package com.aisino2.jdy.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.jdy.dao.IYjcsDao;
import com.aisino2.jdy.domain.Yjcs;

/**
 * 预警参数dao
 */
public class YjcsDaoImpl extends BaseDao implements IYjcsDao {

	/***
	 * 插入
	 */
	public Yjcs insert(Yjcs yjcs) {
		yjcs.setId(this.getNextID("seq_yjcs_id"));
		this.insert("Yjcs.insert", yjcs);
		return yjcs;
	}

	/**
	 * 删除
	 */
	public void remove(Yjcs yjcs) {
		this.delete("Yjcs.remove", yjcs);
	}

	/**
	 * 修改
	 */
	public void update(Yjcs yjcs) {
		this.update("Yjcs.update", yjcs);
	}

	
	public List<Yjcs> query(Map<String, Object> param) {
		return this.queryForList("Yjcs.query", param);
	}

	public List querySQL(String sql) throws SQLException {
		return this.queryForList("Yjcs.querySqlMap", sql);
	}

}
