package com.aisino2.jdy.dao.impl;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.jdy.dao.ISjgljgDao;
import com.aisino2.jdy.domain.Rdrjbxx;

/**
 * 数据关联度分析结果dao
 */
public class SjgljgDaoImpl extends BaseDao implements ISjgljgDao {

	
	public Rdrjbxx insertSjgljg(Rdrjbxx rdrjbxx) {
		rdrjbxx.setId(this.getNextID("seq_sjglgj_id"));
		insert("Sjgljg.insert", rdrjbxx);
		return rdrjbxx;
	}

}
