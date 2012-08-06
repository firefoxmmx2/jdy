package com.aisino2.sysadmin.dao;
import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;

import com.aisino2.sysadmin.domain.Jlxxx;
public interface IJlxxxDao {
	/** @param 街路巷信息(T_JLXXX) 增加 */
	Jlxxx insertJlxxx(Jlxxx JLXXX);

	/** @param 街路巷信息(T_JLXXX) 删除 */
	int deleteJlxxx(Jlxxx JLXXX);

	/** @param 街路巷信息(T_JLXXX) 修改 */
	int updateJlxxx(Jlxxx JLXXX);

	/** @param 街路巷信息(T_JLXXX) 查询单条 */
	Jlxxx getJlxxx(Jlxxx JLXXX);

	/** @param 街路巷信息(T_JLXXX) 分页查询 */
	Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc);

	/** @param 街路巷信息(T_JLXXX) 多条查询 */
	List getListJlxxx(Jlxxx JLXXX);
}
