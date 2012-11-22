package com.aisino2.sysadmin.service.impl;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.service.BaseService;
import com.aisino2.sysadmin.dao.IJlxxxDao;
import com.aisino2.sysadmin.domain.Jlxxx;
import com.aisino2.sysadmin.service.IJlxxxService;

public class JlxxxServiceImpl extends BaseService implements IJlxxxService {

	private IJlxxxDao JLXXXDao;

	/** @param 街路巷信息(T_JLXXX) 增加 */
	public Jlxxx insertJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return (Jlxxx)JLXXXDao.insertJlxxx(JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 删除 */
	public boolean deleteJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return JLXXXDao.deleteJlxxx(JLXXX)>0;
	}

	/** @param 街路巷信息(T_JLXXX) 修改 */
	public boolean updateJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return JLXXXDao.updateJlxxx(JLXXX)>0;
	}

	/** @param 街路巷信息(T_JLXXX) 查询单条 */
	public Jlxxx getJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return (Jlxxx)JLXXXDao.getJlxxx(JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		return JLXXXDao.getListForPage(map,pageNo,pageSize,sort,desc);
	}

	/** @param 街路巷信息(T_JLXXX) 多条查询 */
	public List getListJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return JLXXXDao.getListJlxxx(JLXXX);
	}

	public IJlxxxDao getJlxxxDao() {
		return JLXXXDao;
	}

	public void setJlxxxDao(IJlxxxDao JLXXXDao) {
		this.JLXXXDao = JLXXXDao;
	}
}
