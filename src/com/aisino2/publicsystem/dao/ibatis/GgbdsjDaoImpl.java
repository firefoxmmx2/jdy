package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.publicsystem.dao.IGgbdsjDao;
import com.aisino2.publicsystem.domain.Ggbdsj;

public class GgbdsjDaoImpl extends BaseDao implements IGgbdsjDao {
	/** @param 公共比对数据表(T_GGBDSJ) 增加 */
	public Ggbdsj insertGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		GGBDSJ.setBdsjid(getNextID("Bdsjid"));
		return (Ggbdsj)insert("insertGgbdsj", GGBDSJ);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 删除 */
	public int deleteGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return delete("deleteGgbdsj", GGBDSJ);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 修改 */
	public int updateGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return update("updateGgbdsj", GGBDSJ);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 查询单条 */
	public Ggbdsj getGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return (Ggbdsj)queryForObject("getGgbdsj", GGBDSJ);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Bdsjid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getGgbdsjList", map, pageNo,pageSize);
	}

	/** @param 公共比对数据表(T_GGBDSJ) 多条查询 */
	public List getListGgbdsj(Ggbdsj GGBDSJ){
		// TODO: implement
		return queryForList("getGgbdsjListNoPage", GGBDSJ);
	}
}
