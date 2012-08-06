package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.Page;
import com.aisino2.core.dao.BaseDao;

import com.aisino2.publicsystem.dao.IGgbdsjsjDao;
import com.aisino2.publicsystem.domain.Ggbdsjsj;

public class GgbdsjsjDaoImpl extends BaseDao implements IGgbdsjsjDao {
	/** @param 公共比对手机数据表(T_GGBDSJSJ) 增加 */
	public Ggbdsjsj insertGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		GGBDSJSJ.setBdsjsjid(getNextID("BDSJSJID"));
		return (Ggbdsjsj)insert("insertGgbdsjsj", GGBDSJSJ);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 删除 */
	public int deleteGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		return delete("deleteGgbdsjsj", GGBDSJSJ);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 修改 */
	public int updateGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		return update("updateGgbdsjsj", GGBDSJSJ);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 查询单条 */
	public Ggbdsjsj getGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		return (Ggbdsjsj)queryForObject("getGgbdsjsj", GGBDSJSJ);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.biduiflag desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getGgbdsjsjList", map, pageNo,pageSize);
	}

	/** @param 公共比对手机数据表(T_GGBDSJSJ) 多条查询 */
	public List getListGgbdsjsj(Ggbdsjsj GGBDSJSJ){
		// TODO: implement
		return queryForList("getGgbdsjsjListNoPage", GGBDSJSJ);
	}
}
