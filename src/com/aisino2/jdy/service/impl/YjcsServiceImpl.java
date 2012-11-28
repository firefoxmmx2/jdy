package com.aisino2.jdy.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.jdy.dao.IYjcsDao;
import com.aisino2.jdy.domain.Yjcs;
import com.aisino2.jdy.service.IYjcsService;

public class YjcsServiceImpl implements IYjcsService {
	private IYjcsDao yjcsDao;
	
	
	
	public void setYjcsDao(IYjcsDao yjcsDao) {
		this.yjcsDao = yjcsDao;
	}


	public Yjcs insertYjcs(Yjcs yjcs) {
		return yjcsDao.insert(yjcs);
	}

	
	public void removeYjcs(Yjcs yjcs) {
		yjcsDao.remove(yjcs);
	}

	
	public void updateYjcs(Yjcs yjcs) {
		yjcsDao.update(yjcs);
	}

	
	public List<Yjcs> query(Map<String, Object> param) {
		return yjcsDao.query(param);
	}

}
