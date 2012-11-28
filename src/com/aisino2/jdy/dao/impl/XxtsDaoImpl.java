package com.aisino2.jdy.dao.impl;


import java.util.List;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.jdy.dao.IXxtsDao;
import com.aisino2.jdy.domain.Xxts;
import com.aisino2.jdy.domain.Xxyh;

public class XxtsDaoImpl extends BaseDao implements IXxtsDao {

	public List<Xxts> queryMsgs(Xxts xxts){
		return queryForList("queryMsgs", xxts);
	}
	public Xxts insertXxts(Xxts xxts){
		xxts.setId(getNextID("xxts_id"));
		insert("insertXxts", xxts);
		return xxts;
	}
	public Xxyh insertXxyh(Xxyh xxyh){
		xxyh.setId(getNextID("xxyh_id"));
		insert("insertXxyh", xxyh);
		return xxyh;
	}
	public void deleteXxts(Xxyh xxyh){
		delete("deleteXxts", xxyh);
	}
	public void deleteXxyh(Xxyh xxyh){
		delete("deleteXxyh",xxyh);
	}
}
