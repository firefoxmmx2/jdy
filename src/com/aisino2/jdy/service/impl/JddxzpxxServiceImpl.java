package com.aisino2.jdy.service.impl;

import com.aisino2.jdy.dao.IJddxzpxxDao;
import com.aisino2.jdy.domain.Jddxzpxx;
import com.aisino2.jdy.service.IJddxzpxxService;

public class JddxzpxxServiceImpl implements IJddxzpxxService {
	
	
	private IJddxzpxxDao jddxzpxxDao;
	

	public void setJddxzpxxDao(IJddxzpxxDao jddxzpxxDao) {
		this.jddxzpxxDao = jddxzpxxDao;
	}

	
	
	public Jddxzpxx insert(Jddxzpxx jddxzpxx) {
		if(jddxzpxx.getZpnr() == null)
			throw new RuntimeException("没有照片信息");
		return jddxzpxxDao.insert(jddxzpxx);
	}

	public void delete(Jddxzpxx jddxzpxx) {
		if(jddxzpxx.getRdrjbxx_id() == null)
			throw new RuntimeException("人员ID不能为空");
		jddxzpxxDao.delete(jddxzpxx);
	}

	public Jddxzpxx get(Jddxzpxx jddxzpxx) {
		if(jddxzpxx.getRdrjbxx_id() == null)
			throw new RuntimeException("人员ID不能为空");
		return jddxzpxxDao.get(jddxzpxx);
	}
	
}
