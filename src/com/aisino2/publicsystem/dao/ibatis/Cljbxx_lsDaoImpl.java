package com.aisino2.publicsystem.dao.ibatis;

import java.util.List;
import java.util.Map;

import com.aisino2.core.dao.BaseDao;
import com.aisino2.core.dao.Page;
import com.aisino2.publicsystem.dao.ICljbxx_lsDao;
import com.aisino2.publicsystem.domain.Cljbxx;

public class Cljbxx_lsDaoImpl extends BaseDao implements ICljbxx_lsDao{
	/** @param 车辆基本信息(t_cljbxx) 增加 */
	public Cljbxx insertCljbxx_ls(Cljbxx cljbxx){
		// TODO: implement
		cljbxx.setCljbxx_lsid(getNextID("cljbxx_lsid"));
		insert("insertCljbxx_ls", cljbxx);
		return cljbxx;
	}

	/** @param 车辆基本信息(t_cljbxx) 删除 */
	public int deleteCljbxx_ls(Cljbxx cljbxx){
		// TODO: implement
		return delete("deleteCljbxx_ls", cljbxx);
	}

	/** @param 车辆基本信息(t_cljbxx) 修改 */
	public int updateCljbxx_ls(Cljbxx cljbxx){
		// TODO: implement
		return update("updateCljbxx_ls", cljbxx);
	}

	/** @param 车辆基本信息(t_cljbxx) 查询单条 */
	public Cljbxx getCljbxx_ls(Cljbxx cljbxx){
		// TODO: implement
		return (Cljbxx)queryForObject("getCljbxx_ls", cljbxx);
	}

	/** @param 车辆基本信息(t_cljbxx) 分页查询 */
	public Page getListForPage(Map map, int pageNo,int pageSize,String sort,String desc){
		// TODO: implement
		String sCol="";
		if (sort!=null){
		}else{
			sCol="a.Cljbxx_lsid desc";
		}
		map.put("pageSort", sCol);
		return queryForPage("getCljbxx_lsList", map, pageNo,pageSize);
	}

	/** @param 车辆基本信息(t_cljbxx) 多条查询 */
	public List getListCljbxx_ls(Cljbxx cljbxx){
		// TODO: implement
		return queryForList("getCljbxx_lsListNoPage", cljbxx);
	}

}
