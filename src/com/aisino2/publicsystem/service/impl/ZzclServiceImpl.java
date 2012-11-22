package com.aisino2.publicsystem.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.publicsystem.dao.IZzclDao;
import com.aisino2.publicsystem.domain.Zzcl;
import com.aisino2.publicsystem.service.IZzclService;

public class ZzclServiceImpl extends BaseService implements IZzclService{
	private IZzclDao zzclDao;

	public IZzclDao getZzclDao() {
		return zzclDao;
	}

	public void setZzclDao(IZzclDao zzclDao) {
		this.zzclDao = zzclDao;
	}
	/** @param 纸质材料(t_pmt) 多条查询 */
	public List getListZzcl(Zzcl zzcl){
		// TODO: implement
		return zzclDao.getListZzcl(zzcl);
	}
	
	public Zzcl getZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return zzclDao.getZzcl(zzcl);
	}

	public boolean deleteZzcl(Zzcl zzcl) {
		// TODO Auto-generated method stub
		return zzclDao.deleteZzcl(zzcl)>0;
	}

	public Page getListForPage(Map map, int pageNo, int pageSize, String sort,
			String desc) {
		// TODO Auto-generated method stub
		return zzclDao.getListForPage(map, pageNo, pageSize, sort, desc);
	}
	
}
