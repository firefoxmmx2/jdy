package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.IGgbdclsjDao;
import com.aisino2.publicsystem.domain.Ggbdclsj;

public class GgbdclsjDaoImpl extends BaseDao implements IGgbdclsjDao {
	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 增加 */
	public Ggbdclsj insertGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		GGBDCLSJ.setBdclsjid(getNextID("BDCLSJID"));
		return (Ggbdclsj)insert("insertGgbdclsj", GGBDCLSJ);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 删除 */
	public int deleteGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return delete("deleteGgbdclsj", GGBDCLSJ);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 修改 */
	public int updateGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return update("updateGgbdclsj", GGBDCLSJ);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 查询单条 */
	public Ggbdclsj getGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return (Ggbdclsj)queryForObject("getGgbdclsj", GGBDCLSJ);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.biduiflag desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getGgbdclsjList", map, pageNo,pageSize);
	}

	/** @param 公共比对车辆数据表(T_GGBDCLSJ) 多条查询 */
	public List getListGgbdclsj(Ggbdclsj GGBDCLSJ){
		// TODO: implement
		return queryForList("getGgbdclsjListNoPage", GGBDCLSJ);
	}
}
