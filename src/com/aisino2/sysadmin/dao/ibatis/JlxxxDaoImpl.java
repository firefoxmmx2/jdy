package com.aisino2.sysadmin.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.sysadmin.dao.IJlxxxDao;
import com.aisino2.sysadmin.domain.Jlxxx;

public class JlxxxDaoImpl extends BaseDao implements IJlxxxDao {
	/** @param 街路巷信息(T_JLXXX) 增加 */
	public Jlxxx insertJlxxx(Jlxxx JLXXX){
		// TODO: implement
		JLXXX.setJlxid(getNextID("Jlxid"));
		return (Jlxxx)insert("insertJlxxx", JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 删除 */
	public int deleteJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return delete("deleteJlxxx", JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 修改 */
	public int updateJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return update("updateJlxxx", JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 查询单条 */
	public Jlxxx getJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return (Jlxxx)queryForObject("getJlxxx", JLXXX);
	}

	/** @param 街路巷信息(T_JLXXX) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
			if("0".equals(sort))
				sCol = " a.jlxdm "+ desc;
			else if("1".equals(sort))
				sCol = " a.jlxmc "+ desc;
		}else{
			sCol="a.Jlxid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getJlxxxList", map, pageNo,pageSize);
	}

	/** @param 街路巷信息(T_JLXXX) 多条查询 */
	public List getListJlxxx(Jlxxx JLXXX){
		// TODO: implement
		return queryForList("getJlxxxListNoPage", JLXXX);
	}
}
